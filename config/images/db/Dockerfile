FROM postgres

#ARG user=youser
#ARG group=youser
#ARG uid=1000
#ARG gid=1000

#ENV POSTGRES_USER=${user}
ENV POSTGRES_PASSWORD=password
#ENV USER_HOME /home/${user}/

#RUN addgroup --gid ${gid} ${group}                                                                      
#RUN adduser --system --disabled-password --home ${USER_HOME} --uid ${uid} --gid ${gid} --shell /bin/bash ${user} 

RUN chmod -R 777 /var/lib/postgresql 
RUN chmod -R 777 /var/run/ 

#USER ${user}

