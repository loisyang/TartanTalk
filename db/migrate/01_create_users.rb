class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :provider
      t.string :uid
      t.string :name
      t.string :oauth_token
      t.datetime :oauth_expires_at
      t.string :role
      t.boolean :active
      t.boolean :anonymous
      t.string :anonusername

      t.timestamps
    end
  end
end
