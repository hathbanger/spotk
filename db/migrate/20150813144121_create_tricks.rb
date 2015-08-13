class CreateTricks < ActiveRecord::Migration
  def change
    create_table :tricks do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
