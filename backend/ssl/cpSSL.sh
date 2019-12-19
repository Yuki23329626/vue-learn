#!/bin/bash
# Program:
# 	This program is for "gbc1-ccu-edu-tw" project to copy ssl crt and key to proper locations in the project.
# History:
# 2019/09/20 nxshen First release
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
echo -e "\nPlease input prefix of ssl files.\n"
echo -e "Make sure their name is start with same prefix\n"
echo -e "like *.crt and *.key\n"
read -p "input>> " prefixOfSSL

echo -e "\nYour ssl files' name has prefix: ${prefixOfSSL}"

sudo chmod 444 ${prefixOfSSL}.*
cp ${prefixOfSSL}.* ../dadu3cert/cert-api2/src/ssl/
cp ${prefixOfSSL}.* ../dadu3cert/cert-front/certs/
cp ${prefixOfSSL}.* ../dadu3cert/
cp ${prefixOfSSL}.* ../nest-hydra-login-consent-node/src/ssl/

rm ../dadu3cert/cert-api2/src/ssl/certapi.crt
rm ../dadu3cert/cert-api2/src/ssl/certapi.key
rm ../dadu3cert/cert-front/certs/certfront.crt
rm ../dadu3cert/cert-front/certs/certfront.key
rm ../dadu3cert/certapi.crt
rm ../dadu3cert/certapi.key
rm ../nest-hydra-login-consent-node/src/ssl/ory-hydra-login-consent.crt
rm ../nest-hydra-login-consent-node/src/ssl/ory-hydra-login-consent.key

mv -f ../dadu3cert/cert-api2/src/ssl/${prefixOfSSL}.crt ../dadu3cert/cert-api2/src/ssl/certapi.crt
mv -f ../dadu3cert/cert-api2/src/ssl/${prefixOfSSL}.key ../dadu3cert/cert-api2/src/ssl/certapi.key
mv -f ../dadu3cert/cert-front/certs/${prefixOfSSL}.crt ../dadu3cert/cert-front/certs/certfront.crt
mv -f ../dadu3cert/cert-front/certs/${prefixOfSSL}.key ../dadu3cert/cert-front/certs/certfront.key
mv -f ../dadu3cert/${prefixOfSSL}.crt ../dadu3cert/certapi.crt
mv -f ../dadu3cert/${prefixOfSSL}.key ../dadu3cert/certapi.key
mv -f ../nest-hydra-login-consent-node/src/ssl/${prefixOfSSL}.crt ../nest-hydra-login-consent-node/src/ssl/ory-hydra-login-consent.crt
mv -f ../nest-hydra-login-consent-node/src/ssl/${prefixOfSSL}.key ../nest-hydra-login-consent-node/src/ssl/ory-hydra-login-consent.key

mv ${prefixOfSSL}.crt certificate.crt
mv ${prefixOfSSL}.key private.key

exit 0
