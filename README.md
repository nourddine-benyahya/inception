# Inception - 42 Project Devops Projects

## Introduction
Inception is a project from 42 school focused on Docker and containerization. The goal is to create a fully functional multi-container infrastructure using Docker Compose, managing services efficiently while leveraging volumes, networks, and Docker best practices.

## Table of Contents
- [Docker Basics](#docker-basics)
  - [Images and Containers](#images-and-containers)
  - [Dockerfile](#dockerfile)
  - [Volumes (Bind Mount)](#volumes-bind-mount)
  - [Docker Networks (Bridge)](#docker-networks-bridge)
  - [Docker Compose](#docker-compose)
- [Project Structure](#project-structure)
- [Services Overview](#services-overview)
- [Docker Runtime Explanation](#docker-runtime-explanation)
- [How to Run the Project](#how-to-run-the-project)
- [Cleaning Up](#cleaning-up)

## 📦 Docker Concepts Overview
### 🖼️ Docker Images & Containers
A Docker image is a blueprint for running an application. A container is a running instance of an image. Containers are isolated but can communicate through networks.

### 📄 Dockerfile
Each service in this project is built from a `Dockerfile`, defining the base image, dependencies, and configurations required to run the service.
Blueprint for building images containing:

    - Base image

    - Dependencies

    - Configuration files

    - Startup commands

### 📂 Volumes (Bind Mounts)
Volumes store persistent data. In this project, bind mounts are used to link directories on the host to directories inside the container, ensuring data persistence between restarts.

### 🌐 Docker Network (Bridge)
A bridge network allows multiple containers to communicate within an isolated network. Each container in this project is attached to a bridge network to enable communication between services.

### 🎛️ Docker Compose
Docker Compose simplifies multi-container management using a `docker-compose.yml` file. This file defines all services, networks, and volumes needed for the project.

## 🏗️ Project Structure
```
|-Makefile
 |-secrets
 | |-example.credentials.txt
 | |-example.db_password.txt
 | |-example.db_root_password.txt
 |-srcs
 | |-docker-compose.yml
 | |-example.env
 | |-requirements
 | | |-bonus
 | | | |-adminer
 | | | | |-Dockerfile
 | | | | |-tools
 | | | | | |-setup.sh
 | | | |-codvisor
 | | | | |-Dockerfile
 | | | |-ftp
 | | | | |-Dockerfile
 | | | | |-tools
 | | | | | |-setup.sh
 | | | | | |-vsftpd.conf
 | | | |-redis
 | | | | |-Dockerfile
 | | | |-staticWeb
 | | | | |-Dockerfile
 | | | | |-tools
 | | | | | |-index.html
 | | | | | |-script.js
 | | | | | |-styles.css
 | | |-mariadb
 | | | |-Dockerfile
 | | | |-tools
 | | | | |-setup.sh
 | | |-nginx
 | | | |-conf
 | | | | |-nginx.conf
 | | | |-Dockerfile
 | | |-tools
 | | | |-volume_creation.sh
 | | |-wordpress
 | | | |-Dockerfile
 | | | |-tools
 | | | | |-setup.sh
```

## 🚀 Services Overview (this is just the conclusion of every service search more to understand all the concept)
- **Nginx**: Acts as a reverse proxy to route requests.
- **MariaDB**: Database management system for WordPress.
- **WordPress**: Web application with a CMS for content management.
- **Adminer**: Web-based database management tool.
- **FTP**: File transfer service.
- **Redis**: In-memory data structure store.
- **Codvisor**: Additional monitoring/debugging tool.
- **StaticWeb**: Serves static web content.

## 🔄 Docker Runtime Architecture Explanation
- **dockerd**: The main Docker daemon managing containers, networks, and images.
- **docker-containerd**: A daemon that handles container execution and lifecycle.
- **docker-runc**: A low-level runtime that directly interacts with containers.
- **docker-containerd-ctr**: A command-line tool for interacting with containerd.
- **docker-containerd-shim**: Ensures containers remain running after containerd exits.

## 🛠️ Installation & Usage
  #### Prerequisites

  - Docker & Docker Compose

  - GNU Make

  - Proper directory permissions

  #### Configuration

  - Clone repository:
      ```bash
      git clone https://github.com/nourddine-benyahya/inception
      ```

  - Set up secrets:
      ```bash
      cp secrets/example.*.txt secrets/same_name_with_out_eaxmple.txt
      ```
        ```bash
      cp srcs/example.env srcs/.env
      ```

  - Edit .env and secrets file with your credentials

  #### To build and start the project, run

  - This will execute Docker Compose to build and start all defined services.
      ```bash
      make
      ```
  - To stop and remove containers, run:
      ```bash
      make clean
      ```
  - To remove all images, volumes, and networks, run:
      ```bash
      make fclean
    ```

Access Services

  - WordPress: https://localhost

  - codvisor: http://localhost:8080

  - Adminer: http://localhost:9090

  - Static Site: http://localhost:4242


## Conclusion
This project demonstrates a containerized multi-service infrastructure using Docker and Docker Compose, implementing best practices for networking, volumes, and service management.

