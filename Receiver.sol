


// SPDX-License-Identifier: MIT
pragma solidity  ^0.8.20;

contract ReceiveETH {


    event Log(uint256 amount , uint256 gasleft) ;

    receive() external payable {
        emit Log(msg.value , gasleft());
    }


    function getBalance()  view public returns(uint256){
            return address(this).balance;
    }
}