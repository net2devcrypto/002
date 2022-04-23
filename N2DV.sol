// SPDX-License-Identifier: MIT

pragma solidity 0.8.4;

import "https://github.com/net2devcrypto/002/Pausable.sol";
import "https://github.com/net2devcrypto/002/IN2DR.sol";
import "https://github.com/net2devcrypto/002/IERC721.sol";
import "https://github.com/net2devcrypto/002/ReentrancyGuard.sol";
import "https://github.com/net2devcrypto/002/ERC721Holder.sol";
import "https://github.com/net2devcrypto/002/IN2DVault.sol";
import "https://github.com/net2devcrypto/002/SafeERC20.sol";

contract N2DV is Pausable, ReentrancyGuard, ERC721Holder {
    using SafeMath for uint256;
    using SafeERC20 for IERC20;

    event NewVault(uint256 vaultId, address sender);
    IN2DVault public n2dvault;

    function initialize(address n2dvaultAddress) public initializer {
        initOwnable();
        initReentrancyGuard();
        n2dvault = IN2DVault(n2dvaultAddress);
    }

    function createVault(
        address _RewardContract,
        address _NFTContract,
        bool _isN2DVault
    ) public virtual nonReentrant returns (uint256) {
        onlyOwnerIfPaused(0);
        IN2DR N2DR = IN2DR(_RewardContract);
        require(N2DR.owner() == address(this), "Wrong owner");
        uint256 vaultId = n2dvault.addNewVault();
        n2dvault.setRewardContract(vaultId, _RewardContract);

        n2dvault.setN2DR(vaultId);
        if (!_isN2DVault) {
            n2dvault.setNftAddress(vaultId, _NFTContract);
            n2dvault.setNft(vaultId);
            n2dvault.setNegateEligibility(vaultId, true);
        } else {
            n2dvault.setN2DNFTContract(vaultId, _NFTContract);
            n2dvault.setN2DAsset(vaultId);
            n2dvault.setIsN2DVault(vaultId, true);
        }
        n2dvault.setManager(vaultId, msg.sender);
        emit NewVault(vaultId, msg.sender);
        return vaultId;
    }

}
