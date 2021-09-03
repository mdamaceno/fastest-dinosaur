module Dinosaur
  class SpeedCalculation
    attr_reader :db_context

    GRAVITATIONAL_CONSTANT = 9.8**2

    def initialize(db_context: Dinosaur::DbContext.new)
      @db_context = db_context
    end

    def faster
      bipedal.map do |dino|
        dino[:velocity] = velocity(dino[:stride_length], dino[:leg_length])
        dino
      end.sort_by { |dino| dino[:velocity] }.reverse
    end

    private

    def velocity(stride_length, leg_length)
      ((stride_length / leg_length) - 1) * Math.sqrt((leg_length * GRAVITATIONAL_CONSTANT))
    end

    def bipedal
      @db_context.dinosaurs.select { |s| s[:stance] === 'bipedal' }
    end
  end
end
