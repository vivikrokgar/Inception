# User Documentation

## Overview

This infrastructure provides:

* A secure HTTPS website
* A WordPress CMS
* A MariaDB database backend
* Persistent storage

---

## Starting the Project

Launch all services:

```bash
make
```

or

```bash
docker compose up --build
```

---

## Stopping the Project

```bash
make down
```

or

```bash
docker compose down
```

---

## Accessing the Website

Open:

```text
https://localhost:8443
```

or

```text
https://<your-domain>
```

Depending on your setup.

Because the SSL certificate is self-signed, your browser may display a warning. This is expected.

---

## Accessing the WordPress Administration Panel

Open:

```text
https://localhost:8443/wp-admin
```

Login using the administrator credentials defined in the `.env` file.

---

## Credentials

Credentials are stored inside:

```text
srcs/.env
```

Examples:

```env
SQL_DATABASE=
SQL_USER=
SQL_PASSWORD=

WP_ADMIN=
WP_ADMIN_PASSWORD=
WP_ADMIN_EMAIL=
```

---

## Verifying Services

Check running containers:

```bash
docker ps
```

Expected services:

```text
nginx
wordpress
mariadb
```

---

## Viewing Logs

NGINX

```bash
docker compose logs nginx
```

WordPress

```bash
docker compose logs wordpress
```

MariaDB

```bash
docker compose logs mariadb
```

---

## Persistence Verification

Create:

* a WordPress post
* a comment

Restart the containers:

```bash
docker compose down
docker compose up -d
```

The data should still be present.
