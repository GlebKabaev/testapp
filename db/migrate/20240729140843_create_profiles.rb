class CreateProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :picture
      t.string :firstname
      t.string :lastname

      t.timestamps
    end
  end
end
