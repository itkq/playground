use std::io;
use std::io::{Seek, SeekFrom, Read};
use std::str;
use std::fs::File;

pub fn main() -> io::Result<()> {
    let mut f = File::open("foo.txt")?;
    let mut buffer = [0; 10];

    f.seek(SeekFrom::Start(42))?;
    f.read_exact(&mut buffer)?;

    let s = str::from_utf8(&buffer).unwrap();

    println!("{}", &s);

    Ok(())
}
