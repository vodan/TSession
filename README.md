# TSession
A simple bash script to handle Tmux session templates

This little script needs [Tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect.git) plugin.

## Usage

to restore a saved session enter tmux and call:

```console
$ TSession devel.session
```

to save the last session for later use (SESSIONNAME can be everything as long as the session does not already exists.)

```console
$ TSessionSave SESSIONNAME
```

## Install

Simply clone the repo and call:

```console
$ make install
```

PREFIX is supported. Default installation path is /usr/local/bin and /usr/local/share/TSession.


