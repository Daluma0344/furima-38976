class CreateShoppingCharges < ActiveRecord::Migration[6.0]
  def change
    create_table :shopping_charges do |t|

      t.timestamps
    end
  end
end
