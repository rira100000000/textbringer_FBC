require "stringio"

module Textbringer
  class DefaultOutput
    def write(*args)
      if Window.output && !Window.output.deleted?
        Buffer.output.insert(args.join)
      else
        Buffer.current.insert(args.join)
      end
    end

    def flush
    end

    def method_missing(mid, ...)
      buffer = StringIO.new
      buffer.send(mid, ...)
      write(buffer.string)
    end
  end
end
