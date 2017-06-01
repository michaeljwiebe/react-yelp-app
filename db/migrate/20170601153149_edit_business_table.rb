class EditBusinessTable < ActiveRecord::Migration[5.1]
  def change
    change_table :Businesses do |t|
      t.integer :user_id
    end
  end
end
