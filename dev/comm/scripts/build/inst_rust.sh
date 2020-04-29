#!/bin/bash
set -e

export CARGO_HOME=${SHR_PATH}/.cargo
export RUSTUP_HOME=${SHR_PATH}/.rustup

wget https://sh.rustup.rs -O rustup.sh
chmod +x ./rustup.sh && ./rustup.sh -y
rm -f ./rustup.sh

echo 'export PATH="${HOME}/.cargo/bin:$PATH"' > ${CARGO_HOME}/env
tar -czf ${SHR_PATH}/rust.tar.gz $CARGO_HOME $RUSTUP_HOME
rm -fr $CARGO_HOME $RUSTUP_HOME

echo "cargo version &> /dev/null || tar -xf ${SHR_PATH}/rust.tar.gz -C ~" >> ${SHR_SCRIPTS}/run/user_spec.sh
