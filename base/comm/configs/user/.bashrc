alias ll='ls -hl --color'

[[ -r ~/.i18n ]] && . ~/.i18n

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

[[ -r /opt/rh/devtoolset-7/enable ]] && . /opt/rh/devtoolset-7/enable
[[ -r ~/.cargo/env ]] && . ~/.cargo/env
