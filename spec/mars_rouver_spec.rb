require 'mars_rouver'

describe MarsRover do
    ORIGIN = [0,0]

    it "starts at the origin position" do 
        mars_rover = MarsRover.new
        expect(mars_rover.broadcast_position).to eq(ORIGIN) 
    end
    
    it "start facing north" do
      mars_rover = MarsRover.new
      INITIAL_ORIENTATION = :north
      expect(mars_rover.broadcast_orientation).to eq(INITIAL_ORIENTATION)
    end
    
    
    
    it "spins 360 degrees to the left" do
        mars_rover = MarsRover.new
        mars_rover.receive_commands([:l,:l,:l,:l])
        expect(mars_rover.broadcast_orientation).to eq(:north)
    end
    
    it "spins 360 degrees to the right" do
        mars_rover = MarsRover.new
        mars_rover.receive_commands([:r,:r,:r,:r])
        expect(mars_rover.broadcast_orientation).to eq(:north)
    end
    
    
    it "changes position" do 
        mars_rover = MarsRover.new
        mars_rover.receive_commands([:m])
        expect(mars_rover.broadcast_orientation).to eq(:north)
        expect(mars_rover.broadcast_position).to eq([0,1]) 
        mars_rover.receive_commands([:l])
        expect(mars_rover.broadcast_orientation).to eq(:west)
        expect(mars_rover.broadcast_position).to eq([1,1])
        mars_rover.receive_commands([:r])
        expect(mars_rover.broadcast_orientation).to eq(:north)
        expect(mars_rover.broadcast_position).to eq([1,2])
        mars_rover.receive_commands([5])
        expect(mars_rover.broadcast_orientation).to eq(:north)
        expect(mars_rover.broadcast_position).to eq([1,7])
    end
    
end