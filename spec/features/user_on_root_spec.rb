require 'rails_helper'

describe 'When user loads root' do
  it 'they see a list of most read links from the last 24hrs' do
    VCR.use_cassette('services/links') do
        
      visit root_path

      expect(current_page).to have_content('https://facebook.com')
      expect(current_page).to have_content('https://reddit.com')
    end
  end
end
