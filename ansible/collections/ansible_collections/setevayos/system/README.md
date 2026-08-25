# setevayos.system

Роли системной сущности SetevayOS: обслуживание ОС.

| Роль | Назначение |
|---|---|
| `reboot_vm` | Перезагрузка ВМ с ожиданием возврата SSH |

Использование (FQCN):

```yaml
- ansible.builtin.import_role:
    name: setevayos.system.reboot_vm
```
