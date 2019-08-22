class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :definition
      t.boolean :state
      t.date :added_date
      t.date :end_date

      t.timestamps
    end
  end
end
