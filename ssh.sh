#!/bin/sh

echo "Generating a new SSH key for GitHub..."

ssh-keygen -t ed25519 -C $1 -f ~/.ssh/id_ed25519
eval "$(ssh-agent -s)"
touch ~/.ssh/config
echo "Host *\n AddKeysToAgent yes\n UseKeychain yes\n IdentityFile ~/.ssh/id_ed25519" | tee ~/.ssh/config
ssh-add -K ~/.ssh/id_ed25519
echo "run 'pbcopy < ~/.ssh/id_ed25519.pub' and paste that into GitHub"
