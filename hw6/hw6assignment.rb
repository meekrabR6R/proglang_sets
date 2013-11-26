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
  Cheat_Piece = [[[[0, 0]]]]
 
  attr_reader :cheat_next
  # class method to choose the next piece
  def self.next_piece (board)
  	if @cheat_next
  		@cheat_next = false
  		MyPiece.new(Cheat_Piece[0], board)
  	else
      MyPiece.new(All_My_Pieces.sample, board)
    end
  end

  #cheater override
  def self.cheat
    @cheat_next = true
  end
end

class MyBoard < Board
  
  attr_accessor :score

  def initialize(game)
  	super(game)
  	@current_block = MyPiece.next_piece(self)
  end

  # gets the next piece
  def next_piece
    @current_block = MyPiece.next_piece(self)
    @current_pos = nil
  end
  
  def cheat_next
  	@current_block.cheat_next
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
      if @board.score >= 100 && !@board.cheat_next
      	@board.score -= 100
      	MyPiece.cheat
      end
    end
    
    def one_eighty
  	  2.times { @board.rotate_clockwise }
    end
end


