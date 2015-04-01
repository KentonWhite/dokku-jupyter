FROM jupyter/minimal

USER root

expose 5000
CMD ipython3 notebook --no-browser --port 5000 --ip=0.0.0.0