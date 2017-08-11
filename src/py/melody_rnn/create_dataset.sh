python melody_rnn_create_dataset.py \
  --config='basic_rnn' \
  --input="$PWD/notesequences.tfrecord" \
  --output_dir="$PWD/sequence_examples" \
  --eval_ratio=0.10
