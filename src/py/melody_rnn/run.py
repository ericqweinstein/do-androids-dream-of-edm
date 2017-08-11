import os

checkpoints = os.path.dirname(os.path.realpath(__file__)) + '/checkpoints'
config = 'basic_rnn'

os.system('python ../py/melody_rnn/melody_rnn_generate.py --config=' + config + ' --run_dir=' + checkpoints + ' --output_dir=../../generated --num_outputs=10 --num_steps=128 --hparams="batch_size=64,rnn_layer_sizes=[64,64]" --primer_melody="[60]"')
