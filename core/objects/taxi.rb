=begin
/**
* @author zhzhussupovkz@gmail.com
* @copyright (c) 2013 Zhussupov Zhassulan zhzhussupovkz@gmail.com
*/
=end
#Taxi
class Taxi < Car

  def initialize window, x, y
    begin
      super window, x, y, "images/cars/taxi.png"
      @fuel, @damage, @money, @lives, @score, @distance = 100, 100, 200, 3, 0, 0
      @ui = Gosu::Font.new(window, 'Monaco', 25)
      @beep = Gosu::Song.new(window, 'sounds/beep.ogg')
      @acc = Gosu::Song.new(window, 'sounds/acc.ogg')
      @door = Gosu::Song.new(window, 'sounds/door.ogg')
      @crash = Gosu::Song.new(window, 'sounds/crash.ogg')
      @game_over = Gosu::Font.new(window, 'Monaco', 30)
      @pass = @dead = false
      @gear = 1
      @g = true
      @last_trip = @last_prize = @last_gear = Time.now.to_i
    rescue Exception => e
      puts "#{e.class}: #{e.message}"
    end
  end

  attr_accessor :pass, :last_trip, :last_prize, :lives
  attr_reader :x, :y, :distance, :dead, :gear

  #draw
  def draw
    super
    @ui.draw("Score: #{@score}", 485, 20, 2)
    @ui.draw("#{@money}", 525, 82, 2)
    @ui.draw("#{@damage}", 525, 107, 2)
    @ui.draw("#{@fuel}", 525, 132, 2)
    @ui.draw("#{@gear}", 525, 157, 2)
    @game_over.draw("GAME OVER", 475, 405, 3) if dead
    xc = 0
    @lives.times do
      @img.draw(485 + xc, 190, 2)
      xc += 34
    end
  end

  #accelerate
  def go
    begin
      super
      @acc.play(looping = true)
      @distance += (5.0 * gear)
      if (@distance % 1000 == 0)
        @fuel -= (2.0 * gear)
        @fuel = 0 if @fuel <= 0
        if @pass == true
          @money += 10
          @score += 100
          window.world.pass.cab_ride
        end
      end
      if window.world.pass.distance == 0
        del_pass
        window.world.pass.update_dist
      end
    rescue Exception => e
      puts "#{e.class}: #{e.message}"
    end
  end

  #brake
  def brake
    super
    @acc.stop
  end

  #beep
  def beep
    @beep.play(looping = false)
  end

  #driving
  def driving
    if lives > 0
      move_left if window.button_down? Gosu::KbLeft
      move_right if window.button_down? Gosu::KbRight
      go if window.button_down? Gosu::KbUp
      brake if window.button_down? Gosu::KbDown
      beep if window.button_down? Gosu::KbSpace
      move
    else
      game_over
    end
    transmission
    collect_prizes
  end

  #transmission
  def transmission
    if window.button_down? Gosu::KbLeftShift
      @gear += 1 if @g
      @gear = 4 if @gear >= 4
      @g = false
    elsif window.button_down? Gosu::KbLeftControl
      @gear -= 1 if @g
      @gear = 1 if @gear <= 1
      @g = false
    end
    if ((Time.now.to_i - @last_gear) == 10)
      @g = true
      @last_gear = Time.now.to_i
    end
  end

  #add passenger
  def add_pass
    @pass = true
    @door.play(looping = false)
  end

  #del passenger
  def del_pass
    @acc.stop
    sleep(2)
    @pass = false
    @door.play(looping = false)
    window.world.pass.ride = true
    window.world.pass.y = 225
    window.world.pass.drawing = true
  end

  #add fuel
  def refuel
    @fuel += 10
    @fuel = 100 if @fuel >= 100
    @score += 3
  end

  #repair auto
  def repair
    @damage += 10
    @damage = 100 if @damage >= 100
    @score += 5
  end

  #add money
  def coin
    @money += 5
    @score += 10
  end

  #collect prizes
  def collect_prizes
    if (window.world.prize.x - @x).abs <= 15.0 && (window.world.prize.y - @y).abs <= 15.0 && (window.world.prize.drawing == true)
      window.world.prize.drawing = false
      @last_prize = Time.now.to_i
      case window.world.prize.type
      when 'fuel'
        refuel
      when 'money'
        coin
      when 'damage'
        repair
      end
      window.world.prize.change
    end
  end

  #add injury
  def add_injury
    @damage -= (2.0 * gear)
    @x += 20.0
    @y += 15.0
    if @damage <= 0
      @damage = 0
      @crash.play(looping = false)
      reboot
    end
  end

  #reboot player 
  def reboot
    @x, @y = 250, 425
    sleep(2)
    @lives -= 1
    @damage = 100
    @last_trip, @last_prize = Time.now.to_i, Time.now.to_i
  end

  #game over
  def game_over
    @dead = true
  end

end

