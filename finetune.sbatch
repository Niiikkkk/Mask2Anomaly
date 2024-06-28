#!/bin/bash
#SBATCH --time=48:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=5
#SBATCH --gres=gpu:1
#SBATCH --job-name=python-ex
#SBATCH --mail-type=ALL
#SBATCH --partition=cuda
#SBATCH --output=stdout_ft.txt
#SBATCH --error=stderr_ft.txt
###### 1 Load the module
module load nvidia/cudasdk/
module load intel/python/3/
# 2 Activate the virtual environment
source /home/nberardo/myenv/bin/activate

# 3 Run the python script
CUDA_VISIBLE_DEVICES=1 DETECTRON2_DATASETS=/home/nberardo/Datasets/ python /home/nberardo/Mask2Anomaly/train_net.py --num-gpus 1 --config-file configs/cityscapes/semantic-segmentation/anomaly_ft.yaml
