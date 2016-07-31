class User < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tracks

  has_attached_file :avatar, 
    :styles => { :medium => "600x600>", :thumb => "100x100#" }, 
    :storage => :dropbox,
    :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
    :default_url => "/default_user.png"

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
         
end
