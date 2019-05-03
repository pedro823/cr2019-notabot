import React, { Component } from 'react';
import axios from 'axios';
import './Messages.css';

export class Messages extends Component {
  constructor (props) {
    super(props);
    this.state = { messages: null };
    axios.get('http://localhost:3000/api/message')
         .then(result => this.setState({ messages: result }));
  }

  static renderMessages(messages) {
    const messageList = messages && messages.data;
    if (messageList && messageList.length === 0) {
      return <p>Nenhuma Mensagem!</p>;
    }
    const table = messages && messages.data && messages.data.map(message =>
      <div className="message">
        <div className="message-header">{ message.author } disse:</div>
        <p>{ message.message }</p>
      </div>
    );
    return (
      <div>
        { table }
      </div>
    );
  }

  render () {
    const content = this.state.messages
      ? Messages.renderMessages(this.state.messages)
      : <p><em>Loading...</em></p>
    return (
      <div>
        <h1>Mensagens:</h1>
        { content }
      </div>
    );
  }
}
