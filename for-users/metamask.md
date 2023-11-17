---
meta:
  - name: title
    content: Planq | Planq EVM Chain | Using MetaMask
  - name: description
    content: >-
      Learn how to use the MetaMask chrome extension to send or receive and
      interact with the Planq testnet in this technical documentation.
  - name: og:title
    content: Planq | Planq EVM Chain | Using MetaMask
  - name: og:type
    content: Website
  - name: og:description
    content: >-
      Learn how to use the MetaMask chrome extension to send or receive and
      interact with the Planq testnet in this technical documentation.
  - name: og:image
    content: >-
      https://raw.githubusercontent.com/cosmos/chain-registry/master/planq/images/planq.png
  - name: twitter:title
    content: Planq | Planq EVM Chain | Using MetaMask
  - name: twitter:site
    content: '@planqfoundation'
  - name: twitter:card
    content: summary_large_image
  - name: twitter:description
    content: >-
      Learn how to use the MetaMask chrome extension to send or receive and
      interact with the Planq testnet in this technical documentation.
  - name: twitter:image
    content: >-
      https://raw.githubusercontent.com/cosmos/chain-registry/master/planq/images/planq.png
canonicalUrl: https://docs.planq.network/getting-started/metamask.html
---

# 🦊 MetaMask Configuration

In this guide, you will learn how to use the MetaMask extension on Google Chrome to send and receive tokens, and interact with the Planq network.

## Connecting with MetaMask

First, you will need to connect your MetaMask wallet to the Planq network:

* Click the "**My Account**" button in the top right corner. Then select **"Networks"** in the settings menu.

![](../.gitbook/assets/metamask\_1.png)

*   Click "**Add Network**":

    ![](../.gitbook/assets/metamask\_2.png)

{% tabs %}
{% tab title="Mainnet" %}
* **Name**: Planq
* **New RPC URL:**`https://evm-rpc.planq.network`;
* **Chain ID: 7070**
* **Symbol:**`PLQ`
* **Block explorer URL:**`https://evm.planq.network/`
{% endtab %}
{% endtabs %}

![](../.gitbook/assets/Metamask-settings.png)

* After saving the network configuration, we should be able to see the token in your address.

## Importing private keys to MetaMask

Alternatively, We can export the private keys by using the `unsafe-export-eth-key` command with `planqd.` For example:

```bash
planqd keys unsafe-export-eth-key mykey --keyring-backend test
```

It will show your private key and you can copy it for the next step. Click the "**My Account"** button at the top right corner again. Then, select "**Import Account**":

![](../.gitbook/assets/4.png)

Paste your private key string from the previous step and click "**Import"**.

![](<../.gitbook/assets/metamask\_3 (1) (1) (1) (1) (1) (1) (2).png>)

Once it has been connected, you should see your token balance and you can then begin performing transactions using your MetaMask wallet!

## Address conventions

Please note that the address format in Planq is in there form of bech32 `plq...` , we can use `planqd debug addr` to convert an address between hex and bech32. For example:

```bash
$ planqd keys list --keyring-backend test
  - name: mykey
    type: local
    address: plq1c47uszfujup3ax0d5p4ges3pxa4ne9zqc20pgf
    pubkey: '{"@type":"/ethermint.crypto.v1alpha1.ethsecp256k1.PubKey","key":"A4KKhRCbnMr3mSqBfeeMPp3svRlPhnKlmxh6MmZ+AoR5"}'
    mnemonic: ""

$ planqd debug addr plq1c47uszfujup3ax0d5p4ges3pxa4ne9zqc20pgf
    Address bytes: [197 125 200 9 60 151 3 30 153 237 160 106 140 194 33 55 107 60 148 64]
    Address (hex): C57DC8093C97031E99EDA06A8CC221376B3C9440
    Address (EIP-55): 0xc57DC8093C97031E99EdA06A8CC221376B3c9440
    Bech32 Acc: plq1c47uszfujup3ax0d5p4ges3pxa4ne9zqc20pgf
    Bech32 Val: plqvaloper1c47uszfujup3ax0d5p4ges3pxa4ne9zqx5zmwc

$ planqd debug addr 2F743F55AC49A446484988505244941DEDA1B60A
    Address bytes: [197 125 200 9 60 151 3 30 153 237 160 106 140 194 33 55 107 60 148 64]
    Address (hex): C57DC8093C97031E99EDA06A8CC221376B3C9440
    Address (EIP-55): 0xc57DC8093C97031E99EdA06A8CC221376B3c9440
    Bech32 Acc: plq1c47uszfujup3ax0d5p4ges3pxa4ne9zqc20pgf
    Bech32 Val: plqvaloper1c47uszfujup3ax0d5p4ges3pxa4ne9zqx5zmwc
```

{% hint style="info" %}
Remarks: You will need to add `0x` at the beginning when using the Ethereum HEX address shown as above. For example: `Address (hex): 2F743F55AC49A446484988505244941DEDA1B60A` implies that `0x2F743F55AC49A446484988505244941DEDA1B60A` will be the address in Ethereum.
{% endhint %}

## Resetting your account on MetaMask

If you come across any issue with your MetaMask account or if you have used your imported account to perform transactions in the legacy testnet, you can reset it by using the `Reset Account` function.

Simply go to `Setting/Advance` and click `Reset Account`:

![](../.gitbook/assets/Metamask-reset.png)
