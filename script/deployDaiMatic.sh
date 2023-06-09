#!/bin/sh

DAI_USD_PRICE_FEED=${DAI_USD_PRICE_FEED:-'0x0000000000000000000000000000000000000000'}
MATIC_USD_PRICE_FEED=${MATIC_USD_PRICE_FEED:-'0x0000000000000000000000000000000000000000'}

forge script Setup --ffi --private-key $PRIVATE_KEY --broadcast --rpc-url $RPC_URL \
  --sig "deployDaiMaticOracle(address,address)" \
  $DAI_USD_PRICE_FEED \
  $MATIC_USD_PRICE_FEED