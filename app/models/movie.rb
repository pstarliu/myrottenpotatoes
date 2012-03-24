class Movie < ActiveRecord::Base

  class Movie::InvalidKeyError < StandardError ; end

  def self.api_key
    'cc4b67c52acb514bdf4931f7cedfd12b' # replace with YOUR Tmdb key
  end

  def self.find_in_tmdb(string)
    Tmdb.api_key = self.api_key
    begin
      TmdbMovie.find(:title => string)
    rescue ArgumentError => tmdb_error
      raise Movie::InvalidKeyError, tmdb_error.message
    rescue RuntimeError => tmdb_error
      #if tmdb_error.message =~ /status code '404'/
      if tmdb_error.message =~ /status/
        raise Movie::InvalidKeyError, tmdb_error.message
      else
        raise RuntimeError, tmdb_error.message
      end
    end
  end
end
