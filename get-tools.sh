#!bin/bash

# Check if tools are needed.
read -p "Install necessary tools? (Y/n): " confirm && [[ $confirm == [yY] ]] || exit 1
sudo apt-get install gcc\
	             g++\
		     cmake\
		     cmake-curses-gui\
		     clang-7\
		     make\
		     git\
		     ninja-build\
