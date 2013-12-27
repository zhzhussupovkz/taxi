=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2013 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#Line
class Line

  def initialize window, x, y
    begin
      @window, @x, @y = window, x, y
      @img = Gosu::Image.new(window, "images/env/line.png", false)
    rescue Exception => e
      puts "#{e.class}: #{e.message}"
    end
  end

  #draw
  def draw
    @img.draw(@x, @y, 2)
  end

  #move
  def move
    @y += 3.0
    @y = 0 if @y >= 480
  end

end

