class CreateHosts < ActiveRecord::Migration[5.2]
  def change
    create_table :hosts do |t|
      t.string :name, null: false, unique: true
      t.string :url, null: false, unique: true

      t.timestamps
    end
  end
end
