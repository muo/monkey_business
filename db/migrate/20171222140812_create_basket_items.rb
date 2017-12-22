class CreateBasketItems < ActiveRecord::Migration[5.1]
  def change
    create_table :basket_items do |t|
      t.references :basket, foreign_key: true, null: false
      t.references :item, foreign_key: true, null: false
      t.timestamps
    end
  end
end
