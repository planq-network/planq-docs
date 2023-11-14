---
meta:
  - name: title
    content: Planq | Planq EVM Chain | Architecture
  - name: description
    content: >-
      Planq is an EVM sidechain along the main Planq Chain built on
      Ethermint with smart contract capability. It aims to empower and scale
      decentralised applications for the future multichain world.
  - name: og:title
    content: Planq | Planq EVM Chain | Architecture
  - name: og:type
    content: Website
  - name: og:description
    content: >-
      Planq is an EVM sidechain along the main Planq Chain built on
      Ethermint with smart contract capability. It aims to empower and scale
      decentralised applications for the future multichain world.
  - name: og:image
    content: https://raw.githubusercontent.com/cosmos/chain-registry/master/planq/images/planq.png
  - name: twitter:title
    content: Planq | Planq EVM Chain | Architecture
  - name: twitter:site
    content: '@planqfoundation'
  - name: twitter:card
    content: summary_large_image
  - name: twitter:description
    content: >-
      Planq is an EVM sidechain along the main Planq Chain built on
      Ethermint with smart contract capability. It aims to empower and scale
      decentralised applications for the future multichain world.
  - name: twitter:image
    content: https://raw.githubusercontent.com/cosmos/chain-registry/master/planq/images/planq.png
canonicalUrl: https://docs.planq.network/chain-details/architecture.html
---

# Architecture

## Overview

The Planq blockchain protocol is an [open-source project](https://github.com/planq-network/planq) based on:

* [Ethermint](https://github.com/evmos/ethermint), an open-source Cosmos application module that allows the portability of the Ethereum Virtual Machine (EVM), its go-ethereum client, and its solidity-based smart contracts to the Cosmos ecosystem.
* [Cosmos SDK](https://v1.cosmos.network/sdk), the leading development framework to build interoperable sovereign blockchains.
* [Tendermint’s](https://docs.tendermint.com/) Core BFT Proof-of-Stake consensus engine, a scalable and energy-efficient blockchain consensus.

The open-source Planq blockchain protocol is fast, cheap, and energy-efficient.

Going forward, Planq aims to leverage the best of what the Ethereum/EVM and Cosmos ecosystems both have to offer for end-users and developers.

## **Open-source project**

Please visit the [Github repository](https://github.com/planq-network/planq) to contribute to the Planq blockchain protocol.

## **Consensus**

The Planq consensus is commonly referred to as a proof-of-authority (POA) consensus, as it is a permissioned variant of the proof-of-stake consensus.

Please refer to the [Planq repository](https://github.com/planq-network/planq) for details.

Tendermint was selected by Planq as the underlying technology for several reasons:

* Backed by [formal research](https://eprint.iacr.org/2018/574.pdf)
* Robustly tested [implementation](http://jepsen.io/analyses/tendermint-0-10-2)
* Strong track record: Tendermint has been in continuous development since 2014, and has been adopted by several high-profile [projects](https://forum.cosmos.network/t/list-of-projects-in-cosmos-tendermint-ecosystem/243)
* Modular architecture: It offers flexibility regarding which applications are developed on top of it, and how they are developed.

## Further reading

Follow [this link](../planq-chain-protocol/planq-general-faq.md) for more information about the Planq chain protocol.
