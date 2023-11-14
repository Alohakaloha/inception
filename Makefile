build:
	@mkdir -p /home/trung/data/wordpress || true
	@mkdir -p /home/trung/data/mariadb || true
	docker-compose -f srcs/docker-compose.yml build

up:
	docker-compose -f srcs/docker-compose.yml up -d

down:
	docker stop $(docker ps -qa) || true
	docker-compose -f srcs/docker-compose.yml down
re:
	re:
	@printf "Rebuild configuration ...\n"
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build

clean: down
	printf "Cleaning configuration ..\n"
	@docker system prune -a


fclean:
	@echo "Total clean of all configurations docker\n"
	@docker stop $$(docker ps -qa) || true
	@docker system prune --all --force --volumes
	@docker network prune --force
	@docker volume prune --force
	@docker volume rm srcs_wordpress|| true
	@docker volume rm srcs_mariadb || true
	@sudo rm -rf /home/trung/data/wordpress || true
	@sudo rm -rf /home/trung/data/mariadb || true
#	@sudo rm -rf /home/trung/Desktop/Inception/srcs/requirements/wordpress/data
#	@sudo rm -rf /home/trung/Desktop/Inception/srcs/requirements/mariadb/data
#	@sudo rm -rf /home/trung/Desktop/Inception/srcs/requirements/nginx/tools/nginx.crt
#	@sudo rm -rf /home/trung/Desktop/Inception/srcs/requirements/nginx/tools/nginx.key


.PHONY	: all build down re clean fclean