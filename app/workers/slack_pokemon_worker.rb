require 'sneakers'
require 'redis'
require 'json'

$redis = Redis.new

class SlackPokemonWorker
  include Sneakers::Worker
  from_queue :pokemon_new,
              routing_key: ['pokemon.command'],
              retry_max_times: 0,
              timeout_job_after: 10,
              threads: 5,
              prefetch: 5


  def work(msg)
    message = JSON.parse(msg)
    # p message.inspect
    Cloud::PokemonCommandJob.new(message['payload']).perform
    ack!
  end
end
