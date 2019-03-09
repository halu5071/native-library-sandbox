#!/bin/bash

echo creating shared library 1
gcc -shared library.c -o libsample_1.so -fPIC

echo creating executable file linked with shared library 1
gcc -o main executable.c -lsample_1 -I./ -L./

echo execute 1
echo result of return_one function =======
./main

echo creating shared library 2 linked with shared library 1
gcc -shared library2.c libsample_1.so -fPIC -o libsample_2.so

echo creating executable file linked with shared librarh 2
gcc -o main2 executable2.c -lsample_2 -I./ -L./

echo execute 2
echo result of show_decorated_one function =======
./main2

echo moving so file and executable source to another dir
mkdir sandbox
cp executable2.c sandbox/
cp libsample_1.so sandbox/
cp libsample_2.so sandbox/
cd sandbox
gcc -o main2 executable2.c -lsample_2 -I./ -L./

echo result of executable
./main2
