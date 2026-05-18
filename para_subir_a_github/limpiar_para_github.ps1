# =======================================================================
# Script de limpieza ANTES de hacer git add / commit / push
# Borra todos los archivos GENERADOS por las practicas que no deben subirse
# Solo borra cosas regenerables ejecutando los .qmd
# =======================================================================

$BASE = "C:\Documents\Bioinformatica3"   # <-- AJUSTA si tu repo esta en otro sitio

Write-Host "Limpiando $BASE ..." -ForegroundColor Cyan

# data/Practica3 - FASTQs y BWA indices
Remove-Item -Force -ErrorAction SilentlyContinue "$BASE\data\Practica3\DRR0250*"
Remove-Item -Force -ErrorAction SilentlyContinue "$BASE\data\Practica3\referencia.fa*"

# data/Practica4 - ncbi_dataset
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$BASE\data\Practica4\ncbi_dataset"
Remove-Item -Force -ErrorAction SilentlyContinue "$BASE\data\Practica4\ncbi_dataset.zip"

# data/Practica8 - swissprot, taxdb, taxonomy
Remove-Item -Force -ErrorAction SilentlyContinue "$BASE\data\Practica8\swissprot.*"
Remove-Item -Force -ErrorAction SilentlyContinue "$BASE\data\Practica8\taxdb.*"
Remove-Item -Force -ErrorAction SilentlyContinue "$BASE\data\Practica8\taxonomy4blast.*"

# data/Practica10 - At4.fa descomprimido (At4.10.fa.gz se queda)
Remove-Item -Force -ErrorAction SilentlyContinue "$BASE\data\Practica10\At4.fa"

# results/Practica1
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$BASE\results\Practica1\alng*"
Remove-Item -Force -ErrorAction SilentlyContinue "$BASE\results\Practica1\PF00009*"

# results/Practica3 - BAM, SAM, fastqs, fastp
Remove-Item -Force -ErrorAction SilentlyContinue "$BASE\results\Practica3\*.bam"
Remove-Item -Force -ErrorAction SilentlyContinue "$BASE\results\Practica3\*.bam.bai"
Remove-Item -Force -ErrorAction SilentlyContinue "$BASE\results\Practica3\*.sam"
Remove-Item -Force -ErrorAction SilentlyContinue "$BASE\results\Practica3\*.fastq"
Remove-Item -Force -ErrorAction SilentlyContinue "$BASE\results\Practica3\*.fastq.gz"
Remove-Item -Force -ErrorAction SilentlyContinue "$BASE\results\Practica3\fastp*"
Remove-Item -Force -ErrorAction SilentlyContinue "$BASE\results\Practica3\COV.txt"
Remove-Item -Force -ErrorAction SilentlyContinue "$BASE\results\Practica3\bwa.*"

# results/Practica4 - ncbi_dataset
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$BASE\results\Practica4\ncbi_dataset"
Remove-Item -Force -ErrorAction SilentlyContinue "$BASE\results\Practica4\ncbi_dataset.zip"
Remove-Item -Force -ErrorAction SilentlyContinue "$BASE\results\Practica4\md5sum.txt"
Remove-Item -Force -ErrorAction SilentlyContinue "$BASE\results\Practica4\README.md"

# results/Practica5
Remove-Item -Force -ErrorAction SilentlyContinue "$BASE\results\Practica5\z*.txt"

# results/Practica7
Remove-Item -Force -ErrorAction SilentlyContinue "$BASE\results\Practica7\gwas.txt"

# results/Practica8 - BLAST DBs y resultados
Remove-Item -Force -ErrorAction SilentlyContinue "$BASE\results\Practica8\buchnera.p*"
Remove-Item -Force -ErrorAction SilentlyContinue "$BASE\results\Practica8\blochmannia.p*"
Remove-Item -Force -ErrorAction SilentlyContinue "$BASE\results\Practica8\*_seg.asnb"
Remove-Item -Force -ErrorAction SilentlyContinue "$BASE\results\Practica8\buc2blo.txt"
Remove-Item -Force -ErrorAction SilentlyContinue "$BASE\results\Practica8\blo2buc.txt"
Remove-Item -Force -ErrorAction SilentlyContinue "$BASE\results\Practica8\muestra.fa"
Remove-Item -Force -ErrorAction SilentlyContinue "$BASE\results\Practica8\P39615*"
Remove-Item -Force -ErrorAction SilentlyContinue "$BASE\results\Practica8\resultado.txt"
Remove-Item -Force -ErrorAction SilentlyContinue "$BASE\results\Practica8\taxids.txt"
Remove-Item -Force -ErrorAction SilentlyContinue "$BASE\results\Practica8\taxreport.txt"

# results/Practica10 - ensamblaje hifiasm completo
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$BASE\results\Practica10\asm1"
Remove-Item -Force -ErrorAction SilentlyContinue "$BASE\results\Practica10\hifiasm*"

# results/Practica11 - RepeatModeler, RepeatMasker, GALBA
Remove-Item -Force -ErrorAction SilentlyContinue "$BASE\results\Practica11\At4*"
Remove-Item -Force -ErrorAction SilentlyContinue "$BASE\results\Practica11\proteinas.fasta"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$BASE\results\Practica11\RM_*"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$BASE\results\Practica11\RepetaMasker"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$BASE\results\Practica11\GALBA"

# Quarto libs (se regeneran al render)
Get-ChildItem -Path "$BASE\results" -Recurse -Directory -Filter "libs" -ErrorAction SilentlyContinue |
    Where-Object { $_.FullName -like "*_files\libs*" } |
    Remove-Item -Recurse -Force -ErrorAction SilentlyContinue

# Codigo clonado de terceros (bwa, freebayes...)
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$BASE\bwa"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$BASE\freebayes"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$BASE\hifiasm"

# R session
Remove-Item -Force -ErrorAction SilentlyContinue "$BASE\.RData"
Remove-Item -Force -ErrorAction SilentlyContinue "$BASE\.Rhistory"

Write-Host "✔ Limpieza completada." -ForegroundColor Green
Write-Host ""
Write-Host "Siguiente paso:" -ForegroundColor Yellow
Write-Host "  cd $BASE" -ForegroundColor White
Write-Host "  git add ." -ForegroundColor White
Write-Host "  git commit -m 'Subida final: practicas 1-12'" -ForegroundColor White
Write-Host "  git push origin main" -ForegroundColor White
