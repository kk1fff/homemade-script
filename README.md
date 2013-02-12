homemade-script
===============

1. Simple script to pull code of b2g and mozilla central
1. Build a file list for all mozilla sources.


## Setup octopress

### Command: op_import_image <file_name>

Shrink the long side of image file 1000px and copy into
$OCTOPRESSDIR/source/images/blogimage/ and display the image's related URL. ex.

    /images/blogimage/abcd-e7df7cd2ca07f4f1ab415d457a6e1c13.jpg

the file name is suffuxed with md5 of the file.

### Configure

Configurating __OCTOPRESSDIR__ to the root of octopress. For example,

    export OCTOPRESSDIR=$HOME/w/myproject/octopress
