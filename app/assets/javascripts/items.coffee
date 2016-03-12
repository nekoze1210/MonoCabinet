# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


  speed = 300
  $loading = $('.js-loading')

  # Ajax ローディング
  $(document)
    .on 'ajaxSend', ->
      $loading.show()
    .on 'ajaxComplete', ->
      $loading.fadeOut speed