FROM mcr.microsoft.com/mssql/server:2017-latest
MAINTAINER sujith
RUN apt-get update && apt-get install iputils-ping -y && \
    DEBIAN_FRONTEND='noninteractive' apt-get install vim -y && \
    apt-get install tzdata -y && \
    echo "Asia/Kolkata" > /etc/timezone && \
    echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc
COPY mssql.sql /tmp/
WORKDIR /tmp
