desc 'Start sneakers worker'

namespace :sneakers_worker do

  task start: :environment do
    ::Rails.application.eager_load!
    SneakersWorker.new.start
  end
end
