# imsmp-variant-calling-benchmark
Variant calling benchmark accompanying the IMS-MP project

## Contents:
1. [Requirements](#requirements)
2. [Installation](#installation)
3. [Usage](#usage)


## Requirements:

| Requirement | Tested with |
| --- | --- |
| 64 bits POSIX-compliant operating system | Ubuntu 20.04.5 LTS |
| [conda](https://docs.conda.io/en/latest/) | vers. 23.3.1 |
| [snakemake](https://snakemake.readthedocs.io/en/stable/) | vers. 3.13.3 |

Prior to the installation make sure your system meets all the requirements. Conda is required to launch individual steps of the pipeline. Snakemake is the current choice of workflow language for this pipeline and can easily be installed via conda as well.

### Warnings

⚠️ On the system this pipeline was developend on we faced issues with snakemake versions 7 and later due to their internal shell execution settings. If similar issues occur on your system please refer to the tested versions above. <br>
⚠️ An older version of bcftools did not split multi-allelic sides correctly when using _bcftools norm_. This issue was not observed in the recent version 1.17. The provided conda environment is set up accordingly.

## Installation:

The pipeline only needs to be downloaded, no installation of any internal components required.
```
git clone https://github.com/rki-mf1/imsmp-variant-calling-benchmark.git
```

One way to install snakemake is to use the conda package manager:
```
conda create -y -n snakemake
conda activate snakemake
conda install -y -c bioconda snakemake
```

## Usage:

The current setup to launch the benchmark pipeline is to edit/create a configuration file for snakemake. Generate a `scripts/snakemake/snake_config.yaml` and edit the following variables:
```
HEAD_DIR:
   <path to the cloned repository>
REF:
   <path to the reference genome>
```

With this configuration file in place you can simply run the snakemake pipeline via:
```
snakemake -p --use-conda --cores 1 -s scripts/snakemake/Snakemake
```
