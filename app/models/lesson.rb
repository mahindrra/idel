class Lesson < ApplicationRecord
  belongs_to :objective

  has_attached_file :content 
  validates_attachment_content_type :content, 
  :content_type =>['application/pdf','video/x-flv','video/mp4',
  	"application/xlsx", "application/doc", "application/docx",
   	"application/ppt", "application/pptx",'application/vnd.ms-powerpoint',
   	'application/vnd.openxmlformats-officedocument.presentationml.presentation',
   	'application/vnd.oasis.opendocument.presentation'
   ]
end
