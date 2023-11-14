# FAQs for Bridge transfers

#### What are the fees involved?

* The bridge service itself costs ~1 USD in native tokens per transaction. Additionally, the fees displayed are network gas fees which the blockchain infrastructure charges itself to process the transactions and vary depending on the network.
* For any bridge transaction, network gas fees are incurred on two chains: origin and destination.
  * For the origin chain gas fee, this will be displayed and settled directly on your wallet extension.
  * For the destination chain gas fee (“Bridge network fee”), our decentralised bridge is tasked to collect the appropriate gas fee and pay the network.

#### How fast is the transfer?

IBC Transfers will take between 1 min to 1 hour, depending on transfer congestion. After an hour, the transaction will either go through or revert with the funds sent back to your origin wallet.
Deltaswap Transfers are usually 10 sec to 30 minutes, depending how busy the network is.

#### Can I transfer assets to a different wallet than my own?

* For transfers between BSC and Planq, it will be transferred to the same wallet address you initiate the transfer with.
* This is to avoid manual typing and potential malware risks such as clipboard attacks.

#### What are the support blockchains and tokens?

The networks supported are:

* BSC (Deltaswap)
* Osmosis (IBC)
* Kujira (IBC)
* Ethereum (Coming soon)

#### What are the supported wallets?

* The initially supported wallets will be Leap Wallet, MetaMask, and Keplr.
* Please ensure to set the correct active network on your Wallet if it is supported.

#### Can I complete multiple transfers in one go?

While it is possible to have multiple ongoing transactions, we recommend having one transaction at a time, even if there is some waiting time to avoid issues and duplication.

#### Where can I report bugs and provide product feedback?

For any bug reports, or feedback please contact [info@deltaswap.io](mailto:info@deltaswap.io). This is for the web Deltaswap bridge only. 
For IBC Transfers, please ask in our [Telegram](https://t.me/PlanqNetwork) or [Discord](https://discord.gg/planq-network).

#### How do I find my missing funds?

Please check the transaction history table for your past transactions. If your transactions are not on the list, it was likely not initiated at all.

#### Is transferring tokens across blockchains safe?

* As with any decentralised application, there is a degree of risk related to code exploits and hacking.
* Our bridge code is publicly available. We leverage open-source code from the IBC protocol project and Deltaswap.


&#x20;
