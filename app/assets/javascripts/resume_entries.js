// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {
  $('.dropdown-button').dropdown({
    hover: false,
    belowOrigin: true
  });

  $('.datepicker').pickadate({
    selectMonths: true,
    selectYears: 35
  });
});
