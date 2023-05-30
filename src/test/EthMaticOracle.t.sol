// SPDX-License-Identifier: Apache-2.0
pragma solidity >=0.8.4;

import "forge-std/Test.sol";
import "../EthMaticOracle.sol"; 
import "../MockChainlinkOracle.sol"; 

contract EthMaticOracleTest is DSTest {

    EthMaticOracle ethMaticOracle;
    MockChainlinkOracle maticEthOracle;

    function setUp() public {
        maticEthOracle = new MockChainlinkOracle(481359417243419, 18);

        ethMaticOracle = new EthMaticOracle(address(maticEthOracle));

        console.log("setUp() complete");
    }

    function testGetPrice() public {
        int256 price = ethMaticOracle.getPrice();

        console.logInt(price);
        
        assertTrue(price == 2077449747896610195156);
    }
}