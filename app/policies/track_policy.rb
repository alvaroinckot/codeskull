class TrackPolicy < ApplicationPolicy
  attr_reader :user, :track

  def initialize(user, track)
    @user = user
    @track = track
  end

  def update?
    @track.user.id == @user.id
  end

  def edit?
    update?
  end

  def show?
  	true
  end
  
end