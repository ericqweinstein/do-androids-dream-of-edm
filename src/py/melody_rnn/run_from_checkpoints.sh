python melody_rnn_generate.py \
  --config=basic_rnn \
  --run_dir="$PWD/checkpoints" \
  --output_dir='../../../generated' \
  --num_outputs=10 \
  --num_steps=128 \
  --hparams="batch_size=64,rnn_layer_sizes=[64,64]" \
  --primer_melody="[60]"
