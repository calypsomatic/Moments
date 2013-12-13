class AddArtInProgressToUsers < ActiveRecord::Migration
  def change
    add_column :users, :art_in_progress, :boolean
  end
end
