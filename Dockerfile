############################################################
# Dockerfile to build Nginx Installed Containers
# Based on Ubuntu
# 
# To Do
#   Please, check
#
# Error
#   Please, check
# 
# Ref: 
#   https://github.com/karthequian/docker-helloworld/blob/master/Dockerfile


############################################################


# Set the base image to Ubuntu
FROM ubuntu
# FROM scratch

# File Author / Maintainer
MAINTAINER Cloud Cho

# Install Nginx

# Add application repository URL to the default sources
# RUN echo "deb http://archive.ubuntu.com/ubuntu/ raring main universe" >> /etc/apt/sources.list

# Update the repository
#  for package cache https://stackoverflow.com/a/27273543/5595995
# 
# Error
#  PUBLIC KEY missing
#    possible solution: https://askubuntu.com/a/15272/789450
# 
RUN apt-get update

#
# ----- ----- 
# Hello World 
#
# Install necessary tools
RUN apt-get install -y vim wget dialog net-tools

RUN apt-get install -y nginx

# Remove the default Nginx configuration file
RUN rm -v /etc/nginx/nginx.conf

# Copy a configuration file from the current directory
ADD nginx.conf /etc/nginx/

RUN mkdir /etc/nginx/logs

# Add a sample index file
ADD index.html /www/data/

# Append "daemon off;" to the beginning of the configuration
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# Create a runner script for the entrypoint
COPY runner.sh /runner.sh
RUN chmod +x /runner.sh

# Expose ports
EXPOSE 80

ENTRYPOINT ["/runner.sh"]

# Set the default command to execute
# when creating a new container
CMD ["nginx"]

#
# End of Hello World
#

# 
# ----- ----- 
# Runtime Environment 
#   including Tensorflow
#
# ref: https://stackoverflow.com/a/52744803/5595995
FROM python:alpine3.7
COPY . /app
WORKDIR /app
# RUN pip3 install -r requirements.txt
# Looks like Tensorflow tool required one more step 
RUN python3 -m pip install --upgrade https://storage.googleapis.com/tensorflow/mac/cpu/tensorflow-0.12.0-py3-none-any.whl
EXPOSE 5000

# ref: https://stackoverflow.com/a/34399661/5595995
COPY . /opt/app
WORKDIR /opt/app
RUN pip install -r requirements.txt

CMD python ./index.py

#
# End of Runtime Environment
#
