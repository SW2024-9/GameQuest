# db/migrate/20241127081906_create_products.rb
class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    # テーブルが存在しない場合のみ作成する
    unless table_exists?(:products)
      create_table :products do |t|
        t.string :name
        t.decimal :price
        t.text :description

        t.timestamps
      end
    end
  end
end
