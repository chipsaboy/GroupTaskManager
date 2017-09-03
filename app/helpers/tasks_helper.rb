module TasksHelper
	def pretty_date(date)
		date.strftime("%A, %B %d, %Y at %l:%M%P ")
	end
end
