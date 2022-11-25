import consumer from "./consumer"

consumer.subscriptions.create("NotificationChannel", {
  connected() {

  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    console.log('HELOO WORLD')
    $('#notifications').append(data.html)
  }
});
