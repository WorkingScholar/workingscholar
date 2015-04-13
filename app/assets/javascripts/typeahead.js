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
