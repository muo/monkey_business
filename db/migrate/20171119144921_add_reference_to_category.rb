class AddReferenceToCategory < ActiveRecord::Migration[5.1]
  def change
    add_reference :items, :category, index: true
  end
end
