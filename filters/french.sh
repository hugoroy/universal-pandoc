#!/bin/bash

# Take plain text and add some characters to make your plain text look better in
# French (e.g. unbreakable spaces instead of normal spaces within French style
# quotes « »)

sed 's#"t":"Str","c":"«"},{"t":"Space","c":\[\]#"t":"Str","c":"« "#g' | \
    sed 's#"t":"Str","c":"(«"},{"t":"Space","c":\[\]#"t":"Str","c":"(« "#g' | \
    sed 's#"t":"Space","c":\[\]},{"t":"Str","c":"»#"t":"Str","c":" »#g' | \
    sed 's#"t":"Str","c":"«"},{"t":"Space"#"t":"Str","c":"« "#g' | \
    sed 's#"t":"Str","c":"(«"},{"t":"Space"#"t":"Str","c":"(« "#g' | \
    sed 's#"t":"Space"},{"t":"Str","c":"»#"t":"Str","c":" »#g' | \
    sed 's#"t":"Space"},{"t":"Str","c":";#"t":"Str","c":" ;#g' | \
    sed 's#"t":"Space"},{"t":"Str","c":";#"t":"Str","c":" ;#g'
