weighted-inits
==============

This program generates an infinite output of (seeded) weighted inits of a word.

## dependencies

[stack](http://haskellstack.org)

## installation

``` sh
$ stack install
```

## usage

following command will create a 1MB file full of seeded random inits of misssissippi.

``` sh
$ weighted-inits "mississippi" 47 | dd of=./mississippis.txt bs=1 count=1M
```