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
