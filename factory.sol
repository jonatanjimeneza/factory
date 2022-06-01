// SPDX-License-Identifier: MIT

// Version del compilador
pragma solidity ^0.8.0;

contract SmartContract1 {

    // Almacenamiento de la informacion del Factory
    //Asociamos una dirección de una persona con una dirección de un smart contract.
    mapping (address => address) public MiContratoPersonal;

    //Función para crear un factory
    function Factory() public {
        //Creo la dirección de este nuevo contrato e instancio el smart contracto en este caso smart contract2 al cual le pasamos el parametro
        //los parametros que le pasamos es el msg.sender y la direccion del smart contract 1
        //Estos parametros son los que recibiran el constructor del smart contract 2
        address direccion_nuevo_contrato = address (new SmartContract2(msg.sender, address(this)));
        //Guardamos la dirección de este nuevo contracto para luego poder acceder a él.
        MiContratoPersonal[msg.sender] = direccion_nuevo_contrato;
    }
}

contract SmartContract2 {

    //Creamos una estructura de datos del Owner para luego visualizarlo
    Data public data_owner;

    struct Data{
    address  owner;
    address  direccion_SC;
    }

    //Constructor al cual se le pasará los párametros que se han indicado en la función del factory del smart contract 1 para crear la dirección nueva del contrato.
    constructor (address _direccion, address _direccionSmartContract) {
        data_owner.owner = _direccion;
        data_owner.direccion_SC = _direccionSmartContract;
    }

}

//Básicamente el factory nos permite crear nuevos contratos. Instanciar estos nuevos contratos indicando así su nombre y pasandolé los párametros requeridos
//Con esto podemos interactuar con nuevos contratos en todo momento.
