# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
FROM jupyter/datascience-notebook

MAINTAINER Pedro <pjgs.sousa@gmail.com>

USER root

USER jovyan

# Install Python 3 packages
RUN conda install --yes \
	'numpy=1.10*' \
	'pymc=2.3.6' \
	'pytables=3.2.2' \
    && conda clean -yt

RUN conda install -p $CONDA_DIR/envs/python2 --yes \
	'numpy=1.10*' \
	'pymc=2.3.6' \
	'pytables=3.2.2' \
    && conda clean -yt


# install node and IJavascript kernel
USER root
RUN apt-get update && \
    wget -qO- https://deb.nodesource.com/setup_4.x | bash - && \
    apt-get install -y -q nodejs && \
    apt-get install -y -q libzmq3-dev

USER jovyan
WORKDIR /tmp
RUN mkdir -p /home/$NB_USER/.ipython/kernels/nodejs
RUN git clone https://github.com/notablemind/jupyter-nodejs.git
WORKDIR /tmp/jupyter-nodejs
RUN npm install && node install.js
RUN make
#COPY $HOME/.ipython/kernels/nodejs $CONDA_DIR/share/jupyter/kernels/

WORKDIR /home/$NB_USER/work
USER jovyan
