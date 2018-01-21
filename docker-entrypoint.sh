#!/usr/bin/env sh
php -v
composer update
composer run test
exec "$@"