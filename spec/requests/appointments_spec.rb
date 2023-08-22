require 'swagger_helper'

RSpec.describe 'appointments', type: :request do
  path 'appointments' do
    get('list appointments') do
        tags 'All Appointments'
      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    post('create appointment') do
        tags 'Create Appointment'
      response(200, 'successful') do
        consumes 'application/json'
        parameter user_namename: :user, in: :body, schema: {
          type: :object,
          properties: {
            city: { type: :string },
            date: { type: :string, format: 'date-time' },
            user_id: { type: :integer },
            doctor_id: { type: :integer }
          },
          required: %w[city apppointment_time user_id doctor_id]
        }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/appointments/{id}' do
    parameter name: 'id', in: :path, type: :string, description: 'id'

    delete('delete appointment') do
        tags 'Delete Appointment'
      response(200, 'Appointment created successfully!') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end