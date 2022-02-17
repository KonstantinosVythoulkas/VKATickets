import consumer from "./consumer"

consumer.subscriptions.create("CommentsChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    if(window.location.href == data.content[3]){
    $('#comments').append('<strong>' + data.content[1] + ': ' + '</strong>' + data.content[0] + ' ' + '<em>' + data.content[2] + '</em>' + '<hr class="comments-hr">' )
    // Called when there's incoming data on the websocket for this channel
    $('#comment_field').val('')

  }}
});

var submit_messages;

$(document).on('turbolinks:load', function() {
  submit_messages()
})

submit_messages = function (){
  $('#new_comment').on('keydown', function (event){
    if(event.key === 'Enter'){
      $('#send_button').trigger( "click" )
      //$('#comment_field').val('')
      //event.target.value = ''
      event.preventDefault()
    }
  })
  
}