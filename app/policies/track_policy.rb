class TrackPolicy < ApplicationPolicy
  attr_reader :user, :track

  def initialize(user, track)
    @user = user
    @track = track
  end

  def update?
    check_ownership
  end

  def edit?
    check_ownership
  end

  def show?
  	true
  end

  def export?
    true
  end

  private 

    def check_ownership
      @track.users.any? { |owner| owner.id == user.id }
    end
  
end