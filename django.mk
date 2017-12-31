# Django
.PHONY: django.migrate
PATH_DJANGO:=src
MANAGE:=manage.py
SERVICE:=web

django.help:
	@echo '    Django:'
	@echo ''
	@echo '        django                     command=(shell|createsuperuser|migrate|populate|populate_texts)'
	@echo '        django.runserver 	      run server 0.0.0.0 env=(dev|stage|prod)'
	@echo ''

django: clean
	@if [ "${env}" == "" ]; then \
		docker-compose run --rm "$(SERVICE)" bash -c "cd $(PATH_DJANGO); python $(MANAGE) ${command}" ; \
	else \
		docker-compose -f docker-compose.yml -f "${PATH_DOCKER_COMPOSE}"/"${env}".yml run --rm "$(SERVICE)" bash -c "cd $(PATH_DJANGO); python $(MANAGE) ${command}"; \
	fi


django.runserver: clean
	@if [ "${env}" == "" ]; then \
		docker-compose run --rm --service-ports "$(SERVICE)" bash -c "cd $(PATH_DJANGO); python $(MANAGE)  runserver 0.0.0.0:${PROJECT_PORT}" ; \
	else \
		docker-compose -f docker-compose.yml -f "${PATH_DOCKER_COMPOSE}"/"${env}".yml run --rm --service-ports "$(SERVICE)" bash -c "cd $(PATH_DJANGO); python $(MANAGE)  runserver 0.0.0.0:${PROJECT_PORT}"; \
	fi