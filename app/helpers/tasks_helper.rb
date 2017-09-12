module TasksHelper
	def pretty_date(date)
		date.strftime("%A, %B %d, %Y at %l:%M%P ")
	end

	def allowed_complete?(task)
		task.users.exists?(name: current_user.name)
	end
end
