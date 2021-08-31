#!/bin/bash

sed 's#"html","<label>"#"html","<a id="#g'  | \
    sed 's#"html","<\/label>"#"html","><\/a>"#g' | \
    sed 's#"html","<vref>"#"html","<a href=\#"#g'  | \
    sed 's#"html","<\/vref>"#"html",">~VRef.<\/a>"#g' | \
    sed 's#"html","<ref>"#"html","<a href=\#"#g'  | \
    sed 's#"html","<\/ref>"#"html",">~Ref.<\/a>"#g' | \
    sed 's#"html","<bigskip>"#"html","<br class=bigskip>"#g' | \
    sed 's#"html","<hg>"#"html","<span class=hangguillemet>« <\/span>"#g'| \
    sed 's#"html","<hq>"#"html","<span class=hangquote>“<\/span>"#g'
    
