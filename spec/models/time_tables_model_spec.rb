require 'rails_helper'

RSpec.describe TimeTable, type: :model do

  before(:each) do
    @worker = Worker.create!(last_name: "Cermak",
                             first_name: "Cyril",
                             mac: "123456789",
                             ip: "098876554432",
                             state: false,
                             host_name: "cyril@mbp",
                             email: "aaaa@gmail.com",
                             password: "123456789A")

    @time_table = TimeTable.create!(start: Time.now,
                                    end: Time.now,
                                    worker: @worker)
  end

  it 'has one worker' do
    expect(@time_table.worker).equal? @worker
  end

  it 'must have start' do
    t = TimeTable.create(end: Time.now)
    expect { t.save! }.to raise_error("Validation failed: Start can't be blank, Worker can't be blank")
  end

  it 'must have worker' do
    t = TimeTable.create(end: Time.now, start: Time.now)
    expect { t.save! }.to raise_error("Validation failed: Worker can't be blank")
  end

end
