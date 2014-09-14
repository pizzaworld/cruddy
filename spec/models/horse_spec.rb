require 'rails_helper'

describe Horse do

  let(:horse) { Horse.new }

  it 'requires a name' do
    horse.valid?
    expect(horse.errors[:name].size).to eq 1
  end

end
