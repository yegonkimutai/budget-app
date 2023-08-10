require 'rails_helper'

RSpec.describe 'Category Transactions', type: :feature do
  let!(:user) { User.create(name: 'test', email: 'test@test.com', password: 'password') }
  let!(:group) { Group.create(name: 'Test Category', icon: 'https://example.com/icon.png', user:) }

  before do
    visit new_user_session_path
    fill_in 'Email Address', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Login'

    group.items.create(name: 'Transaction 1', amount: 50)
    group.items.create(name: 'Transaction 2', amount: 75)

    visit group_items_path(group)
  end

  it 'navigates to the "Add a New Transaction" page when the link is clicked' do
    click_link('ADD TRANSACTION')
    expect(page).to have_current_path(new_group_item_path(group))
  end
end