class MarsRover
    
    DEFAULT_POSITION = [0,0]
    ORIENTATIONS = [:north, :west, :south, :east]
    DEFAULT_ORIENTATION = ORIENTATIONS[0]
    
    def initialize
       @position = DEFAULT_POSITION
       @orientation = DEFAULT_ORIENTATION
    end
    
    def broadcast_position
       @position 
    end
    
    def broadcast_orientation
       @orientation
    end
    
    def receive_commands(commands)
        commands.each do |command|
            num = 0
            if command == :l
                turn_left
                num = 1
            elsif command == :r
                turn_right 
                num = 1
            elsif command == :m
                num = 1
            elsif command.is_a? Numeric
                num = command
            end
             change_position(num)
        end
    end
    
    private 
    
    def turn_left
      orientation_index =  ORIENTATIONS.index(@orientation) 
      final_position =  orientation_index+1
      final_position = 0 if final_position > 3

      @orientation = ORIENTATIONS[final_position]    
    end
    
    def turn_right
        orientation_index =  ORIENTATIONS.index(@orientation) 
        final_position =  orientation_index-1
        final_position = 3 if final_position < 0
        
        @orientation = ORIENTATIONS[final_position]
    end
    
    def change_position(num)
        case @orientation
        when :north
           @position[1] += num
        when :west
           @position[0] += num
        when :south
            @position[1] -= num
        when :east
            @position[0] -= num
        end
    end
    
   
    
end