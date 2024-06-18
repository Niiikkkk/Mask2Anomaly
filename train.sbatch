#!/bin/bash
#SBATCH --time=04:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=5
#SBATCH --gres=gpu:1
#SBATCH --job-name=python-ex
#SBATCH --mail-type=ALL
#SBATCH --partition=cuda
###### 1 Load the module
module --ignore-cache load nvidia/cudasdk/11.6
module --ignore-cache load intel/python/3/2019.4.088
# 2 Activate the virtual environment
source /home/nberardo/myenv/bin/activate
# 3 Run the python script
CUDA_VISIBLE_DEVICES=1 python /home/nberardo/Mask2Anomaly/train.sbatch --num-gpus 1 --config-file configs/cityscapes/semantic-segmentation/anomaly_train.yaml
