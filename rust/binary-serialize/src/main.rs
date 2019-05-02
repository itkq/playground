extern crate bincode;
use serde_derive::{Deserialize, Serialize};
use std::fs::File;
use std::io::BufWriter;

#[derive(Serialize, Deserialize, PartialEq, Debug)]
struct Entity {
    x: f32,
    y: f32,
}

#[derive(Serialize, Deserialize, PartialEq, Debug)]
struct World {
    entities: Vec<Entity>,
}

fn main() {
    let world = World {
        entities: vec![Entity { x: 0.0, y: 4.0 }, Entity { x: 10.0, y: 20.5 }],
    };

    let buffer = BufWriter::new(File::create("world.bin").unwrap());
    bincode::serialize_into(buffer, &world).unwrap();
}
