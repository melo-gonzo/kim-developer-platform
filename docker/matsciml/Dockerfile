# Copyright (C) 2022 Intel Corporation
# SPDX-License-Identifier: MIT License

# CUDA version from nvidia docker: https://hub.docker.com/r/nvidia/cuda/tags
# NO CUDA FOR NOW
# ARG CUDA_VERSION=11.8.0-cudnn8-runtime-ubuntu20.04
# FROM nvidia/cuda:$CUDA_VERSION
ARG IMAGE_KDP
FROM ${IMAGE_KDP}

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
# Avoids some interactive prompts during apt-get install
ARG DEBIAN_FRONTEND=noninteractive

USER root
# clean up and refresh apt-get index
RUN apt-get update && \
    apt-get autoremove -y && \
    apt-get clean && rm -rf /var/cache/apt/archives /var/lib/apt/lists/*

# Install system tools
RUN apt-get update --fix-missing && \
    apt-get install -yq --no-install-recommends \
    sudo \
    curl \
    wget \
    build-essential \
    git \
    unzip \
    tmux \
    screen \
    openssh-client && \
    apt-get clean && rm -rf /var/cache/apt/archives /var/lib/apt/lists/*

RUN apt-get update --fix-missing && \
    apt-get install -yq --no-install-recommends \
    sudo \
    software-properties-common \
    python3.10-venv && \
    apt-get clean && rm -rf /var/cache/apt/archives /var/lib/apt/lists/*

RUN apt-get update \
    && apt-get install -y wget tmux vim libxrender-dev libsm6 libxext6 && \
    apt-get clean && rm -rf /var/cache/apt/archives /var/lib/apt/lists/*

# Create py3 virtualenv in order to use python3 for the project

USER openkim
WORKDIR /home/openkim

# NO virtual env, install everything in base python
#RUN python3 -m venv  matsciml_venv
#ENV PATH=/matsciml_venv/bin:$PATH
#RUN . matsciml_venv/bin/activate
RUN pip install --upgrade pip
RUN pip install -q \
    ipdb \
    pandas \
    matplotlib \
    scikit-learn

RUN pip install psutil
RUN pip install pytorch_lightning==2.2.4
RUN pip install dgllife==0.3.2
RUN pip install rdkit==2023.9.5
RUN pip install numba>=0.55.0
RUN pip install numpy>=1.21.0
RUN pip install matplotlib
RUN pip install munch==2.5.0
RUN pip install lmdb==1.4.1
RUN pip install geometric-algebra-attention>=0.3.0
RUN pip install sympy>=1.10.1
RUN pip install jsonargparse[signatures]>=4.13.1
RUN pip install mp_api==0.41.2
RUN pip install emmet-core==0.82.1
RUN pip install pydantic==2.7.0
RUN pip install pymatgen==2024.3.1
RUN pip install schema>=0.7.5
RUN pip install ase>=3.22.1
RUN pip install matgl==1.0.0
RUN pip install einops==0.7.0
RUN pip install mendeleev==0.15.0
RUN pip install e3nn
RUN pip install mace-torch==0.3.4
RUN pip install monty==2024.2.2


RUN pip install black>=22.3.0
RUN pip install flake8
RUN pip install flake8-pyproject
RUN pip install flake8-black
RUN pip install flake8-bandit
RUN pip install pre-commit
RUN pip install bandit
RUN pip install pytest

RUN pip install torch-scatter -f https://data.pyg.org/whl/torch-2.3.0+cpu.html
RUN pip install torch-sparse -f https://data.pyg.org/whl/torch-2.3.0+cpu.html
RUN pip install torch-geometric

RUN pip uninstall -y dgl
RUN pip install dgl==2.0.0 -f https://data.dgl.ai/wheels/repo.html

### KUSP/KIM Specific Things
RUN pip install loguru
RUN pip install git+https://github.com/ipcamit/kusp.git@kim-tests-fix
RUN pip install --upgrade numdifftools
