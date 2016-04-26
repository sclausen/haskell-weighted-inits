weighted-inits
==============

This program generates an infinite output of (seeded) weighted inits of a word.
The intention to write this is a intra-departmental coding challenge to find
the number of words within an undelimited string.
## dependencies

[stack](http://haskellstack.org)

## installation

``` sh
$ stack install
```

## options

    -h,--help                Show this help text
    -w,--word WORD           The word to print the inits of
    -s,--seed SEED           The seed for the random function
    -b,--bytes BYTES Limit the output to BYTES

| SI  | Bytes                                                              | 
| --- |:-------------------------------------------------------------------|
| KB  | 1000 (i.e. 1KB equals 1000 Byte)                                   |
| K   | 1024 (i.e. 1K equals 1024 Byte)                                    |
| MB  | 1000000 (= 1000 * 1000, i.e. 1MB equals 1000000 Byte)              |
| M   | 1048576 (= 1024 * 1024, i.e. 1M equals 1048576 Byte)               |
| GB  | 1000000000 (= 1000 * 1000 * 1000, i.e. 1GB equals 1000000000 Byte) |
| G   | 1073741824 (= 1024 * 1024 * 1024, i.e. 1G equals 1073741824 Byte)  |

## example

following command will create a 1MB file full of seeded random inits of misssissippi.

``` sh
$ weighted-inits \
  --word mississippi \
  --seed 47 \
  --bytes 1M > ./mississippis.txt
```