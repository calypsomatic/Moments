class AddGrabbyToArts < ActiveRecord::Migration
  def change
    add_column :arts, :grabby, :string
  end
end
