// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

import "https://github.com/net2devcrypto/n2dstaking/N2DRewards.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";

interface IN2DRVault {

        struct Vault {
        address N2DRAddress;
        address assetAddress;
        N2DRewards N2DR;
        ERC721Enumerable nft;
    }

    function N2DRAddress(uint256 vaultId) external view returns (address);
    function assetAddress(uint256 vaultId) external view returns (address);
    function N2DR(uint256 vaultId) external view returns (N2DRewards);
    function nft(uint256 vaultId) external view returns (ERC721Enumerable);
    function setN2DRAddress(uint256 vaultId, address _N2DRAddress) external;
    function setNftAddress(uint256 vaultId, address _assetAddress) external;
    function setN2DR(uint256 vaultId) external;
    function setNft(uint256 vaultId) external;
    function addNewVault() external returns (uint256);
    
}
