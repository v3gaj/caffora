class Posts < ActiveRecord::Migration[5.0]
  def change
  	rename_column :posts, :release, :release_date
  end
end
