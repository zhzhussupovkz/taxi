=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2014 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#Menu
class Menu

  def initialize window
    @window, @display = window, true
    @bg = Gosu::Image.new(window, 'images/env/green.png', true)
    @name = Gosu::Image.new(window, 'images/menu/name.png', true)
    @icon = Gosu::Image.new(window, 'images/menu/icon.png', true)
    @new = Gosu::Image.new(window, 'images/menu/new.png', true)
    @exit = Gosu::Image.new(window, 'images/menu/exit.png', true)
    @cursor = Gosu::Image.new(@window, 'images/menu/cursor.png')
    @beep = Gosu::Song.new(window, 'sounds/beep.ogg')
    @c = Gosu::Font.new(window, 'Monaco', 20)
  end

  attr_accessor :display

  def draw
    if @display === true
      @bg.draw(0,0,0)
      @name.draw(250, 25, 2)
      @icon.draw(175, 100, 2)
      @new.draw(250, 335, 2)
      @exit.draw(250, 375, 2)
      @cursor.draw(@window.mouse_x, @window.mouse_y, 3)
      year = (Time.at(Time.now.to_i)).strftime("%Y")
      @c.draw("Copyright (c) #{year} by zhzhussupovkz", 175, 425, 2)
      @c.draw("Icons by http://findicons.com", 200, 450, 2)
    end
  end

  def update
    if 250 < @window.mouse_x &&
    @window.mouse_x < 370 &&
    335 < @window.mouse_y &&
    @window.mouse_y < 370 && (@window.button_down? Gosu::MsLeft)
      new_game
    elsif 250 < @window.mouse_x &&
    @window.mouse_x < 370 &&
    375 < @window.mouse_y &&
    @window.mouse_y < 410 && (@window.button_down? Gosu::MsLeft)
      exit
    end
  end

  #new game button click event
  def new_game
    @beep.play(looping = false)
    @display = false
    @window.pause = false
  end

  #exit button click event
  def exit
    @window.pause = true
    @window.close
  end
  
end