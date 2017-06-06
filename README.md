
# TODO

# DONE

1. GUI: gui variable define
2. `sudo su - user` 无法 `source ~/.profile`
3. backup 用来区分和对比直接对 dotfiles 文件的修改，因为 dotfiles 是由 ansible 生成的不受 git 控制
4. root tmux PS1

# init

```
$ mkdir -pv mini/{group_vars,roles} && cd mini
mkdir: created directory ‘mini’
mkdir: created directory ‘mini/group_vars’
mkdir: created directory ‘mini/roles’

$ mkdir -pv roles/dotfiles/{files,templates,tasks,handlers,vars,meta}
mkdir: created directory ‘roles/dotfiles’
mkdir: created directory ‘roles/dotfiles/files’
mkdir: created directory ‘roles/dotfiles/templates’
mkdir: created directory ‘roles/dotfiles/tasks’
mkdir: created directory ‘roles/dotfiles/handlers’
mkdir: created directory ‘roles/dotfiles/vars’
mkdir: created directory ‘roles/dotfiles/meta’
```

script

```
mkdir -pv ~/mini/{group_vars,roles} && cd mini
mkdir -pv roles/dotfiles/{files,templates,tasks,handlers,vars,meta}
echo 'localhost' >> ~/mini/hostfile
```

# ENV

`ansible -m setup localhost` 获取 ansible 环境变量

ansible 依赖 python 2.x 如果系统有多个 python ， python 路径识别会有问题 (Archlinux)：

```
$ ansible -i 'localhost,' all -c local -m setup
localhost | FAILED >> {
  "failed": true,
  "msg": "/bin/sh: /usr/bin/python: No such file or directory\n",
  "parsed": false
}
```

## sudo user

`sudo ansible-playbook -i hostfile  user.dotfiles.yml` :

```
---
- hosts: local
  sudo: True
  sudo_user: username
  gather_facts: yes
  any_errors_fatal: true
  roles:
    - dotfiles
```

## archboostrap under RHEL 6.x KVM

```
$ ansible -i 'localhost,' all -c local -e 'ansible_python_interpreter=/usr/bin/python2' -m setup

"ansible_product_version": "RHEL 6.2.0 PC",
"ansible_system_vendor": "Red Hat",
"ansible_distribution": "Archlinux",
"ansible_os_family": "Archlinux",
"ansible_env": {
    "DISTRO": "ARCHLINUX",
}
```

## gentoo

```
$ ansible -i 'localhost,' all -c local -e 'ansible_python_interpreter=/usr/bin/python2' -m setup|grep Gentoo

"ansible_distribution": "Gentoo",
"ansible_os_family": "Gentoo",
```

## CentOS 7

```
$ ansible -i 'localhost,' all -c local -e 'ansible_python_interpreter=/usr/bin/python2' -m setup|egrep -i 'distribution|os_family'

"ansible_distribution": "CentOS",
"ansible_distribution_major_version": "7",
"ansible_distribution_release": "Core",
"ansible_distribution_version": "7.2.1511",
"ansible_os_family": "RedHat",
```

## Fedora 23

```
$ ansible -i 'localhost,' all -c local -e 'ansible_python_interpreter=/usr/bin/python2' -m setup|egrep -i 'distribution|os_family'

"ansible_distribution": "Fedora",
"ansible_distribution_major_version": "23",
"ansible_distribution_release": "Twenty Three",
"ansible_distribution_version": "23",
"ansible_os_family": "RedHat",
```

## Fedora 26

- Fedora 26 默认使用 Python 3
- ansible 2.2 开始支持 Python 3 ：[Python 3 Support](https://docs.ansible.com/ansible/python_3_support.html)

命令参数：

    ansible-playbook -i 10.20.30.1, \
                     -e 'ansible_ssh_port=2222' \
                     -e 'ansible_python_interpreter=/usr/bin/python3' \
                     -e 'desk=true' \
                     -u $USER dotfiles.yml

# debug

```
$ ansible-playbook -i hostfile -e 'ansible_python_interpreter=/usr/bin/python2' dotfiles.yml --tag emacs -e 'test=True'
```

# dotfiles

## shell

1. login shell
2. non-login shell
3. interactive shell
4. non-interactive shell
5. sudo su - user NOT source ~/.profile

ssh remote login only souce one of `~/.bash_profile` `~/.profile`
如果 `~/.bash_profile` `~/.profile` 都存在，只加载 `~/.bash_profile`。
ssh 登录也不会加载 `~/.bashrc` 需要在 `~/.(bash_)profile` 中 **手动加载** ：

    [ -f ~/.bashrc ] && source ~/.bashrc





