// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var majors = bloodhoundFactory('/majors.json');

// kicks off the loading/processing of `local` and `prefetch`
majors.initialize();

$(document).ready(function() {
  $('#student_major_name').typeahead(
    {
      highlight: true,
      minLength: 4
    },
    {
      name: 'majors',
      displayKey: 'name',
      source: majors.ttAdapter()
    });
});
