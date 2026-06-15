# Developer Documentation

## Prerequisites

Required software:

* Docker
* Docker Compose
* GNU Make

Verify installation:

```bash
docker --version
docker compose version
make --version
```

---

## Environment Configuration

Create the required directories:

```bash
mkdir -p /home/vvalenti/data/wordpress
mkdir -p /home/vvalenti/data/mariadb
```

Configure variables inside:

```text
srcs/.env
```

Example:

```env
SQL_DATABASE=wordpress
SQL_USER=user
SQL_PASSWORD=password

SQL_ROOT_PASSWORD=rootpassword

WP_ADMIN=admin42
WP_ADMIN_PASSWORD=password42
WP_ADMIN_EMAIL=admin@example.com
```

---

## Build the Project

```bash
make
```

Equivalent command:

```bash
docker compose up --build
```

---

## Stop the Project

```bash
make down
```

Equivalent:

```bash
docker compose down
```

---

## Rebuild from Scratch

```bash
make re
```

---

## Remove Containers and Volumes

```bash
make fclean
```

Equivalent:

```bash
docker compose down -v
```

---

## Useful Docker Commands

List containers:

```bash
docker ps -a
```

Inspect logs:

```bash
docker compose logs
```

Access a container:

```bash
docker exec -it nginx bash
```

```bash
docker exec -it wordpress bash
```

```bash
docker exec -it mariadb bash
```

---

## Data Persistence

### MariaDB

Stored in:

```text
/home/vvalenti/data/mariadb
```

Mounted inside container:

```text
/var/lib/mysql
```

---

### WordPress

Stored in:

```text
/home/vvalenti/data/wordpress
```

Mounted inside container:

```text
/var/www/wordpress
```

---

## Service Communication

All services communicate through the Docker bridge network:

```text
inception
```

Container DNS names:

```text
nginx
wordpress
mariadb
```

Examples:

```text
wordpress -> mariadb:3306
nginx -> wordpress:9000
```

---

## Container Responsibilities

### NGINX

* HTTPS termination
* Static file serving
* PHP request forwarding

### WordPress

* PHP-FPM execution
* WordPress installation
* WordPress configuration

### MariaDB

* Database management
* User management
* Data persistence

---

## Project Lifecycle

1. Docker Compose creates the network.
2. MariaDB starts and initializes the database.
3. WordPress waits for MariaDB.
4. WP-CLI configures WordPress automatically.
5. PHP-FPM starts.
6. NGINX starts and exposes HTTPS.
