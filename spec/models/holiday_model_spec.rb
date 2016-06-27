require 'rails_helper'

RSpec.describe Holiday, type: :model do

  before(:each) do
    @w = Worker.create!(last_name: "Cermak",
                        first_name: "Cyril",
                        mac: "1234567",
                        ip: "098876554432",
                        state: false,
                        host_name: "cyril@mbp",
                        email: "aaaa@gmail.com",
                        state: false, password: "123456789A")
    @h = Holiday.create(start: Time.now, end: Time.now, name: "Dovolenka")
  end

  it 'has valid atributes' do
    h = Holiday.create(start: Time.now, end: Time.now, worker: @w)
    expect {h.save!}.to raise_error "Validation failed: Name can't be blank"
    h = Holiday.create(end: Time.now, worker: @w,name: "Dovca")
    expect {h.save!}.to raise_error "Validation failed: Start can't be blank"
    h = Holiday.create(start: Time.now, worker: @w,name: "Dovca")
    expect {h.save!}.to raise_error "Validation failed: End can't be blank"
    h = Holiday.create(start: Time.now,end: Time.now,name: "Dovca")
    expect {h.save!}.to raise_error "Validation failed: Worker can't be blank"
  end

end
