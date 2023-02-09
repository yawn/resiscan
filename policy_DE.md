# Verfahrensdokumentation zum ersetzenden Scannen

Version: 1.0 (09.02.2023)

Diese Verfahrensbeschreibung steht in Einklang mit Sinn und Zweck der Richtlinie RESISCAN – Ersetzendes Scannen (BSI TR RESISCAN – 03138), in der jeweils geltenden Fassung soweit die hier beschriebenen Verfahren Teil dieser Richtlinie sind.

Gegenstand der Digitalisierung sind alle originär in Papierform vorliegenden bzw. eingehenden Dokumente, die eine Belegfunktion im Sinne der handels- und/oder steuerrechtlichen Buchführungs- oder Aufzeichnungspflichten erfüllen und deshalb einer Aufbewahrungspflicht unterliegen.

Die Aufbewahrungsfrist digitaler Unterlagen beträgt sechs Jahre für empfangene Handelsoder Geschäftsbriefe und Wiedergaben der abgesandten Handels- oder Geschäftsbriefe und sonstige Unterlagen, vgl. § 257 Abs. 4 i. V. m. § 257 Abs. 1 Nr. 2,3 HGB, § 147 Abs. 3 i. V. m. § 147 Abs. 1 Nr. 2, 3, 5 AO. Handelsbriefe sind nur Schriftstücke, die ein Handelsgeschäft betreffen (§ 257 Abs. 2 HGB).

Diese Verfahrensdokumentation basiert auf der Muster-Verfahrensdokumentation zum ersetzenden Scannen (Version: 2.0; Stand: 29. November 2019), erstellt von der Bundessteuerberaterkammer (BStBK) und dem Deutschen Steuerberaterverband e.V. (DStV)

## Eingesetze Software

Durch die Nutzung der nachfolgend bezeichneten Software wird sichergestellt, dass bei ordnungsmäßiger und zeitlich ununterbrochener Anwendung die Grundsätze ordnungsmäßiger Buchführung eingehalten werden. Gleichzeitig wird sichergestellt, dass die digitalisierten Daten bei Lesbarmachung mit den empfangenen Handelsbriefen und den Buchungsbelegen bildlich und mit den anderen Unterlagen inhaltlich übereinstimmen, während der Dauer der Aufbewahrungsfrist verfügbar sind und jederzeit innerhalb angemessener Frist lesbar gemacht werden können (§ 257 Abs. 3 HGB, § 147 Abs. 2 AO).

Für die Digitalisierung kommt folgende Software zum Einsatz:

1. [Scanbot Document Scanning SDK](https://scanbot.io/de/products/document-scanning/) (iOS)

Für die Ablage bzw. Archivierung der digitalisierten Belege kommt folgende Software zum Einsatz:

1. [Amazon S3 Objektspeicher](https://aws.amazon.com/de/s3/) unter Verwendung einer Objektsperre im Governance-Modus 

## Zuständigkeiten

Die Identifikation, Vorbereitung, Digitalisierung, Vollständigkeits-/Lesbarkeitskontrolle der zu scannenden Belege unterliegt aussschliesslich der Verantwortung des Einzelunternehmers

Die Vernichtung der originären Papierbelege erfolgt durch den [Aktenvernichtungs-Service der Berlin Recycyling](https://www.berlin-recycling.de/entsorgung/aktenvernichtung).

Die Vernichtung erfolgt gem. Art. 28 EU-DSGVO, Schutzklasse 2 Sicherheitsstufe P-3 gem. DIN 66399

Der Datenschutz und die Datensicherheit werden berücksichtigt, indem Unbefugte keinen Zugriff auf Daten bei der Bearbeitung, der Aufbewahrung, dem Transport und der Vernichtung haben. Nach dem Ende der Aufbewahrungsfristen werden die archivierten Daten aus dem Archiv gelöscht.

Diese Löschung erfolgt automatisiert und regelbasiert. Eine Löschung der digitalen Archivbestände erfolgt nicht vor Ablauf der Aufbewahrungsfrist. 

## Verfahren

Die entgegengenommenen Papierbelege werden vom Empfänger auf Echtheit und Unversehrtheit geprüft.

Bei Annahme der Papierbelege wird auf gute Lesbarkeit und Vollständigkeit des Belegs geachtet. Ergänzend wird der Papierbeleg auf die umsatzsteuerlichen Pflichtangaben entsprechend geprüft. Sofern ein Papierbeleg Mängel aufweist, ist von einem mobilen Scannen abzusehen und der Empfänger hat einen korrekten Beleg beim Belegaussteller anzufordern.

Das mobile Scannen im Ausland ist zulässig, wenn die Belege z. B. anlässlich einer Auslandsreise entstanden sind.

Für das mobile Scannen identifizierte Belege werden grundsätzlich daraufhin geprüft, ob eine bildliche Erfassung durch das mobile Endgerät technisch möglich ist und ein originalgetreues Abbild erzeugt werden kann.

### Ablauf

1. Das mobile Scannen erfolgt durch den Empfänger des Beleges.
2. Der Empfänger fotografiert den Beleg so lange, bis die qualitativen Anforderungen aufgrund der am Gerät möglichen Sichtkontrolle erfüllt sind.
3. Der fotografierte Beleg muss vollständig, richtig und lesbar sein.
4. Soweit sich Informationen auf der Rückseite des Belegs befinden, sind diese ebenfalls zu fotografieren.
5. Der Empfänger stellt unmittelbar nach dem Fotografieren sicher, dass jeder Papierbeleg genau einmal erfasst wurde (Vollständigkeit und Existenz der digitalen Kopie). Dies ist insbesondere bei mehrseitigen Originaldokumenten von Bedeutung, wobei auch auf die fortlaufende Nummerierung der Seiten geachtet wird. Fehlende digitale Dokumente werden ergänzend erfasst. Mehrfachdigitalisierungen werden bis auf eine Ausfertigung gelöscht oder entsprechend als Zweitexemplar gekennzeichnet und somit von einer doppelten Weiterverarbeitung ausgeschlossen.

### Transfer

Die fotografierten Belege werden zur Rechnungseingangsprüfung und zur Archivierung auf folgendem Wege übertragen:

1. Verwendung des Skripts `upload.sh`; 
2. Dabei kommen folgende Verfahren bzw. Kontrollen zur Sicherung der Vollständigkeit, Richtigkeit, Unveränderbarkeit und Vertraulichkeit zum Einsatz:
    1. Verwendung des kryptographischen Prüfsummenverfahrens SHA256 zur Ende-zu-Ende Integritätskontrolle
    2. Kryptographische Verfahren zur Sicherung von Vertraulichkeit und Integrität des Transportswegs.
    3. Kryptographische Verfahren zur Sicherung von Vertraulichkeit und Integrität der Speicherung.
3. Die Speicherung der digitalisierten Belege für deren Archivierung erfolgt nach folgendem System: `Jahr/Monat/Tag/Name des Dokuments`
4. Die Integrität der digitalen Beleg-Kopie mit dem Beleg-Original wird durch Anwendung folgender technischer und organisatorischer Maßnahmen abgesichert:
    1. Jedes Dokument wird mit einem Zeitnachweis versehen, der eine Zeitinformation mit dem Datenobjekt unabänderlich verbindet.
    2. Der digitalisierte Beleg wird zum Zeitpunkt des Speicherns festgeschrieben, d. h., von einer späteren Bearbeitung/Änderung und insbesondere Löschung durch technische Verfahren der Software ausgeschlossen]
5. Durch herstellerseitig verantwortete Prozesse erfolgt eine Prävention gegen Ausfälle und Datenverluste.

