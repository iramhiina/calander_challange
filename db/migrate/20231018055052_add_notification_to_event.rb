class AddNotificationToEvent < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :notification, :boolean
  end
end
