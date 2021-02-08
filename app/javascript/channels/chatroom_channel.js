import consumer from "./consumer";

const initChatroomCable = () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    const id = messagesContainer.dataset.chatroomId;
    consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
      
      received(data) {
        document.querySelector('#message_content').value = ''
        messagesContainer.insertAdjacentHTML('beforeend', data);
        console.log(data)
        const messages = document.querySelectorAll('.chat-bubble');
        const lastMessage = messages[messages.length - 1]
        lastMessage.scrollIntoView()
      }
    });   
  }
}


export { initChatroomCable };