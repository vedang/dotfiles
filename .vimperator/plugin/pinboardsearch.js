(function() {
  liberator.modules.commands.addUserCommand(
    ["pin[boardsearch]"],
    "Search for bookmarks at pinboard.in",
    function(args){
      if (args.length === 0) {
        liberator.echo('Search For: ');
        return false;
      }

      // make "and" query
      var query = args.join("+");
      var pinboardUrl = 'https://pinboard.in/search/u:vedang?query='
      // open in a new tab
      liberator.open(pinboardUrl + query, liberator.NEW_TAB);
      return false;
    },
    {},
    true
  );
})();
