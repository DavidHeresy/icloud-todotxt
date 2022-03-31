#!/bin/sh

pylint --output-format=text icloud_todotxt | tee pylint.txt
score=$(sed -n 's/^Your code has been rated at \([-0-9.]*\)\/.*/\1/p' pylint.txt)
rm pylint.txt
rm -f public/pylint.svg
anybadge -l pylint -v $score -f public/pylint.svg 2=red 4=orange 8=yellow 10=green
