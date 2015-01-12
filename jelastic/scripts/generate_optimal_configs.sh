#!/bin/bash

source /etc/environment 

version=`passenger-config --version`

if [[ $version =~ 4.* ]] ;then

    gem install passenger -v 5.0.0.beta2 >>/opt/repo/log/out.log 2>&1 ;

    gem uninstall passenger -v 4.0.50 >>/opt/repo/log/out.log 2>&1 ;

    passenger-config install-agent >>/opt/repo/log/out.log 2>&1 ;

    passenger-config install-standalone-runtime >>/opt/repo/log/out.log 2>&1 ;

    passenger-config build-native-support >>/opt/repo/log/out.log 2>&1 ;
    
    [ -f $GEM_HOME/gems/passenger-5.0.0.beta2/lib/phusion_passenger/standalone/start_command/builtin_engine.rb ] && { sed -ib_q 's/ecape/escape/' $GEM_HOME/gems/passenger-5.0.0.beta2/lib/phusion_passenger/standalone/start_command/builtin_engine.rb; }

fi
