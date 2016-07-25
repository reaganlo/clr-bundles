Bundle Definition Files
=======================

This repository contains bundle definition files for the Clear Linux 
Operating System for Intel Architecture.

The files under bundles/ in this directory are processed via m4 macros 
and disregard lines start with '#' as comments.  Please be careful when
editing.  The end result is a list of the packages that comprise a bundle.

All bundle files must include a filled-out bundle-header.txt at the top 
of the file. These are used to generate documentation, so be descriptive
and precise.


For debugging and visualization purposes, a small perl program called
`make-dot.pl` is included. If run, the output will be suitable to create
a dependency graph of the bundles. Run it as so:

   `make-dot.pl | dot -Tsvg > dot.svg`

This will output a "dot.svg" file that can be opened with a web browser.

Currently maintained by:
Robert Nesius <robert.a.nesius@intel.com>
William Douglas <william.douglas@intel.com>
