# 🔐 Secure Bash Password Manager

A simple, terminal-based password manager written in **Bash**. It uses **GPG** for symmetric encryption to securely store multiple credentials (service, username/email, and randomly generated passwords) in a single encrypted vault. Clipboard operations are supported via `xclip` (or `xsel`/`pbcopy`), and entries can be added, viewed, copied, or deleted through a menu-driven interface.

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
  - Copy password (or username/password) to clipboard, with auto-clear after 30 seconds
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
   git clone https://github.com/<your-username>/bash-password-manager.git
   cd bash-password-manager
