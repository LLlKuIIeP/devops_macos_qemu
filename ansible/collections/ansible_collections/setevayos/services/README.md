# setevayos.services

Роли сущности «Сервисы» SetevayOS: прикладные стеки поверх ВМ.

| Роль | Назначение |
|---|---|
| `hashistack` | Установка и настройка Consul + Nomad + Docker (+ UFW) |

Использование (FQCN):

```yaml
- ansible.builtin.import_role:
    name: setevayos.services.hashistack
```
