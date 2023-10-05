# Set base image (host OS)
FROM python:3.8.3-slim-buster

# By default, listen on port 5000
EXPOSE 8000

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory in the container
WORKDIR /flask_app

COPY . .

WORKDIR /flask_app/app
# Copy the dependencies file to the working directory
# COPY ./app/requirements.txt .

# Install any dependencies
RUN pip3 install --upgrade pip
RUN pip3 install -r requirements.txt
WORKDIR /flask_app
# Copy the content of the local src directory to the working directory
# RUN flask db init
CMD [ "python3","start.py" ]