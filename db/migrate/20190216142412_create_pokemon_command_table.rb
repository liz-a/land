require 'google/cloud/bigquery'

class CreatePokemonCommandTable < ActiveRecord::Migration[5.2]
  def up
    bigquery = Google::Cloud::Bigquery.new
    dataset = bigquery.create_dataset 'slack_pokemon', location: 'europe-west2'

    dataset.create_table :pokemon_command do |t|
      t.name = 'pokemon_command'
      t.description = 'Users slash commands.'
      t.schema do |s|
        s.string 'command', mode: :required
        s.timestamp 'created_at', mode: :required
        s.string 'slack_name', mode: :required
        s.string 'slack_id', mode: :required
      end
    end
  end

  def down
    bigquery = Google::Cloud::Bigquery.new
    dataset = bigquery.dataset 'pokemon_command'
    dataset.delete
  end
end
