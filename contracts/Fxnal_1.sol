pragma solidity ^0.5.4;

import "./Storage.sol";

contract Fxnal_1 is Storage {
    modifier onlyAdmin() {
        require(msg.sender == admin);
        _;
    }

    constructor() public {
        admin = msg.sender;
    }

    function getNoOfClans() public view returns (uint256) {
        return _uintMap["Clans"];
    }

    function setNoOfClans(uint256 _clans) public {
        _uintMap["Clans"] = _clans;
    }
}
