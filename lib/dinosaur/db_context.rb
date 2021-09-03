module Dinosaur
  class DbContext
    COLLECTIONS_PATH = File.join(
      Application::ROOT_PATH,
      'data'
    )

    def dinosaurs
      dinosaur_diets = diets.select do |dino|
        stances.map { |s| s[:name] }.include? dino[:name]
      end
      dinosaur_diets.map do |dino|
        stance = stances.detect { |b| b[:name] == dino[:name] }
        dino.tap do |d|
          d[:stride_length] = stance[:stride_length]
          d[:stance] = stance[:stance]
        end
      end
    end

    def bipedal
      dinosaurs.select { |s| s[:stance] === 'bipedal' }
    end

    private

    def diets
      content = parse_csv(build_diets_file_path)
      content
        .to_a
        .map do |name, leg_length, diet|
          {
            name: name,
            leg_length: leg_length,
            diet: diet
          }
        end
        .drop(1)
        .map do |c|
          c[:leg_length] = c[:leg_length].to_f
          c
        end
    end

    def stances
      content = parse_csv(build_stances_file_path)
      content
        .to_a
        .map do |name, stride_length, stance|
          {
            name: name,
            stride_length: stride_length,
            stance: stance
          }
        end
        .drop(1)
        .map do |c|
          c[:stride_length] = c[:stride_length].to_f
          c
        end
    end

    def parse_csv(file_path)
      CSV.parse(File.read(file_path), headers: true, header_converters: :symbol, col_sep: ',', encoding: 'UTF-8')
    end

    def build_diets_file_path
      File.join(COLLECTIONS_PATH, 'dataset1.csv')
    end

    def build_stances_file_path
      File.join(COLLECTIONS_PATH, 'dataset2.csv')
    end
  end
end
