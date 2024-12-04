class AddFileToProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :file, :binary
  end
end
