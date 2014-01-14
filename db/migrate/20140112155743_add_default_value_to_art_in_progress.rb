class AddDefaultValueToArtInProgress < ActiveRecord::Migration
  def up
    change_column :users, :art_in_progress, :boolean, default: false
  end

  def down
  change_column :users, :art_in_progress, :boolean
  end
end
