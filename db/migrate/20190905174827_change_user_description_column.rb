class ChangeUserDescriptionColumn < ActiveRecord::Migration[5.2]
  def self.up
    change_column :users, :description, :text
  end

  def self.down
    change_column :users, :description, :string
  end
end
