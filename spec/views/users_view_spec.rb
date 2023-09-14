require 'rails_helper'

RSpec.describe 'Index page', type: :feature do
  before(:each) do
    @user = User.create(name: 'Felix', bio: DateTime.now.to_s, email: "#{DateTime.now}@gmail.com",
                        password: '123456',
                        password_confirmation: '123456')
  end

  describe 'index page' do
    it 'shows the right content' do
      visit new_user_session_path
      expect(page).to have_content('Login')
    end

    it 'should have the right content' do
      visit new_user_session_path
      expect(page).to have_content('Remember me')
    end
  end
end
