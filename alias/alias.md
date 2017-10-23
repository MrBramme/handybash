# Handy commandline aliases

## Permanent aliases
An alias remains in effect during the current login session only. You can add them to `~/.bashrc` to avoid this issue.


## aliases
### directory

- go up: `alias ..='cd ..'`
- go up 2: `alias .2='cd ../..'`
- go to quicklink: `alias astart='cd c:/frequently/used/folder'`
- see all : `alias lsa='ls -la'`
### ssh
Don't do this. see https://www.cyberciti.biz/faq/create-ssh-config-file-on-linux-unix/
- ~~quick ssh: `alias server_name='ssh user@ip`~~
- ~~quick ssh with rmate: `alias server_name_rmate='ssh -R 52698:localhost:52698  user@ip`~~