require 'swagger_helper'
require 'rails_helper'

describe 'Users API' do
  path '/signup' do
    post 'Creates a user' do
      tags 'users'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          password: { type: :string },
          username: { type: :string },
          email: { type: :string }
        },
        required: %w[name email password]
      }
      response '201', 'user created' do
        let(:user) do
          {
            name: 'name',
            password: 'password',
            username: 'test',
            email: 'test@test.com'
          }
        end
        run_test!
      end
    end
  end
end
