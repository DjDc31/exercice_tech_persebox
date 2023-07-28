import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = { chatroomId: Number }
  static targets = ["messages"]

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      { received: data => this.#insertMessageAndScrollDown(data) }
    )
    console.log(`Subscribed to the chatroom with the id ${this.chatroomIdValue}.`)

    // Scroll to the bottom of the chat on page load
    this.#scrollToBottom()
  }

  #insertMessageAndScrollDown(data) {
    // Parse the incoming data as HTML and get the message id
    const incomingMessage = new DOMParser().parseFromString(data, "text/html").body.firstChild;
    const messageId = incomingMessage.dataset.messageId;

    // Check if a message with this id is already present in the DOM
    const existingMessage = this.messagesTarget.querySelector(`[data-message-id="${messageId}"]`);

    // If not, insert the new message and scroll down
    if (!existingMessage) {
      this.messagesTarget.insertAdjacentHTML("beforeend", data)
      this.#scrollToBottom()
    }
  }

  #scrollToBottom() {
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }



  resetForm(event) {
    event.target.reset()
  }

  disconnect() {
    console.log("Unsubscribed from the chatroom")
    this.channel.unsubscribe()
  }
}
