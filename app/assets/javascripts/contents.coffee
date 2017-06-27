# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
@get_full_chips = (contents_type, attribute) ->
  $.getJSON '/' + contents_type + '/contents/api/' + attribute, (result) ->

    input = $('#content_'+attribute)[0]
    values = {}
    self_value = {}
    self_values = []
    if input
      input.value.split(',').forEach (s) ->
        self_value['tag'] = s
        self_values.push(self_value)
      if result
        result.forEach (s) ->
          values[s] = null
          return

      $('.chips-'+attribute).material_chip
        secondaryPlaceholder: 'Enter a ' + attribute
        placeholder: '+ '+ attribute
        data: self_values
        autocompleteOptions:
          data: values
          limit: Infinity
          minLength: 1
      if result
        input.value = result.toString()

    $('.chips-'+attribute).on 'chip.add', (e, chip) ->
      index = result.indexOf(chip.tag)
      if (index < 0)
        result.push(chip.tag)
      input.value = result.toString()
      return

    $('.chips-'+attribute).on 'chip.delete', (e, chip) ->
      index = result.indexOf(chip.tag)
      if (index > -1)
        result.splice(index, 1)
      input.value = result.toString()
      return

    return