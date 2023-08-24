require 'swagger_helper'

describe 'doctors' do
  path '/doctors' do
    get 'Retrieve a list of doctors' do
      tags 'Doctors'
      produces 'application/json'

      response '200', 'List of doctors' do
        run_test!
      end
    end
  end

  path '/doctors/{doctor_id}' do
    get 'Retrieve a single doctor' do
      tags 'Doctors'
      produces 'application/json'
      parameter name: :doctor_id, in: :path, type: :string

      response '200', 'Doctor details' do
        let(:doctor_id) { '123' }
        run_test!
      end
      response '404', 'Doctor not found' do
        let(:doctor_id) { 'invalid_id' }
        run_test!
      end
    end
  end
end
