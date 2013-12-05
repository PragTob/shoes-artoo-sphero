require 'artoo'
require 'shoes'


STOP_KEYS = [:escape]
FORWARD_KEYS = ['w']
LEFT_KEYS = ['a']
BACK_KEYS = ['s']
RIGHT_KEYS = ['d']
GREEN_KEYS = ['g']
RED_KEYS = ['r']
BLUE_KEYS = ['b']
ACCLERATE_KEYS = [:page_up]
BREAK_KEYS = [:page_down]

class MySphero < Artoo::Robot
  connection :sphero, :adaptor => :sphero, :port => '127.0.0.1:8023'
  device :sphero, :driver => :sphero

  work do
    sphero.set_color 0, 0, 255
  end

end

Shoes.app do
  def stop_sphero
    puts 'Stopping sphero...'
    sphero.stop
  end

  def sphero_roll(degree)
    puts 'rolling sphero'
    sphero.roll @speed, degree
  end

  def sphero_color(r, g, b)
    puts 'changing color...'
    sphero.set_color r, g, b
  end

  def sphero
    puts 'my sphero method'
    @robot.sphero
  end

  def update_speed_text
    @speed_para.text = "Your current speed is #{@speed}"
  end

  #@robot = MySphero.new
  #@robot.work
  @speed = 50


  para 'Have fun playing with your sphero.'
  para 'Use wasd to control, escape to quit'
  @speed_para = para ''
  update_speed_text


  keypress do |key|
    case key
    when *STOP_KEYS
      stop_sphero
    when *FORWARD_KEYS
      sphero_roll 0
    when *RIGHT_KEYS
      sphero_roll 90
    when *BACK_KEYS
      sphero_roll 180
    when *LEFT_KEYS
      sphero_roll 270
    when *GREEN_KEYS
      sphero_color(0, 255, 0)
    when *RED_KEYS
      sphero_color(255, 0, 0)
    when *BLUE_KEYS
      sphero_color 0, 0, 255
    when *ACCLERATE_KEYS
      @speed += 10
      update_speed_text
    when *BREAK_KEYS
      @speed -= 10
      update_speed_text
    else
      puts "Sphero don't know what to do... :-(" + key.to_s
    end
  end
end