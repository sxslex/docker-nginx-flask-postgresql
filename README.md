docker-nginx-flask-postgresql
=======================

Base docker image to run a PostgreSQL database server


Usage
-----

To create the image `sxslex/nginx-flask-postgresql`, execute the following command on the docker-nginx-flask-postgresql folder:

	docker build -t web/app .

To run the image and bind to port 5432:

	docker run -d -p 5432:5432 web/app

The first time that you run your container, a new user `postgres` with all privileges
will be created in PostgreSQL with a random password. To get the password, check the logs
of the container by running:

	docker logs <CONTAINER_ID>

You will see an output like the following:

	========================================================================
	You can now connect to this PostgreSQL Server using:

	    psql -h <host> -p <port> --username=postgres
	and enter the password 'WUZyHubI6HrF' when prompted

	Please remember to change the above password as soon as possible!
	========================================================================

In this case, `WUZyHubI6HrF` is the password assigned to the `postgres` user.

Done!


Setting a specific password for the admin account
-------------------------------------------------

If you want to use a preset password instead of a random generated one, you can
set the environment variable `POSTGRES_PASS` to your specific password when running the container:

	docker run -d -p 5432:5432 -e POSTGRES_PASS="mypass" web/app


Mounting the database file volume
---------------------------------

Coming soon!


Migrating an existing PostgreSQL Server
----------------------------------

Coming soon!
