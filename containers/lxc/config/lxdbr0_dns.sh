#!/bin/sh

if [ -n "$1" ]
then
  LXD_INTERFACE=lxdbr0
  LXD_DNS=`ip addr show $LXD_INTERFACE | grep -Po 'inet \K[\d.]+'`
  LXD_DOMAIN='~lxd'

  case "$1" in
    "up")
      /usr/bin/resolvectl dns $LXD_INTERFACE $LXD_DNS
      /usr/bin/resolvectl domain $LXD_INTERFACE $LXD_DOMAIN
      ;;

    "down")
      /usr/bin/resolvectl revert $LXD_INTERFACE
      ;;

    *)
      echo "Wrong option"
      ;;
  esac
else
  echo "No parameters found."
fi
