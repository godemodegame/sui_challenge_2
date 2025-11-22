/*
/// Module: challenge2
module challenge2::challenge2;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions

module challenge2::my_nft {
  use std::string::String;
  use sui::transfer::public_transfer;
  use sui::transfer::transfer;
  use sui::display::new_with_fields;
  use sui::display::Display;
  use sui::package::claim;

  public struct MY_NFT has drop { }

  public struct MyNFT has key, store {
    id: UID,
    name: String,
    image_url: String,
    description: String
  }

  fun init(otw: MY_NFT, ctx: &mut TxContext) {
    let keys = vector[
        b"name".to_string(),
        b"image_url".to_string(),
        b"description".to_string()
    ];

    let values = vector[
        b"People".to_string(),
        b"".to_string(),
        b"I'm really scary with rabbits".to_string()
    ];
  
    let publisher = claim(otw, ctx);
    let mut display = new_with_fields<MyNFT>(
        &publisher, keys, values, ctx
    );
  
    display.update_version();

    public_transfer(publisher, ctx.sender());
    public_transfer(display, ctx.sender())
  }

  #[allow(lint(self_transfer))]
  public fun mint_and_transfer(name: String, image_url: String, description: String, ctx: &mut TxContext) {
    let my_nft = MyNFT {
        id: object::new(ctx),
        name,
        image_url,
        description
    };

    transfer(my_nft, ctx.sender())
  }
}
