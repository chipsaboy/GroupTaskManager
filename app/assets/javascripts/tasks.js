function Task(attr) {
	this.id = attr.id
	this.name = attr.name
	this.state = attr.state
	this.due_date = attr.due_date
	this.list_id = attr.list_id
	this.users = []
	this.tags = []
}

Task.timeRemaining = function() {
	var date1 = new Date(this.due_date);
	var date2 = new Date();
	var timeDiff = Math.abs(date2.getTime() - date1.getTime());
	var diffDays = Math.ceil(timeDiff / (1000 * 3600 * 24));
	return diffDays;
};

Task.prototype.renderTask = function() {
	return `
	<div class="item db card">
		<h4 id="task-color">
				<a href="/lists/${this.list_id}/tasks/${this.id}/edit">${this.name}</a>
		</h4>
		<p>Due Date: ${Date.parse(this.due_date)}
		   	   ||
			   		Time remaining: ${Task.timeRemaining()} day(s)
		</p>
			<p>Assigned to:
					brian1988
			</p>
		<p id="task-color">
				<span class="badge badge-info">Back Yard</span>
				<span class="badge badge-info">New</span>
		</p>
	</div>
	`
};

Task.newTask = function(e) {
	e.preventDefault()
	var $form = $(this)
	var action = $form.attr("action")
	var params = $form.serialize()

	$.post(action, params, Task.success, "json")
}

Task.success = function(json) {
	var task = new Task(json)
	var taskDiv = task.renderTask()

	$("div.ui relaxed divided items").append(taskDiv)
}
