Launchpad.Search ||= {}

class Launchpad.Search.SearchBar
  constructor: ->
    $('[data-behavior=search]').autocomplete
      minLength: 3
      html: true
      focus: (event, ui) -> false
      select: (event, ui) ->
        document.location = ui.item.link
        false
      source: (request, response) ->
        $.ajax
          url: "http://omnisearch:F5XJoFUmuEG5SdXiljfn4MPx7ZiFhZ1HdkGoS58r@search.teachbanzai.com/items.jsonp"
          data:
            q: request.term
          dataType: 'jsonp'
          success: (data) ->
            response $.map(data.items, (item) ->
              { 
                label: new Launchpad.Search.Items[item.item_type](item).render(),
                value: item.item_id,
                link: item.internal_url,
              })

Launchpad.Search.Items ||= {}

class Launchpad.Search.Items.Teacher
  template: JST['launchpad/templates/search/items/teacher']

  constructor: (item) ->
    @item = item

  render: ->
    @template(@item)

class Launchpad.Search.Items.Student
  template: JST['launchpad/templates/search/items/student']

  constructor: (item) ->
    @item = item

  render: ->
    @template(@item)
