// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var schools = bloodhoundFactory('/schools.json');

// kicks off the loading/processing of `local` and `prefetch`
schools.initialize();

$(document).ready(function() {
  $('#student_school_name').typeahead(
    {
      highlight: true,
      minLength: 4
    },
    {
      name: 'schools',
      displayKey: 'name',
      source: schools.ttAdapter()
    });
});
