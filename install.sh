#!/bin/bash

pushd . >> /dev/null

echo "" >> ~/.profile
mkdir -p ~/.bash
rm -rf ~/.bash/gap >> /dev/null
echo "export GAP_PATH=~/.bash/gap" >> ~/.profile
cd ~/.bash
git clone https://github.com/bri0/git-aware-prompt.git gap
echo "source \${GAP_PATH}/main.sh" >> ~/.profile

echo "if [ -f \${GAP_PATH}/git-completion.bash ]; then" >> ~/.profile
echo "  . \${GAP_PATH}/git-completion.bash" >> ~/.profile
echo "fi" >>~/.profile

echo 'export PS1="\[$txtgrn\]\u\[$txtrst\] \W \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "' >> ~/.profile
echo 'export SUDO_PS1="\[$bakred\]\u@\h\[$txtrst\] \w\$ "' >> ~/.profile

popd >> /dev/null
echo "Installed"
