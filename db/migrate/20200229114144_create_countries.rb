class CreateCountries < ActiveRecord::Migration[6.0]
  def change
    enable_extension "cube"
    enable_extension "earthdistance"
    create_table :countries do |t|
      t.string :code
      t.string :name
      t.timestamps
    end
  end
end
