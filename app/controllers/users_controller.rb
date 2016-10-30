#Modify when users properly setup
class UsersController < ApplicationController

	def index
		@active_users = User.active.by_role.alphabetical.paginate(:page => params[:page]).per_page(10)
		@inactive_users = User.inactive.by_role.alphabetical.paginate(:page => params[:page]).per_page(10)
	end

	def edit
	end


end
