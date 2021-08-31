#!/bin/bash

# Useful to add labels in your text with <label>id</label> and then refer to them
# with <ref>id</ref> or <vref>id</vref>. Great if you need to list attachments, or
# have numbered paragreaphs.

sed 's#"html","<label>"#"html","<a id="#g'  | \
    sed 's#"html","<\/label>"#"html","><\/a>"#g' | \
    sed 's#"html","<vref>"#"html","<a href=\#"#g'  | \
    sed 's#"html","<\/vref>"#"html",">~VRef.<\/a>"#g' | \
    sed 's#"html","<ref>"#"html","<a href=\#"#g'  | \
    sed 's#"html","<\/ref>"#"html",">~Ref.<\/a>"#g' | \
    sed 's#"html","<bigskip>"#"html","<br class=bigskip>"#g' | \ # Useful typographic feature in LaTeX to have in HTML
    sed 's#"html","<hg>"#"html","<span class=hangguillemet>« <\/span>"#g'| \ # Use until CSS handles hanging quotes
    sed 's#"html","<hq>"#"html","<span class=hangquote>“<\/span>"#g'
    
