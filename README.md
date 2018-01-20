# Docker PHP CI
Use this docker-compose config for __composer__ based projects to reach responsive Unit Testing or Contionus Integration.

## How to set up
* Clone this and make it as __root__ of your project
* Place project sources in the __./src__ subfolder (or pass it to the Dockerfile ENV __$SRCDIR__)
* Check in project sources __composer.json__ exists and correct
* By default __composer.json__ must contain __scripts:test__ entry. Example:
```json
        "scripts": {
            "test": [
                "phpunit --bootstrap vendor/autoload.php tests"
            ]
        }
```
* Set up in Dockerfile __#core__ section necessary PHP extensions (by default it's __mbstring__, __intl__)
* Check PHP versions configured up in the __docker-compose.yml__
* Run installation from cli `docker-compose up --build`

## How to test a project
Run cli command `docker-compose up --build`.

_* You don't need to manually start composer re-build. Any changes of project source folder will be applied by default via `composer update` command in docker-entrypoint.sh_

## How to customize test running
Default __docker-entrypoint.sh__ contains `composer run test` where `test` is __scripts:test__ section of __composer.json__