require 'rails_helper'

describe "User can create a room" do
  context "when user visits the landing page" do
    before do
      user_goes_to_home_page
      Room.where(name: 'DEMO ROOM').destroy_all
    end

    it "allows user to create a new room", js: true do
      user_creates_room("DEMO ROOM")
      user_should_see_a_new_room
    end

    it "does not allow room creation without a name", js: true do
      user_creates_room("")
      user_should_see_an_error_message
    end
  end

  def user_goes_to_home_page
    visit rooms_path
  end

  def user_creates_room(name)
    within '#actions' do
      fill_in 'room_name', with: name
    end
    click_button 'Create Room'
  end

  def user_should_see_a_new_room
    expect(page).to have_selector('.room', text: 'DEMO ROOM', count: 1)
  end

  def user_should_see_an_error_message
    expect(page).to have_content("Name can't be blank")
  end
end
