class Type < ActiveRecord::Migration[5.0]
  def change
  	remove_column :contents, :type
  	add_column :contents, :style, :string
  end
end
