# This script handles initial Git setup, creates an SSH key and adds it to the
# ssh-agent. You should run this command with two positional arguments: your full
# name and your email. You will be prompted to create passphrase for the SSH key
# during the process.

echo 'SETTING UP GIT WITH THE FOLLOWING PARAMETERS'
echo 'Full name: ' $1
echo 'Email: ' $2

git config --global user.name $1
git config --global user.email $2

echo 'Generating new SSH key and adding it to the ssh-agent'
ssh-keygen -t rsa -b 4096 -C $2

echo 'Start ssh-agent in the background'
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub