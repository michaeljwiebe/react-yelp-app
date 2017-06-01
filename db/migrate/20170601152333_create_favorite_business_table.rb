class CreateFavoriteBusinessTable < ActiveRecord::Migration[5.1]
  def change
    create_table :Businesses do |t|
      t.string :business_name
      t.string :business_location
      t.string :business_phone
    end
  end
end
