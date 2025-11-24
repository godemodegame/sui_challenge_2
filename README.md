## Deployment

```bash
sui client publish
```

## Usage

After deployment, you can mint NFTs by calling the `mint_and_transfer` function:

```bash
sui client call \
  --package <PACKAGE_ID> \
  --module my_nft \
  --function mint_and_transfer \
  --args "NFT Name" "https://example.com/image.png" "NFT Description"
```

To complete the challenge, send the Deploy object to the `feed_rabbit` function.

```bash
sui client call \
  --package 0xaa3e79b37f336fa23ce354ddaa82391a7903690e78e46f61a197537be0b318b3 \
  --module display \
  --function feed_rabbit \
  --type-args <PACKAGE_ID>::my_nft::MyNFT \
  --args <DISPLAY_OBJECT_ID> \
```
