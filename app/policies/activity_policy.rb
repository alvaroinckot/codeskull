class ActivityPolicy < ApplicationPolicy
  
  attr_reader :user, :activity

  # define access policies

  def initialize(user, activity)
    @user = user
    @activity = activity
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

end