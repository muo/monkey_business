class CreateBaskets < ActiveRecord::Migration[5.1]
  def change
    create_table :baskets do |t|
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end
