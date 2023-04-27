// SPDX-License-Identifier: Apache-2.0
pragma solidity >=0.8.4;

contract MockChainlinkOracle {
    // is IChainlinkOracle

    int256 public immutable price;
    uint8 public immutable decimal;

    constructor(int256 _price, uint8 _decimal) {
        price = _price;
        decimal = _decimal;
    }

    function decimals() external view returns (uint8) {
        return decimal;
    }

    function latestRoundData() external view returns (uint80, int256, uint256, uint256, uint80) {
        return (
            uint80(1), // roundId
            price, // answer
            block.timestamp - 1, // startedAt
            block.timestamp, // updatedAt
            uint80(1) // answeredInRound
        );
    }

    function getRoundData(uint256) external view returns (uint80, int256, uint256, uint256, uint80) {
        return this.latestRoundData();
    }
}