# This class should read from a file in chunks, and pass on
# the chunks to a class that can process them a chunk at a
# time.
# It is relatively hairy to test, so I won't be unit testing
# it at first. I will make this less risky by trying to avoid
# any complex logic here, or any conditionals, if possible
# (pardon the pun).

require_relative './rover_processor'

INPUT_FILENAME = 'input.txt'
CHUNK_SIZE = 1

class RoverRunner
  def self.start
    @processor = RoverProcessor.new
    File.open INPUT_FILENAME, 'r' do |input_file|
      until input_file.eof?
        chunk = input_file.read CHUNK_SIZE
        @processor.process(chunk: chunk)
      end
    end
  end
end
