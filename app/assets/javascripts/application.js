// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui/widgets/datepicker
//= require chosen-jquery
//= require rails-ujs
//= require underscore
//= require social-share-button
//= require gmaps/google
//= require_tree .





$(document).ready(function() {
  $(".dropdown-toggle").dropdown();
});


$(document).ready(function() {
$("[href]").each(function() {
    if (this.href == window.location.href) {
        $(this).addClass("nav-guide-color");
    }
});
});
//
// $(document).ready(function() {
//   $('.a-chevron').click(function() {
//     $(this).closest('collapse-where')
//     $(this).toggleClass('rotate-chevron');
// });
// });

$(document).ready(function(){
  $('.dateselect-time').timepicker({ 'scrollDefault': 'now' });
});

$(document).ready(function(){
  $('.datepicker').datepicker({ dateFormat: 'yy-mm-dd' });
});

let checkboxValues = JSON.parse(localStorage.getItem('checkboxValues')) || {},
    $checkboxes = $(".checkbox-container :checkbox");

$checkboxes.on("change", function(){
  $checkboxes.each(function(){
    checkboxValues[this.id] = this.checked;
  });

  localStorage.setItem("checkboxValues", JSON.stringify(checkboxValues));
});

// On page load
$.each(checkboxValues, function(key, value) {
  $("#" + key).prop('checked', value);
});
