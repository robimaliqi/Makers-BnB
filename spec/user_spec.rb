require 'database_helpers'
require 'user'

describe User do
  describe '.create' do
    it 'creates a new user' do
      user = User.create(email: 'example@example.com', password: 'Password123')

      persisted_data = persisted_data(id: user.id, table: 'users')
      
      expect(user).to be_a User
      expect(user.id).to eq persisted_data.first['id']
      expect(user.email).to eq 'example@example.com'
    end
  end
end