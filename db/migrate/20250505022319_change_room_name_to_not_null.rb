class ChangeRoomNameToNotNull < ActiveRecord::Migration[8.0]
  def change
    change_column_null :rooms, :name, false
  end
end
