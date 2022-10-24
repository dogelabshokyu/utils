#!/bin/sh

start_time=$(date +%s)
source build/envsetup.sh
lunch $1-$2
build -j$(nproc)
end_time=$(date +%s)
work_time=$((end_time - start_time))

echo $work_time
