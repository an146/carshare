class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name
      t.float :lat
      t.float :lon

      t.datetime :created_at
    end

    add_index :cities, :name, :unique => true
  end
end
