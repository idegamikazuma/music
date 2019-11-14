class Add < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :users_id, :string
  end
end
