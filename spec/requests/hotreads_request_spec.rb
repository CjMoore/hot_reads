require 'rails_helper'

describe 'post hot read' do
  it 'returns top ten hotreads' do
    hotread1 = HotRead.create(url: 'https://google.com', count: 3)
    hotread2 = HotRead.create(url: 'https://reddit.com', count: 2)
    hotread3 = HotRead.create(url: 'https://gmail.com', count: 1)
    hotread4 = HotRead.create(url: 'https://four.com', count: 1)
    hotread5 = HotRead.create(url: 'https://five.com', count: 1)
    hotread6 = HotRead.create(url: 'https://six.com', count: 1)
    hotread7 = HotRead.create(url: 'https://seven.com', count: 1)
    hotread8 = HotRead.create(url: 'https://eight.com', count: 1)
    hotread9 = HotRead.create(url: 'https://nine.com', count: 1)

    hotread_data = {url: 'https://booyah.com'}

    post '/api/v1/links', hotread_data

    expect(response).to be_success
    returned_hot_reads = JSON.parse(response.body)

    expect(returned_hot_reads.count).to eq(10)
    expect(returned_hot_reads[0]['url']).to eq('https://google.com')
  end
  it 'increases count for hot read already in system' do
    hotread1 = HotRead.create(url: 'https://google.com', count: 3)
    hotread2 = HotRead.create(url: 'https://reddit.com', count: 2)
    hotread3 = HotRead.create(url: 'https://gmail.com', count: 1)
    hotread4 = HotRead.create(url: 'https://four.com', count: 1)
    hotread5 = HotRead.create(url: 'https://five.com', count: 1)
    hotread6 = HotRead.create(url: 'https://six.com', count: 1)
    hotread7 = HotRead.create(url: 'https://seven.com', count: 1)
    hotread8 = HotRead.create(url: 'https://eight.com', count: 1)
    hotread9 = HotRead.create(url: 'https://nine.com', count: 1)
    hotread10 = HotRead.create(url: 'https://booyah.com', count: 1)

    hotread_data = {url: 'https://google.com'}

    post '/api/v1/links', hotread_data

    expect(response).to be_success
    returned_hot_reads = JSON.parse(response.body)

    expect(returned_hot_reads.count).to eq(10)
    expect(returned_hot_reads[0]['url']).to eq('https://google.com')
    expect(returned_hot_reads[0]['count']).to eq(4)
  end
end

describe 'get hot_reads' do
  it "returns array of top-ten hot_reads" do
    hotread1 = HotRead.create(url: 'https://google.com', count: 3)
    hotread2 = HotRead.create(url: 'https://reddit.com', count: 2)
    hotread3 = HotRead.create(url: 'https://gmail.com', count: 1)
    hotread4 = HotRead.create(url: 'https://four.com', count: 1)
    hotread5 = HotRead.create(url: 'https://five.com', count: 1)
    hotread6 = HotRead.create(url: 'https://six.com', count: 1)
    hotread7 = HotRead.create(url: 'https://seven.com', count: 1)
    hotread8 = HotRead.create(url: 'https://eight.com', count: 1)
    hotread9 = HotRead.create(url: 'https://nine.com', count: 1)
    hotread10 = HotRead.create(url: 'https://booyah.com', count: 1)

    get '/api/v1/links'

    expect(response).to be_success

    hot_reads = JSON.parse(response.body)

    expect(hot_reads.count).to eq(10)
  end
end
