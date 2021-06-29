# ddcopy

A better command to copy files and folders than cp. Linux provides a feature for caching every file in the RAM whenever I/O operation is performed by default. But sometimes it becomes painfull to cache everything in a RAM especially when data is much larger in size since caching slows down the system performance. Moreover, nerally large sized data is not required again to be copy once is it copied somewhere so, caching files into RAM is useless. Linux does not provide facility to stop caching.


# Installation
bash

git clone https://github.com/Jyot0131/ddcopy

cd ddcopy

chmod +x ./ddcopy.sh

Then alias can be set by adding following line in file .bashrc at last 

alias ddcopy="bash <path to ddcopy directory>/ddcopy/ddcopy.sh"
  
  
# Usage

usage: ddcopy <source> <destination>

it accepts n number of arguments from which the last argument should be the destination.
