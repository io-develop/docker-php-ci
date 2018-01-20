#!/usr/bin/env sh
composer update
composer run test
exec "$@"