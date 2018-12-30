# RS IoT Blockchain Demonstrators

![Electronica 2018 Connected Stand](/images/stand.jpg)

The code in this repository is from a set of IoT Blockchain demonstrators constructed for [Electronica](https://electronica.de) 2018, built upon the Raspberry Pi platform and which integrate sensors and outputs, a private Ethereum network with supporting smart contracts, plus MQTT for real-time data.

For a more detailed introduction, see [RS IoT Blockchain Demonstrators Part 1: Introduction](https://www.rs-online.com/designspark/rs-iot-blockchain-demonstrators-part-1-introduction).

## Purpose

This code is being published in support of the DesignSpark blog post series and the hope that it may prove useful to others developing similar applications. While it is not anticipated that anyone would want to try and recreate the demonstrators as-is, notes are included below to assist in reusing these resources. 

## Contents

The directory structure is as follows:

      etc/                   - Configuration files
      python/                - Host applications
      solidity/              - Ethereum smart contracts 
      systemd/               - systemd unit files

## Notes

In order to reuse the code provided here certain changes would have to be made.

### Smart contracts

The smart contracts are packaged as a [Truffle](https://truffleframework.com/) project.

Ethereum account addresses are hardcoded and at the very least these would need to be updated.

If the Ethereum node is running on an IP/port other than 127.0.0.1:8545, or the network ID used is not 555, the appropriate network parameters would need to be updated in _truffle.js_.

For further details, see [RS IoT Blockchain Demonstrators Part 4: Blockchain Network](https://www.rs-online.com/designspark/rs-iot-blockchain-demonstrators-part-4-blockchain-network).

### Python code

Dependencies vary depending upon the script and include:

* DesignSpark.Pmod
* luma.led_matrix
* paho-mqtt
* PyYAML
* pyzmq
* smbus-cffi
* web3

If an import fails on execution, install the dependency with _pip3_.

For further details, see [RS IoT Blockchain Demonstrators Part 5: Host Software](https://www.rs-online.com/designspark/rs-iot-blockchain-demonstrators-part-5-host-software).

### Configuration files

If config files are not located in _/opt/iotbc/etc/_ the Python scripts will need updating.

Each demonstrator only requires two files: the corresponding ABI file and _config.yml_ file.

#### ABI

Should a smart contract be updated such that its ABI changes, the JSON that is generated following _truffle compile_ will need to be used to update the corresponding ABI file, e.g. _CarCrashABI.json_.

#### config.yml

At the very least the following parameters would need to be updated:

* boot_node - enode URL will be specific to the actual boot node IP address and key
* account - the address of the locally configured Ethereum account
* contract - the address for that demonstrator smart contract (emitted upon running _truffle migrate_) 

### systemd

All demonstrators require:

* buttons.service
* eth-leds.service
* eth-node.service

However, on all nodes but the miner, the eth-node.service file should be modified to remove the _Requires=_ line altogether, and to remove from the _After=_ line the units, _eth-bootnode.service_ and _mqtt-broker.service_.

The _eth-bootnode_ unit only needs configuring on the miner.

Obviously the use case-specific unit files, e.g. _car-crash_, are only configured on the associated demonstrator.

## Licence

Copyright (C) 2018 RS Components Ltd.

This software is published under the Apache License Version 2.0.
