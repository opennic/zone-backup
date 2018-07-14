#!/bin/bash

CURRTIME="`date '+%Y-%m-%d (%H:%M)'`";

mkdir -p output
mkdir -p output/include
/usr/bin/git pull origin master

dig_tld () {
  /usr/bin/dig +onesoa +nocomments +nocmd +nostats AXFR $1 @$2 > output/$1.zone
  sed "/NSEC\|RRSIG\|DNSKEY\|SOA\|^$1\./d" < output/$1.zone > output/include/$1.zone
}

dig_tld bbs 207.192.71.13
dig_tld chan 94.103.153.176
dig_tld cyb 79.124.7.81
dig_tld dyn 161.97.219.84
dig_tld fur 163.172.168.171
dig_tld geek 161.97.219.84
dig_tld gopher 161.97.219.84
dig_tld indy 161.97.219.84
dig_tld libre 161.97.219.84
dig_tld neo 104.168.144.17
dig_tld null 188.226.146.136
dig_tld o 45.55.97.204
dig_tld oss 161.97.219.84
dig_tld oz 188.226.146.136
dig_tld parody 161.97.219.84
dig_tld pirate 161.97.219.84

/usr/bin/git add --no-all .
/usr/bin/git commit --allow-empty -m "Auto update $CURRTIME"
/usr/bin/git push origin master
