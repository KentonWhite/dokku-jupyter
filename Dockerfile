FROM jupyter/demo

USER root
COPY . /home/jovyan/data
RUN rm /home/jovyan/data/Dockerfile
WORKDIR /home/jovyan/notebooks

expose 5000
CMD ipython3 notebook --no-browser --port 5000 --ip=0.0.0.0