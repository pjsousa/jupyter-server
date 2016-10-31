This Dockerfile extends from the oficial jupyter's [datascience notebook](https://github.com/jupyter/docker-stacks/tree/master/datascience-notebook). It installs the pymc package on both anaconda environments and also installs a NodeJs environment to setup the [jupyter-nodejs](https://github.com/notablemind/jupyter-nodejs) kernel.

You'll end up with with these kernels:
- Julia 0.3.2
- Python 2
- Python 3
- R
- NodeJS

You can setup this up with the same parameters as the original datascience notebook.


# BUILD

``` bash
# You can change "pedro/datascience-notebook" to your namespace/imagename. Remember to change the RUN commands accordingly
docker build -t pedro/datascience-notebook .
```


# RUN

```

# from the oficial images docs, you need to set your data on /home/jovyan/work inside the container

mkdir -p /docker-volumes/data/ipython-notebooks

docker run -v /docker-volumes/data/ipython-notebooks:/home/jovyan/work --name=ipython-server -d pedro/datascience-notebook

docker run -v /docker-volumes/data/ipython-notebooks:/home/jovyan/work --name=ipython-server -d -e PASSWORD="YOURPASSWORD" pedro/datascience-notebook

docker run -v /docker-volumes/data/ipython-notebooks:/home/jovyan/work --name=ipython-server -d -e USE_HTTPS=yes -e PASSWORD="YOURPASSWORD" pedro/datascience-notebook
```
