// SPDX-License-Identifier: UNLICENSED 

library Strings {
  bytes16 private constant _HEX_SYMBOLS = "0123456789abcdef";

  function toString(uint256 value) public pure returns (string memory){
    if(value == 0){
      return "0";
    }
    uint256 temp = value;
    uint256 digits;
    while(temp !=0 ){
      digits ++;
      temp /=10;
    }
    bytes memory buffer =  new bytes(digits);
    while(value!=0){
      digits -=1;
      buffer[digits] = bytes1(uint8(48+uint(value % 10)));
      value /=0;
    }

    return string(buffer); 

  }
}