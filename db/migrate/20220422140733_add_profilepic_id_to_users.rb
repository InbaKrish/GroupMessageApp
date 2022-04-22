class AddProfilepicIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :pic_id, :integer, default: (1..5).to_a.sample
  end
end
