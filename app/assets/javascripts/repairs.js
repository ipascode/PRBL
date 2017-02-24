# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(“.bus_no-select”).selectize(options)

options = {
    maxOptions: 5
    render:
        item: (item, escape) ->
            return "<div class='bus-item'><span>#{escape(item.bus_no)}</span></div>"
        option: (item, escape) ->
            return "<div class='bus-item'><span>#{escape(item.bus_no)}</span></div>"
    valueField: ‘bus_no’
    searchField: ‘bus_no’
    create: true
}

$('#driver-selectize').selectize({
    create: true,
    sortField: 'text'
});

