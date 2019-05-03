import React, { Component } from 'react';
import { Route } from 'react-router';
import { Layout } from './components/Layout';
import { Home } from './components/Home';
import { CreateMessage } from './components/CreateMessage';
import { Messages } from './components/Messages';

export default class App extends Component {
  static displayName = App.name;

  render () {
    return (
      <Layout>
        <Route exact path='/' component={Home} />
        <Route path='/messages' component={Messages} />
        <Route path='/create-message' component={CreateMessage} />
      </Layout>
    );
  }
}
