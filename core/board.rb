# encoding: utf-8
=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2013 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#Board
class Board

  def initialize window
    begin
      @window = window
      @img = Gosu::Image.new(window, 'images/scboard/scboard.png', true)
      @fuel = Gosu::Image.new(window, 'images/scboard/fuel.png', true)
      @money = Gosu::Image.new(window, 'images/scboard/dollar.png', true)
      @damage = Gosu::Image.new(window, 'images/scboard/wrench.png', true)
      @tr = Gosu::Image.new(window, 'images/scboard/transmission.png', true)
      @ui = Gosu::Font.new(window, 'Monaco', 13)
      @controls = Gosu::Font.new(window, 'Monaco', 20)
    rescue Exception => e
      puts "#{e.class}: #{e.message}"
    end
  end

  attr_reader :window

  #draw
  def draw
    begin
      @img.draw(440, 0, 1)
      @money.draw(495, 80, 2)
      @damage.draw(495, 105, 2)
      @fuel.draw(495, 130, 2)
      @tr.draw(495, 155, 2)
      draw_controls
      time = (Time.at(Time.now.to_i - window.st - 3600*6)).strftime("%H:%M:%S")
      @ui.draw("Time: " + time.to_s, 495, 435, 2)
      year = (Time.at(Time.now.to_i)).strftime("%Y")
      @ui.draw("Copyright (c) #{year} by zhzhussupovkz", 445, 450, 2)
      @ui.draw("Icons by http://findicons.com", 460, 465, 2)
    rescue Exception => e
      puts "#{e.class}: #{e.message}"
    end
  end

  #draw controls
  def draw_controls
    @controls.draw("controls:", 500, 225, 2)
    @controls.draw("move - ↑ ↓ ← →", 485, 255, 2)
    @controls.draw("beep - space", 485, 280, 2)
    @controls.draw("passenger - alt", 485, 305, 2)
    @controls.draw("gear up - shift", 485, 330, 2)
    @controls.draw("gear down - ctrl", 485, 355, 2)
    @controls.draw("quit - esc", 485, 380, 2)
  end

end

