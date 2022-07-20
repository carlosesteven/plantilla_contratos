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

  function verInformacion() public view returns (
    string memory, uint
  ) 
  {
    return (nombre, edad);
  }   
}

contract Biblioteca
{
    // Estructura de datos de los libros
    struct Libro {
        string ISBN;
        string titulo;
        string autor;
        uint fecha;
        bool valido; // Variable Validadora
    }

    // Evento que registra los nuevos libros
    event nuevoLibroRegistrado( string _ISBN, string _titulo );

    // MAPPING de los libros   
    mapping(string => Libro) mappingLibros; 

    // Función para AGREGAR nuevos libros a la biblioteca
    function agregarLibro(
      string memory _ISBN, 
      string memory _titulo, 
      string memory _autor, 
      uint _fecha
    ) public 
    {
        // Funcion para validar SI YA EXISTE un libro en la lista, en caso de EXISTIR, muestra el error entre " (comillas).
        require( mappingLibros[_ISBN].valido == false, "Ya existe un libro con el mismo numero de ISBN."); 

        // Crea el libro en el MAPPING de libros de la biblioteca
        mappingLibros[ _ISBN ] = Libro(
            _ISBN, 
            _titulo, 
            _autor, 
            _fecha, 
            true
        );

        // Evento que registra los nuevos libros registrados
        emit nuevoLibroRegistrado( _ISBN, _titulo );
    }
   
    // Función para BUSCAR el libro en la lista (MAPPING) de la biblioteca
    function buscarLibro(string memory _ISBN) public view returns (
        string memory, 
        string memory, 
        string memory, 
        uint
    ) 
    {
        //  Busca el libro en el mapping de contactos mediante el numero ISBM
        Libro storage libroBuscado = mappingLibros[ _ISBN ];
        
        // Valida si el que el libro existe, en caso de NO existir muestra el error entre " (comillas).
        require(
            libroBuscado.valido, 
            "El libro buscado NO existe"
        ); 
        
        // Retorna el libro encontrado en la lista (MAPPING)
        return (
            libroBuscado.ISBN, 
            libroBuscado.titulo, 
            libroBuscado.autor, 
            libroBuscado.fecha
        );
    }
}
