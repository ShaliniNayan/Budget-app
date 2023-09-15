require 'rails_helper'

RSpec.describe Bill, type: :model do
  let(:user) { User.create(name: 'user', email: 'example@mail.com', password: 'password') }
  let(:group) do
    Group.create(name: 'Group', icon: 'icon.png', description: 'description', created_at: Time.now,
                 updated_at: Time.now, user_id: user.id)
  end

  subject do
    described_class.new(name: 'name', amount: 20, author_id: user.id, group_id: group.id)
  end

  describe 'Validations' do
    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
  end
end
