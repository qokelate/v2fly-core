#!/bin/sh

set -ex

export 'TZ=Asia/Shanghai'

cd "$(dirname "$script")"
cd "$(realpath "$PWD")/main"
echo "WorkDir: $PWD"

output=`realpath "$PWD/../v2ray"`

go get

go build -a -trimpath \
-ldflags "-extldflags -static -s -w" \
-o "$output" .

echo "[INFO] output: $output"

exit


docker run --rm -it -v "$PWD:/data" -w /data golang:alpine ./build.sh

