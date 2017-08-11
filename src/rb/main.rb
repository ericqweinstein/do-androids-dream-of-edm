# Entrypoint for our Ruby machine learning magicks.
#
# @author Eric Weinstein <eric.q.weinstein@gmail.com>

require_relative './lstm'

# Requires a path to your Python virtualenv.
lstm = LSTM.new('/Users/ericweinstein/virtualenvs/magenta')

# Converts MIDI files in `midi/` to a .tfrecord
# file for Tensorflow/Magenta to process.
lstm.prepare

# Trains the network on the music data.
lstm.train

# Generates music!
lstm.run
