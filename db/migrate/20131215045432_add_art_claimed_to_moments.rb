class AddArtClaimedToMoments < ActiveRecord::Migration
  def change
    add_column :moments, :art_claimed, :boolean, default: false
  end
end
