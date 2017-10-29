$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "screenshot_opener"

require "minitest/autorun"

class Minitest::Test
  def silence_stream(stream)
    old_stream = stream.dup
    stream.reopen(IO::NULL)
    stream.sync = true
    yield
  ensure
    stream.reopen(old_stream)
    old_stream.close
  end

  def quietly
    silence_stream(STDOUT) do
      silence_stream(STDERR) do
        yield
      end
    end
  end
end
