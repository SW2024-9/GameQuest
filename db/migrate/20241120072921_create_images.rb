class CreateImages < ActiveRecord::Migration[7.1]
  def change
    create_table :images do |t|
      t.string :title
      t.binary :file

      t.timestamps
    end
  end
end
