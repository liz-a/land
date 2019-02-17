desc 'Start sneakers slack pokemon worker'

namespace :sneakers_slack_pokemon_worker do

  task start: :environment do
    ::Rails.application.eager_load!
    SneakersSlackPokemonWorker.new.start
  end

end
