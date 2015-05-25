class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :time_zone

      t.timestamps null: false
    end
  end
end
