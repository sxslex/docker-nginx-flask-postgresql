FROM ubuntu:trusty
MAINTAINER SleX <slex@slex.com.br>

#Install Nginx

#Install PostgreSQL-9.3
RUN apt-get update && \
    apt-get install -y postgresql-9.3 pwgen && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Configura o acesso ao postgresql
RUN echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/9.3/main/pg_hba.conf
RUN echo "listen_addresses='*'" >> /etc/postgresql/9.3/main/postgresql.conf

# Adiciona o postgres como volumes para fazer o backup
VOLUME	["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]

ADD modify_postgres_pass.sh ./modify_postgres_pass.sh
ADD run.sh /run.sh
RUN chmod 755 /*.sh

EXPOSE 5432
CMD ["/run.sh"]
