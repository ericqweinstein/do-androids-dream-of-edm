# Code to call into Tensorflow/Magenta in order to train
# its LSTM neural network model and generate MIDI files.
#
# @see https://en.wikipedia.org/wiki/Long_short-term_memory
# @see https://github.com/tensorflow/magenta
#
# @author Eric Weinstein <eric.q.weinstein@gmail.com>
require 'rubypython'

# Wrapper for the Tensorflow/Magenta model.
class LSTM
  # Creates a new instance of the wrapper.
  # @param virtualenv [String] The path to the Python virtualenv.
  # @param config [String] The model type.
  #                        One of 'basic_rnn' | 'attention_rnn' | 'lookback_rnn'.
  # @param input_dir [String] The directory of MIDI files for training.
  # @param output_dir [String] The directory of generated MIDI files.
  def initialize(virtualenv, config='basic_rnn', input_dir='../../midi', output_dir='../../generated')
    @config = config
    @input_dir = input_dir
    @output_dir = output_dir
    @virtualenv = virtualenv
  end

  # Converts MIDI files in `midi/` to a .tfrecord file (a collection of
  # NoteSequence protocol buffers), then feeds those data into the LSTM NN.
  def prepare
    RubyPython.start_from_virtualenv(@virtualenv)

    sys = RubyPython.import('sys')
    sys.path.append("#{File.expand_path('..', Dir.pwd)}/py/util")
    RubyPython.import('prepare')
    RubyPython.stop
  end

  # Trains the Magenta LSTM on new MIDI files.
  # @param num_steps [Fixnum] The number of training steps.
  # @param batch_size [Fixnum] The batch size, used to partition training data
  #                            into smaller pieces.
  # @param layer_sizes [Array<Fixnum>] The size of each neural network layer.
  def train(num_steps=20_000, batch_size=64, layer_sizes=[64, 64])
    RubyPython.start_from_virtualenv(@virtualenv)

    sys = RubyPython.import('sys')
    sys.path.append("#{File.expand_path('..', Dir.pwd)}/py/melody_rnn")
    RubyPython.import('train')
    RubyPython.stop
  end

  # Runs the trained neural network to generate music.
  # @param num_outputs [Fixnum] The number of melodies to generate.
  # @param num_steps [Fixnum] The total number of steps the melody should be.
  def run(num_outputs=10, num_steps=128)
    model = "#@config.mag"
    RubyPython.start_from_virtualenv(@virtualenv)

    sys = RubyPython.import('sys')
    sys.path.append("#{File.expand_path('..', Dir.pwd)}/py/melody_rnn")
    RubyPython.import('run')
    RubyPython.stop
  end
end
