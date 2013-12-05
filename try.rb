require 'artoo'

connection :sphero, :adaptor => :sphero, :port => '127.0.0.1:8023'
device :sphero, :driver => :sphero

work do
  @rolling = false

  every(3.seconds) do
    puts "Rolling..."
    if @rolling
      sphero.stop
      @rolling = false
    else
      sphero.roll 90, rand(360)
      @rolling = true
    end
  end
end