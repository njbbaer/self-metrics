# frozen_string_literal: true

module Authentication
  def log_in
    visit login_path
    fill_in 'Password', with: Rails.configuration.password
    click_button 'Authenticate'
    expect(page).to have_content 'You have authenticated successfully'
  end
end
