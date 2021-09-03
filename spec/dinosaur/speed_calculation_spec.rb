# frozen_string_literal: true

require 'spec_helper'
require_relative '../support/db_context_mock'

RSpec.describe Dinosaur::SpeedCalculation do
  let(:instance_db_context) { Dinosaur::DbContext.new }
  let(:instance_db_context_mock) { DbContextMock.new }

  before do
    allow(instance_db_context).to receive(:stances)
      .and_return(instance_db_context_mock.stances)
    allow(instance_db_context).to receive(:diets)
      .and_return(instance_db_context_mock.diets)
  end

  describe '#faster' do
    it 'returns a list of dinosaurs from the faster to the slower' do
      speed_calculation = described_class.new(db_context: instance_db_context)
      dinosaurs = speed_calculation.faster

      dinosaurs.each_with_index do |dino, index|
        expect(dino[:velocity]).to be > dinosaurs[index + 1][:velocity] if index + 1 < dinosaurs.size
      end
    end
  end
end
