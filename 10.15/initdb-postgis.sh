#!/bin/sh

set -x

WAIT=${WAIT:-3}

sleep $WAIT

psql <<EOSQL
CREATE DATABASE template_postgis;
UPDATE pg_database SET datistemplate = TRUE WHERE datname = 'template_postgis';
\c template_postgis
CREATE EXTENSION postgis;
CREATE EXTENSION postgis_topology;
EOSQL
