entrada = input("Escribe los caracteres: ")
if entrada.isalpha():
    print("Es una palabra :) ")
elif entrada.isdigit():
    print("Es un numero :) ")
elif any(char.isdigit() for char in entrada) and any(char.isalpha() for char in entrada):
    print("Es compuesta")
else:
    print("Error")
    
