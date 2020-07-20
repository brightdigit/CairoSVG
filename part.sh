#!/bin/bash

case $1 in
main)
  part="major"
  ;;
features)
  part="minor"
  ;;
*)
  part="patch"
  ;;
esac

echo $part