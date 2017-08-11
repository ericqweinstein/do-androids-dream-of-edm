import os

INPUT_DIRECTORY='../../midi'

# TFRecord file that will contain NoteSequence protocol buffers.
SEQUENCES_TFRECORD='../../notesequences.tfrecord'

os.system('python ../py/util/convert_dir_to_note_sequences.py --input_dir=' + INPUT_DIRECTORY + ' --output_file=' + SEQUENCES_TFRECORD + ' --recursive')
