#!/bin/bash
repos=( $(ls | grep ketos))
baseDir=$(pwd)

printf "\n\n****Status base repository****\n\n"
git status

for repoName in ${repos[@]}
do
  printf "\n************************************************\n Status repository $repoName:\n************************************************\n" 
  cd $repoName
  git status
  cd ..
done