// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2; // NO MODIFICAR ESTA VERSIÓN

/*
*
* RECOMENDACIÓN
* DECLARAR LOS DIFERENTES CONTRATOS EN ESTE MISMO ARCHIVO
* PARA MAS FACILIDAD AL EJECUTAR LOS DIFERENTES CONTRATOS
*
*/

contract InformacionContacto {

  string nombre;
  uint edad;

  function cambiarInformacion(
    string memory _nombre, 
    uint _edad
  ) public 
  {
    nombre = _nombre;
    edad = _edad;
  }

  function getInformacion() public view returns (string memory, uint) 
  {
    return (nombre, edad);
  }   
}
