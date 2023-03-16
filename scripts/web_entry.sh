#!/bin/bash

rm -rf ~/.ssh/*
ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts
echo "ssh-rsa AAAAB3NzaCfakefakefakeRJG/s7nwF/BBcQOOLFEBSW2NMtkWVU5ARHe5Pp matt" > ~/.ssh/id_rsa.pub
echo "-----BEGIN OPENSSH PRIVATE KEY-----" > ~/.ssh/id_rsa
echo "b3BlbnNzaC1rZXktdjEAAAAABG5vbmfakefakefakeUAAAAEbm9uZQAAAAAAAAABAAABFwAAAAdzc2gtcn" >> ~/.ssh/id_rsa
echo "NhAAAAAwEAAQAAAQEAz0hltuajyHX1aDyfYC6YCsnOurICh/hn5wZ5BVeAOtqRFUP28Y44" >> ~/.ssh/id_rsa
echo "54SYT3Nr/dVnOm/7AAAABG1hdHQBAgMEBQY=" >> ~/.ssh/id_rsa
echo "-----END OPENSSH PRIVATE KEY-----" >> ~/.ssh/id_rsa
chmod 400 ~/.ssh/id_rsa

git config --global user.name "matt"

#debug git credentials!
#git config --global --list
#ssh -vT git@github.com

bundle config set path /usr/local/workspace/tmp/bundle
#bundle install

#rake db:migrate:with_data

bundle exec rake db:migrate

#bundle exec rake spec

bundle exec rake log:clear
rails server -b 0.0.0.0

#tail -f /dev/null 
