#!/bin/bash
git clone git@github.com:ytnobody/Otogiri.git
cd Otogiri
git config --local user.name $GIT_USER
git config --local user.email $GIT_EMAIL
/root/.plenv/shims/minil build
/root/.plenv/shims/minil test
bash