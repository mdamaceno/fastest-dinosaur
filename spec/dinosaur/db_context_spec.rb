# frozen_string_literal: true

require 'spec_helper'
require_relative '../support/db_context_mock'

RSpec.describe Dinosaur::DbContext do
  let(:instance_db_context) { described_class.new }
  let(:instance_db_context_mock) { DbContextMock.new }

  before do
    allow(instance_db_context).to receive(:stances)
      .and_return(instance_db_context_mock.stances)
    allow(instance_db_context).to receive(:diets)
      .and_return(instance_db_context_mock.diets)
  end

  describe '#dinosaurs' do
    it 'returns a list of dinosaurs' do
      instance_db_context.dinosaurs.each do |dino|
        expect(dino).not_to be_nil
        expect(dino).to have_key(:leg_length)
        expect(dino).to have_key(:stride_length)
        expect(dino).to have_key(:diet)
        expect(dino).to have_key(:stance)
      end
    end
  end

  describe '#bipedal' do
    it 'returns a list of bipedal dinosaurs' do
      instance_db_context.bipedal.each do |dino|
        expect(dino[:stance]).to eq 'bipedal'
      end
    end
  end
end
