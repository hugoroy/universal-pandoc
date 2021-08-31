#!/bin/bash

# Fix some strange XeTeX behaviour in French...

sed 's#« #«#g' | \
    sed 's# »#»#g' | \
    sed 's# :#:#g'
