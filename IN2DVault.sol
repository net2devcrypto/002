// SPDX-License-Identifier: MIT

pragma solidity 0.8.4;

import "https://github.com/net2devcrypto/n2dstaking/002/EnumerableSet.sol";
import "https://github.com/net2devcrypto/n2dstaking/002/Ownable.sol";
import "https://github.com/net2devcrypto/n2dstaking/002/SafeMath.sol";
import "https://github.com/net2devcrypto/n2dstaking/002/IN2DR.sol";
import "https://github.com/net2devcrypto/n2dstaking/002/IERC721.sol";

interface IN2DVault {

    struct Vault {
        address RewardContract;
        address NFTContract;
        address manager;
        IN2DR N2DR;
        IERC721 nft;
        bool negateEligibility;
        bool isN2DVault;
        address NFTContract;
        IERC20 N2DAsset;
        uint256 N2DHoldings;
    }

    function vaultsLength() external view returns (uint256);

    function RewardContract(uint256 vaultId) external view returns (address);

    function NFTContract(uint256 vaultId) external view returns (address);

    function manager(uint256 vaultId) external view returns (address);

    function N2DR(uint256 vaultId) external view returns (IN2DR);

    function nft(uint256 vaultId) external view returns (IERC721);

    function negateEligibility(uint256 vaultId) external view returns (bool);

    function setRewardContract(uint256 vaultId, address _RewardContract) external;

    function setNftAddress(uint256 vaultId, address _NFTContract) external;

    function setManager(uint256 vaultId, address _manager) external;

    function setN2DR(uint256 vaultId) external;

    function setNft(uint256 vaultId) external;

    function setNegateEligibility(uint256 vaultId, bool negateElig) external;

    function setIsN2DVault(uint256 vaultId, bool _isN2DVault) external;

    function setN2DNFTContract(uint256 vaultId, address _NFTContract) external;

    function setN2DAsset(uint256 vaultId) external;

    function setN2DHoldings(uint256 vaultId, uint256 _d2Holdings) external;

    ////////////////////////////////////////////////////////////

    function addNewVault() external returns (uint256);
}
