require 'rails_helper'
RSpec.describe 'groups/index', type: :feature do
  before :each do
    @user = User.create(name: 'Felix Ouma', email: "#{DateTime.now.to_i}@gmail.com", password: 'password', bio: 'bio',
                        password_confirmation: 'password')
    @group = @user.groups.create(name: 'group 1', icon: 'http://localhost:3000/icon.png', description: 'description',
                                 user_id: @user.id)

    visit(new_user_session_path)
    fill_in 'user[email]', with: @user.email
    fill_in 'user[password]', with: @user.password
    click_button 'Log in'
  end

  describe "Visit groups' new page" do
    it 'should have group header' do
      visit(new_group_path)
      expect(page).to have_text('Icon')
    end

    it 'should have save button' do
      visit(new_group_path)
      expect(page).to have_selector(:link_or_button, 'Save Category', exact: true)
    end

    it 'should have new page link' do
      visit(new_group_path)
      expect(page).to have_selector(:link_or_button, 'Back to groups', exact: true)
    end

    it 'redirect to groups page' do
      visit(new_group_path)
      click_link('Back to groups', exact: true)
      expect(page).to have_current_path(groups_path)
    end

    it 'redirect to add new group' do
      visit(new_group_path)
      click_button('Save Category', exact: true)
      expect(page).to have_current_path(groups_path)
    end
  end
end
