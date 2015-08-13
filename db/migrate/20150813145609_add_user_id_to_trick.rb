class AddUserIdToTrick < ActiveRecord::Migration
  def change
  	add_column :tricks, :user_id, :integer
  end
end
