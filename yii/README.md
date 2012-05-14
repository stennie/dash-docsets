Yii Framework Docset
====================

Prerequisite tools that are assumed installed and accessible in current PATH:
 - doxygen 1.8.0 or newer (http://doxygen.org/)
 - graphviz 2.1.4 or newer (http://graphviz.org/)


Instructions below have been tested with Yii 1.10 (yii-1.1.10.r3566.tar.gz):

1. Download & unpack Yii Framework from http://www.yiiframework.com/

2. Apply doxygen patch for mainpage info:

    patch -p0 < yii-doxygen.patch

3. Update Yii version in *.dox as appropopriate

4. Build docset (see ./build.sh -h for more options):

    ./build.sh

5. Install docsets into local XCode

    cd docset/html
    make install

6. (optional) If using Dash (http://kapeli.com/dash/):
 - view Preferences => Docsets
 - refresh the Docset list
 - enable "Yii Framework" docset and assign shortcode of 'yii'


