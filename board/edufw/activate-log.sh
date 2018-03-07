#!/bin/sh

if [ -L "$TARGET_DIR/var/log" ]; then
    rm "$TARGET_DIR/var/log"
    mkdir "$TARGET_DIR/var/log"
fi
