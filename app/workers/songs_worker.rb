class SongsWorker
  require 'csv'
  include Sidekiq::Worker


  def perform(songs_file)
    CSV.foreach(songs_file, headers: true) do |song|
      Customer.create(email: song[0], first_name: song[1], last_name: song[2])
    end
  end
end
