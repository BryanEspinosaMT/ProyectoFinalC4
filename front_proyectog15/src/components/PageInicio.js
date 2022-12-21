import React, { Component } from 'react'

import axios from "axios";
import "bootstrap/dist/css/bootstrap.min.css";


const urlEventos = 'http://localhost:9005/api/eventos'

class PageInicio extends Component{
   
    state={
        data: []
    }


    peticionGet = () => {
        axios.get(urlEventos).then(response => {
          //console.log(response.data);
          this.setState({
            data:response.data})
        }).catch(error => {
          console.log(error.message);
        })
      }

      componentDidMount(){
        this.peticionGet()
      }


    render(){
        return <div>
            <table className="table ">
        <thead>
          <tr>
            <th>Fecha</th>
            <th>Equipo1</th>            
            <th>Equipo2</th>
            <th>Deporte</th>            
            <th>Descripción</th>
                       
          </tr>
        </thead>
        <tbody>
          {this.state.data.map(evento => {
            return(
              <tr key={evento.eve_id}>
              <td>{evento.eve_fecha}</td>
              <td>{evento.equ_equipo1}</td>
              <td><h5>{evento.eve_marca1}</h5></td>
              <td>{evento.equ_equipo2}</td>
              <td><h5>{evento.eve_marca2}</h5></td>
              <td>{evento.dep_id}</td>
              <td>{evento.eve_descrip}</td>
              </tr>
            )
          })}
        </tbody>
        </table>
        </div>
    }
}

export default PageInicio