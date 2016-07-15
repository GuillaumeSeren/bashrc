Bash configuration
==================

" Simple and efficient bash setup for most uses. "
![alt tag](https://github.com/GuillaumeSeren/bashrc/blob/master/img/bashconfig_prompt.png)

## Why ?
Because I am lazy of copying it everywhere,
I switched some time ago to zsh but I still use bash on most remote server.

## Philosophy :
I like the `KISS` mantra (*Keep It Simple, Stupid*),
so I try to get quality and efficient solution.

## Pattern
I define an alias **up** to upgrade the system, I try to follow good practice,
and so I add some more check to restart upgraded service ([checkrestart][checkrestart]) and
check security ([glsa-check][glsa]).

## Usage & Installation :
You can clone this repos in your home directory, like:
```
$ git clone https://github.com/GuillaumeSeren/bashrc ~/.bashrc.d
# Add a link to the bashrc
$ ln -s ~/.bashrc.d/bashrc.sh ~/.bashrc
# Then reload your bash profile
$ . ~/.bashrc
# To enable advanced feature go to 'Personalize' section
```

## Structure:
The Bash configuration is broken into several files:

File                          | Description
------------------------------|------------
`.bashrc.sh`                  | Central **bash** file, source the others.
`.bashrc.set.sh`              | **Set** the general variables.
`.bashrc.alias.sh`            | Define the **alias**.
`.bashrc.function.sh`         | Add the **functions**.
`.bashrc.history.sh`          | Configure the **history** feature.
`.bashrc.prompt.sh`           | Set the **prompt**.
`.bashrc.local.sh`            | Ass some **user configuration**.
`user.d/bashrc.local-user.sh` | User config file, customize and more.

## Personalize
You can add your own tweaks, and overide any alias / functions,
defined in the basic setup, here how to do it.

Create a file named bashrc.local-user.sh in the user config directory 'user.d'
```
$ touch user.d/bashrc.local-user.sh
```
After in the file you can source some lib, like Debian of Gentoo file,
and define your own alias and functions.

Below a sample of a bashrc.local-user.sh
```
# Source the lib-gentoo
[ -f "$BASH_REAL_PATH"/bashrc.lib-gentoo.sh ] && source "$BASH_REAL_PATH"/bashrc.lib-gentoo.sh

# Define an awesome alias
alias hello="echo hello from my user alias"

# user fzf module
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
```

## Who ?
Mainly useful for server and headless system where you don't want zsh,
it can also be a good starting point for beginners, and maybe __fit your need__,
if your staying with bash for any reason.

## Participate !
If you find it useful, and would like to add your tips and tricks in it,
feel free to fork this project and fill a __Pull Request__.

## Licence
The project is GPLv3.


[glsa]: https://www.gentoo.org/support/security/
[checkrestart]: http://arcdraco.net/checkrestart
