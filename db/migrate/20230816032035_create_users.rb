class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.text :photo
      t.text :bio
      t.integer :posts_counter, default: 0
      t.string :role
      

      t.timestamps
    end
  end
end
