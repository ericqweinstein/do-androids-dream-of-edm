BUNDLE_PATH="$PWD/models/basic_rnn.mag"
CONFIG='basic_rnn'

python melody_rnn_generate.py \
  --config=${CONFIG} \
  --bundle_file=${BUNDLE_PATH} \
  --output_dir='../../../generated' \
  --num_outputs=10 \
  --num_steps=128 \
  --primer_melody="[60]"
