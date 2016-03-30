class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.integer :profile_id
      t.datetime :birthday
      t.string :gender
      t.string :email
      t.text :description
      t.string :location
      t.integer :user_id

      t.timestamps null: false
    end
    add_index :profiles , :user_id

  end
end
