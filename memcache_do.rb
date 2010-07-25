require 'socket'

class MemcacheDo
  def self.exec(command, hostname="localhost", port="11211")
    begin
      data = ''
      sock = TCPSocket.new(hostname, port)
      sock.print("#{command}\r\n")
      sock.flush
      # memcached does not close the socket once it is done writing
      # the stats data.  We need to read line by line until we detect
      # the END line and then stop/close on our side.
      stats = sock.gets
      while true
        data += stats
        break if stats.strip == 'END'
        stats = sock.gets
      end
      sock.close
      data
    rescue => e
      puts e
    end
  end
end