module HomeHelper

	def current_tasks_incomplete
		current_user.tasks.incomplete.size
	end

	def current_tasks_complete
		current_user.tasks.completed.size
	end

	def current_tasks_overdue
		current_user.tasks.overdue_tasks.size
	end

end
