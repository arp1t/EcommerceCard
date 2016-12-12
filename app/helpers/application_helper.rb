module ApplicationHelper
	def fetch_all_users
		@users = User.all
	end
end
