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
  --package <PACKAGE_ID> \
  --module my_nft \
  --function call_feed_rabbit \
  --args <DISPLAY_OBJECT_ID>
```