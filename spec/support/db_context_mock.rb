# frozen_string_literal: true

class DbContextMock
  def diets
    [
      {
        name: 'Hadrosaurus',
        leg_length: 1.2,
        diet: 'herbivore'
      },
      {
        name: 'Struthiomimus',
        leg_length: 0.92,
        diet: 'omnivore'
      },
      {
        name: 'Velociraptor',
        leg_length: 1.0,
        diet: 'carnivore'
      },
      {
        name: 'Triceratops',
        leg_length: 0.87,
        diet: 'herbivore'
      },
      {
        name: 'Euoplocephalus',
        leg_length: 1.6,
        diet: 'herbivore'
      },
      {
        name: 'Stegosaurus',
        leg_length: 1.4,
        diet: 'herbivore'
      },
      {
        name: 'Tyrannosaurus Rex',
        leg_length: 2.5,
        diet: 'carnivore'
      }
    ]
  end

  def stances
    [
      {
        name: 'Euoplocephalus',
        stride_length: 1.87,
        stance: 'quadrupedal'
      },
      {
        name: 'Stegosaurus',
        stride_length: 1.9,
        stance: 'quadrupedal'
      },
      {
        name: 'Tyrannosaurus Rex',
        stride_length: 5.76,
        stance: 'bipedal'
      },
      {
        name: 'Hadrosaurus',
        stride_length: 1.4,
        stance: 'bipedal'
      },
      {
        name: 'Deinonychus',
        stride_length: 1.21,
        stance: 'bipedal'
      },
      {
        name: 'Struthiomimus',
        stride_length: 1.34,
        stance: 'bipedal'
      },
      {
        name: 'Velociraptor',
        stride_length: 2.72,
        stance: 'bipedal'
      }
    ]
  end
end
