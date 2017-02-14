class Lesson < ApplicationRecord
  belongs_to :objective

  has_attached_file :content 
  validates_attachment_content_type :content, 
  :content_type =>['application/pdf','video/x-flv','video/mp4']
end
