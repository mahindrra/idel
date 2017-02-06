class AddColumnsToQuestion < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :answer_a, :string
    add_column :questions, :answer_b, :string
  end
end
