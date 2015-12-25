
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












