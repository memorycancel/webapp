FROM ruby:2.4

RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list

RUN apt-get update \
    && apt-get install -y --no-install-recommends nodejs \
    && apt-get install libaio1 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app

COPY . .

RUN mv /usr/src/app/oracle /opt
ENV LD_LIBRARY_PATH /opt/oracle/instantclient_12_1
ENV ORACLE_HOME /opt/oracle/instantclient_12_1


COPY Gemfile* ./
RUN sed -i 's/gem "sqlite3"/gem "sqlite3","~>1.3.0"/g' /usr/src/app/Gemfile
RUN bundle install

# RUN rails db:create
RUN rails db:migrate

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]