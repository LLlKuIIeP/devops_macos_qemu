# setevayos.virtualization

Роли сущности «Виртуализация» SetevayOS: полный жизненный цикл ВМ на QEMU/HVF под macOS.

| Роль | Назначение |
|---|---|
| `download_ubuntu_cloudimg` | Скачивание Ubuntu cloud image (arm64) |
| `create_vm_disks` | Создание qcow2 дисков на базе образа |
| `create_cloudinit_iso` | Сборка cloud-init ISO (noCloud) |
| `create_ovmf_vars` | Создание файлов OVMF_VARS (UEFI) |
| `qemu_vms` | Запуск нескольких ВМ QEMU ARM64 на macOS |

Использование (FQCN):

```yaml
- ansible.builtin.import_role:
    name: setevayos.virtualization.qemu_vms
```
