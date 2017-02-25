# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function(){

$('.driver-selectize').selectize({
    create: true,
    sortField: 'text'
});

$('.bus-selectize').selectize({
    sortField: 'text'
});

$('.type-selectize').selectize({
	console.log('yeahh it works');
});

});