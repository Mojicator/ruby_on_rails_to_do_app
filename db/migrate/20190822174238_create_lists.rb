class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.string :title
      t.text :description
      t.date :created_date
      t.date :end_date

      t.timestamps
    end
  end
end
