class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.string :email
      t.string :address
      t.string :postal

      t.timestamps
    end
  end
end
