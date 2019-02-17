module Cloud
  class PokemonCommandJob
    attr_reader :data
    private :data

    def initialize(data)
      @data = data
    end

    def self.perform(data)
      new(data).perform
    end

    def perform
      Bigquery::PokemonCommand.save(command_data)
    end

    private

    def command_data
      serialiser.adapted_command_data
    end

    def serialiser
      @serialiser ||= Serialiser.new(data)
    end
  end
end
