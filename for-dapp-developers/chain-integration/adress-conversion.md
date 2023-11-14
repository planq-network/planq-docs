# Adress Conversion

As explained in [chain-id.md](../../planq-chain-protocol/chain-id.md "mention"), Planq uses the Bech32 address format. \
In order to convert between a Bech32 format address and an Ethereum format address, we provide the following sample code below:



### Python implementation

In order to convert from Bech32 `plq...` address to a Ethereum `0x...` address:

````python
```python
import bech32

bech32_address = input("Please enter a plq address: ")
#bech32_address = "plq1c47uszfujup3ax0d5p4ges3pxa4ne9zqc20pgf"

_, bz = bech32.bech32_decode(bech32_address)
hexbytes=bytes(bech32.convertbits(bz, 5, 8))
eth_address = '0x' + hexbytes.hex()
print(eth_address)
#0xc57DC8093C97031E99EdA06A8CC221376B3c9440
```
````

Vice versa, in order to convert from an Ethereum `0x...` to a Bech32 `plq...` address:

````python
```python
import bech32

eth_address = input("Please enter a ETH address (0x...): ")
#eth_address = "0xc57DC8093C97031E99EdA06A8CC221376B3c9440"
eth_address_bytes = bytes.fromhex(eth_address[2:])

bz = bech32.convertbits(eth_address_bytes, 8, 5)
bech32_address = bech32.bech32_encode("plq",bz)
print(bech32_address)
#plq1c47uszfujup3ax0d5p4ges3pxa4ne9zqc20pgf
```
````



