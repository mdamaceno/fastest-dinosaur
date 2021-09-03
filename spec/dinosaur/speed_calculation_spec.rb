# frozen_string_literal: true

require 'spec_helper'
require_relative '../support/db_context_mock'

RSpec.describe Dinosaur::SpeedCalculation do
  describe '#faster' do
    it 'returns a list of dinosaurs from the faster to the slower' do
      speed_calculation = described_class.new(db_context: DbContextMock.new)
      dinosaurs = speed_calculation.faster

      dinosaurs.each_with_index do |dino, index|
        expect(dino[:velocity]).to be > dinosaurs[index + 1][:velocity] if index + 1 < dinosaurs.size
      end
    end
  end
end
