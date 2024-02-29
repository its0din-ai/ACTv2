use std::io;
use std::io::Write;

const STORED_PASSWORD: &str = "ACT_CTF{rust_is_saf3_but_wh0_wr1te_pa$$w0rd_0n_the_variable_like_th1s_is_a_dumb_269a18f6}";

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