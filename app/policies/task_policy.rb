class TaskPolicy < ApplicationPolicy
  attr_reader :user, :track

  def initialize(user, task)
    @user = user
    @task = task
  end

  def destroy?
    true
  end

  def update?
    true
  end

  def edit?
    true
  end

  def show?
  	true
  end

  private 

    def check_ownership
      # @task.track&.users&.any? { |user| user.id == @user.id }

      true
    end
  
end