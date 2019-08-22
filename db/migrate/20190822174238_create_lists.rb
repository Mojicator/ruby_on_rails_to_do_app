class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.string :title
      t.text :description
      t.datetime :created_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
