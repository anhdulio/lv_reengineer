# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
@get_full_chips = (contents_type, attribute) ->
  $.getJSON '/' + contents_type + '/contents/api/' + attribute, (result) ->
    input = $('#content_'+attribute)[0]
    tags_string = $('#hidden_'+attribute)[0]
    all_tag = {}
    self_value = {}
    tags_array = []

    if input
      tags_string.value = input.value

      if result
        result.forEach (s) ->
          all_tag[s] = null

      tags_string.value.split(',').forEach (s) ->
        tags_array.push({'tag': s})

      $('.chips-'+attribute).material_chip
        placeholder: '+ tag'
        data: tags_array
        autocompleteOptions:
          data: all_tag
          limit: Infinity
          minLength: 1

    $('.chips-'+attribute).on 'chip.add', (e, chip) ->
      tags = tags_string.value.split(',')
      index = tags.indexOf(chip.tag)
      if (index < 0)
        tags.push(chip.tag)
      tags_string.value = tags.toString()
      return

    $('.chips-'+attribute).on 'chip.delete', (e, chip) ->
      index = result.indexOf(chip.tag)
      if (index > -1)
        result.splice(index, 1)
      tags_string.value = result.toString()
      return

    return