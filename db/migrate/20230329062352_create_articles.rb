class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.integer :user_id
      t.text :content

      t.timestamps
    end
  end
end
