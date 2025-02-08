make:
	docker-compose -f ./srcs/docker-compose.yml up -d

clean:
	docker-compose -f ./srcs/docker-compose.yml down

fclean : clean
	docker-compose -f ./srcs/docker-compose.yml down --volumes --rmi all --remove-orphans
	sudo rm -fr /home/${USER}/data


docker_kali_install :
	sudo apt update
	sudo apt install -y docker.io
	sudo systemctl enable docker --now
	sudo usermod -aG docker $USER

docker_kali_compose :
	sudo curl -L "https://github.com/docker/compose/releases/download/v2.22.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

re: fclean make

.PHONY: all clean fclean re