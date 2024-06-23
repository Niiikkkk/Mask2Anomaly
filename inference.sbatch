#!/bin/bash
#SBATCH --time=01:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=5
#SBATCH --gres=gpu:1
#SBATCH --job-name=python-ex
#SBATCH --mail-type=ALL
#SBATCH --partition=cuda
#SBATCH --output=stdout_inference.txt
#SBATCH --error=stderr_inference.txt
###### 1 Load the module
module load nvidia/cudasdk/
module load intel/python/3/
# 2 Activate the virtual environment
source /home/nberardo/myenv/bin/activate

# 3 Run the python script
#CUDA_VISIBLE_DEVICES=1 python /home/nberardo/Mask2Anomaly/anomaly_utils/anomaly_inference.py --input /home/nberardo/Datasets/RoadAnomaly/images/*.jpg --config-file configs/cityscapes/semantic-segmentation/anomaly_inference.yaml
#CUDA_VISIBLE_DEVICES=1 python /home/nberardo/Mask2Anomaly/anomaly_utils/anomaly_inference.py --input /home/nberardo/Datasets/RoadAnomaly21/images/*.png --config-file configs/cityscapes/semantic-segmentation/anomaly_inference.yaml
#CUDA_VISIBLE_DEVICES=1 python /home/nberardo/Mask2Anomaly/anomaly_utils/anomaly_inference.py --input /home/nberardo/Datasets/fs_static/images/*.jpg --config-file configs/cityscapes/semantic-segmentation/anomaly_inference.yaml
#CUDA_VISIBLE_DEVICES=1 python /home/nberardo/Mask2Anomaly/anomaly_utils/anomaly_inference.py --input /home/nberardo/Datasets/FS_LostFound_full/images/*.png --config-file configs/cityscapes/semantic-segmentation/anomaly_inference.yaml
CUDA_VISIBLE_DEVICES=1 python /home/nberardo/Mask2Anomaly/anomaly_utils/anomaly_inference.py --input /home/nberardo/Datasets/RoadObsticle21/images/*.webp --config-file configs/cityscapes/semantic-segmentation/anomaly_inference.yaml
