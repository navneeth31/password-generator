# 🔐 Password Generator & Manager

A simple, terminal-based password manager written in **Bash**. It uses **GPG** for symmetric encryption to securely store multiple credentials (service, username/email, and randomly generated passwords) in a single encrypted vault. Clipboard operations are supported via `xclip` (or) `xsel`, and entries can be added, viewed, copied, or deleted through a menu-driven interface.

---

## 🔒 Features

- **Master Password Protection**  
  Unlocks and re-locks the vault with a single master passphrase.

- **Secure Storage**  
  All data is encrypted in `vault.txt.gpg` using GPG symmetric encryption.

- **Auto-Generated Passwords**  
  Generates strong 20-character random passwords via OpenSSL.

- **CRUD Operations**
  - Add new service credentials (service name, username/email, generated password)
  - View stored entries with line numbers
  - Copy password to clipboard, which auto-clear's after 30 seconds
  - Delete entries by selecting their line number

- **Clipboard Auto-Clear**  
  Sensitive data is cleared from the clipboard 30 seconds after copying.

- **Terminal-Only**  
  No GUI dependencies, works in any Unix-like terminal.

---

## 🚀 Prerequisites

- **Bash** (v4+)
- **GPG** (`gpg`) for encryption/decryption
- **OpenSSL** (`openssl`) for password generation
- **Clipboard Tool**:
  - **Linux**: `xclip` or `xsel` (install via `sudo apt install xclip`)
  - **macOS**: `pbcopy` (built-in)

---

## ⚙ Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/navneeth31/password-generator.git
   cd bash-password-manager
   ```
2. **Make the script executable**
   ```bash
   chmod +x password-manager.sh
   ```
3. **Install dependencies (if not already present)**
   ```bash
   sudo apt update
   sudo apt install gnupg openssl xclip
   ```

---

## 🎯 Usage

1. **Run the script**
   ```bash
   ./password-manager.sh
   ```
2. **Enter your master password (new or existing).**

   ![Image](https://github.com/user-attachments/assets/42267cd4-02e2-4491-b126-848af488fffa)

3. **Use the menu to:**
   - *Add New Password: Generate and optionally save a credential*
   - *View/Copy Passwords: List entries and copy data to the clipboard*
   - *Delete an Entry: Remove credentials by their line number*
   - *Exit: Re-encrypt the vault and exit's*
  
   ![Image](https://github.com/user-attachments/assets/8fe30293-1c0b-4acc-b024-d914e72c2fd7)

4. **Add New Password:** *Generate and optionally save a credential*

   ![Image](https://github.com/user-attachments/assets/364830bd-48ed-4974-ac0a-50db5da9adf0)

5. **View/Copy Passwords:** *List entries and copy data to the clipboard*

   ![Image](https://github.com/user-attachments/assets/2bc1d741-bec6-4bbf-a43c-dba07332ab5e)
   
6. **On exit, all data is securely re-encrypted to `vault.txt.gpg`**

   ![Image](https://github.com/user-attachments/assets/b78f1b00-0e19-409a-8dca-526b3b6b279e)

---

## 🛡 Security Considerations

- **Strong Master Password**  
  Choose a robust master passphrase—losing it means losing access to all stored data.
  
- **Vault Backup**  
  Periodically back up `vault.txt.gpg` to a secure location (offsite or encrypted storage).

- **Limit Clipboard Exposure**  
  Be cautious when copying sensitive data—clipboard auto-clears after 30 seconds, but avoid pasting into insecure environments.

- **File Permissions**  
  Ensure `vault.txt.gpg` and `vault_temp.txt` (while in use) have restrictive permissions
  ```bash
  chmod 600 vault.txt.gpg
  ```
