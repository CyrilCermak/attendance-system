require 'rails_helper'

RSpec.describe API::Endpoints::Workers do

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

  describe 'PATCH /api/workers/:id' do
    it 'changes worker state' do
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
  end


end

