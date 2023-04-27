// SPDX-License-Identifier: Apache-2.0
pragma solidity >=0.8.4;

import "forge-std/Test.sol";
import "../../DaiMaticOracle.sol";
import "../../MockChainlinkOracle.sol";

contract Setup is Test {
    function deploy(address _daiUsdPriceFeed, address _maticUsdPriceFeed) public {
        address daiUsdPriceFeed;
        if (_daiUsdPriceFeed != address(0)) {
            daiUsdPriceFeed = _daiUsdPriceFeed;
        }
        else {
            vm.broadcast();
            daiUsdPriceFeed = address(new MockChainlinkOracle(99992294, 8));
        }

        address maticUsdPriceFeed;
        if (_maticUsdPriceFeed != address(0)) {
            maticUsdPriceFeed = _maticUsdPriceFeed;
        }
        else {
            vm.broadcast();
            maticUsdPriceFeed = address(new MockChainlinkOracle(101070000, 8));
        }

        vm.broadcast();
        DaiMaticOracle daiMaticOracle = new DaiMaticOracle(daiUsdPriceFeed, maticUsdPriceFeed);

        emit log_named_address("DAI_USD_ORACLE   ", daiUsdPriceFeed);
        emit log_named_address("MATIC_USD_ORACLE ", maticUsdPriceFeed);
        emit log_named_address("DAI_MATIC_ORACLE ", address(daiMaticOracle));
    }
}