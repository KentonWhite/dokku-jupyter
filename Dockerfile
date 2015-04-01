FROM jupyter/minimal

expose 5000
CMD ipython3 notebook --no-browser --port 5000 --ip=*