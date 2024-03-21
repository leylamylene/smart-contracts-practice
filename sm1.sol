// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "./Strings.sol";
using Strings for uint256;
contract useLibrary{
  function getStrings(uint256 _number ) public pure returns (string memory){
    return _number.toString();
  }
}