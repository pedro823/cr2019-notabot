import React, { Component } from 'react';
import { Redirect } from 'react-router';
import { API_HOST } from '../Environment';
import axios from 'axios';

export class CreateMessage extends Component {
  constructor (props) {
    super(props);
    this.state = {
      author: '',
      message: '',
      answer: '',
      captcha: null,
      submitted: false,
      errors: null,
    };
    axios.post(`http://${API_HOST}/api/captcha/generate`)
         .then(response => this.setState({
           captcha: response.data
         }));
  }

  handleChange = (event) => {
    const { target: { name, value } } = event;
    this.setState({
      [name]: value,
    });
  }

  handleSubmit = (event) => {
    this.setState({ errors: null })
    const { captcha: { id }, author, message, answer } = this.state
    axios.post(`http://${API_HOST}/api/message/create`, {
      captchaId: id,
      author,
      message,
      answer,
    })
    .then(() => this.setState({ submitted: true }))
    .catch(err => this.setState({ errors: err.response.data.errorMessage }));
    event.preventDefault();
  }

  renderCaptcha = (captcha) => {
    const { challenge } = captcha;
    return (
      <div id="captcha">
        <h4>Captcha:</h4>
        <p>{ challenge }<br />
          <input type="text" name="answer" onChange={this.handleChange} />
        </p>
      </div>
    );
  }


  render () {
    const { captcha, submitted, errors } = this.state;
    if (submitted) {
      return <Redirect to='/messages' />
    }

    const renderedCaptcha = captcha
          ? this.renderCaptcha(captcha)
          : <p><em>Loading...</em></p>;

    return ( 
      <div>
        <h1>Mande uma mensagem</h1>
        <form onSubmit={this.handleSubmit}>
          {errors && <p>erros ocorreram: <code><b>{ errors }</b></code></p>}
          <p>Digite seu nome:<br />
            <input required type="text" name="author" onChange={this.handleChange} />
          </p>
          <p>Digite sua mensagem:<br />
            <textarea required name="message" onChange={this.handleChange} />
          </p>
          { renderedCaptcha }
          <input type="submit" value="Enviar" className="btn btn-primary" onClick={this.sendInfo} disabled={!captcha} />
        </form>
      </div>
    );
  }
}
