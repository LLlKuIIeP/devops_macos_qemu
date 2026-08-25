# setevayos.network

Роли сущности «Сеть» SetevayOS: всё, что работает с сетью и сетевой идентификацией узлов.

| Роль | Назначение |
|---|---|
| `netplan_config` | Настройка сети через netplan на нескольких ВМ |
| `set_hostname` | Установка hostname и обновление /etc/hosts |
| `wait_ssh` | Ожидание доступности ВМ по SSH |
| `brew_install_casks` | Установка пакетов хоста через Homebrew (qemu, ansible) |
| `apt_upgrade` | Обновление пакетов через apt (update/full-upgrade/autoremove) |

Использование (FQCN):

```yaml
- ansible.builtin.import_role:
    name: setevayos.network.netplan_config
```
