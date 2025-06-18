require 'rails_helper'

describe "Quest", type: :system do
  it 'allows user to create a new quest' do
    visit root_path
    fill_in 'Enter quest title', with: 'Finish Capybara Setup'
    click_button 'Create Quest'

    expect(page).to have_content('Finish Capybara Setup')
  end
end
