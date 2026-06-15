# *This project has been created as part of the 42 curriculum by vvalenti.*

# Inception

## Description

Inception is a system administration project from the 42 curriculum.

The goal of this project is to build a complete web infrastructure using Docker and Docker Compose. Each service runs inside its own dedicated container and communicates through a Docker network.

The infrastructure contains:

* NGINX configured with TLSv1.2/TLSv1.3
* WordPress with PHP-FPM
* MariaDB database
* Persistent storage using Docker volumes
* Environment-based configuration

The website is accessible through HTTPS and all data remains available after container restarts thanks to persistent volumes.

---

## Project Architecture

```text
                HTTPS (443)
                       |
                       v
                 +-----------+
                 |   NGINX   |
                 +-----------+
                       |
                 FastCGI :9000
                       |
                       v
                 +-----------+
                 | WordPress |
                 | PHP-FPM   |
                 +-----------+
                       |
                  Port 3306
                       |
                       v
                 +-----------+
                 | MariaDB   |
                 +-----------+
```

### Services

#### NGINX

* Handles HTTPS connections
* Uses a self-signed SSL certificate
* Serves WordPress files
* Forwards PHP requests to PHP-FPM

#### WordPress

* Runs PHP-FPM
* Automatically configures WordPress using WP-CLI
* Connects to MariaDB

#### MariaDB

* Stores WordPress data
* Creates database and users automatically during initialization
* Uses persistent storage

---

## Docker Usage

Docker allows each service to run in an isolated environment.

Advantages:

* Reproducible environment
* Easy deployment
* Service isolation
* Simplified dependency management

Each service is built from its own Dockerfile and runs inside its own container.

---

## Technical Choices

### Virtual Machines vs Docker

| Virtual Machine                      | Docker             |
| ------------------------------------ | ------------------ |
| Includes a complete operating system | Shares host kernel |
| Higher resource usage                | Lightweight        |
| Slower startup                       | Very fast startup  |
| Strong isolation                     | Process isolation  |

Docker was chosen because it is lighter, faster and easier to deploy.

---

### Secrets vs Environment Variables

| Secrets                    | Environment Variables             |
| -------------------------- | --------------------------------- |
| More secure                | Easier to use                     |
| Hidden from most processes | Visible inside container          |
| Recommended for production | Suitable for educational projects |

This project uses environment variables through a `.env` file because it matches the project requirements and keeps the configuration simple.

---

### Docker Network vs Host Network

| Docker Bridge Network   | Host Network       |
| ----------------------- | ------------------ |
| Container isolation     | Direct host access |
| Internal DNS resolution | No isolation       |
| Better security         | Less secure        |

A Docker bridge network was used to allow communication between containers while keeping services isolated.

---

### Docker Volumes vs Bind Mounts

| Docker Volumes     | Bind Mounts                |
| ------------------ | -------------------------- |
| Managed by Docker  | Managed by host filesystem |
| Easier portability | Easier direct access       |
| Better abstraction | More flexible              |

This project uses bind-mounted Docker volumes to satisfy the subject requirements and persist database and WordPress files.

---

## Instructions

### Requirements

* Docker
* Docker Compose

### Build and Run

```bash
make
```

or

```bash
docker compose up --build
```

### Stop Containers

```bash
make down
```

or

```bash
docker compose down
```

### Remove Containers and Volumes

```bash
make fclean
```

---

## Project Structure

```text
.
├── Makefile
├── README.md
├── USER_DOC.md
├── DEV_DOC.md
└── srcs
    ├── docker-compose.yml
    ├── .env
    └── requirements
        ├── nginx
        ├── wordpress
        └── mariadb
```

---

## Resources

### Docker

* https://docs.docker.com/
* https://docs.docker.com/compose/

### NGINX

* https://nginx.org/en/docs/

### MariaDB

* https://mariadb.com/kb/en/documentation/

### WordPress

* https://wordpress.org/documentation/

### PHP-FPM

* https://www.php.net/manual/en/install.fpm.php

### WP-CLI

* https://wp-cli.org/

---

## AI Usage

AI tools were used as learning and debugging assistants during the project.

Main usages:

* Understanding Docker networking concepts.
* Understanding MariaDB initialization behavior.
* Reviewing Docker Compose configuration.
* Debugging container startup issues.
* Reviewing NGINX and PHP-FPM communication.

All implementation, configuration, testing and validation were performed manually.
