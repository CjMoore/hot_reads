require 'rails_helper'

RSpec.describe HotRead, type: :model do
  context 'validations' do
    it { should validate_presence_of(:url) }
  end

  context 'methods' do
    it "returns recently read links only" do
      hotread1 = HotRead.create(url: 'https://google.com', count: 3, updated_at: 3.days.ago)
      hotread2 = HotRead.create(url: 'https://reddit.com', count: 2)
      hotread3 = HotRead.create(url: 'https://gmail.com', count: 1)
      hotread4 = HotRead.create(url: 'https://four.com', count: 1)
      hotread5 = HotRead.create(url: 'https://five.com', count: 1)

      hot_reads = HotRead.get_recent

      expect(hot_reads.count).to eq(4)
      expect(hot_reads[0].url).to eq('https://reddit.com')
      expect(hot_reads[0].count).to eq(2)
    end
  end
end
