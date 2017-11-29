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

Task.prototype.renderTask = function() {
  return `
  <div class="item db card" id="task-${this.id}">
    <h4 id="task-color">
      <a href="/lists/${this.list_id}/tasks/${this.id}/edit">Test</a>
    </h4>
    <p>Due Date: ${this.due_date}
    </p>
      <p>Assigned to:
          ${this.users}
    </p>
    <p id="task-color">
        <span class="badge badge-info">${this.tags}</span>
    </p>
      <form class="button_to" method="post" action="/lists/${this.list_id}/tasks/${this.id}/complete"><input type="hidden" name="_method" value="put"><button class="btn btn-xs btn-login sidebs" data-confirm="Are you sure?" type="submit" value="Done"><
      </form>
  </div>
  `
}

Task.prototype.$card = function() {
  return $("div#task-"+this.id)
}

Task.prototype.removeTask = function() {
  this.$card.remove()
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