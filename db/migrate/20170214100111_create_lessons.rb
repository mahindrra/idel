class CreateLessons < ActiveRecord::Migration[5.0]
  def change
    create_table :lessons do |t|
      t.string :name
      t.references :objective, foreign_key: true
      t.attachment :content

      t.timestamps
    end
  end
end
