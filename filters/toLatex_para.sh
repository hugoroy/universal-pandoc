#!/bin/bash

# Insert a \para{} command in new paragraphs, to allow counting paragraphs and
# enumerate them.

sed 's#"t":"Para","c":\[{"t":"Str#"t":"Para","c":\[{"t":"RawInline","c":\["tex","\\\\para{}"\]},{"t":"Str#g' | sed 's#\[{"t":"Para","c":\[{"t":"RawInline","c":\["tex","\\\\para{}"\]},{"t":"Str#\[{"t":"Para","c":\[{"t":"Str#g' #| sed 's#"t":"Para","c":\[{"t":"RawInline","c":\["tex","\\\\para{}"\]},{"t":"Str","c":"("},{"t":"Cite",#"t":"Para","c":\[{"t":"Str","c":"("},{"t":"Cite",#g'




