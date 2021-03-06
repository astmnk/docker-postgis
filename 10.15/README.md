# PostGIS 2.4.9 using Postgres 10.15

The `postgis` image is built using the official `postgres` docker image, which explains some basic usage of the `postgres` image.

https://registry.hub.docker.com/_/postgres/

Starting a `postgis` container.

```
docker build -t postgis .
```

Once the server is running you can connect to it:

```
docker exec server-name psql -U postgres -l

                                    List of databases
       Name       |  Owner   | Encoding |  Collate   |   Ctype    |   Access privileges
------------------+----------+----------+------------+------------+-----------------------
 postgres         | postgres | UTF8     | en_US.utf8 | en_US.utf8 |
 template0        | postgres | UTF8     | en_US.utf8 | en_US.utf8 | =c/postgres          +
                  |          |          |            |            | postgres=CTc/postgres
 template1        | postgres | UTF8     | en_US.utf8 | en_US.utf8 | =c/postgres          +
                  |          |          |            |            | postgres=CTc/postgres
 template_postgis | postgres | UTF8     | en_US.utf8 | en_US.utf8 |
(4 rows)
```

When creating a database your can use the `template_postgis` template as it already has the extensions `postgis` and `postgis_topology` pre-installed. 

```
docker exec server-name psql -U postgres -c "CREATE DATABASE my_db TEMPLATE template_postgis;"

docker exec server-name psql -U postgres -d my_db -c "\dx"
                                         List of installed extensions
       Name       | Version |   Schema   |                             Description
------------------+---------+------------+---------------------------------------------------------------------
 plpgsql          | 1.0     | pg_catalog | PL/pgSQL procedural language
 postgis          | 2.1.7   | public     | PostGIS geometry, geography, and raster spatial types and functions
 postgis_topology | 2.1.7   | topology   | PostGIS topology spatial types and functions
(3 rows)
```
