require 'rails_helper'

describe NationService do
  context "class methods" do
    context "#get_nation_members" do
      it "returns nation member data" do
        nation_response = File.read('spec/fixtures/fire_nation_fixture.json')
        stub_request(:get, "https://last-airbender-api.fly.dev/api/v1/characters?affiliation=Fire%20Nation&perPage=25").
        with(
          headers: {
         'Accept'=>'*/*',
         'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
         'User-Agent'=>'Faraday v2.7.12'
          }).
        to_return(status: 200, body: nation_response, headers: {})
         search = NationService.new.get_nation_members("Fire+Nation")
        expect(search).to be_a Array
        nation_data = search.first
        expect(nation_data).to have_key :name
        expect(nation_data[:name]).to be_a(String)

        expect(nation_data).to have_key :photoUrl
        expect(nation_data[:photoUrl]).to be_a(String)
      end
    end
  end
end