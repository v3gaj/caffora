class CreateContents < ActiveRecord::Migration[5.0]
  def change
    create_table :contents do |t|
      t.integer :index
      t.string :type
      t.string :title
      t.string :body
      t.attachment :image
      t.string :video

      t.timestamps
    end
  end
end
