class SneakersSlackPokemonWorker < SneakersWorker
  private
  def worker
    [SlackPokemonWorker]
  end
end
