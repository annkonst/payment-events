# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  jQuery('#event_date').datetimepicker({
     timepicker:false,
     format:'d.m.Y'
  });
  jQuery('.list-sum input').on 'change', ->
    list_id = jQuery(this).attr('id');
    list_sum = Math.abs(jQuery(this).val());
    jQuery(this).val(list_sum);
    jQuery.ajax({
      url: "/product_lists/update_sum/",
      type: "POST",
      data: {
        'product_list_id': list_id,
        'price': list_sum
      }
    })

  jQuery('.guest input').on 'change', ->
    invite_id = jQuery(this).attr('id');
    money = Math.abs(jQuery(this).val());
    jQuery(this).val(money);
    jQuery.ajax({
      url: "/invites/update_amount/",
      type: "POST",
      data: {
              'invite_id': invite_id,
              'user_money': money
            }
    })
