class CreateFeedbacks < ActiveRecord::Migration[5.0]
  def change
    create_table :feedbacks do |t|
    	t.string :content
    	t.string :feedback_type
      t.integer :article_id
    	t.integer :user_id
      t.timestamps
    end
    add_index :feedbacks, :feedback_type
    add_foreign_key :feedbacks, :users
    add_foreign_key :feedbacks, :articles
  end
end
