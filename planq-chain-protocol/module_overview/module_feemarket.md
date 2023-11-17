# module\_feemarket

**`feemarket` module**

#### Introduction&#x20;

The Huygen upgrade v0.7.0 on Planq Mainnet introduced the Feemarket module and EIP-1559 implementation. The new feemarket module allows a dynamic fee structure to be applied to the network. It allows for defining a common base fee for the network, and this base fee is calculated dynamically in each block for the next block allowing it to reflect the activity of the network.

With EIP-1559, the transaction fee itself is calculated with `fee = (baseFee + priorityTip)*gasLimit`, where `baseFee` is the fixed-per-block network fee per gas and `priorityTip` is an optional fee per gas added on extra to accelerate the transaction. However, Planq chain is based on Cosmos SDK which does not have a prioritization mechanism by nature, and transactions are first in and first out (FIFO) basis on the Planq chain. Thus, different from the regular EIP-1559 design, Planq feemarket module design does not have any “prioritization fee” mechanism than the Ethereum EIP-1559 design.

Therefore, on Planq at the current stage, `fee = gasFeeCap * gasLimit`, where the `gasFeeCap` is the maximum gas price and `gasLimit` is the gas amount. Increasing the total fee does not accelerate the transaction processing time on Planq, while the transaction still possibly can be rejected if you set up a too low-value arbitrary.



#### Overview

**Parameters**&#x20;

Below are the parameters for the `x/feemarket` module:



<table><thead><tr><th width="192">Key</th><th width="121">Type</th><th width="125">Default Values</th><th>Description</th></tr></thead><tbody><tr><td>NoBaseFee</td><td>bool</td><td>false</td><td>control the base fee adjustment</td></tr><tr><td>BaseFeeChangeDenominator</td><td>uint32</td><td>8</td><td>bounds the amount the base fee that can change between blocks</td></tr><tr><td>ElasticityMultiplier</td><td>uint32</td><td>2</td><td>bounds the threshold which the base fee will increase or decrease depending on the total gas used in the previous block</td></tr><tr><td>BaseFee</td><td>uint32</td><td>1000000000</td><td>base fee for EIP-1559 blocks</td></tr><tr><td>EnableHeight</td><td>uint32</td><td>0</td><td>height which enable fee adjustment</td></tr><tr><td>MinGasPrice</td><td>sdk.Dec</td><td>0</td><td>global minimum gas price that needs to be paid to include a transaction in a block</td></tr><tr><td>min_gas_multiplier</td><td>sdk.Dec</td><td>0</td><td>bounds the minimum gasUsed to be charged to senders based on the GasLimit</td></tr></tbody></table>

#### Base Fee

`baseFee` is a module param and works as the global state. It affects the amount of gas a transaction costs, not the `gasPrice`. The base fee is a global base fee defined at the consensus level. It is stored as a module parameter and is adjusted at the end of each block based on the total gas used in the previous block and gas target (`block gas limit/elasticity multiplier`):&#x20;

* It increases when blocks are above the gas target;
* It decreases when blocks are below the gas target.

**Effective Gas price**

For EIP-1559 transactions (dynamic fee transactions) the effective gas price describes the maximum gas price that a transaction is willing to provide. It is derived from the transaction arguments and the base fee parameter. The effective gas price is either the `baseFee + tip` or the `gasFeeCap`. Since `gasTipCap` is not applicable on Planq, `effectiveGasPrice = min(baseFee, gasFeeCap)` where `gasFeeCap >= baseFee`.

#### Minimum Gas Price

`minimum-gas-price` is a config param per node that only affects that specific node, `minimum-gas-prices` effect is a setting at the Cosmos level and only affects Cosmos-based transactions. In general, Ethereum users won't be affected because they will use the json-rpc endpoint to send the transaction. For an Ethereum transaction, the ante handler has been overwritten to ignore the `minimum-gas-prices` setting and only taking into consideration the global base-fee `Minimum-gas-prices` is a mandatory setting for node operators and should not be 0 for security reasons and it only affects low-level cosmos transactions (delegations, ibc relay messages etc).



#### **Queries**

The query commands allow users to query feemarket state:

**`./conosd query feemarket --help`**

The base-fee command allows users to query the block base fee by height.&#x20;

**`./planqd query feemarket base-fee [height] [flags]`**

The block-gas command allows users to query the block gas by height.&#x20;

**`./planqd query feemarket block-gas [height] [flags]`**

The params command allows users to query the module parameters.

**`./planqd query params subspace [subspace] [key] [flags]`**

The query with params command allows users to query the feemarket parameters.

**`./planqd query feemarket params [flags]`**



**REST endpoint**

The parameters can also be checked by browsing to the following REST endpoint on testnet:

[https://rest.planq.network/ethermint/feemarket/v1/params](https://rest.planq.network/ethermint/feemarket/v1/params)

```json
{
  "params": {
    "no_base_fee": false,
    "base_fee_change_denominator": 100000000,
    "elasticity_multiplier": 2,
    "enable_height": "2280800",
	    "base_fee": "1955046261113",
    "min_gas_price": "0.000000000000000000",
    "min_gas_multiplier": "0.500000000000000000"
  }
}
```
