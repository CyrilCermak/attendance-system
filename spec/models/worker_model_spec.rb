require 'rails_helper'

describe :worker do

  before(:each) do
    @w = Worker.create!(last_name: "Cermak",
                        first_name: "Cyril",
                        mac: "123456789",
                        ip: "098876554432",
                        state: false,
                        host_name: "cyril@mbp",
                        email: "aaaa@gmail.com")
  end

  it 'has more than one time_table' do
    w = Worker.find_by(last_name: "Cermak")
    10.times { TimeTable.create!(arrival: Time.now, departure: Time.now, worker: w) }
    expect(w.time_tables.size).to eq 10
  end

  it 'has one position' do
    p = Position.create!(name: "IT")
    @w.position = p
    expect(@w.position.name).to eq "IT"
  end

  it 'has first_name,last_name,mac,ip,host_name' do
    expect(@w.first_name).not_to be nil
    expect(@w.last_name).not_to be nil
    expect(@w.mac).not_to be nil
    expect(@w.ip).not_to be nil
    expect(@w.state).to be false
    expect(@w.host_name).not_to be nil
  end

  it 'has valid atributes' do
    w = Worker.create(email: "aaaa@gmail.com")
    expect(w.save).to be false
    expect { w.save! }.to raise_error("Validation failed: First name can't be blank, Last name can't be blank, Email has already been taken")
    w.first_name = "Cyril"
    expect(w.save).to be false
    w.last_name = "Cermak"
    expect { w.save! }.to raise_error('Validation failed: Email has already been taken')
    w.email = "cyril@gmail.com"
    expect(w.save!).to be true
  end

  it 'has valid email' do
    @w.email = "@a.a.a.com"
    expect(@w.save).to be false
    @w.email = "a.a.a.@com"
    expect(@w.save).to be false
    @w.email = "aaaaaaaa"
    expect(@w.save).to be false
    @w.email = "a.a.a.@com@com"
    expect(@w.save).to be false
    expect {
      x = Worker.create!(last_name: "Cermak",
                         first_name: "Cyril",
                         mac: "123456789",
                         ip: "098876554432",
                         state: false,
                         host_name: "cyril@mbp",
                         email: "AAAA@gmail.com")
    }.to raise_error('Validation failed: Email has already been taken')
    expect {
      x = Worker.create!(last_name: "Cermak",
                         first_name: "Cyril",
                         mac: "123456789",
                         ip: "098876554432",
                         state: false,
                         host_name: "cyril@mbp",
                         email: "aaaa@GMAIL.com")
    }.to raise_error('Validation failed: Email has already been taken')
  end
end
