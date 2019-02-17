require 'sneakers'
require 'sneakers/runner'
require 'logger'

class SneakersWorker

  def start
    Sneakers.logger.level = Logger::INFO

    begin
      Sneakers::Runner.new(worker).run
    rescue StandardError => exception
      p exception
    end
  end

  private

  def worker
    [Worker]
  end
end
