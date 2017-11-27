function Task(attributes) {
	this.id = attr.id
	this.name = attr.name
	this.state = attr.state
	this.due_date = attr.due_date
	this.list_id = attr.list_id
	this.users = []
	this.tags = []
}

$(function(){
    flatpickr('#flatpickr-input', {
    	enableTime: true, altInput: true
    });
});