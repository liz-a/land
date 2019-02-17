require 'google/cloud/bigquery'

class Bigquery
  def self.instance
    @instance ||= Google::Cloud::Bigquery.new
  end

  def self.dataset
    @dataset ||= instance.dataset 'slack_pokemon'
  end
end
