pragma solidity ^0.5.4;

contract Storage {
    mapping(string => uint256) _uintMap;
    mapping(string => address) _addressMap;
    mapping(string => bool) _boolMap;
    mapping(string => string) _stringMap;
    mapping(string => bytes32) _bytesMap;

    address public admin;
    bool public _initialized;
}
