Feature: User can add movie by seaching for it in The Movie Database (TMDb)

  As a movie fan
  So that I can add new movies without manual tedium
  I want to add movies by looking up their details in TMDb

Scenario: Try to add nonexistent movie (sad path)

  Given I am on the RottenPotatoes home page
  Then I should see "Search TMDb for a movie"
  When I fill in "Search Terms" with "Movie That Does Not Exist"
  And I press "Search TMDb"
  Then I should be on the RottenPotatoes home page
  And I should see "'Movie That Does Not Exist' was not found in TMDb."
