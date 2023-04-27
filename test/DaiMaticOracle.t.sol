// SPDX-License-Identifier: Apache-2.0
pragma solidity >=0.8.4;

import "forge-std/console.sol";
import "forge-std/Test.sol";
import "../src/DaiMaticOracle.sol"; 
import "../src/MockChainlinkOracle.sol"; 

contract DaiMaticOracleTest is DSTest {

    DaiMaticOracle daiMaticOracle;
    MockChainlinkOracle maticUsdOracle;
    MockChainlinkOracle daiUsdOracle;

    function setUp() public {
        maticUsdOracle = new MockChainlinkOracle(101070000, 8);
        daiUsdOracle = new MockChainlinkOracle(99992294, 8);

        daiMaticOracle = new DaiMaticOracle(address(daiUsdOracle), address(maticUsdOracle));

        console.log("setUp() complete");
    }

    function testGetPrice() public {
        int256 price = daiMaticOracle.getPrice();
        
        assertTrue(price == 98933703);
    }
}