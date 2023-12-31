---
description: Quick-start resource if you are hacking and need to integrate with Planq.
---

# 🏅 Hacker's getting started resources

## Overview of Planq chain

[Planq](https://planq.network) A leading Ethereum-compatible layer 1 blockchain network built on the Cosmos SDK, supported by Leap Wallet, and more than[ 500 app developers and partners.](#user-content-fn-1)[^1] At Planq, the vision is to create a global community empowered by our mobile-first decentralized permissionless ecosystem, where financial freedom is accessible and transparent for all, not just the wealthy and fortunate.

## How to stand out and win in a Web3 hackathon 🥇

Check out our [blog post](https://medium.com/@planq/).

## Hack with Planq 🥚[^2]

Developing dApps on Planq is as easy as developing them on any of the major EVM-compatible chains: write and test solidity with Hardhat, deploy your contract, connect your frontend or your backend with ethers.js, and connect your wallet with MetaMask or Leap Wallet.

The native cryptocurrency of Planq mainnet is $PLQ, while the testnet uses TPLQ.

**Planq overview & key links for developers**

* Planq docs: [https://docs.planq.network](https://docs.planq.network)

**MetaMask end-user configuration**

* For more details, see [Metamask configuration](../for-users/metamask.md)

**JSON-RPC endpoint configuration**

*   For most use cases you can use the free endpoints that are provided by Planq. Most developers use a configuration file that looks like this:

    For Hardhat:

    ```json
    {
    "planq_mainnet": {
          "chainId": 7070,
          "url": "https://evm-rpc.planq.network/",
          "gasPrice": 5000000000000,
          "blockExplorer": "https://evm.planq.network/",
          "blockExplorerPrefix": "https://evm.planq.network/tx/"
        }    
    }
    ```

    or, using EIP1559 in a Node.js backend:

    ```json
    {
    "planq_mainnet": {
          "id": 7070,
          "url": "https://evm-rpc.planq.network/",
          "maxPriorityFeePerGas": 5000000000,
          "maxFeePerGas": 6000000000000,
          "blockExplorer": "https://evm.planq.network/",
          "blockExplorerPrefix": "https://evm.planq.network/tx/"
        }
    }
    ```

## Essential developer tools 💻

Write, test and deploy smart contracts

* Smart contracts library: [OpenZeppelin](https://www.openzeppelin.com/)
* Compile & test: [Hardhat](https://hardhat.org/)

Connect your Dapp to the blockchain

* Web3 library for Javascript / Typescript: [ethers.js](https://docs.ethers.io/v5/), [web3.js](https://web3js.readthedocs.io/)
* Web3 library for Python: [web3.py](https://web3py.readthedocs.io/)

## Developer support ☎️

Please visit the #general channel on the Planq [Discord](https://discord.gg/planq-network) server.

Feedback is a gift! [Let us know](mailto:info@planq.network) if there is anything that we can improve in this documentation.

Socials: [Twitter](https://twitter.com/planqfoundation) | [Telegram](https://t.me/PlanqNetwork) | [Discord](https://discord.gg/planq-network)

[^1]: 

[^2]: is this egg emoji?

