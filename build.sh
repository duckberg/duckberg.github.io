#!/bin/sh
# By default we use the Node.js version set in your package.json or the latest
# version from the 0.10 release
#
# You can use nvm to install any Node.js (or io.js) version you require.
# nvm install 4.0

#npm update

#grunt build

#lftp -c "open -u $FTP_USER,$FTP_PASSWORD $FTP_SERVER; set ssl:verify-certificate no; put -O / .htaccess"
lftp -c "open -u $FTP_USER,$FTP_PASSWORD $FTP_SERVER; set ssl:verify-certificate no; put -O / index.html"
#lftp -c "open -u $FTP_USER,$FTP_PASSWORD $FTP_SERVER; set ssl:verify-certificate no; put -O / business.html"

lftp -c "open -u $FTP_USER,$FTP_PASSWORD $FTP_SERVER; set ssl:verify-certificate no; mirror -R --parallel=4 --exclude-glob .git oth/ /oth"
lftp -c "open -u $FTP_USER,$FTP_PASSWORD $FTP_SERVER; set ssl:verify-certificate no; mirror -R --parallel=4 --exclude-glob .git js/ /js"
#lftp -c "open -u $FTP_USER,$FTP_PASSWORD $FTP_SERVER; set ssl:verify-certificate no; mirror -R --parallel=4 --exclude-glob .git jsmin/ /jsmin"
lftp -c "open -u $FTP_USER,$FTP_PASSWORD $FTP_SERVER; set ssl:verify-certificate no; mirror -R --parallel=4 --exclude-glob .git css/ /css"
lftp -c "open -u $FTP_USER,$FTP_PASSWORD $FTP_SERVER; set ssl:verify-certificate no; mirror -R --parallel=4 --exclude-glob .git images/ /images"
lftp -c "open -u $FTP_USER,$FTP_PASSWORD $FTP_SERVER; set ssl:verify-certificate no; mirror -R --parallel=4 --exclude-glob .git fonts/ /fonts"


lftp -c "open -u $FTP_USER,$FTP_PASSWORD $FTP_SERVER; set ssl:verify-certificate no; mirror -R no/ /no"
