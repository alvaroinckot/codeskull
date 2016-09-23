class Track < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  enum idiom: [ :pt_br, :eng ]
  enum language: [ :ruby, :javascript ]

  has_and_belongs_to_many  :users
  has_many :contents
  has_many :tasks

  def owner
  	# TODO create ownership rule
  	self.users.first
  end
  
  def tasks_of(category)
  	self.tasks.select{ |t| t.category == category }
  end

  def tasks_count
    self.tasks.count
  end

  def get_next_task(task)
    # TODO build order system
    self.tasks.order(:id).select{ |t| t.id > task.id }.first
  end

end
