require 'spec_helper'

describe MoviesController do
  describe 'searching TMDb' do
    it 'should call the model method that performs TMDb search' do
      fake_results = [mock('Movie'), mock('Movie')]
      Movie.should_receive(:find_in_tmdb).with('hardware').
        and_return(fake_results)
      post :search_tmdb, {:search_terms => 'hardware'}
    end
    it 'should select the Search Results template for rendering'
    it 'should make the TMDb search results available to that template'
  end
end
