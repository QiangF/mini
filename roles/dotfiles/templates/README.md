
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















