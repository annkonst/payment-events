# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  jQuery('#event_date').datetimepicker({
     timepicker:false,
     format:'d.m.Y'
  });
  jQuery('.invites input').on 'change', ->
    invite_id = jQuery(this).attr('id');
    money = jQuery(this).val();
    jQuery.ajax({
      url: "/invites/update_amount/",
      type: "POST",
      data: {
              'invite_id': invite_id,
              'user_money': money
            }
    })