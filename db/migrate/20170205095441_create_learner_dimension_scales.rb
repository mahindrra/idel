class CreateLearnerDimensionScales < ActiveRecord::Migration[5.0]
  def change
    create_table :learner_dimension_scales do |t|
      t.string :name
      t.references :learner_style, foreign_key: true

      t.timestamps
    end
  end
end
