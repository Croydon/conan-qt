#!/usr/bin/env bash

set -ex

if [[ "$(uname -s)" == 'Darwin' ]]; then
    unset PYENV_ROOT
    curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
    export PATH="$HOME/.pyenv/bin:$PATH"

    if which pyenv > /dev/null; then
        eval "$(pyenv init -)"
    fi

    pyenv install 3.8.0
    pyenv virtualenv 3.8.0 conan
    pyenv rehash
    pyenv activate conan

    pip install cmake --upgrade
fi

pip install bincrafters_package_tools --upgrade

conan user
