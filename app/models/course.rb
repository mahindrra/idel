class Course < ApplicationRecord
  belongs_to :user
  belongs_to :learner_style
  has_many :objectives, dependent: :destroy
  enum audiences:['First Year','Second Year(E&TC)']

  has_attached_file :file 
  validates_attachment_content_type :file, 
  :content_type =>['application/pdf','video/x-flv','video/mp4']
end
