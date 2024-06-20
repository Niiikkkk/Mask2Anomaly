#!/bin/bash
#SBATCH --time=01:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=5
#SBATCH --gres=gpu:1
#SBATCH --job-name=python-ex
#SBATCH --mail-type=ALL
#SBATCH --partition=cuda
#SBATCH --output=stdout.txt
#SBATCH --error=stderr.txt
###### 1 Load the module
module load nvidia/cudasdk/
module load intel/python/3/
# 2 Activate the virtual environment
source /home/nberardo/myenv/bin/activate

# 3 Run the python script
CUDA_VISIBLE_DEVICES=1 CITYSCAPES_DATASET=/home/nberardo/Datasets/cityscapes/cityscapes/data python /home/nberardo/Mask2Anomaly/train_net.py --num-gpus 1 --config-file configs/cityscapes/semantic-segmentation/anomaly_train.yaml
