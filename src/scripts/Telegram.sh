#!/bin/bash
case "$1" in
        install)
            sudo add-apt-repository ppa:atareao/telegram
			sudo apt-get update
			sudo apt-get install telegram
            ;;
         
        uninstall)
            sudo apt-get remove telegram 
            ;;
        *)
esac