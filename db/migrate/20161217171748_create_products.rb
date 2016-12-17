class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.text :name
      t.text :brand
      t.text :description
      t.integer :collection_id
    end
  end
end
