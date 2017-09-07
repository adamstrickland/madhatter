class CreateFriends < ActiveRecord::Migration[5.1]
  def change
    create_table :friends do |t|
      t.string :name

      t.timestamps
    end
    add_attachment :friends, :avatar
  end
end