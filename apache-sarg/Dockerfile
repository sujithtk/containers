FROM sujithtk/apache-sarg
MAINTAINER sujith
# RUN apt-get update
# RUN DEBIAN_FRONTEND='noninteractive' apt-get install apache2 -y && \
#     DEBIAN_FRONTEND='noninteractive' apt-get install vim -y && \
#     DEBIAN_FRONTEND='noninteractive' apt-get install sarg -y && \
#     DEBIAN_FRONTEND='noninteractive' apt-get install cron -y && \
#     DEBIAN_FRONTEND='noninteractive' apt-get install tzdata && apt-get clean
# COPY ports.conf /etc/apache2/
# COPY 000-default.conf /etc/apache2/sites-available/
COPY sarg.conf /etc/sarg/
COPY sarg-reports.conf /etc/sarg/
# RUN mkdir /var/www/html/sarg-reports
# RUN chmod o+rwx /var/www/html/sarg-reports
# RUN mkdir /var/log/squid
# EXPOSE 8080/tcp
# RUN echo "00 18  *  *  * /usr/sbin/sarg-reports daily -o /var/www/html/sarg-reports" >> /var/spool/cron/crontabs/root
# ENTRYPOINT ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
