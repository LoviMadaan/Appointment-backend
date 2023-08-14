class CreateDoctors < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors do |t|
      t.string :name
      t.text :bio
      t.string :image
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
