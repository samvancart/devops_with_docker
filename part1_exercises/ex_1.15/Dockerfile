# Pull base image
FROM alpine as intermediate

# Install git
# RUN apt-get update && apt-get install -y git
RUN apk update && \
    apk add --update git

# Make dir and clone repo into it
RUN mkdir /home/app
RUN cd /home/app
RUN git clone https://github.com/samvancart/number-to-binary-clicker.git

# Create config folder
RUN mkdir /number-to-binary-clicker/num_to_bin_clicker/config

# Get python image
FROM python:3.8-slim-buster

RUN mkdir app
COPY --from=intermediate /number-to-binary-clicker /app/number-to-binary-clicker

# Set working directory
WORKDIR /app/number-to-binary-clicker

# Get django and environ lib
RUN pip install django==3.1
RUN pip install django-environ

# Set environment variables: 
# Generate SECRET_KEY
RUN echo DJANGO_SECRET_KEY=$(python -c 'from django.core.management.utils import get_random_secret_key; print(get_random_secret_key())') > /app/number-to-binary-clicker/num_to_bin_clicker/config/.env

# Set Debug=True
RUN echo DJANGO_DEBUG=TRUE >> /app/number-to-binary-clicker/num_to_bin_clicker/config/.env

# Open port
EXPOSE 8000


CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]