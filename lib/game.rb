require './lib/frame'

class Game

  attr_reader :frames, :current_frame

  def initialize(frames = [])
    @frames = frames
  end

  def total_score
    @frames.sum { |frame| frame.score }
  end

  def add_roll(knocked_pins)
    validate_roll(knocked_pins)
    assign_bonus_points(knocked_pins)
    combine_frame(knocked_pins) unless tenth_frame?
  end

  def show_breakdown
    breakdown = ''
    @frames.each_with_index do |frame, index|
      if frame.strike? 
        frame_scores = "| #{frame.roll_1.to_s} X "
        frame_scores += ' ' if frame_scores.length == 5
        frame_scores += '|' if index == 9
        breakdown += frame_scores
      elsif frame.spare?
        frame_scores = "| #{frame.roll_1.to_s} / "
        frame_scores += ' ' if frame_scores.length < 7
        frame_scores += '|' if index == 9
        breakdown += frame_scores
      else
        frame_scores = "| #{frame.roll_1.to_s} #{frame.roll_2.to_s} "
        frame_scores + ' ' if frame_scores.length == 5
        frame_scores + '|' if index == 9
        breakdown += frame_scores
      end
    end
    breakdown
  end

  private  

  def tenth_frame?
    @frames.length == 10
  end

  def validate_roll(knocked_pins)
    raise 'round complete' if round_finished?
    raise 'invalid roll' unless valid_roll?(knocked_pins)
  end

  def assign_bonus_points(points)
    @frames.each do |frame|
      if frame.bonus_rolls > 0
        frame.add_points(points)
        frame.bonus_rolls -= 1
      end
    end
  end
  
  def add_frame(frame)
    @frames << frame
  end

  def round_finished?
    if @frames.empty?
      false
    else
      @frames.length == 10 && @frames.last.bonus_rolls == 0
    end
  end

  def valid_roll?(knocked_pins)
    if knocked_pins > 10 
      false
    elsif @current_frame 
      @current_frame.first + knocked_pins <= 10 
    else
      true
    end
  end

  def combine_frame(knocked_pins)
    if knocked_pins == 10 
      add_frame(Frame.new(10, nil))
    else
      @current_frame ? @current_frame << knocked_pins : @current_frame = [knocked_pins]
      if @current_frame.length == 2
        add_frame(Frame.new(@current_frame.first, @current_frame.last))
        @current_frame = nil
      end
    end
  end
end


game = Game.new
 #frame 1
 game.add_roll(4)
 game.add_roll(6)
 #frame 2
 game.add_roll(5)
 game.add_roll(5)
 #frame 3
 game.add_roll(5)
 game.add_roll(4)
 #frame 4
 game.add_roll(10)
 #frame 5
 game.add_roll(9)
 game.add_roll(0)
 #frame 6
 game.add_roll(10)
 #frame 7
 game.add_roll(6)
 game.add_roll(4)
 #frame 8
 game.add_roll(5)
 game.add_roll(2)
 #frame 9
 game.add_roll(10)
 #frame 10
 game.add_roll(10)
 #bonus
 game.add_roll(3)
 game.add_roll(7)

 puts game.show_breakdown
