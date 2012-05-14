dash-docsets
============

Build scripts to generate Xcode Documentation Sets (docsets) for some popular open source frameworks.

In particular, these work well with the very handy Dash (http://kapeli.com/dash/) utility available in the App Store.

Dash is an API Documentation Browser and Code Snippet Manager that include Docsets for a number of popular open source tools and frameworks.

Prerequisite tools that are assumed installed and accessible in current PATH:
 - doxygen 1.8.0 or newer (http://doxygen.org/)
 - graphviz 2.1.4 or newer (http://graphviz.org/)

Current build scripts follow the approach documented in the OS X Developer Library using Doxygen:
 https://developer.apple.com/library/mac/#featuredarticles/DoxygenXcode/_index.html
