# Contract Deployment

## Truffle: Deploy ERC20 Contract

### Step 1. Enter `smart-contract-example/truffle` folder

```bash
$ cd planq-smart-contract-example/truffle
```

### Step 2. Run `npm install` inside the folder

```bash
$ npm install
```

### Step 3. Make a copy of `.env.example` to `.env`

```bash
$ cp .env.example .env
```

### Step 4. Modify `.env` and fill _ONE_ of the field

```bash
MNEMONIC=goose easy ivory ...
PRIVATE_KEY=XXXXXXX
```

### Step 5. Review Migration Script at `migrations/2_deploy_planq_token.js`

```javascript
  const PlanqToken = artifacts.require("PlanqToken");
  
  module.exports = function (deployer) {
      deployer.deploy(PlanqToken, "Planq Token", "PLQ", "1000000000000000000000000");
  };
```

### Step 6. Endpoints setting

By default, the script will be using your local host `"127.0.0.1"` - If you are not running a localhost, you may leverage the public endpoint `https://evm-rpc.planq.network/` by making changes to `networks` in `truffle-config.js`, for example:

```json
  networks: {
    development: {
      provider: new HDWalletProvider(getHDWallet(), "http://127.0.0.1:8545"), // TODO
      network_id: "*",       // Any network (default: none)
    },
    testnet: {
      provider: new HDWalletProvider(getHDWallet(), "https://evm-rpc.planq.network/"), // TODO
      network_id: "*",
      skipDryRun: true
    },
  },
```

### Step 7. Deploy Contract

```bash
npm run deploy-contract-planq
```

### Step 8. Obtain Contract address from console and input to Metamask

Correct balance will be shown on Metamask page

![](../assets/planq-smart-contract/truffle\_deploy\_contract\_address.png)

![](../assets/planq-smart-contract/metamask\_add\_tokens.png) ![](../assets/planq-smart-contract/metamask\_add\_token\_success.png)

## Hardhat: Deploy ERC20 Contract

### Step 1. Enter `smart-contract-example/hardhat` folder

```bash
$ cd smart-contract-example/hardhat
```

### Step 2. Run `npm install` inside the folder

```bash
$ npm install
```

### Step 3. Make a copy of `.env.example` to `.env`

```bash
$ cp .env.example .env
```

### Step 4. Modify `.env` and fill _ONE_ of the field

```bash
MNEMONIC=goose easy ivory ...
PRIVATE_KEY=XXXXXXX
```

### Step 5. Review Migration Script at `scripts/deploy-planq-token.js`

```javascript
  async function main() {
      const PlanqToken = await hre.ethers.getContractFactory("PlanqToken");
      const planqToken = await PlanqToken.deploy("Planq Token", "PLQ", "1000000000000000000000000");
  
      await planqToken.deployed();
  
      console.log("PlanqToken deployed to:", planqToken.address);
  }
```

### Step 6. Endpoints setting

By default, the script will be using your local host `"127.0.0.1"` - If you are not running a localhost, you may leverage the public endpoint `https://evm-rpc.planq.network/` by making changes to `networks` in `hardhat.config.js`, for example:

```json
  networks: {
    development: {
      url: "http://localhost:8545",
      accounts: getHDWallet(),
     },
    testnet: {
      url: "https://evm-rpc.planq.network/",
      accounts: getHDWallet(),
    },
  },
```

### Step 7. Deploy Contract

```bash
npm run deploy-contract-planq
```

### Step 8. Obtain Contract address from console and input to Metamask

Correct balance will be shown on Metamask page

```bash
PlanqToken deployed to: 0x5F803c894a0A16B46fe5982fB5D89eb334eAF68
```

![](../assets/planq-smart-contract/metamask\_add\_tokens.png) ![](../assets/planq-smart-contract/metamask\_add\_token\_success.png)
