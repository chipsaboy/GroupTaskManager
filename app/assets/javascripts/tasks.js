function Task(attributes) {
	this.id = attr.id
	this.name = attr.name
	this.state = attr.state
	this.due_date = attr.due_date
	this.list_id = attr.list_id
	this.users = []
	this.tags = []
}

$(function() {
    newTask();
});

function newTask() {
    $("form#new_task").on('submit', function(event) {
	    event.preventDefault();
	    var params = $(this).serialize();
	    var action = this.action;

	    $.ajax ({
	        url: action,
	        method: 'POST',
	        data: params,
	        dataType: 'json'
	    })
	    .success(Task.success)
	    .error(Task.error);
    });
}

$(function(){
    flatpickr('#flatpickr-input', {
    	enableTime: true, altInput: true
    });
});