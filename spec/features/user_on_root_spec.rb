require 'rails_helper'

describe 'When user loads root' do
  it 'they see a list of most read links from the last 24hrs' do
    hot_read1 = HotRead.create(url: 'https://reddit.com')
    hot_read2 = HotRead.create(url: 'https://facebook.com')
    hot_read2 = HotRead.create(url: 'https://google.com')

    visit root_path

    expect(page).to have_content('https://reddit.com')
    expect(page).to have_content('https://facebook.com')
    expect(page).to have_content('https://google.com')
  end
end
