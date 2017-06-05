require 'rails_helper'

RSpec.describe HotRead, type: :model do
  context 'validations' do
    it { should validate_presence_of(:url) }
  end
end
