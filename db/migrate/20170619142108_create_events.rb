class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.integer :user_id
      t.string :name
      t.string :venue
      t.text :information
      t.string :festwebsite
      t.string :fblink
      t.integer :festtype
      t.date :startdate
      t.date :enddate
      t.string :email1
      t.string :email2
      t.string :phone1
      t.string :phone2
      t.integer :fee

      t.timestamps
    end
  end
end
