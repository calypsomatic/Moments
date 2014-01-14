class RemoveArtInProgress < ActiveRecord::Migration
  def up
    remove_column :users, :art_in_progress
    add_column :arts, :in_progress, :boolean, default: true
  end

  def down
    add_column :users, :art_in_progress, :boolean, default: false
    remove_column :arts, :in_progress
  end
end
