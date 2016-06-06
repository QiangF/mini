
# bash

## ~/.bash_profile ~/.profile ~/.bashrc

`/etc/profile -> /etc/profile.d/* -> ~/.bash_profile`
`/etc/profile -> /etc/profile.d/* -> ~/.profile`

http://unix.stackexchange.com/questions/70519/linux-redhat-sudo-su-l-user-acct-does-not-source-profile

**login shell** 读取配置时，匹配到 `~/.bash_profile` 将 **不再读取** `~/.profile` ：

`man bash`

> When  bash  is  invoked  as  an **interactive login** shell, or as a **non-interactive** shell with the `--login` option, it first reads and executes commands from the file `/etc/profile`,  if  that  file  exists.   After  reading that file, it looks for `~/.bash_profile`, `~/.bash_login`, and `~/.profile`, in that **order**, and **reads and executes commands from the first one that exists and is readable**.

```
~/.bash_profile
    The personal initialization file, executed for login shells
~/.bashrc
    The individual per-interactive-shell startup file
```

https://wiki.archlinux.org/index.php/Bash

Environment variables are conventionally placed in `~/.profile` or `/etc/profile` so that all bourne-compatible shells can use them.

| File               | Login shells | Interactive, non-login shells |
|--------------------|--------------|-------------------------------|
| `/etc/profile`     | Yes          | No                            |
| `~/.bash_profile`  | Yes          | No                            |
| `~/.bash_logout`   | Yes          | No                            |
| `/etc/bash.bashrc` | No           | Yes                           |
| `~/.bashrc`        | No           | Yes                           |


http://askubuntu.com/questions/121073/why-bash-profile-is-not-getting-sourced-when-opening-a-terminal

`~/.bash_profile` is only sourced by bash when started in **interactive login** mode. That is typically only when you login at the console (`Ctrl+Alt+F1..F6`), or connecting via `ssh`.

When you log in **graphically(X11 GUI)**, `~/.profile` will be specifically sourced by the script that launches `gnome-session` (or whichever desktop environment you're using). So `~/.bash_profile` is **not sourced at all** when you log in **graphically**.

http://stackoverflow.com/questions/902946/about-bash-profile-bashrc-and-where-should-alias-be-written-in

**login shell** does **NOT** execute `~/.bashrc` but only `~/.profile` or `~/.bash_profile`, so you should source that one manually from the latter. You'll see me do that in my `~/.profile` too: `source ~/.bashrc`.

http://mywiki.wooledge.org/DotFiles

bash-only variables like `HISTSIZE` (this is not an environment variable, don't `export` it!)

## /etc/profile.d/

`/etc/profile.d/vim.sh` 中定义的 vi alias 会覆盖 `~/.shrc` 中定义的 vi function

`/etc/profile` 和 `/etc/bashrc` 都有下面的配置：


```
for i in /etc/profile.d/*.sh ; do
    if [ -r "$i" ]; then
        if [ "${-#*i}" != "$-" ]; then·
            . "$i"
        else
            . "$i" >/dev/null
        fi
    fi
done
```

`/etc/bashrc` 之在 `if ! shopt -q login_shell` 才会 `source` 上面的文件


## PROMPT $PS1

    # echo $PS1
    \[\ek\e\\\]\[\ek\W\e\\\] \[\e[1;31m\]${HOSTNAME} \[\e[01;34m\]\w \n \$\[\e[00m\]

`man bash` 章节 `PROMPTING`

    \e     an ASCII escape character (033)
    \h     the hostname up to the first '.'
    \H     the hostname
    \u     the username of the current user
    \w     the current working directory
    \W     the basename of the current working directory

`man console_codes`

    ESC (0x1B, ^[) starts an escape sequence

    | color | foreground | background |
    |-------+------------+------------|
    | bold  |          1 |          - |
    | red   |         31 |         41 |
    | green |         32 |         42 |
    | blue  |         34 |         44 |

`man ascii`

    Oct   Dec   Hex   Char                        Oct   Dec   Hex   Char
    ------------------------------------------------------------------------
    033   27    1B    ESC (escape)                133   91    5B    [ ]

# tmux

## non-login shell

tmux 默认启动的是 **login-shell** 每次都会 `source ~/.profile` ：

    __~/.PROFILE: 2016-06-06 21:40:44 PPID 2585 PID  -bash
    __~/.BASHRC: 2016-06-06 21:40:44 PPID 2585 PID  -bash

配置 `default-command` 参数，禁用默认 **login-shell** 启动 **non-login shell** :

https://wiki.archlinux.org/index.php/tmux#Start_a_non-login_shell

    set -g default-command "${SHELL}"

修改之后 tmux 启动新 pane 只 `source ~/.bashrc` ：

    __~/.BASHRC: 2016-06-07 00:24:11 PPID 5242 PID  /bin/bash

可以查看 `man tmux` 关于 `default-command` 和 `default-shell` 的区别







