Launchpad.Search ||= {}

class Launchpad.Search.SearchBar
  constructor: ->
    $('[data-behavior=search]').autocomplete
      delay: 0
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

class Launchpad.Search.Items.Item
  constructor: (item) ->
    @item = item

  render: ->
    @template(@item)

class Launchpad.Search.Items.Teacher extends Launchpad.Search.Items.Item
  template: JST['launchpad/templates/search/items/teacher']

class Launchpad.Search.Items.Student extends Launchpad.Search.Items.Item
  template: JST['launchpad/templates/search/items/student']

class Launchpad.Search.Items.Sponsor extends Launchpad.Search.Items.Item
  template: JST['launchpad/templates/search/items/sponsor']
