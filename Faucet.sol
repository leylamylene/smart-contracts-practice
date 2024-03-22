// Here, we will implement a simplified version of an ERC20 faucet.
// The logic is very simple: we will transfer some ERC20 tokens to 
// the faucet contract, and users can use the requestToken() function
// of the contract to receive 100 units of the token. Each address
// can only receive tokens once.


// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract FaucetContract {
    event SendTokens(address recipient, uint256 amount);
    uint256 public allowedAmount = 100;
    address public  tokenAddress;
    mapping(address => bool) public requestedAddress ;

    constructor(address _tokenAddress){
        tokenAddress = _tokenAddress ;
    }

    function requestTokens()external {
            require(requestedAddress[msg.sender] ==false ,"Already got tokens");
            IERC20 token = new IERC20(tokenAddress);
            require(token.balanceOf[address(this)] >= allowedAmount , "Faucet empty");
            token.transfer(msg.sender , allowedAmount);
            requestedAddress[msg.sender] = true;
            emit SendTokens(msg.sender, allowedAmount);

    }

}