# CFR installation in Linux server

1)Prerequisites
PostgreSQL database (preferred version 9.5 or latest) installation guidelines refer the below link;

    https://www.postgresql.org/download/

2)Install Python virtual environment by using following commands;

    pip install virtualenv
    virtualenv cfr
    source cfr/bin/activate
    git clone https://github.com/GeoEDGE/cfr_web.git
    cd cfr

3)Install following dependencies;

    pip install django
    pip install pillow
    pip install paver
    pip install django-tables2
    pip install django-filter
    pip install django-cors-headers
    pip install django-bower
    pip install django-jsonify
    pip install django-tastypie

4)Now youhave setup CFR project environment, to Start the CFR project use the following commands; 
      
    cd cfr
    python manage.py runserver
