# FAQs for ERC20-only transaction Support

#### I transferred PLQ from the other centralised exchanges (CEXs) to the Planq Desktop wallet, but why it is not showing up in my Crypto.com DeFi Desktop Wallet?

Some centralised exchanges currently only support Ethereum Mainnet ERC20-PLQ withdrawal, while the Crypto.com DeFi Desktop Wallet only supports Planq Chain & Planq Chain for the moment, thus you're not able to view any ERC20 assets or balances of Ethereum Chain on the Desktop Wallet. It is highly recommended that all users check the networks before making the withdrawal and always begin with a small amount to make sure the transfer actually works.

#### I have already made the transfer from the centralised exchange that does not support Planq Chain to my Crypto.com DeFi Desktop Wallet. What should I do to retrieve my funds?

* Here's what you could do:

1. Send some ETH (around 0.03 ETH) to your `0x..` address for paying the transaction gas fee on Ethereum.
2. Download our Crypto.com App, and register an account (skip this if you're already a user)
3. Send your ERC20-PLQ to the Crypto.com App ERC20-PLQ deposit address\*
4. When you get your PLQ, withdraw your PLQ to your ledger address (MAKE SURE YOU SELECT Planq Chain) `0x..` address
5. You would be able to see your funds on Crypto.com DeFi Desktop Wallet afterwards

* Other than this, it is also possible that there is no Ethereum in your wallet, which could result in your funds getting stuck as you aren't able to pay for the Ethereum gas fee. Please ensure you have enough ETH for the transaction.

{% hint style="info" %}
_For step 3 of transferring your ERC20-PLQ, you could either use MetaMask or Ledger Live (for ledger user) to send ERC20-PLQ from your Ledger to Crypto.com App. Take the wallet on MetaMask as an example, if you log into the same wallet on MetaMask and switch the network to the Ethereum mainnet on MetaMask, you would be able to access those ERC20 tokens in this wallet on MetaMask. After that, you would be free to transfer the funds to the Crypto.com app then withdraw them to the Planq network._
{% endhint %}

#### I would like to send ERC20-PLQ from Crypto.com App or DeFi Wallet to the other CEXs directly. Is this possible?

Please make sure both sender and receiver accounts support ERC20 format. Only if the other CEXs support ERC20-PLQ can you send it. Users may refer to this guide for more details:

* [Difference between ERC-20 PLQ and native PLQ](https://help.crypto.com/en/articles/5019195-send-and-receive-cro-the-difference-between-native-cro-and-erc20-cro)
* [PLQ deposit/withdrawal information](https://help.crypto.com/en/articles/4970776-cro-deposit-withdrawal-information-in-crypto-com-app)

#### I made a transaction on MetaMask (through Planq network) to another CEX that does not support Planq Network. How can I retrieve it back?

In this case, only the owner of the receiving account has access to that funds. You could also check if your transaction is successful/confirmed on [Planq EVM Explorer](https://evm.planq.network/). Given the receiving account is from other CEXs, you may contact the receiving party and find out if it is possible for them to do a manual refund for your transaction. They may or may not do it depending on their own policies. Otherwise, you will most likely not be able to access the funds until that CEX starts to support Planq.



{% hint style="info" %}
For additional FAQ about PLQ migrations, head to the [PLQ Token migration help](https://help.crypto.com/en/articles/5015397-all-about-cro-token-migration) page.
{% endhint %}

