require 'rails_helper'

RSpec.describe Trip, type: :model do
  context 'before save' do
    it 'cannot have nil code' do
      expect(Trip.create.code).not_to be_nil
    end
    it 'should have uniq code' do
      code = Trip.create.code
      tripe = Trip.create(code: code)
      expect(code).not_to eq(tripe.code)
    end
    it 'cannot have nil state' do
      expect(Trip.create.state).not_to be_nil
    end
    it 'should have default state as created' do
      expect(Trip.create.state).to eq('created')
    end
  end
end
