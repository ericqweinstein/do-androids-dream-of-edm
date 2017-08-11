python melody_rnn_train.py \
  --config='basic_rnn' \
  --run_dir="$PWD/checkpoints" \
  --sequence_example_file="$PWD/sequence_examples/training_melodies.tfrecord" \
  --hparams="batch_size=64,rnn_layer_sizes=[64,64]" \
  --num_training_steps=1000
