def clasificar_cadena(cadena):
    if cadena.isdigit():
        return "Número entero"
    elif cadena.isalpha():
        return "Palabra"
    elif cadena.isalnum():
        return "Mixta (letras y números)"
    else:
        return "La cadena contiene caracteres especiales."

# Solicitar entrada al usuario
cadena_usuario = input("Por favor, ingrese una cadena de caracteres: ")

# Clasificar y mostrar el resultado
resultado = clasificar_cadena(cadena_usuario)
print(f"La cadena '{cadena_usuario}' es: {resultado}")
