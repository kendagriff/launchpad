#= require jquery
#= require jquery_ujs
#= require ./jquery-ui
#= require ./jquery.ui.autocomplete.html.js
#= require_self
#= require_tree ./templates
#= require_tree .

window.Launchpad = {}

$(document).ready ->
  search = new Launchpad.Search.SearchBar()
  $('[data-behavior=search]').select()
