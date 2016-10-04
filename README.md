
CFR installation in Linux server

1)Prerequisites
PostgreSQL database (prefferred version 9.5 or later) - You may refer the following doc for installation guidelines.
https://www.postgresql.org/download/

2) First you may install Python virtual environment.
pip install virtualenv
virtualenv cfr
source cfr/bin/activate
git clone https://github.com/GeoEDGE/cfr_web.git
cd cfr

3) Install following dependencies
pip install django
pip install pillow
pip install paver
pip install django-tables2
pip install django-filter
pip install django-cors-headers
pip install django-bower
pip install django-jsonify
pip install django-tastypie

4) Now CFR enviroment is setup you can start the server with following commands
  cd cfr
  python manage.py runserver
