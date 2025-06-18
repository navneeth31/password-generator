#!/bin/bash

VAULT="vault.txt.gpg"
TEMP_VAULT="vault_temp.txt"

# Function to generate a password
generate_password() {
    openssl rand -base64 48 | cut -c1-20
}

# Ask master password once
echo "🔐 Enter your master password to unlock vault:"
read -s MASTER_PASSWORD

# If vault exists, decrypt it
if [[ -f "$VAULT" ]]; then
    echo "$MASTER_PASSWORD" | gpg --batch --yes --passphrase-fd 0 --output "$TEMP_VAULT" --decrypt "$VAULT" 2>/dev/null
    if [[ $? -ne 0 ]]; then
        echo "❌ Wrong master password. Exiting..."
        exit 1
    fi
else
    touch "$TEMP_VAULT"
fi

# Add password
add_password() {
    echo "🔧 Service Name:"
    read SERVICE
    echo "👤 Username or Email:"
    read USER
    PASS=$(generate_password)
    echo "🔑 Generated Password: $PASS"

    echo "💾 Do you want to save this password? (y/n)"
    read SAVE

    if [[ $SAVE == "y" ]]; then
        echo "$SERVICE | $USER | $PASS" >> "$TEMP_VAULT"
        echo "✅ Saved!"
    fi
}

# View stored services
view_passwords() {
    echo "📂 Stored entries:"
    nl "$TEMP_VAULT"
}

# Copy a password
copy_password() {
    view_passwords
    echo "Enter the number to copy password:"
    read NUM
    ENTRY=$(sed -n "${NUM}p" "$TEMP_VAULT")
    PASSWORD=$(echo "$ENTRY" | cut -d "|" -f3)
    echo "$PASSWORD" | xclip -selection clipboard
    echo "✅ Password copied to clipboard!"
}

# Delete entry
delete_password() {
    view_passwords
    echo "Enter the number of the entry to delete:"
    read NUM
    sed -i "${NUM}d" "$TEMP_VAULT"
    echo "🗑️  Deleted!"
}

# Main menu
while true; do
    echo ""
    echo "🛡️  Password Manager Menu"
    echo "1. Add New Password"
    echo "2. View Saved Passwords"
    echo "3. Copy a Password"
    echo "4. Delete a Password Entry"
    echo "5. Exit"
    echo "Choose an option [1-5]:"
    read CHOICE

    case $CHOICE in
        1) add_password ;;
        2) view_passwords ;;
        3) copy_password ;;
        4) delete_password ;;
        5)
            # Re-encrypt and cleanup
            echo "$MASTER_PASSWORD" | gpg --batch --yes --passphrase-fd 0 -c -o "$VAULT" "$TEMP_VAULT"
            rm -f "$TEMP_VAULT"
            echo "🔒 Vault encrypted and saved. Goodbye!"
            exit
            ;;
        *) echo "❌ Invalid option" ;;
    esac
done
