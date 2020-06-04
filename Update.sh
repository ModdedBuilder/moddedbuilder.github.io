rm ./Packages.bz2

dpkg-scanpackages debians > Packages

bzip2 -fks ./Packages