#!/bin/bash
case "$1" in
        install)
            sudo add-apt-repository ppa:adabbas/1stppa
			sudo apt-get update
			sudo apt-get install filezilla
            ;;
        uninstall)
            
            ;;
        *)
esac