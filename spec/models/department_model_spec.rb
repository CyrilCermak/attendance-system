require 'rails_helper'

RSpec.describe Department, type: :model do
  before(:each) do
    @d = Department.create(name: "IT",floor: 10)
  end

  it 'must have a name' do
    expect { Department.create!(floor:20)}.to raise_error("Validation failed: Name can't be blank")
  end

  it 'has a name' do
    expect(@d.name).equal? "IT"
  end

  it 'has a floor' do
    expect { Department.create!(floor: 100)}.equal? true
    expect(@d.floor).not_to be nil
  end

  it 'has positions' do
    p1 = Position.create!(name: "Programmer", wage:10000)
    p2 = Position.create!(name: "CEO", wage:10000)
    @d.positions << p1 << p2
    expect(@d.positions.size).to be 2
  end

end