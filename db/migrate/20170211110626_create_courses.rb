class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.integer :duration
      t.integer :audience
      t.text :course_objective
      t.integer :no_of_objective
      t.integer :session
      t.integer :skill_based
      t.integer :knowledge_based
      t.references :user, foreign_key: true
      t.references :learner_style, foreign_key: true

      t.timestamps
    end
  end
end
