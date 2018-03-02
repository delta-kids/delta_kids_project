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
//= require recurring_select
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

$(document).ready(function() {
  $('.a-chevron').click(function() {
    $(this).toggleClass('rotate-chevron');
});
});

$(document).ready(function() {
$('.cal-hl').click(
function(){
    $('.cal-highlight-yellow').addClass('cal-highlight-blue')
    $('.cal-highlight-yellow').removeClass('cal-highlight-yellow');
    $(this).addClass('cal-highlight-yellow')
    $(this).removeClass('cal-highlight-blue');
});
});

$(document).ready(function(){
  $('.dateselect-time').timepicker({ 'scrollDefault': 'now' });
});

$(document).ready(function(){
  $('.datepicker').datepicker({ dateFormat: 'yy-mm-dd ' });
});
