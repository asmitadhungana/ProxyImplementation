pragma solidity ^0.5.4;

import "./Storage.sol";

contract Fxnal_2 is Storage {
    modifier onlyAdmin() {
        require(msg.sender == admin);
        _;
    }

    constructor() public {
        initialize(msg.sender);
    }

    function initialize(address _admin) public {
        require(!_initialized); //this fxn can be called only once
        admin = _admin;
        _initialized = true;
    }

    function getNoOfClans() public view returns (uint256) {
        return _uintMap["Clans"];
    }

    function setNoOfClans(uint256 _clans) public onlyAdmin {
        _uintMap["Clans"] = _clans;
    }
}
