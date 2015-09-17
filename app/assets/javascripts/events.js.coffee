# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

window.initDraggables = ->
  jQuery('.drag_product').draggable
    revert: "invalid"
  jQuery('.drop_list').droppable
    drop: (event, ui) ->
      product_id = ui.draggable.attr('id')
      product_list_id = jQuery(@).closest('.product-list').attr('id')
      jQuery.ajax
        url: "/products/change_product_list/"
        type: 'POST'
        data:
          'product_id': product_id
          'product_list_id': product_list_id


jQuery ->
  jQuery('#event_date').datetimepicker
    minDate: 0
    timepicker: false
    format: 'd.m.Y'

  initDraggables();

  jQuery('#event_date').change ->
    if jQuery(this).val()
      jQuery('.xdsoft_datetimepicker').hide()


  jQuery('.invites input').on 'input', ->
    invite_id = jQuery(@).attr('id');
    money = jQuery(@).val();
    jQuery.ajax
      url: "/invites/update_amount/",
      type: 'POST',
      data:
        'invite_id': invite_id,
        'user_money': money

  jQuery('body').on 'input', '.drag_product input[type="number"]', ->
    product_id = jQuery(@).attr('data-product-id');
    price = $(@).val()
    jQuery.ajax
      url: "/products/#{product_id}/",
      type: 'PATCH',
      data:
        product:
          price: price
  window.calculateAmounts = ->
    formUploader.clearFormLoading('#product_form')

  window.calculateAmounts = ->
    path = window.location.pathname;
    eventId = path.substring(path.lastIndexOf('/') + 1);
    data = { products: {} }
    for priceEl in jQuery('.drag_product input[type="number"]')
      priceEl = jQuery(priceEl)
      data.products[priceEl.data('product-id')] = { price: priceEl.val() }
    jQuery.ajax
      url: "/events/#{eventId}/calculate",
      type: 'POST',
      data: data

  jQuery('#main_menu').click ->
    jQuery("html, body").animate({"scrollTop":0},"slow")