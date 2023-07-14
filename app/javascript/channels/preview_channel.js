import consumer from "channels/consumer"

consumer.subscriptions.create("PreviewChannel", {
  connected() {
    console.log("connection established")
  },

  disconnected() {
    console.log("connection disconnected")
  },

  received(data) {
    var img_url = data.image_url;
    var imageElement = document.createElement('img');
    imageElement.src = img_url;
  
    var parentElement = document.getElementById("img_url");
    var existingChild = parentElement.children[0];

    if (existingChild) {
      parentElement.replaceChild(imageElement, existingChild);
    } else {
      parentElement.appendChild(imageElement);
    }
  }
});
