//= require typeahead/typeahead.bundle.js

var bloodhoundFactory = function(resource_url) {
  var bloodhound = new Bloodhound({
    datumTokenizer: Bloodhound.tokenizers.obj.whitespace('name'),
    queryTokenizer: Bloodhound.tokenizers.whitespace,
    limit: 10,
    prefetch: {
      url: resource_url,
      filter: function(list) {
        return $.map(list, function(resource) { return { name: resource }; });
      }
    }
  });
  return bloodhound;
};

var schools = bloodhoundFactory('/schools.json');
var majors = bloodhoundFactory('/majors.json');

// kicks off the loading/processing of `local` and `prefetch`
schools.initialize();
majors.initialize();

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
