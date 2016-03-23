Bundle Definition Files
=======================

This repository contains bundle definition files for the ClearLinux 
Operating System.

The files under bundles/ in this directory are processed via m4 macros 
and disregard lines start with '#' as comments.  Please be careful when
editing.  The end result is a list of the packages that comprise a bundle.

All bundle files must include a filled-out bundle-header.txt at the top 
of the file. These are used to generate documentation, so be descriptive
and precise.

