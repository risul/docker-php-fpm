#!/bin/bash

echo "INFO: Running startup task for Laravel container"

set -e

PREINSTALLED_FOLDER=/var/myapp
APP_FOLDER=/var/www/$APP_NAME

# Does the app folder exist?
if [ -d "$APP_FOLDER" ]; then
  echo "INFO: App folder exists.. use existing app"


else
  echo "INFO: App folder does not exist.. start with fresh laravel app"
  
  # Moved preinstalled Laravel app to the App folder
  mv $PREINSTALLED_FOLDER $APP_FOLDER
  
  cd $APP_FOLDER 
  mv .env.example .env #rename .env.example
  
fi

# Check if .env file exists
if [ -f $APP_FOLDER/.env  ]; then
  echo "ERROR: Missing .env file.. please add and restart"
  exit 1

else
  
  if  [ $GENERATE_APP_KEY = "1"  ]; then
    php artisan key:generate #create new application key
  fi
  
  # Set ownership of storage and bootstrap folder
  chown -R www-data:www-data $APP_FOLDER/storage $APP_FOLDER/bootstrap
fi

echo "INFO: Done running startup task for Laravel container"

# Prevent the container to auto stop
tail -f /dev/null