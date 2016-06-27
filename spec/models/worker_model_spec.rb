require 'rails_helper'

describe :worker do

  before(:each) do
    @w = Worker.create!(last_name: "Cermak",
                        first_name: "Cyril",
                        mac: "1234567",
                        ip: "098876554432",
                        state: false,
                        host_name: "cyril@mbp",
                        email: "aaaa@gmail.com",
                        state: false,
                        password: "123456789A")
  end

  it 'has more than one time_table' do
    w = Worker.find_by(last_name: "Cermak")
    10.times { TimeTable.create!(start: Time.now, end: Time.now, worker: w) }
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
    expect { w.save! }.to raise_error("Validation failed: Email has already been taken, Password can't be blank, First name can't be blank, Last name can't be blank")
    w.first_name = "Cyril"
    expect(w.save).to be false
    w.last_name = "Cermak"
    expect { w.save! }.to raise_error("Validation failed: Email has already been taken, Password can't be blank")
    w.password = "123456789a"
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
                         mac: "1234567890",
                         ip: "098876554432",
                         state: false,
                         host_name: "cyril@mbp",
                         email: "AAAA@gmail.com", password: "123456789A")
    }.to raise_error('Validation failed: Email has already been taken')
    expect {
      x = Worker.create!(last_name: "Cermak",
                         first_name: "Cyril",
                         mac: "1234567890",
                         ip: "098876554432",
                         state: false,
                         host_name: "cyril@mbp",
                         email: "aaaa@GMAIL.com", password: "123456789A")
    }.to raise_error('Validation failed: Email has already been taken')
  end

  it 'has a unique mac address' do
    x = Worker.create(last_name: "Cermak",
                      first_name: "Cyril",
                      mac: "1234567",
                      ip: "098876554432",
                      state: false,
                      host_name: "cyril@mbp",
                      email: "aaaaaa@GMAIL.com", password: "123456789A")
    expect { x.save! }.to raise_error("Validation failed: Mac has already been taken")
  end

  it 'has a lot of holidays' do
    h = Holiday.create!(start: Time.now, end: Time.now, name: "Dovca", worker: @w)
    expect(@w.holidays.size).to be 1
    h = Holiday.create!(start: Time.now + 10, end: Time.now + 1000, name: "Dovca", worker: @w)
    expect(h.worker).not_to be nil
    expect(@w.holidays.size).to be 2
    Holiday.create!(start: Time.now + 1000, end: Time.now + 100000, name: "Dovca",worker: @w)
    expect(@w.holidays.size).to be 3
    Holiday.create!(start: Time.now + 100000, end: Time.now + 100000, name: "Dovca", worker: @w)
    expect(@w.holidays.size).to be 4
    expect(h.worker).not_to be nil
  end

end

RSpec.describe :worker, :type => :request do
  before(:each) do
    @w = Worker.create!(last_name: "Cermak",
                        first_name: "Cyril",
                        mac: "1234567",
                        ip: "098876554432",
                        state: false,
                        host_name: "cyril@mbp",
                        email: "aaaa@gmail.com",
                        state: false, password: "123456789A")

  end

  it 'changes state' do
    w = Worker.find_by_first_name("Cyril")
    expect(w.state).to be false
    expect(w.time_tables.size).to be 0
    patch '/api/workers', mac: "1234567", state: true
    w = Worker.find_by_first_name("Cyril")
    expect(w.state).to be true
    expect(w.time_tables.size).to be 1
    expect(w.time_tables.first.start).not_to be nil
    expect(w.time_tables.first.end).to be nil
    patch '/api/workers', mac: "1234567", state: false
    w = Worker.find_by_first_name("Cyril")
    expect(w.state).to be false
    expect(w.time_tables.size).to be 1
    expect(w.time_tables.first.start).not_to be nil
    expect(w.time_tables.first.end).not_to be nil
  end

  it 'recognize admin user' do
    w = Worker.create!(last_name: "Cermak",
                       first_name: "Cyril",
                       mac: "123456",
                       ip: "098876554432",
                       state: false,
                       host_name: "cyril@mbp",
                       email: "aaaaaaa@gmail.com",
                       state: false,
                       password: "123456789A",
                       admin: true)
  end

end

