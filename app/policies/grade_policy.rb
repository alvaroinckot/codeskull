class GradePolicy < ApplicationPolicy
 
  attr_reader :user, :grade

  # define access policies

  def initialize(user, grade)
    @user = user
    @grade = grade
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