require 'spec_helper'

feature 'user authentication' do 
  background do
    # add setup details
  end

  scenario 'user signing up' do
    visit root_path

    expect{
    click_link 'Sign up'
    fill_in 'Email', with: 'newuser@example.com'
    find('#password').fill_in 'Password', with: 'Secret123'
    find('#password_confirmation').fill_in 'Password confirmation', with: 'Secret123'
    click_button 'Sign up'}.to change(User, :count).by(1)

    # rewrite exectation to expect current_user path - user is redirected to his/her profile after signing up
    expect(current_path).to eq users_path
    expect(page).to have_content 'Successfully signed up'
    # pending "waiting for implementation"
    # write the example!
  end
end
