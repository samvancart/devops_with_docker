FROM python:3.8

WORKDIR /usr/src/app

COPY . .

EXPOSE 8000

RUN mkdir num_to_bin_clicker/config

RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir django==4.0 && \
    pip install django-environ --no-cache-dir

RUN echo DJANGO_SECRET_KEY=$(python -c 'from django.core.management.utils import get_random_secret_key;print(get_random_secret_key())') > num_to_bin_clicker/config/.env
RUN echo DJANGO_DEBUG=TRUE >> num_to_bin_clicker/config/.env

CMD [ "python", "manage.py", "runserver", "0.0.0.0:8000" ]