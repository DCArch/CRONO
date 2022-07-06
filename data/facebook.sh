#!/bin/bash

function download
{
  cd "${0%/*}" || exit
  wget -c https://snap.stanford.edu/data/facebook_combined.txt.gz
  gunzip facebook_combined.txt.gz
  mv facebook_combined.txt facebook.txt
}

function clean
{
  cd "${0%/*}" || exit
  rm -rf facebook.txt
}

if [ "$#" -ne 1 ]
then
  echo "Do you wish to download data files or clean up?"
  select choice in "Download" "Clean"; do
    case $choice in
      Download ) download; break;;
      Clean ) clean; break;;
    esac
  done
else
  if [ "$1" == "-d" ]
  then
    download
  elif [ "$1" == "-c" ]
  then
    clean
  else
    echo "Invalid command line arguments. Available options are -d for download, and -c for clean"
  fi
fi