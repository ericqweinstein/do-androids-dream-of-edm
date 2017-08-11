import os

pwd = os.path.dirname(os.path.realpath(__file__))

os.system('python ../py/melody_rnn/melody_rnn_create_dataset.py --config="basic_rnn" --input="' + pwd + '/notesequences.tfrecord" --output_dir="' + pwd + '/sequence_examples" --eval_ratio=0.10')

os.system('python ../py/melody_rnn/melody_rnn_train.py --config="basic_rnn" --run_dir="' + pwd + '/checkpoints" --sequence_example_file="' + pwd + '/sequence_examples/training_melodies.tfrecord" --hparams="batch_size=64,rnn_layer_sizes=[64,64]" --num_training_steps=1000')
