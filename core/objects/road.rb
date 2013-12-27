=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2013 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#Road
class Road

  def initialize window, x, y
    begin
      @window = window
      @x, @y = x, y
      @img = Gosu::Image.new(window, "images/env/asphalt.png", false)
      @lines = []
      (0..440).step(40) do |i| @lines << Line.new(window, 215, i) end
    rescue Exception => e
      puts "#{e.class}: #{e.message}"
    end
  end

  attr_reader :window

  #draw
  def draw
    @img.draw(@x, @y, 1)
    @lines.each do |e| e.draw end
  end

  #update
  def update
    @lines.each do |e| e.move end if (window.button_down? Gosu::KbUp) && (not window.world.taxi.dead)
  end

end

