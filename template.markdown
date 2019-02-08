---
$if(title-meta)$
title: "$title-meta$"
$else$$if(title)$
title: "$title$"
$endif$
$endif$
$if(author-meta)$
author: "$author-meta$"
$else$
$if(author)$
author: "$author$"
$endif$
$endif$
$if(date-meta)$
date: "$date-meta$"
$else$
$if(date)$
date: "$date$"
$endif$
$endif$
$if(version)$
version: "$version$"
$endif$
$if(abstract)$
abstract: "$abstract$"
$endif$
$if(keywords)$
keywords: "keywords"
$endif$
...

$for(include-before)$
$include-before$

$endfor$
$if(toc)$
$table-of-contents$

$endif$
$body$
$for(include-after)$

$include-after$
$endfor$
