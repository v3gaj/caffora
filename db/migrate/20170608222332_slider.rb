class Slider < ActiveRecord::Migration[5.0]
  def change
  	add_column :sliders, :index, :integer, unique: true
  end
end
