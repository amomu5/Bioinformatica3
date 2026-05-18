# Bioinformatica-
Contiene las prácticas de la asignatura de Bioinformática (curso 2025/2026).
Cada práctica está organizada en dos carpetas paralelas: `data/PracticaX/` contiene los **datos de entrada** y `results/PracticaX/` los **cuadernos Quarto (`.qmd`)** con su salida renderizada (`.html`) y resultados de poco peso.

## Estructura del repositorio

```
Bioinformatica3/
├── data/           # Datos de entrada de cada práctica (FASTAs, TSVs, archivos sin procesar)
├── results/        # Cuadernos .qmd, informes .html y figuras
├── doc/            
├── .gitignore      # Excluye los archivos generados al ejecutar los .qmd 
└── Bioinformatica.Rproj
```

> **Nota:** los archivos pesados que generan las prácticas (ensamblajes, BAM/SAM, BLAST DBs, salidas de GALBA, etc.) **no están en el repositorio**: se regeneran ejecutando los `.qmd`. El `.gitignore` está pensado para ello.

## PRÁCTICAS

| Práctica | Trata de | Usa |
|---|---|---|
| **1** | Alineamiento múltiple de secuencias proteicas (familia PF00009, factor de elongación Tu) | Clustal Omega, MUSCLE |
| **3** | Control de calidad, recorte y mapeo de lecturas Illumina al genoma de referencia | FastQC, fastp, BWA, samtools |
| **4** | Descarga y exploración de genomas desde NCBI Datasets (*Trypanosoma melophagium*) | `datasets`, `dataformat` |
| **5** | Lectura y manipulación de archivos EMBL (gen *Adh*) | R / Biostrings |
| **7** | Análisis GWAS básico sobre datos genotípicos | R |
| **8** | BLAST: ortólogos recíprocos *Buchnera*–*Blochmannia*, PSI-BLAST con Swissprot y BLASTN remoto para identificar contaminación en lecturas de *Aphis aurantii* | NCBI BLAST+, `datasets`/`dataformat` |
| **9** | Análisis filogenético de mtDNA | R / Biostrings |
| **10** | Ensamblaje *de novo* del cromosoma 4 de *Arabidopsis thaliana* con lecturas HiFi | hifiasm |
| **11** | Anotación estructural del ensamblaje: identificación y enmascarado de repeticiones, y predicción de genes | RepeatModeler, RepeatMasker, bedtools, GALBA |
| **12** | Análisis de expresión diferencial en *Drosophila melanogaster* (poblaciones × temperatura) | DESeq2 |

## Reproducible

1. Clona el repositorio:
```bash
   git clone https://github.com/amomu5/Bioinformatica3.git
   cd Bioinformatica3
```
2. Abre `Bioinformatica.Rproj` con RStudio.
3. Entra en `results/PracticaX/` y abre el `.qmd` correspondiente.
4. Pulsa **Render**. El cuaderno crea los archivos pesados a partir de los datos que están en `data/PracticaX/` (algunos en bases públicas: SRA, Uniprot, NCBI, etc.).

## Requiere de:

- **R ≥ 4.4** con RStudio y Quarto.
- **Paquetes de R**: `DESeq2`, `Biostrings` (vía Bioconductor); `ggplot2`, `tidyverse`.
- **Programas ** (instalables con conda o apt):
  `bwa`, `samtools`, `fastp`, `fastqc`, `ncbi-blast+`, `bedtools`, `hifiasm`,
  `datasets`/`dataformat` de NCBI, `RepeatModeler`, `RepeatMasker`, `GALBA`.

## Autor
Alejandro Moreno — Grado en Biotecnología, Universitat de València (2025/2026)
