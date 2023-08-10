require 'rails_helper'

RSpec.feature 'Groups Index Page' do
  include Devise::Test::IntegrationHelpers

  let(:user) { User.create }
  let!(:group1) { Group.create(name: 'Group 1', created_at: 3.days.ago) }

  scenario 'displays a list of groups' do
    sign_in user
    visit groups_path

    expect(page).to have_content('Group')
  end

  scenario "displays 'Add New Group' button" do
    sign_in user
    visit groups_path

    expect(page).to have_link('Add New Group', href: new_group_path)
  end
end
