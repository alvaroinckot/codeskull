class Content < ActiveRecord::Base
  
  belongs_to :resource, polymorphic: true

  has_attached_file :file, 
    :styles => { :medium => "600x600", :thumb => "100x100" }

    validates_attachment_content_type :file, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  
end
