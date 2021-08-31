#!/bin/bash

sed 's#"html","<label>"#"html","<a id="#g'  | \
    sed 's#"html","<\/label>"#"html","><\/a>"#g' | \
    sed 's#"html","<vref>"#"html",""#g'  | \
    sed 's#"html","<\/vref>"#"html","~VRef."#g' | \
    sed 's#"html","<ref>"#"html",""#g'  | \
    sed 's#"html","<\/ref>"#"html","~Ref."#g' | \
    sed 's#"html","<bigskip>"#"html","   "#g' | \
    sed 's#"html","<hg>"#"html","« "#g'| \
    sed 's#"html","<hq>"#"html","“"#g'
