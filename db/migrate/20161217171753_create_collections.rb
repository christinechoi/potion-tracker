class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.text :name
      t.integer :user_id
    end
  end
end
