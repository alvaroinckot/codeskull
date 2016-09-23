class Grade < ActiveRecord::Base
    
  before_create :setup_grade

  belongs_to :track
  belongs_to :user
  has_many :activities, :dependent => :delete_all

  def total_tasks
    self.track.tasks_count
  end

  def total_completed_tasks
    self.activities.where(completed: true).count
  end

  def completed?
    self.total_tasks == self.total_completed_tasks
  end

  def build_next_activity(activity)
    task = self.track.get_next_task(activity.task)
    unless task.nil?
      actvity = Activity.create(task: task, grade: self)
      self.activities << activity 
      self.save
    end
  end

  def actual_activity
    # TODO test it
    return self.activities.where(completed: false).first
  end

  private

    def setup_grade
	    activity = Activity.new(grade: self, task: track.tasks.first)
      self.activities << activity
    end

end
