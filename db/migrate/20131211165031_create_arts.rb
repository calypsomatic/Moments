class CreateArts < ActiveRecord::Migration
  def change
    create_table :arts do |t|
      t.integer :user_id
      t.integer :moment_id

      t.timestamps
    end
  end
end
