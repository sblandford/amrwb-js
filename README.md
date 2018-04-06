# amrwb-js
Javascript implementation of the Opencore AMR-WB codec. Only decode is implemented.

Depends on EMSDK and Open AMR https://sourceforge.net/projects/opencore-amr/

# Demo
Serve demo.html, amrwb.js and amrwb-util.js from a web server and access demo.html from a web browser. A simple way to get a webserver is just to use php -S localhost:8080 from the same directory as these files.

The demo contains an audio speech sample at each of the available bitrates from 6.6 kbps to 23.850 kbps.

# Build instructions for Linux
Ensure you are working in a directory that has no spaces in the path
* chmod +x bldwb.sh
* Install and activate the EMSDK from https://github.com/juj/emsdk
* make
