# Planq General FAQ

#### **What is the difference between Planq Chain and Planq Chain?**

* Planq is an EVM-compatible (Ethereum Virtual Machine) chain powered by Ethermint, built on the Cosmos SDK, which allows rapid porting of apps and smart contracts from Ethereum and EVM-compatible chains. On Planq, users pay transaction fees in the $PLQ cryptocurrency.

If you are an application developer who is creating smart contracts in Solidity and would like to deploy decentralized applications in a permissionless environment, Planq is suitable for your needs.&#x20;

#### **Who is currently running as a validator on Planq?**&#x20;

Planq uses Proof of Stake (POS) consensus, a streamlined and scalable consensus mechanism based on the Tendermint POS consensus.&#x20;

There are currently 59 validators supporting the Planq network, all backed by our growing community.  (see the [list here](https://ping.pub/planq/staking)).

#### **How can I become a Planq validator?**&#x20;

Please see [here](../for-node-hosts/running-nodes/planq-mainnet/run-validator.md)

#### **What is the chain-ID for Planq Mainnet?**&#x20;

* Ethereum Chain ID: `7070`&#x20;
* Cosmos Chain ID: `planq_7070-2`

#### **What are the rate limits of the free JSON-RPC EVM endpoint for Planq?**&#x20;

* Planq Mainnet: rate limit is 300 req/min/IP&#x20;

If the limit is exceeded, the IP gets blocked for 1 minute. If you are expecting to consistently make more requests than what limits allow, you may consider setting up your own full node or contacting a commercial JSON-RPC endpoint provider (see Dev Tools & Integrations). You can also reach out to us on [Discord](https://discord.gg/planq-network) for assistance.

#### **If I increase the gas price, does it help to speed up my transaction?**&#x20;

The current mempool setting works on a first-come-first-serve manner. The Planq network does not yet support transaction prioritization using gas price or priority fee.
