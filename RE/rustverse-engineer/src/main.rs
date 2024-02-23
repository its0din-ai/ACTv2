use std::io;
use std::io::Write;

const STORED_PASSWORD: &str = "ACTCTF{f695d_simplest_r3verse_engin3er1ng_3v3r!_a3c96d607}";

fn main() {
    println!("Welcome to the Blazingly Fast Login System!");

    println!("Input password here:");
    print!("[>] ");
    io::stdout().flush().unwrap();
    let mut inpt_pass = String::new();
    io::stdin().read_line(&mut inpt_pass).expect("Something wen't wrong...");
    let inpt_pass = inpt_pass.trim();
    if inpt_pass == STORED_PASSWORD {
        println!("[+] EZ KANNN?");
    } else {
        println!("[-] EWW. SO SLOWWW  ^o^");
    }
}
