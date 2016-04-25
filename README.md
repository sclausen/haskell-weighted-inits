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
    -m,--megabytes MEGABYTES Limit the output to MEGABYTES
    
## example

following command will create a 1MB file full of seeded random inits of misssissippi.

``` sh
$ weighted-inits \
  --word mississippi \
  --seed 47 \
  --megabytes 1 > ./mississippis.txt
```