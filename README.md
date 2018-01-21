# Docker PHP CI
Docker config for responsive Unit Testing / Continous Integration of the __Composer based__ PHP projects

## How to set up
* Clone this repo and make it as a __root of your project__
* Place your project sources in the __./sources__ directory (or pass that folder as __$SRCDIR__ env)
* A valid __composer.json__ must exist in the project directory
* By default __composer.json__ must contain __scripts > test__ entry. Example:
```json
    "scripts": {
        "test": [
            "phpunit --bootstrap vendor/autoload.php tests"
        ]
    }
```
* Uncomment and configure PHP versions in the __docker-compose.yml__
* Open terminal and change directory to the __root of your project__
* Start installation by `docker-compose up --build`

## How to run a project testing
Run cli command `docker-compose up --build`.

_* You don't need manually start a composer re-build. Any changes of the project sources will be applied
by default via `composer update` command in the docker-entrypoint.sh_

## How to customize test running
Default __docker-entrypoint.sh__ contains `composer run test` where `test` is the __scripts > test__ section
of the __composer.json__
