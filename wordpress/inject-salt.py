with open("salt.txt", "r") as f:
    salt = f.read()
    salt = salt.replace("; define", ";\ndefine")
    print(salt)
    print("==> 💉 injecting salt into wp-config")
    raw = ""
    with open("wp-config.php", "r") as config:
        raw = config.read()
        raw = raw.replace("{{SALT}}", salt)
    with open("wp-config.php", "w") as config:
        config.write(raw)