# Если вам нужно, чтобы весь блок команд выполнялся в рамках одного процесса оболочки, совместите .SHELLFLAGS и цель .ONESHELL
.ONESHELL:
SHELL := /usr/bin/env bash
.SHELLFLAGS := -eu -o pipefail -c

EXEC := bash

SCRIPTS := \
	scripts/01_init.sh \
	scripts/02_build.sh \
	scripts/03_deploy.sh

.PHONY: all init
all: init create_vms deploy_cluster

start:
	@echo "=========================================="
	@echo "Выполняется: $(TARGET_NAME)"

end:
	@echo "Успешно завершено: $(TARGET_NAME)"
	@echo "******************************************"


init:
	@$(MAKE) start TARGET_NAME=$@
	$(EXEC) scripts/01_init.sh
	@$(MAKE) end TARGET_NAME=$@

create_vms:
	@$(MAKE) start TARGET_NAME=$@
	$(EXEC) scripts/02_create_vms.sh
	@$(MAKE) end TARGET_NAME=$@

deploy_cluster:
	@$(MAKE) start TARGET_NAME=$@
	$(EXEC) scripts/03_deploy_cluster.sh
	@$(MAKE) end TARGET_NAME=$@

# Флаг -e означает, что скрипт остановится при первой ошибке.
# Флаг -u выдаст ошибку при использовании неопределенной переменной.
# Флаг -o pipefail полезен, если внутри есть пайплайны.
#	bash -eu -o pipefail $@
#	@echo "Успешно завершено: $@"
