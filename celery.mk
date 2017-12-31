# Celery
.PHONY: celery.help
PATH_DJANGO:=src

celery.help:
	@echo '    Celery:'
	@echo ''
	@echo '        celery                     Execute worker'
	@echo ''

celery: clean
	cd $(PATH_DJANGO); exec celery -A midoc worker --loglevel=info

