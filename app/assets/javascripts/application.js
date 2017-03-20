// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require cocoon
//= require_tree .
//= require bootstrap-sprockets
//= require selectize
//= require chart.bundle
//= require chartkick
//= require turbolinks
//= require moment
//= require bootstrap-datetimepicker
//= require pickers
//= require bootstrap-material-design
//= require snackbar


$(document).on("page:change", function(){
    $("input.datepicker").datepicker();
});

$(document).on('ready page:load', function(){
  $.each( flashMessages, function(key, value){
    $.snackbar({content: value, style: key, timeout: 10000});
  });
});

$(document).ready(function() {
// This command is used to initialize some elements and make them work properly
$.material.init();