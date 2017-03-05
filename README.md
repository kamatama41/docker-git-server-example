# docker-git-server-example
This repository can create a local Git server with Docker.

## Usage

Install Docker and create your SSH key ([ref](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/)) if you don't have them.
And then run `create_git_server.sh` so that a Git server will be running locally and we can access it with SSH 2222 port.

```
$ git clone ssh://git@localhost:2222/git/repos/awesome-repo.git
Cloning into 'awesome-repo'...
Warning: Permanently added '[localhost]:2222' (ECDSA) to the list of known hosts.
remote: Counting objects: 6, done.
remote: Compressing objects: 100% (3/3), done.
remote: Total 6 (delta 1), reused 0 (delta 0)
Receiving objects: 100% (6/6), done.
Resolving deltas: 100% (1/1), done.
Checking connectivity... done.
$
$ cd awesome-repo
$
$ git log
commit f35d53a97488fac01267d094551df59a53e7ae07
Author: xxxx xxxx <xxxx@example.com>
Date:   Mon Mar 6 02:10:30 2017 +0900

    Add hello.txt

commit b15e864ddade594953ef671d1a2d3b4a0e3e9b0d
Author: xxxx xxxx <xxxx@gmail.com>
Date:   Mon Mar 6 02:10:30 2017 +0900

    my first commit

```
