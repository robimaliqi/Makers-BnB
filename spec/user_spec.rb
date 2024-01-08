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

    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('Password123')

      User.create(email: 'example@example.com', password: 'Password123')
    end
  end

  describe '.authenticate' do
    it 'returns a user given a correct username and password, if one exists' do
      user = User.create(email: 'example@example.com', password: 'Password123')
      authenticated_user = User.authenticate(email: 'example@example.com', password: 'Password123')

      expect(authenticated_user.id).to eq user.id
    end

    it 'returns nil given an incorrect emaill address' do
      user = user = User.create(email: 'example@example.com', password: 'Password123')

      expect(User.authenticate(email: 'wrongemail@example.com', password: 'Password123')).to be_nil
    end

    it 'returns nil given an incorrect password' do
      user = user = User.create(email: 'example@example.com', password: 'Password123')

      expect(User.authenticate(email: 'example@example.com', password: 'wrongpassword')).to be_nil
    end
  end
end