class TaskPolicy < ApplicationPolicy
  attr_reader :user, :track

  def initialize(user, tasks)
    @user = user
    @tasks = track
  end

  def update?
    @task.track&.users&.any? { |user| user.id == @user.id }
  end

  def edit?
    update?
  end

  def show?
  	true
  end
  
end