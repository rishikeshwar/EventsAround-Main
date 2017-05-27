class CreatePersonalinfos < ActiveRecord::Migration[5.0]
  def change
    create_table :personalinfos do |t|
      t.integer :user_id
      t.string :name
      t.string :phoneno

      t.timestamps
    end
  end
end
