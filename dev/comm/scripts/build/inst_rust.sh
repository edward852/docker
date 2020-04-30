#!/bin/bash
set -e

export CARGO_HOME=${SHR_PATH}/.cargo
export RUSTUP_HOME=${SHR_PATH}/.rustup

groupadd -g 150 rust_grp
mkdir --mode=u+rwx,g+rws,o-rwx $CARGO_HOME
mkdir --mode=u+rwx,g+rws,o-rwx $RUSTUP_HOME
chgrp rust_grp $CARGO_HOME
chgrp rust_grp $RUSTUP_HOME
setfacl -Rdm g:rust_grp:rwx $CARGO_HOME
setfacl -Rdm g:rust_grp:rwx $RUSTUP_HOME

wget https://sh.rustup.rs -O rustup.sh
chmod +x ./rustup.sh && ./rustup.sh -y
rm -f ./rustup.sh

echo "export CARGO_HOME=$CARGO_HOME" >> ${CARGO_HOME}/env
echo "export RUSTUP_HOME=$RUSTUP_HOME" >> ${CARGO_HOME}/env

cp -f ${CARGO_HOME}/env ${SHR_CONFIGS}/user/.cargo/
echo 'usermod -aG rust_grp $USR_NAME' >> ${SHR_SCRIPTS}/run/gen_uid_gid.sh

# restore acl when container recreated
cat >> ${SHR_SCRIPTS}/run/gen_uid_gid.sh << EOF

if getfacl -c $CARGO_HOME | grep 'rust_grp:rwx' &> /dev/null; then
    echo "acl remains, do nothing."
else
    setfacl -Rdm g:rust_grp:rwx $CARGO_HOME
    setfacl -Rdm g:rust_grp:rwx $RUSTUP_HOME
fi
EOF
