class CreatePorfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :porfiles do |t|
      t.string :first_name
      t.string :last_name
      t.references :user, foreign_key: true
      t.references :learner_dimension_scale, foreign_key: true

      t.timestamps
    end
  end
end
