[![stars-badge](https://img.shields.io/github/stars/gao-lab/SLAT?logo=GitHub&color=yellow)](https://github.com/gao-lab/SLAT/stargazers)
[![dev-badge](https://img.shields.io/endpoint?url=https://gist.githubusercontent.com/xiachenrui/bc835db052fde5bd731a09270b42006c/raw/slat_version.json)](https://gist.github.com/xiachenrui/bc835db052fde5bd731a09270b42006c)
[![build-badge](https://github.com/gao-lab/SLAT/actions/workflows/build.yml/badge.svg)](https://github.com/gao-lab/SLAT/actions/workflows/build.yml)
[![license-badge](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![docs-badge](https://readthedocs.org/projects/slat/badge/?version=latest)](https://slat.readthedocs.io/en/latest/?badge=latest)
[![pypi-badge](https://img.shields.io/pypi/v/scslat)](https://pypi.org/project/scslat)
<!-- [![conda-badge](https://anaconda.org/bioconda/<name>/badges/version.svg)](https://anaconda.org/bioconda/<name>) -->

# scSLAT: single cell spatial alignment tools
**scSLAT** package implements the **SLAT** (**S**patial **L**inked **A**lignment **T**ool) model to align single cell spatial omics data.

![Model architecture](docs/_static/Model.png)

## Directory structure

```
.
├── scSLAT/                  # Main Python package
├── env/                     # Extra environment
├── data/                    # Data files
├── evaluation/              # SLAT evaluation pipeline
├── benchmark/               # Benchmark pipeline
├── case/                    # Case studies in paper
├── docs/                    # Documentation files
├── resource/                # Other useful resource 
├── pyproject.toml           # Python package metadata
└── README.md
```

## Tutorial
Tutorial of `scSLAT` is [here](https://slat.readthedocs.io/en/latest/tutorials.html), if you have any question please open an issue on github

<img src='docs/_static/imgalignment.gif' width='400'>


## Installation

### Docker
Dockerfile of `scSLAT` is available at [`env/Dockerfile`](env/Dockerfile). You can also pull the docker image directly from [here](https://hub.docker.com/repository/docker/huhansan666666/slat) by:

``` bash
docker pull huhansan666666/slat:latest
```

### PyPI
> **Note**
> Installing `scSLAT` within a new [conda environment](https://conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html) is recommended.

First, we create a clean environment and install `scSLAT` from PyPI. We need install dependency `torch` before install `pyg`.

> **Warning**
> old NVIDIA driver may raise error, please update NVIDIA driver to the latest version.

```bash
conda create -n scSLAT python=3.8 -y && conda activate scSLAT
pip install "scSLAT[torch]"
pip install "scSLAT[pyg]"
```

> **Note**
> Some dependencies such as `torch-scatter` need to compile from source, which may take a long time. Please refer our solution to accelerate the install [here](https://slat.readthedocs.io/en/latest/install.html)

### Development version
For development purpose, clone this repo and install:

```bash
git clone git@github.com:gao-lab/SLAT.git
cd SLAT
pip install -e ".[torch]"
pip install -e ".[pyg,dev,doc]"
```

### Conda (Ongoing)
We plan to provide a conda package of `scSLAT` in the near future.


## Reproduce manuscript results
1. Please follow the [`env/README.md`](env/README.md) to install all dependencies. Please checkout the repository to v0.2.0 before install `scSLAT`:
2. Download and pre-process data follow the [`data/README.md`](data/README.md)
3. Whole benchmark and evaluation procedure can be found in [`/benchmark`](benchmark/README.md) and [`/evaluation`](evaluation/README.md), respectively.
4. Every case study is recorded in the [`/case`](case/README.md) directory in the form of jupyter notebook.
