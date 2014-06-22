github-index
============

Utility to generate an index of your local git repositories

## Installation
```bash
gem install gitindex
```

## Usage
From any directory, run executable with
```bash
gitindex
```
Command line interface will prompt you to select a directory to map. Directories can use relative or absolute paths. If left blank, gitindex will map your current directory.

Since gitindex recursively indexes all directories, it is recommended that you do not run this program on your home directory.