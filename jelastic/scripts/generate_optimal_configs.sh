#!/bin/bash

. /etc/environment

version=`passenger-config --version`

if [[ $version =~ 4.* ]] ;then

    gem install passenger -v 5.0.0.beta1 >>/opt/repo/log/out.log 2>&1 ;

    gem uninstall passenger -v 4.0.50 >>/opt/repo/log/out.log 2>&1 ;

    passenger-config install-agent >>/opt/repo/log/out.log 2>&1 ;

    passenger-config install-standalone-runtime >>/opt/repo/log/out.log 2>&1 ;

    passenger-config build-native-support >>/opt/repo/log/out.log 2>&1 ;

fi
