# -i on bash is needed to pick up the correct umask from internal ~/.bashrc
.PHONY: start
start:
	docker-compose run --rm backend composer install
	docker-compose run --rm backend php /app/init --env=Development
	docker-compose up -d
	sleep 3
	docker-compose run --rm backend yii migrate -y
