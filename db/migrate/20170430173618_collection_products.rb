class CollectionProducts < ActiveRecord::Migration
  def change
    create_table :collection_products do |t|
      t.integer :collection_id
      t.integer :product_id
    end
  end
end
