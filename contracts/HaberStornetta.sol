// SPDX-License-Identifier: MIT

pragma solidity 0.8.11;

import "./interface/IJaxAdmin.sol";
import "./lib/BEP20.sol";

contract HaberStornetta is BEP20 {
    
    IBEP20 WJXN;

    constructor(address _WJXN) BEP20("Haber-Stornetta", "Haber-Stornetta"){
        _setupDecimals(8);
        WJXN = IBEP20(_WJXN);
    }

    function fromWJXN(uint256 amountIn) public {
        WJXN.transferFrom(msg.sender, address(this), amountIn);
        _mint(msg.sender, amountIn * 1e8);
    }

    function toWJXN(uint256 amountOut) public {
        _burn(msg.sender, amountOut * 1e8);
        WJXN.transfer(msg.sender, amountOut);
    }

}