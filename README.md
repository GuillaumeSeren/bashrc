Bash configuration
==================

" Simple and efficient bash setup for most uses. "

## Why ?
Because I am lazy of copying it everywhere,
I switch some time ago to zsh and would like to keep this bash setup updated.

## Philosophy :
I like the `KISS` mantra (*Keep It Simple, Stupid*),
so I try to get quality and efficient solution.

## Usage & Installation :
You can clone this repos in your home directory, like:
```
$ git clone https://github.com/GuillaumeSeren/bashrc ~/.bashrc.d
# Add a link to the bashrc
$ ln -s ~/.bashrc.d/bashrc.sh ~/.bashrc
# Then reload your bash profile
$ . ~/.bashrc
```

## Structure:
The Bash configuration is broken into several files:

File                  | Description
----------------------|------------
`.bashrc.sh`          | Central **bash** file, source the others.
`.bashrc.set.sh`      | **Set** the general variables.
`.bashrc.alias.sh`    | Define the **alias**.
`.bashrc.function.sh` | Add the **functions**.
`.bashrc.history.sh`  | Configure the **history** feature.
`.bashrc.prompt.sh`   | Set the **prompt**.

## Who ?
Mainly useful for server and headless system where you don't want zsh,
it can also be a good starting point for beginners, and maybe __fit your need__,
if your staying with bash for any reason.

## Participate !
If you find it useful, and would like to add your tips and tricks in it,
feel free to fork this project and fill a __Pull Request__.

## Licence
TODO !!
