FROM jupyter/demo

USER root

RUN apt-get install -y r-cran-rjava libgdal1-dev libproj-dev

RUN rm /home/jovyan/data/Dockerfile
RUN echo 'R_LIBS_USER=/home/jovyan/lib/R:/home/jovyan/.R:/usr/lib/R/site-library' > /home/jovyan/.Renviron

ONBUILD COPY . /home/jovyan/data

WORKDIR /home/jovyan/notebooks

expose 5000
CMD ipython3 notebook --no-browser --port 5000 --ip=0.0.0.0

