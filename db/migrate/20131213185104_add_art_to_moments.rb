class AddArtToMoments < ActiveRecord::Migration
  def change
    add_column :moments, :art_id, :integer
  end
end
