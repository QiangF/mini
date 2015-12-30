
# init

step

```
$ mkdir -pv server/{group_vars,roles} && cd server
mkdir: created directory ‘server’
mkdir: created directory ‘server/group_vars’
mkdir: created directory ‘server/roles’
~/server

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
mkdir -pv ~/server/{group_vars,roles} && cd server
mkdir -pv roles/dotfiles/{files,templates,tasks,handlers,vars,meta}
echo 'localhost' >> ~/server/hostfile
```

#  ENV

`ansible -m setup localhost` 获取 ansible 环境变量

## archboostrap under RHEL 6.x KVM

```
"ansible_product_version": "RHEL 6.2.0 PC",
"ansible_system_vendor": "Red Hat",
"ansible_distribution": "Archlinux",
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

## centos 7

```
$ ansible -i 'localhost,' all -c local -e 'ansible_python_interpreter=/usr/bin/python2' -m setup|egrep -i 'distribution|os_family'
"ansible_distribution": "CentOS", 
"ansible_distribution_major_version": "7", 
"ansible_distribution_release": "Core", 
"ansible_distribution_version": "7.2.1511", 
"ansible_os_family": "RedHat",
```

## fedora 23

```
$ ansible -i 'localhost,' all -c local -e 'ansible_python_interpreter=/usr/bin/python2' -m setup|egrep -i 'distribution|os_family'
"ansible_distribution": "Fedora", 
"ansible_distribution_major_version": "23", 
"ansible_distribution_release": "Twenty Three", 
"ansible_distribution_version": "23", 
"ansible_os_family": "RedHat", 
```









