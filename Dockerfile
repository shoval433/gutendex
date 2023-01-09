FROM python:3.6
# ENV 
ENV ADMIN_NAMES=You
ENV ADMIN_EMAILS=you@your.domain.here
ENV ALLOWED_HOSTS=127.0.0.1,localhost,.your.domain.here
ENV DATABASE_HOST=my_db
ENV DATABASE_NAME=gutendex
ENV DATABASE_PASSWORD=root
ENV DATABASE_PORT=5432
ENV DATABASE_USER=postgres
ENV DEBUG=false
ENV EMAIL_HOST=your.smtp.host.here
ENV EMAIL_HOST_ADDRESS=gutendex@your.domain.here
ENV EMAIL_HOST_PASSWORD=your-smtp-host-password
ENV EMAIL_HOST_USER=your-smtp-host-user-name
ENV MANAGER_EMAILS=someone@their.domain.here
ENV MANAGER_NAMES=Someone
ENV MEDIA_ROOT=/var/www/gutendex/media/
ENV SECRET_KEY=root
ENV STATIC_ROOT=/var/www/gutendex/static-root/

COPY . .

RUN pip install -r requirements.txt
RUN chmod 777 manage.py

# RUN python manage.py migrate
RUN apt update && apt install rsync -y
ENTRYPOINT ./entreypoint.sh

#for test what is the erro 
# && python manage.py updatecatalog &&python manage.py collectstatic && ./manage.py runserver 0.0.0.0:8080