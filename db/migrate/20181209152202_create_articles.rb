class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
    	t.text :content
    	t.integer :author_id
      t.timestamps
    end
    add_foreign_key :articles, :users, column: :author_id
  end
end
