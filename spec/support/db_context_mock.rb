# frozen_string_literal: true

class DbContextMock
  def dinosaurs
    [
      {
        name: 'Hadrosaurus',
        leg_length: 1.2,
        diet: 'herbivore',
        stride_length: 1.4,
        stance: 'bipedal'
      },
      {
        name: 'Struthiomimus',
        leg_length: 0.92,
        diet: 'omnivore',
        stride_length: 1.34,
        stance: 'bipedal'
      },
      {
        name: 'Velociraptor',
        leg_length: 1.0,
        diet: 'carnivore',
        stride_length: 2.72,
        stance: 'bipedal'
      },
      {
        name: 'Euoplocephalus',
        leg_length: 1.6,
        diet: 'herbivore',
        stride_length: 1.87,
        stance: 'quadrupedal'
      },
      {
        name: 'Stegosaurus',
        leg_length: 1.4,
        diet: 'herbivore',
        stride_length: 1.9,
        stance: 'quadrupedal'
      },
      {
        name: 'Tyrannosaurus Rex',
        leg_length: 2.5,
        diet: 'carnivore',
        stride_length: 5.76,
        stance: 'bipedal'
      }
    ]
  end

  def bipedal
    dinosaurs.select { |s| s[:stance] === 'bipedal' }
  end
end
