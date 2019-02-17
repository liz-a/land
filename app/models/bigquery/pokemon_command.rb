class Bigquery
  class PokemonCommand
    include Structural::Model

    field :command, type: String
    field :created_at, type: String
    field :slack_name, type: String
    field :slack_id, type: String

    def self.table
      @table ||= Bigquery.dataset.table('pokemon_command')
    end

    def self.save(command)
      new(command).save
    end

    def save
      self.class.table.insert(data)
    end
  end
end
