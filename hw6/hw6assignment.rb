# University of Washington, Programming Languages, Homework 6, hw6runner.rb

# This is the only file you turn in, so do not modify the other files as
# part of your solution.

class MyPiece < Piece
  # The constant All_My_Pieces should be declared here
  All_My_Pieces = [[[[0, 0], [1, 0], [0, 1], [1, 1]]],  # square (only needs one)
               rotations([[0, 0], [-1, 0], [1, 0], [0, -1]]), # T
               [[[0, 0], [-1, 0], [1, 0], [2, 0]], # long (only needs two)
               [[0, 0], [0, -1], [0, 1], [0, 2]]],
               rotations([[0, 0], [0, -1], [0, 1], [1, 1]]), # L
               rotations([[0, 0], [0, -1], [0, 1], [-1, 1]]), # inverted L
               rotations([[0, 0], [-1, 0], [0, -1], [1, -1]]), # S
               rotations([[0, 0], [1, 0], [0, -1], [-1, -1]]), # Z
               rotations([[0, 0], [1, 0], [0, 1], [1, 1], [0, 2]]),
               rotations([[0, 0], [0, 1], [1, 0]]),
               [[[0, 0], [-1, 0], [1, 0], [2, 0], [3, 0]], # long (only needs two)
               [[0, 0], [0, -1], [0, 1], [0, 2], [0, 3]]]] 
  # your enhancements here
 

  # class method to choose the next piece
  def self.next_piece (board)
    MyPiece.new(All_My_Pieces.sample, board)
  end

  #cheater override
  def self.cheat_piece (board)
  	MyPiece.new([[[0,0]]], board)
  end
end

class MyBoard < Board
  # your enhancements here

  def initialize(game)
  	super(game)
  	@current_block = MyPiece.next_piece(self)
  end

  # gets the next piece
  def next_piece
    @current_block = MyPiece.next_piece(self)
    @current_pos = nil
  end

  def store_current
    locations = @current_block.current_rotation
    displacement = @current_block.position
    range = if locations.length == 5
    	        (0..4)
    	      elsif locations.length == 4
    	      	(0..3)
    	      elsif locations.length == 1
    	      	(0...1)
    	      else
    	      	(0..2)
    	      end

    range.each{|index| 
      current = locations[index];
      @grid[current[1]+displacement[1]][current[0]+displacement[0]] = 
      @current_pos[index]
    }
    remove_filled
    @delay = [@delay - 2, 80].max
  end

  def score
  	@score
  end

  def dec_score
  	@score -= 100
  end

  def current_block=(block)
  	@current_block = block
  end
end

class MyTetris < Tetris
  # your enhancements here
  def initialize
  	super
  	new_key_bindings
  	set_board
  end
  
  def set_board
    @canvas = TetrisCanvas.new
    @board = MyBoard.new(self)
    @canvas.place(@board.block_size * @board.num_rows + 3,
                  @board.block_size * @board.num_columns + 6, 24, 80)
    @board.draw
  end

  def new_key_bindings
  	@root.bind('u', proc { one_eighty })
  	@root.bind('c', proc { cheat })
  end

  private
    def cheat
      if @board.score >= 100
      	@board.dec_score
      	@board.current_block = MyPiece.cheat_piece(@board)
      end
    end
    
    def one_eighty
  	  2.times { @board.rotate_clockwise }
    end
end


