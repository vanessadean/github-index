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

In the selected directory, an index/html file will be generated listing all detected repositories, in a tree-like format. If the repo includes an origin remote, the name of the repository will be a hyperlink to the remote.

Since gitindex recursively indexes all directories, it is recommended that you do not run this program on your home directory.