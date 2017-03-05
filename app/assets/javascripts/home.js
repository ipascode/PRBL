$(document).ready(function() { 

$('#openall').click(function(){
  $('.panel-collapse:not(".in")')
    .collapse('show');
});

$('#closeall').click(function(){
  $('.panel-collapse.in')
    .collapse('hide');
});

});

