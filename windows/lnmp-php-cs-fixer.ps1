#
# https://github.com/FriendsOfPHP/PHP-CS-Fixer
#

. "$PSScriptRoot/.env.example.ps1"

if (Test-Path "$PSScript/.env.ps1"){
  . "$PSScriptRoot/.env.ps1"
}

docker run -it --rm `
  --mount type=bind,src=$PWD,target=/app,consistency=cached `
  --mount src=lnmp_composer_cache-data,target=/tmp/cache `
  --entrypoint php-cs-fixer `
  ${LNMP_PHP_IMAGE} `
  $args
