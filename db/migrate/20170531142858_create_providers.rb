class CreateProviders < ActiveRecord::Migration[5.0]
  def change
    create_table :providers do |t|
      t.string :uid
      t.string :name
      t.string :oauth_token
      t.datetime :oauth_expires_at

      t.timestamps
    end
  end
end
