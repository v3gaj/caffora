class CreateSliders < ActiveRecord::Migration[5.0]
  def change
    create_table :sliders do |t|
      t.string :title
      t.string :subtitle
      t.string :url
      t.attachment :image

      t.timestamps
    end
  end
end
