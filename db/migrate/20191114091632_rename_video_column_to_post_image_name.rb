class RenameVideoColumnToPostImageName < ActiveRecord::Migration[5.2]
  def change
    rename_column :posts, :video, :post_image_name
  end
end
