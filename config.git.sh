#!/bin/sh

git config user.email bob@minion.im
git config user.name Bob

github_url='git@github.com:lvii/mini.git'

echo $github_url

git config -l

