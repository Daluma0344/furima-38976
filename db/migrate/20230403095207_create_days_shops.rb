class CreateDaysShops < ActiveRecord::Migration[6.0]
  def change
    create_table :days_shops do |t|

      t.timestamps
    end
  end
end
