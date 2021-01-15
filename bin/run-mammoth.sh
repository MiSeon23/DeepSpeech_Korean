#!/bin/sh
set -xe

export CUDA_VISIBLE_DEVICES=0

python -u DeepSpeech.py --noshow_progressbar \
  --train_files data/train_data.csv \
  --dev_files data/validate_data.csv \
  --test_files data/test_data.csv \
  --train_batch_size 1 \
  --test_batch_size 1 \
  --n_hidden 50 \
  --learning_rate 0.001 \
  --epochs 50 \
  --alphabet_config_path data/alphabet_korean.txt \
  --export_language="ko-KR" \
  --export_dir data/ \
  --checkpoint_dir data/checkpoint_dir \       
  "$@"


