require 'rails_helper'

describe "Room management: " do
  context "when user visits the landing page" do
    it "allows user to create a new room", js: true do
      user_goes_to_home_page
      user_enters_room_name
      user_clicks_create_room
      user_should_see_a_new_room
    end
  end

  def user_goes_to_home_page
    visit rooms_path
  end

  def user_enters_room_name
    within '#actions' do
      fill_in 'room_name', with: "DEMO ROOM"
    end
  end

  def user_clicks_create_room
    click_button 'Create Room'
  end

  def user_should_see_a_new_room
    expect(page).to have_content 'DEMO ROOM'
  end
end
