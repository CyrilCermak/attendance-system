require 'rails_helper'

RSpec.describe Position, type: :model do

  before(:each) do
    @p = Position.create(name: "Programmer", wage: 100000)
    @w = Worker.create!(last_name: "Cermak",
                        first_name: "Cyril",
                        mac: "123456789",
                        ip: "098876554432",
                        state: false,
                        host_name: "cyril@mbp",
                        email: "aaaa@gmail.com",
                        password: "123456789A")
    @w1 = Worker.create!(last_name: "Cermak",
                        first_name: "Cyril",
                        mac: "1234567890",
                        ip: "098876554432",
                        state: false,
                        host_name: "cyril@mbp",
                        email: "aaaaa@gmail.com",
                         password: "123456789A")
    @w2 = Worker.create!(last_name: "Cermak",
                        first_name: "Cyril",
                        mac: "12345678901",
                        ip: "098876554432",
                        state: false,
                        host_name: "cyril@mbp",
                        email: "aaaaaa@gmail.com",
                         password: "123456789A")
  end

  it 'must have a name' do
    expect {Position.create!(wage:1000)}.to raise_error("Validation failed: Name can't be blank")
    expect {Position.create!(name: "HR",wage:1000)}.equal? true
  end

  it 'has a name' do
    expect(@p.name).not_to eq nil
    expect(@p.name).to eq "Programmer"
  end

  it 'has a wage' do
    expect(@p.wage).not_to eq nil
    expect(@p.wage).to eq 100000
    expect(@p.wage.class).to be Fixnum
  end

  it 'worker has a position' do
    @w.position = @p
    expect(@w.save!).to be true
  end

  it 'must have a lot of workers' do
    @p.workers << @w << @w1 << @w2
    expect(@p.workers).not_to be []
    expect(@p.workers.size).to be 3
    expect(@p.workers.first.id).to be @w.id
  end

  it 'has belongs to department' do
    d = Department.create(name: "IT")
    @p.department = d
    expect(@p.save!).to be true
    expect(@p.department.name).equal? "IT"
  end

end