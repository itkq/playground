module FTP
  class CommandHandler
    CRLF = "\r\n"

    attr_reader :connection
    def initialize(connection)
      @connection = connection
    end

    def pwd
      @pwd || Dir.pwd
    end

    def handle(data)
      cmd = data[0..3].strip.upcase
      options = data[4..-1].strip

      case cmd
      when 'USER'
        # Accept any username anonymously
        "230 Logged in anonymously"

      when 'SYST'
        # what's your name?
        "215 UNIX Working With FTP"

      when 'CWD'
        if File.directory?(options)
          @pwd = options
          "250 directory changed to #{pwd}"
        else
          "550 directory not found"
        end

      when 'PWD'
        "257 \"#{pwd}\" is the current directory"

      when 'PORT'

        @pwd || Dir.pwd
      end

      def handle(data)
        cmd = data[0..3].strip.upcase
        options = data[4..-1].strip

        case cmd
        when 'USER'
          # Accept any username anonymously
          "230 Logged in anonymously"

        when 'SYST'
          # what's your name?
          "215 UNIX Working With FTP"

        when 'CWD'
          if File.directory?(options)
            @pwd = options
            "250 directory changed to #{pwd}"
          else
            "550 directory not found"
          end

        when 'PWD'
          "257 \"#{pwd}\" is the current directory"

        when 'PORT'
          "221 Ciao"

        else
          "502 Don't know how to respond to #{cmd}"
        end
      end
    end
  end
end
