set -e
true
true
/Users/thomaserko/opt/anaconda3/envs/genome_assembly_env/bin/spades-hammer /Users/thomaserko/Desktop/pyhton/VS_code/Principles_of_bioinfo/spades_results/corrected/configs/config.info
/Users/thomaserko/opt/anaconda3/envs/genome_assembly_env/bin/python /Users/thomaserko/opt/anaconda3/envs/genome_assembly_env/share/spades/spades_pipeline/scripts/compress_all.py --input_file /Users/thomaserko/Desktop/pyhton/VS_code/Principles_of_bioinfo/spades_results/corrected/corrected.yaml --ext_python_modules_home /Users/thomaserko/opt/anaconda3/envs/genome_assembly_env/share/spades --max_threads 16 --output_dir /Users/thomaserko/Desktop/pyhton/VS_code/Principles_of_bioinfo/spades_results/corrected --gzip_output
true
/Users/thomaserko/opt/anaconda3/envs/genome_assembly_env/bin/python /Users/thomaserko/opt/anaconda3/envs/genome_assembly_env/share/spades/spades_pipeline/scripts/breaking_scaffolds_script.py --result_scaffolds_filename /Users/thomaserko/Desktop/pyhton/VS_code/Principles_of_bioinfo/spades_results/scaffolds.fasta --misc_dir /Users/thomaserko/Desktop/pyhton/VS_code/Principles_of_bioinfo/spades_results/misc --threshold_for_breaking_scaffolds 3
true
