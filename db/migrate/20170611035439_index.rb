class Index < ActiveRecord::Migration[5.0]
  def change
  	add_reference :contents, :post, index: true
  end
end
