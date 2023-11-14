# Free and commercial RPC endpoints

### Free RPC URLs for Planq

{% hint style="danger" %}
Public RPCs URL Updates: The Planq RPC endpoints have been updated in March 2021 (shown as below) and it is recommended that all users update the endpoints. The old endpoints are still available for compatibility but maybe deprecated later.
{% endhint %}

{% hint style="info" %}
Request Limits on Public RPCs: To provide a stable experience to users, there is a request rate limit on the public RPCs to ensure fair usage. If your application requires a higher usage, please consider setting up your own nodes or using a commercial node provider. You can also reach out to us on [Discord](https://discord.gg/planq-network) for assistance.
{% endhint %}

{% hint style="info" %}
Public RPCs Integration Tips: There are more than one machines serving the public RPC services. There is no guarantee that you are served by the same machine every time. For example, if you are broadcasting many transactions in a row, they will be sent to multiple machines that may not be perfectly in sync with respect to the account nonce, and this may cause your batch to fail.

If you are sending large numbers of transactions from your backend, consider setting up a single dedicated node.
{% endhint %}

{% tabs %}
{% tab title="Mainnet" %}
* **EVM HTTP JSON RPC (Web3 compatible)**
  * [https://evm-rpc.planq.network/](https://evm-rpc.planq.network/)
* **EVM HTTP Websocket (Web3 compatible)**
  * [https://evm-rpc-ws.planq.network/](https://evm-rpc-ws.planq.network/)
* **Block explorer**
  * [https://evm.planq.network/](https://evm.planq.network/)
* **Tendermint RPC**
  * [https://rpc.planq.network/](https://rpc.planq.network/)
* **Cosmos RESTful**
  * [https://rest.planq.network/](https://rest.planq.network/)
* **Cosmos gRPC Based**
  * [https://grpc.planq.network/](http://grpc.planq.network/)
{% endtab %}

{% tab title="3th party" %}
**EVM HTTP JSON RPC (Web3 compatible)**

Mainnet

* [https://jsonrpc.planq.nodestake.top/](https://jsonrpc.planq.nodestake.top/) (Nodestake)
{% endtab %}
{% endtabs %}
