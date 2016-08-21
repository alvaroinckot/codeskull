class Track < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  has_and_belongs_to_many  :users
  has_many :contents
  has_many :tasks
  
end
