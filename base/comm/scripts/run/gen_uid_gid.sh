#!/bin/bash
set -e

echo "Preparing user ${USR_NAME} uid ${USR_ID} gid ${GRP_ID} sudo ${WITH_SUDO}..."

grep "x:${GRP_ID}:" /etc/group &> /dev/null || groupadd -g $GRP_ID $USR_NAME
if grep "${USR_NAME}:x" /etc/passwd &> /dev/null; then
usermod -d $USR_HOME -u $USR_ID -g $GRP_ID -p $(openssl passwd -1 ${USR_PW}) $USR_NAME
else
useradd -m -d $USR_HOME -u $USR_ID -g $GRP_ID -p $(openssl passwd -1 ${USR_PW}) -s /bin/bash $USR_NAME
fi

if [ "$WITH_SUDO" == "yes" ]; then
    if [ "$SUDO_WITH_PW" == "yes" ]; then
    usermod -aG sudo $USR_NAME
    else
    usermod -aG no_pw_sudo $USR_NAME
    fi
fi
