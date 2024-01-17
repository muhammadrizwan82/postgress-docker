# Use an official PostgreSQL image as the base image
FROM postgres:latest

# Set environment variables for Ubuntu user and group
ARG UBUNTU_USER=uuser
ARG UBUNTU_GROUP=ugroup
ARG POSTGRES_DB=db
ARG POSTGRES_USER=dbuser
ARG POSTGRES_PASSWORD=dbpassword

# Create Ubuntu user and group
RUN groupadd -r $UBUNTU_GROUP && useradd -r -g $UBUNTU_GROUP $UBUNTU_USER

# Set the user and group ownership for the PostgreSQL data directory
RUN chown -R $UBUNTU_USER:$UBUNTU_GROUP /var/lib/postgresql/data

# Set the PostgreSQL user to the specified Ubuntu user
USER $UBUNTU_USER

ENV POSTGRES_DB=$POSTGRES_DB
ENV POSTGRES_USER=$POSTGRES_USER
ENV POSTGRES_PASSWORD=$POSTGRES_PASSWORD

# Expose the default PostgreSQL port
EXPOSE 5432