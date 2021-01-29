#!/bin/sh

export LANG=C
export caf_tag="LA.UM.5.3-02310-89xx.0"

list="
AndroidKernel.mk
Kbuild
Kconfig
Makefile
arch
block
crypto
drivers
firmware
fs
include
init
ipc
kernel
lib
mm
net
samples
scripts
security
sound
tools
usr
virt
"

START_TIME=$(date +%s)

CHECK_TAG=$(./dotfiles/bin/best_kernel "*8064.0" | grep TAG:)
CAF_TAG="${CHECK_TAG:5}"
echo $CAF_TAG > best_caf_kernel.txt

mkdir diff_log

for i in $list
do
	git diff tags/$CAF_TAG --word-diff $i 2>&1 | tee diff_log/$i.log
	#mv diff_log.txt diff_log/diff-$i.txt
done

echo "work end : $(($(date +%s)- $START_TIME))"
