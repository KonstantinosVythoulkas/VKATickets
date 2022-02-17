import consumer from "./consumer"

consumer.subscriptions.create("EmployeeroomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    console.log(data.content)
    $('#comments').append('<strong>' + data.content[1] + ' (' + data.content[2] + ')' + ': ' + '</strong>' + data.content[0] + ' ' + '<em>' +  data.content[3] + '</em>' + ' <hr class="comments-hr">' )
    // Called when there's incoming data on the websocket for this channel
    $('#comment_field_emp').val('')
  }
});

var submit_messages;

$(document).on('turbolinks:load', function() {
  submit_messages()
})

submit_messages = function (){
  $('#new_comment').on('keydown', function (event){
    if(event.key === 'Enter'){
      $('#send_button').trigger( "click" )
      event.preventDefault()
    }
  })
}
