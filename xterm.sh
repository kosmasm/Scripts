#!/bin/bash
bg=rgbi:`dd if=/dev/urandom bs=1 count=3 2>/dev/null | od -tu1 | awk
'{b=0.1/256; printf("%s/%s/%s\n", $2*b, $3*b, $4*b); exit(0)}'`
exec xterm -bg $bg -fg white "$@"

