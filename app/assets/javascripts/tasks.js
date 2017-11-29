function Task(attr) {
	this.id = attr.id
	this.name = attr.name
	this.state = attr.state
	this.due_date = attr.due_date
	this.list_id = attr.list_id
	this.users = []
	this.tags = []
}

$(function() {
    Task.ready()
})

Task.ready = function() {
	Task.newTaskListener()
}

Task.error = function(response) {
    console.log("Oops, something went wrong.", response)
}

Task.success = function(json) {
  var task = new Task(json)
  var taskCard = task.renderTask()

  $("div.ui.relaxed.divided.items").append(taskCard)
}

function newTaskListener = function() {
	$("form#new_task").on('submit', Task.newTask)
}

Task.newTask = function(event) {
    event.preventDefault()
    var $form = $(this)
    var action = $form.attr("action")
	var params = $form.serialize()

    $.ajax ({
        url: action,
        method: 'POST',
        data: params,
        dataType: 'json'
    })
    .success(Task.success)
    .error(Task.error)
}

$(function(){
    flatpickr('#flatpickr-input', {
    	enableTime: true, altInput: true
    });
});