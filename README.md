# d_init
Dlang Project Template

Make a `dinit.bat` into your path with:

```
@echo Generating project '%1' ...
@echo off
git clone --quiet --depth=1 --branch=master https://github.com/SrMordred/d_init %1
rm -rf %1/.git
rm -rf %1/bin/.keep
rm -rf %1/include/.keep
rm -rf %1/build/.keep
cd %1
echo Done!

```

Usage:
`dinit my_new_project`