# Docker PHP CI
Docker-compose config for PHP projects based on __Composer__ to speed up Unit Testing or Contionus Integration.

## How to set up
* Clone this repo and make it as __root of your project__
* Place your project in __./sources__ directory (or pass the project folder as __$SRCDIR__ env)
* A valid __composer.json__ must exist in the project directory
* By default __composer.json__ must contain __scripts > test__ entry. Example:
```json
    "scripts": {
        "test": [
            "phpunit --bootstrap vendor/autoload.php tests"
        ]
    }
```
* Check configured PHP versions in the __docker-compose.yml__
* Run the installation from __root of your project__ by cli `docker-compose up --build`

## How to test a project
Run cli command `docker-compose up --build`.

_* You don't need to manually start composer re-build. Any changes of project source folder will be applied
by default via `composer update` command in docker-entrypoint.sh_

## How to customize test running
Default __docker-entrypoint.sh__ contains `composer run test` where `test` is __scripts > test__ section
of the __composer.json__