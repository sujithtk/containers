FROM sameersbn/squid
RUN  apt-get update && \
     DEBIAN_FRONTEND=noninteractive apt-get install tzdata
ENV  TZ=Asia/Kolkata
RUN  ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN  dpkg-reconfigure --frontend noninteractive tzdata
