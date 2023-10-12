// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract test {

    bool monBool;

    function getBool() public view returns(bool) {
        return monBool;
    }

    function setBool(bool _bool) public {
        monBool = _bool;
    }

    address monAdresse;

    function getAdresse() public view returns(address) {
        return monAdresse;
    }

    function setAdresse(address _adresse) public {
        monAdresse = _adresse;
    }

}