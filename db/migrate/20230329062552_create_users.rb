class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :social_linkedin
      t.string :social_instagram
      t.string :social_facebook
      t.boolean :admin, default: false

      t.timestamps
    end
  end
end
