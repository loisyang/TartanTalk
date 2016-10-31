class Ability
  include CanCan::Ability
  
  def initialize(user)
    # set user to new User if not logged in
    @current_user ||= User.new # i.e., a guest user
    if current_user.role? :admin
    can :manage, :all
  elsif current_user.role? :student
    can :update, User do |u|
    u.id == @current_user.id
  end

    can :show, User do |u|
    u.id == @current_user.id
  end
      
  else
   
  end
    





  end
end