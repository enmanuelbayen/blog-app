class AddRefUsersToPosts < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :auhtor, null: false, foreign_key: { to_table: :users }
  end
end
