require 'swagger_helper'

describe 'appointments' do
  path '/appointments' do
    post 'Create an appointment' do
      tags 'Appointments'
      consumes 'application/json'
      parameter name: :appointment, in: :body, schema: {
        type: :object,
        properties: {
          date: { type: :string, format: :date },
          city: { type: :string },
          name: { type: :string },
          doctor_id: { type: :string }
        },
        required: %w[date city name doctor_id]
      }

      response '201', 'Appointment created' do
        let(:appointment) { appointment_data }
        run_test!
      end

      response '422', 'Invalid request' do
        let(:appointment) { invalid_appointment_data }
        run_test!
      end
    end

    get 'Retrieve a list of appointments' do
      tags 'Appointments'
      produces 'application/json'

      response '200', 'List of appointments' do
        run_test!
      end
    end
  end
end

def appointment_data
  {
    date: '2023-08-24',
    city: 'New York',
    name: 'John Doe',
    doctor_id: '123'
  }
end

def invalid_appointment_data
  {
    date: '2023-08-24',
    name: 'John Doe'
  }
end
