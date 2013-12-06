class CreateMoments < ActiveRecord::Migration
  def change
    create_table :moments do |t|
      t.string :sentence
      t.datetime :day

      t.timestamps
    end
  end
end
