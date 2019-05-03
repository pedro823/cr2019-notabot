import React, { Component } from 'react';
import { Estovakia2 } from './images/Estovakia'

export class Home extends Component {
  static displayName = Home.name;

  render () {
    return (
      <div style={{textAlign: 'center'}}>
        <h1>Portal do cidadão - Estovakia</h1>
        <p>Bem-vindo ao portal do cidadão da Estovakia, onde é possível deixar
           mensagens, avisos, reclamações e sugestões para o país!
        </p>
        <p>As mensagens vão direto para o gabinete da presidência,
           na qual será avaliada quando houver tempo.
        </p>
        <Estovakia2 />
      </div>
    );
  }
}
