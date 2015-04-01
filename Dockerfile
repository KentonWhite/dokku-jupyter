FROM jupyter/demo

USER root

# Install Java.
RUN \
  echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java7-installer && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk7-installer

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-7-oracle


COPY . /home/jovyan/data
RUN rm /home/jovyan/data/Dockerfile
RUN mkdir lib
RUN mkdir lib/R
RUN rm /home/jovyan/.Renviron
RUN echo 'R_LIBS_USER=/home/jovyan/lib/R:/home/jovyan/.R:/usr/lib/R/site-library' > /home/jovyan/.Renviron
WORKDIR /home/jovyan/notebooks

expose 5000
CMD ipython3 notebook --no-browser --port 5000 --ip=0.0.0.0