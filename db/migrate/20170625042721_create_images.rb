class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.references :collection, foreign_key: true
      t.attachment :content

      t.timestamps
    end
  end
end
