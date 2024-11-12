class CreateReviews < ActiveRecord::Migration[7.2]
  def change
    create_table :reviews do |t|
      t.text :content, null: false
      t.integer :rating, null: false
      t.references :restaurant, null: false, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end
