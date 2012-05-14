<?php

// Doxygen input filters for improved support of phpdoc markup 
$source = file_get_contents($argv[1]);

// Type hints from: http://stackoverflow.com/questions/4325224/doxygen-how-to-describe-class-member-variables-in-php?answertab=votes#tab-top
$regexp = '#\@var\s+([^\s]+)([^/]+)/\s+(public|protected|private)\s+(\$[^\s;=]+)#';
$replac = '${2} */ ${3} ${1} ${4}';
$source = preg_replace($regexp, $replac, $source);

echo $source;
?>
