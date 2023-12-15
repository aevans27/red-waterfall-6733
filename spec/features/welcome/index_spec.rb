# As a user,
# When I visit "/"
# And I Select "Fire Nation" from the select field
# (Note: Use the existing select field)
# And I click "Search For Members"
# Then I should be on page "/search"
# Then I should see the total number of people who live in the Fire Nation. (should be close to 100)
# And I should see a list with the detailed information for the first 25 members of the Fire Nation.

# And for each of the members I should see:
# - The name of the member (and their photo, if they have one)
# - The list of allies or "None"
# - The list of enemies or "None"
# - Any affiliations that the member has

require 'rails_helper'

RSpec.describe 'Avatar characters viewing page' do 
  it 'get list of all members by nation' do
    nation_response = File.read('spec/fixtures/fire_nation_fixture.json')
    stub_request(:get, "https://last-airbender-api.fly.dev/api/v1/characters?affiliation=fire%20nation&perPage=25").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v2.7.12'
           }).
         to_return(status: 200, body: nation_response, headers: {})
    visit '/'
    select "Fire Nation", :from => :nation
    click_on "Search For Members"
    expect(current_path).to eq("/search")
    
    expect(page).to have_content("Name: Azula")
    expect(page).to have_content("Ozai Zuko")
    expect(page).to have_content("Enemies: Iroh Zuko Kuei Long Feng Mai Ty Lee Ursa")
    expect(page).to have_content("Affiliation: Azula's team (formerly) Dai Li (formerly) Fire Nation Fire Nation Royal Family Fire Warriors Royal Fire Academy for Girls (formerly)")
  end
end