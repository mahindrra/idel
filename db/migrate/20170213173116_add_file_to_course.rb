class AddFileToCourse < ActiveRecord::Migration[5.0]
  def change
    add_attachment :courses, :file 
  end
end
