## Terragrunt
.PHONY: terragrunt.help
TERRAFORM_VERSION := 0.10.0
TERRAFORM_DIR:=$(PROVISION_DIR)/terraform
terragrunt := terragrunt

terragrunt.help:
	@echo '    terragrunt:'
	@echo ''
	@echo '        terragrunt                 Apply all'
	@echo '        terragrunt.encrypt         encrypt by env'
	@echo '        terragrunt.decrypt         decrypt by env'
	@echo '        terragrunt.plan            plan by env'
	@echo '        terragrunt.apply           apply by env'
	@echo '        terragrunt.destroy         destroy by env'
	@echo ''

terragrunt: clean
	@cd "${TERRAFORM_DIR}/us-east-1/" && $(terragrunt) apply-all --terragrunt-source-update

terragrunt.encrypt: clean
	@ansible-vault encrypt "${TERRAFORM_DIR}/us-east-1/${env}/variables.tf" \
		--vault-password-file "${HOME}/${PROJECT}.txt" && echo $(MESSAGE_HAPPY)

terragrunt.decrypt: clean
	@ansible-vault decrypt "${TERRAFORM_DIR}/us-east-1/${env}/variables.tf" \
		--vault-password-file "${HOME}/${PROJECT}.txt" && echo $(MESSAGE_HAPPY)

terragrunt.plan: clean
	@cd "${TERRAFORM_DIR}/us-east-1/${env}/" && $(terragrunt) plan --terragrunt-source-update

terragrunt.apply: clean
	@cd "${TERRAFORM_DIR}/us-east-1/${env}/" && $(terragrunt) apply --terragrunt-source-update

terragrunt.destroy: clean
	@cd "${TERRAFORM_DIR}/us-east-1/${env}/" && $(terragrunt) destroy --terragrunt-source-update
