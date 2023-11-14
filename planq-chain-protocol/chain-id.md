---
meta:
  - name: title
    content: Planq | Planq EVM Chain | Chain ID and Address Format
  - name: description
    content: >-
      Find out more about Bech32 address, BIP-0173 address prefix and Chain ID
      format in this documentation.
  - name: og:title
    content: Planq | Planq EVM Chain | Chain ID and Address Format
  - name: og:type
    content: Website
  - name: og:description
    content: >-
      Find out more about Bech32 address, BIP-0173 address prefix and Chain ID
      format in this documentation.
  - name: og:image
    content: https://raw.githubusercontent.com/cosmos/chain-registry/master/planq/images/planq.png
  - name: twitter:title
    content: Planq | Planq EVM Chain | Chain ID and Address Format
  - name: twitter:site
    content: '@planqfoundation'
  - name: twitter:card
    content: summary_large_image
  - name: twitter:description
    content: >-
      Find out more about Bech32 address, BIP-0173 address prefix and Chain ID
      format in this documentation.
  - name: twitter:image
    content: https://raw.githubusercontent.com/cosmos/chain-registry/master/planq/images/planq.png
canonicalUrl: https://docs.planq.network/chain-details/chain-id.html
---

# Chain ID and Address Format

## Chain ID

Planq has different Chain IDs to distinguish between the _devnet_, _testnet_ and _mainnet_. When running Planq in your local environment, you will need to decide your own Chain ID.

For example, our mainnet Chain ID is `planq_7070-2`.

## Address prefix

[BIP-0173](https://github.com/satoshilabs/slips/blob/master/slip-0173.md) defines a new format for segregated witness output addresses that contains a human-readable part which identifies the coin type. Planq has different address prefixes for its corresponding network types, these prefixes are:

| Testnet |
|---------|
| `plq`  |

Planq uses the Bech32 address format wherever users must handle binary data. Bech32 encoding provides robust integrity checks on data and the human readable part (HRP) that provides contextual hints that can assist UI developers with providing informative error messages. Specifically, we have the following HRP prefixes for different address types in the mainnet:

|                    | Address bech32 Prefix |
| ------------------ |-----------------------|
| Account            | `plq`                 |
| Validator Operator | `plqvaloper`          |
| Consensus Nodes    | `plqvalcons`          |

We can use the `keys show` command of `planqd` with the flag `--bech <type> (acc|val|cons)` to obtain the addresses and keys as mentioned above. \
For example:

```bash
$ planqd keys show mykey --bech acc
- name: mykey
  type: local
  address: plq1c47uszfujup3ax0d5p4ges3pxa4ne9zqc20pgf
  pubkey: '{"@type":"/ethermint.crypto.v1alpha1.ethsecp256k1.PubKey","key":"A4KKhRCbnMr3mSqBfeeMPp3svRlPhnKlmxh6MmZ+AoR5"}'
  mnemonic: ""

$ planqd keys show test --bech val
- name: mykey
  type: local
  address: plqvaloper1c47uszfujup3ax0d5p4ges3pxa4ne9zqx5zmwc
  pubkey: '{"@type":"/ethermint.crypto.v1alpha1.ethsecp256k1.PubKey","key":"A4KKhRCbnMr3mSqBfeeMPp3svRlPhnKlmxh6MmZ+AoR5"}'
  mnemonic: ""

$ planqd keys show test --bech cons
- name: mykey
  type: local
  address: plqvalcons1c47uszfujup3ax0d5p4ges3pxa4ne9zqj838ze
  pubkey: '{"@type":"/ethermint.crypto.v1alpha1.ethsecp256k1.PubKey","key":"A4KKhRCbnMr3mSqBfeeMPp3svRlPhnKlmxh6MmZ+AoR5"}'
  mnemonic: ""
```
