pragma solidity ^0.5.4;

import "./Storage.sol";

//proxy inherits from storage
contract Proxy is Storage {
    address _fxnalAddress;

    constructor(address implementationAddress) public {
        admin = msg.sender;
        _fxnalAddress = implementationAddress;
    }

    //FUNCTION FOR UPGRADING TO NEW IMPLEMENTAION ADDRESS
    function upgrade(address newAddress) public {
        require(msg.sender == admin);
        _fxnalAddress = newAddress;
    }

    //FALLBACK FUNCTION.
    function() external payable {
        address implementation = _fxnalAddress;
        require(_fxnalAddress != address(0));

        //DELEGATECALL EVERY FUNCTION CALL
        assembly {
            calldatacopy(0, 0, calldatasize)
            let result := delegatecall(
                gas,
                implementation,
                0,
                calldatasize,
                0,
                0
            )

            returndatacopy(0, 0, returndatasize)

            switch result
                case 0 {
                    revert(0, returndatasize)
                }
                default {
                    return(0, returndatasize)
                }
        }
    }
}
