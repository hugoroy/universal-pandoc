#!/bin/bash

sed 's#"html","<label>"#"latex","\\\\label\{"#g' | \
    sed 's#"html","<\/label>"#"latex","\}"#g' | \
    sed 's#"html","<vref>"#"latex","\\\\vref\{"#g' | \
    sed 's#"html","<\/vref>"#"latex","\}"#g' | \
    sed 's#"html","<ref>"#"latex","\\\\ref\{"#g' | \
    sed 's#"html","<\/ref>"#"latex","\}"#g' | \
    sed 's#"html","<hg>"#"latex","\\\\Hangquote\{«\ \}"#g'| \
    sed 's#"html","<hq>"#"latex","\\\\Hangquote\{“\}"#g'| \
    sed 's#"html","<bigskip>"#"latex","\\\\bigskip"#g'| \
    sed 's#"html","<vfill>"#"latex","\\\\vfill"#g'| \
    sed 's#"html","<clearpage>"#"latex","\\\\clearpage"#g'| \
    sed 's#"html","<cleardoublepage>"#"latex","\\\\cleardoublepage"#g'| \
    sed 's#"html","<center>"#"latex","\\\\begin\{center\}"#g' | \
    sed 's#"html","<\/center>"#"latex","\\\\end\{center\}"#g' 
