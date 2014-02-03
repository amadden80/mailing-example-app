class HomeController < ApplicationController
	def index
		@user = current_user
	end

	def shoot_mail
		if current_user
			UserMailer.welcome_user(current_user).deliver
		end
		redirect_to root_path
	end
end