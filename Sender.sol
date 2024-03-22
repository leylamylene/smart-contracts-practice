// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Sender {
   error SendFailed();
   error CallFailed();

    constructor(){

    }


    receive() external payable {

    }


    function transfer(address payable receiver , uint256 amount ) public  payable {
        // the gas limit of transfer is 2300 which is enough to transfer ether , but not if the receiver contract has a receive() or fallback() function that is gas conusming ;
        // if the transfer fails  , the transaction will revert

        require(msg.value >= amount , "Unsufficient value");
            receiver.transfer(amount);
    }


    function sendETH(address payable _to , uint256 _amount) public payable {
        require(_amount >= msg.value  , "Unsufficient value");
        bool success = _to.send(_amount);
        if(!success) {
            revert SendFailed();
        }
    }

    function sendWithCall(address payable _to , uint256 _amount ) public payable{
        require(_amount >= msg.value , "Unsufficient value");
        (bool success,) = _to.call{value:_amount}("");
        if(!success){
            revert CallFailed();
        }

    }
}