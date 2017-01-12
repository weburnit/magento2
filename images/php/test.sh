#!/usr/bin/env bash
rm -rf ../apps-dev
mkdir ../apps-dev
cp -R app/ ../apps-dev/
cp -R sr/ ../apps-dev/
mkdir ../apps-dev/web
cp web/*.php ../apps-dev/web/
cp -R web/ ../apps-dev/
cp -R core_test ../apps-dev/
cp -R feature ../apps-dev/
cp -R bin ../apps-dev/
cp cache.sh ../apps-dev/
cp composer* ../apps-dev/

cd ../apps-dev
composer install
app/console doctrine:cache:clear-query
app/console doctrine:cache:clear-metadata
php app/console assetic:dump
php app/console d:m:migrate -n
./cache.sh dev

chown -R www-data var/
chown -R www-data web/mediafile
chmod -R 777 var/
bin/phpunit -c app/
bin/codeception --config=core_tests/frontend_test/codeception.yml run acceptance --steps