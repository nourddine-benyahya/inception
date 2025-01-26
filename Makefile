make:
	bash ./srcs/requirements/tools/volume_creation.sh
	docker-compose -f ./srcs/docker-compose.yml up --build -d

clean:
	docker-compose -f ./srcs/docker-compose.yml down

fclean : clean
	docker-compose -f ./srcs/docker-compose.yml down --volumes --rmi all
	docker system prune -a -f
	sudo rm -fr /home/${USER}/data

remove:
	docker-compose -f ./srcs/docker-compose.yml down

rm_containers :
	docker rm -f $(docker ps -aq)
rm_images :
	docker rmi -f $(docker images -aq)

rm_images_force : rm_containers rm_images

rm_volumes:
	docker volume rm $(docker volume ls -q)
	sudo rm -fr /home/${USER}/data


docker_install :
	sudo apt update
	sudo apt install -y docker.io
	sudo systemctl enable docker --now
	sudo usermod -aG docker $USER

docker_compose :
	sudo curl -L "https://github.com/docker/compose/releases/download/v2.22.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose


