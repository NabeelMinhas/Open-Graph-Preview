import consumer from "channels/consumer"

consumer.subscriptions.create("PreviewChannel", {
  connected() {
    console.log("connection established")
  },

  disconnected() {
    console.log("connection disconnected")
  },

  received(data) {
    document.getElementById("url_form").reset();
    var img_url = data.image_url;
    var imageElement = document.createElement('img');
    imageElement.src = img_url;
    imageElement.classList.add('img-fluid');
    imageElement.style.maxWidth = '100%';
    imageElement.style.maxHeight = '100%';
    imageElement.style.objectFit = 'contain';
  
    var parentElement = document.getElementById("img_url");
    var existingChild = parentElement.children[0];
  
    if (existingChild) {
      parentElement.replaceChild(imageElement, existingChild);
    } else {
      parentElement.appendChild(imageElement);
    }
  }  
});
