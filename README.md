# Symfony Swoole Skeleton
skeleton for symfony swoole projects with docker.

## Prerequisites

* **[Docker compose](https://docs.docker.com/compose/install/)**
* **[Windows Subsystem for Linux 2](https://docs.microsoft.com/en-us/windows/wsl/install-win10)**

## Configuration
* ### configure _docker-compose.yaml_
	* replace all ***my_app*** words with your project name.
	* replace environment variables with your database  configuration.

* ### configure _.env_
	* replace line 31 with your database configuration.

* ### write sql script in _dockerfile/init.sql_
	* write sql to create tables or other queries.

## Running the server
command to run the server:

	$ docker-compose up

command to run the server in background:

	$ docker-compose up -d
