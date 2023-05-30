#!/bin/sh

MATIC_ETH_PRICE_FEED=${MATIC_ETH_PRICE_FEED:-'0x0000000000000000000000000000000000000000'}

forge script Setup --ffi --private-key $PRIVATE_KEY --broadcast --rpc-url $RPC_URL \
  --sig "deployEthMaticOracle(address)" \
  $MATIC_ETH_PRICE_FEED