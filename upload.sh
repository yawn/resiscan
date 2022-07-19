#!/bin/bash
BUCKET=$(aws cloudformation describe-stacks --stack-name DocumentArchive --query "Stacks[0].Outputs[?OutputKey == 'Bucket'].OutputValue" --output text) || exit 128

IFS="$(printf '\n\t')"

for file in documents/* ; do
  if [ -e "$file" ] ; then

    key=$(stat -f "%Sc/%N" -t "%Y/%m/%d" $file | sed 's/documents\///')
    md=$(sha2 -256 -q $file)
    sig=$(echo $md | xxd -r -p | base64)

    rsig=$(aws --no-cli-pager s3api get-object-attributes --bucket $BUCKET --key $key --object-attributes Checksum --query Checksum.ChecksumSHA256 --output text 2>/dev/null)

    if [ -z $rsig ] ; then
        echo "$key does not exists"
    elif [ $rsig = $sig ] ; then
        echo "$key already exists remotely" 
        continue
    else
        echo "$key already exists remotely but in a different version"
    fi

    echo -n "Uploading $file with SHA2 $md: $sig -> "  
    aws --no-cli-pager s3api put-object --bucket $BUCKET --body $file --checksum-sha256 $sig --key $key --query ChecksumSHA256 --output text 

  fi
done
