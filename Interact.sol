// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

//interacting with data
contract OtherContract {
    uint256 x;

    function setX(uint256 _x) public payable {
        x = _x;
    }

    function getX() public view returns (uint256) {
        return x;
    }
}

contract InteractWithOtherContract {
    event Response(bool success, bytes data);

    function callSetX(address _otherConractAddress, uint256 _x) public payable {
        (bool success, bytes memory data) = _otherConractAddress.call{
            value: msg.value
        }(abi.encodeWithSignature("setX(uint256)", _x));
        emit Response(success, data);
    }

    function callGetX(address _addr) external returns (uint256) {
        // call getX()
        (bool success, bytes memory data) = _addr.call(
            abi.encodeWithSignature("getX()")
        );

        emit Response(success, data); //emit event
        return abi.decode(data, (uint256));
    }
}
