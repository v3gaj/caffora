class CreateGalleries < ActiveRecord::Migration[5.0]
  def change
    create_table :collections do |t|
      t.references :post, foreign_key: true
      t.string :title
      t.string :subtitle
      t.attachment :cover

      t.timestamps
    end
  end
end
