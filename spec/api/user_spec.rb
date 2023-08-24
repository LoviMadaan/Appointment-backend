require 'swagger_helper'

describe 'users' do
  path '/signup' do
    post 'create a user' do
      tags 'Users'
      consumes 'appication/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          email: { type: :string },
          password: { type: :string },
          password_confirmation: { type: :string }
        },
        required: %w[name email password password_confirmation]
      }
      response '201', 'user created' do
        let(:user) do
          { name: 'test', email: 'test@test.com', password: 'test@123', password_confirmation: 'test@123' }
        end
        run_test!
      end
      response '422', 'Invalid request' do
        let(:user) { { name: 'test' } }
        run_test!
      end
    end
  end
  path '/login' do
    post 'login a user' do
      tags 'Users'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string },
          password: { type: :string }
        },
        required: %w[email password]
      }
      response '200', 'user loggedin' do
        let(:user) { { email: 'test@test.com', password: 'test@123' } }
        run_test!
      end
      response '401', 'Unauthorized' do
        let(:user) { { email: 'test@test.com' } }
        run_test!
      end
    end
  end
end
