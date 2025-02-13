r"""
Benchmark different methods
"""
import os


rule get_metrics:
    input:
        adata1="{path}/adata1.h5ad",
        adata2="{path}/adata2.h5ad",
        notebook="workflow/notebooks/get_metrics.ipynb",
    output:
        metric="{path}/{method,PCA|Harmony}/metrics.yaml",
        emb0="{path}/{method,PCA|Harmony}/emb0.csv",
        emb1="{path}/{method,PCA|Harmony}/emb1.csv",
        matching="{path}/{method,PCA|Harmony}/matching.csv",
    params:
        notebook_result="{path}/{method,PCA|Harmony}/get_metrics.ipynb",
    log:
        "{path}/{method,PCA|Harmony}/get_metrics.log"
    threads:4
    shell:
        """
        timeout {config[timeout]} papermill \
        -p adata1_file {input.adata1} \
        -p adata2_file {input.adata2} \
        -p method {wildcards.method} \
        -p metric_file {output.metric} \
        -p emb0_file {output.emb0} \
        -p emb1_file {output.emb1} \
        -p matching_file {output.matching} \
        {input.notebook} {params.notebook_result} \
        > {log} 2>&1
        """


rule run_SLAT:
    input:
        adata1="{path}/adata1.h5ad",
        adata2="{path}/adata2.h5ad",
        notebook="workflow/notebooks/run_SLAT.ipynb",
    output:
        metric="{path}/SLAT/metrics.yaml",
        emb0="{path}/SLAT/emb0.csv",
        emb1="{path}/SLAT/emb1.csv",
        graphs="{path}/SLAT/graph.pkl",
        matching="{path}/SLAT/matching.csv",
    params:
        notebook_result="{path}/SLAT/run_SLAT.ipynb",
    log:
        "{path}/SLAT/run_SLAT.log"
    threads:16
    resources: gpu=1
    shell:
        """
        timeout {config[timeout]} papermill \
        -p adata1_file {input.adata1} \
        -p adata2_file {input.adata2} \
        -p metric_file {output.metric} \
        -p emb0_file {output.emb0} \
        -p emb1_file {output.emb1} \
        -p graphs_file {output.graphs} \
        -p matching_file {output.matching} \
        {input.notebook} {params.notebook_result} \
        > {log} 2>&1
        """


rule run_SLAT_harmony:
    input:
        adata1="{path}/adata1.h5ad",
        adata2="{path}/adata2.h5ad",
        notebook="workflow/notebooks/run_SLAT_harmony.ipynb",
    output:
        metric="{path}/SLAT_harmony/metrics.yaml",
        emb0="{path}/SLAT_harmony/emb0.csv",
        emb1="{path}/SLAT_harmony/emb1.csv",
        matching="{path}/SLAT_harmony/matching.csv",
    params:
        notebook_result="{path}/SLAT_harmony/run_SLAT_harmony.ipynb",
    log:
        "{path}/SLAT_harmony/run_SLAT_harmony.log"
    threads:16
    resources: gpu=1
    shell:
        """
        timeout {config[timeout]} papermill \
        -p adata1_file {input.adata1} \
        -p adata2_file {input.adata2} \
        -p metric_file {output.metric} \
        -p emb0_file {output.emb0} \
        -p emb1_file {output.emb1} \
        -p matching_file {output.matching} \
        {input.notebook} {params.notebook_result} \
        > {log} 2>&1
        """


rule run_SLAT_dpca:
    input:
        adata1="{path}/adata1.h5ad",
        adata2="{path}/adata2.h5ad",
        notebook="workflow/notebooks/run_SLAT_dpca.ipynb",
    output:
        metric="{path}/SLAT_dpca/metrics.yaml",
        emb0="{path}/SLAT_dpca/emb0.csv",
        emb1="{path}/SLAT_dpca/emb1.csv",
        matching="{path}/SLAT_dpca/matching.csv",
    params:
        notebook_result="{path}/SLAT_dpca/run_SLAT_dpca.ipynb",
    log:
        "{path}/SLAT_dpca/run_SLAT_dpca.log"
    threads:16
    resources: gpu=1
    shell:
        """
        timeout {config[timeout]} papermill \
        -p adata1_file {input.adata1} \
        -p adata2_file {input.adata2} \
        -p metric_file {output.metric} \
        -p emb0_file {output.emb0} \
        -p emb1_file {output.emb1} \
        -p matching_file {output.matching} \
        {input.notebook} {params.notebook_result} \
        > {log} 2>&1
        """


rule run_SLAT_without_prematch:
    input:
        adata1="{path}/adata1.h5ad",
        adata2="{path}/adata2.h5ad",
        notebook="workflow/notebooks/run_SLAT_without_prematch.ipynb",
    output:
        metric="{path}/SLAT_without_prematch/metrics.yaml",
        emb0="{path}/SLAT_without_prematch/emb0.csv",
        emb1="{path}/SLAT_without_prematch/emb1.csv",
        matching="{path}/SLAT_without_prematch/matching.csv",
    params:
        notebook_result="{path}/SLAT_without_prematch/run_SLAT_without_prematch.ipynb",
    log:
        "{path}/SLAT_without_prematch/run_SLAT_without_prematch.log"
    threads:16
    resources: gpu=1
    shell:
        """
        timeout {config[timeout]} papermill \
        -p adata1_file {input.adata1} \
        -p adata2_file {input.adata2} \
        -p metric_file {output.metric} \
        -p emb0_file {output.emb0} \
        -p emb1_file {output.emb1} \
        -p matching_file {output.matching} \
        {input.notebook} {params.notebook_result} \
        > {log} 2>&1
        """


rule run_PASTE:
    input:
        adata1="{path}/adata1.h5ad",
        adata2="{path}/adata2.h5ad",
        notebook="workflow/notebooks/run_PASTE.ipynb",
    output:
        metric="{path}/PASTE/metrics.yaml",
        matching="{path}/PASTE/matching.csv",
    params:
        notebook_result="{path}/PASTE/run_PASTE.ipynb",
    log:
        "{path}/PASTE/run_PASTE.log"
    container: 
        "docker://huhansan666666/paste:v0.1"
    threads:16
    resources: gpu=1
    shell:
        """
        timeout {config[timeout]} papermill \
        -p adata1_file {input.adata1} \
        -p adata2_file {input.adata2} \
        -p metric_file {output.metric} \
        -p matching_file {output.matching} \
        {input.notebook} {params.notebook_result} \
        > {log} 2>&1
        """


rule run_STAGATE:
    input:
        adata1="{path}/adata1.h5ad",
        adata2="{path}/adata2.h5ad",
        notebook="workflow/notebooks/run_STAGATE.ipynb",
    output:
        emb0="{path}/STAGATE/emb0.csv",
        emb1="{path}/STAGATE/emb1.csv",
    params:
        notebook_result="{path}/STAGATE/run_STAGATE.ipynb",
    container: 
        "docker://huhansan666666/stagate_pyg:v0.2"
    log:
        "{path}/STAGATE/run_STAGATE.log"
    threads:16
    resources: gpu=1
    shell:
        """
        timeout {config[timeout]} papermill \
        -p adata1_file {input.adata1} \
        -p adata2_file {input.adata2} \
        -p emb0_file {output.emb0} \
        -p emb1_file {output.emb1} \
        {input.notebook} {params.notebook_result} \
        > {log} 2>&1
        """

rule STAGATE_metrics:
    input:
        emb0="{path}/STAGATE/emb0.csv",
        emb1="{path}/STAGATE/emb1.csv",
        adata1="{path}/adata1.h5ad",
        adata2="{path}/adata2.h5ad",
        notebook="workflow/notebooks/emb2metrics.ipynb"
    output:
        metric="{path}/STAGATE/metrics.yaml",
        matching="{path}/STAGATE/matching.csv",
    params:
        notebook_result="{path}/STAGATE/emb2metrics.ipynb",
    log:
        "{path}/STAGATE/emb2metrics.log"
    threads:4
    shell:
        """
        papermill\
        -p emb0_file {input.emb0} \
        -p emb1_file {input.emb1} \
        -p adata1_file {input.adata1} \
        -p adata2_file {input.adata2} \
        -p metric_file {output.metric} \
        -p matching_file {output.matching} \
        {input.notebook} {params.notebook_result} \
        > {log} 2>&1
        """


rule run_Seurat:
    input:
        adata1="{path}/adata1.h5ad",
        adata2="{path}/adata2.h5ad",
        notebook="workflow/notebooks/run_Seurat.ipynb",
    output:
        emb0="{path}/Seurat/emb0.csv",
        emb1="{path}/Seurat/emb1.csv",
        # seurat_RDS_file="{path}/Seurat/seurat_combine.rds",
    params:
        notebook_result="{path}/Seurat/run_Seurat.ipynb",
    log:
        "{path}/Seurat/run_Seurat.log"
    threads:16
    shell:
        """
        timeout {config[timeout]} papermill -k slat_r \
        -p adata1_file {input.adata1} \
        -p adata2_file {input.adata2} \
        -p emb0_file {output.emb0} \
        -p emb1_file {output.emb1} \
        {input.notebook} {params.notebook_result} \
        > {log} 2>&1
        """


rule Seurat_metrics:
    input:
        emb0="{path}/Seurat/emb0.csv",
        emb1="{path}/Seurat/emb1.csv",
        adata1="{path}/adata1.h5ad",
        adata2="{path}/adata2.h5ad",
        notebook="workflow/notebooks/emb2metrics.ipynb"
    output:
        metric="{path}/Seurat/metrics.yaml",
        matching="{path}/Seurat/matching.csv",
    params:
        notebook_result="{path}/Seurat/emb2metrics.ipynb",
    log:
        "{path}/Seurat/emb2metrics.log"
    threads:4
    shell:
        """
        papermill\
        -p emb0_file {input.emb0} \
        -p emb1_file {input.emb1} \
        -p adata1_file {input.adata1} \
        -p adata2_file {input.adata2} \
        -p metric_file {output.metric} \
        -p matching_file {output.matching} \
        {input.notebook} {params.notebook_result} \
        > {log} 2>&1
        """