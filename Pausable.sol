// SPDX-License-Identifier: MIT

pragma solidity 0.8.4;

import "https://github.com/net2devcrypto/n2dstaking/002/Ownable.sol";
import "https://github.com/net2devcrypto/n2dstaking/002/SafeMath.sol";

contract Pausable is Ownable {
    mapping(uint256 => bool) isPaused;

    function onlyOwnerIfPaused(uint256 pauserId) public view virtual {
        require(!isPaused[pauserId] || msg.sender == owner(), "Paused");
    }

    function setPaused(uint256 pauserId, bool _isPaused)
        public
        virtual
        onlyOwner
    {
        isPaused[pauserId] = _isPaused;
    }
}
