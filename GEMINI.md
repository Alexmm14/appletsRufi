# Directrices de Desarrollo y Arquitectura - appletsRufi

Este archivo es la guía de referencia y pauta de desarrollo para la colección de applets basados en Rofi para entornos Linux. Define la estructura del proyecto, las decisiones de arquitectura, las pautas de estilo y cómo interactuar con los diferentes scripts de configuración.

---

## 📖 Descripción General del Proyecto

`appletsRufi` es un repositorio que contiene un conjunto de scripts en Bash diseñados para proporcionar una interfaz moderna, funcional y rápida mediante **Rofi**. Estos applets permiten gestionar diversas funciones del sistema de forma eficiente:

- **Gestión de Energía**: Menús para suspender, reiniciar, apagar o bloquear la sesión (`powermenu.sh`, `rofi-power.sh`).
- **Control de Sistema**: Ajustes rápidos de volumen, brillo y gestión de batería (`volume.sh`, `brightness.sh`, `battery.sh`).
- **Utilidades**: Lanzadores rápidos de aplicaciones y accesos directos (`apps.sh`, `quicklinks.sh`).
- **Multimedia y Capturas**: Control de MPD y herramientas de captura de pantalla (`mpd.sh`, `screenshot.sh`).

---

## 📂 Estructura del Proyecto

El código está organizado para mantener una estructura plana y modular en el raíz:

```
/home/al3xmm14/Documentos/projects/appletsRufi/
├── appasroot.sh           # Script para ejecutar comandos con privilegios
├── apps.sh                # Lanzador de aplicaciones
├── battery.sh             # Monitor de batería
├── brightness.sh          # Control de brillo
├── mpd.sh                 # Controlador MPD
├── powermenu.sh           # Menú principal de energía
├── quicklinks.sh          # Lanzador de accesos directos
├── rofi-power.sh          # Script auxiliar de energía para Rofi
├── screenshot.sh          # Capturas de pantalla
├── volume.sh              # Control de volumen
├── COMMIT_CONVENTIONS.md  # Reglas para mensajes de commit
└── .git/
```

---

## 📐 Decisiones de Arquitectura y Extensibilidad

### 1. Interfaz de Rofi
Todos los scripts interactúan con `rofi` para mostrar menús. Al añadir nuevos applets o modificar los existentes:
- Asegúrate de que las llamadas a `rofi` mantengan una coherencia visual (colores, fuentes, dimensiones).
- Utiliza `-dmenu` para mostrar las opciones al usuario.

### 2. Ejecución con Privilegios (`appasroot.sh`)
- Si un script requiere permisos de superusuario, utiliza `appasroot.sh` como contenedor o adaptador para manejar la autenticación de forma segura (ej. utilizando `pkexec` o `sudo`).

### 3. Modularidad
- Cada script es independiente. Si un script requiere funcionalidad de otro, considera extraer la lógica común a un nuevo archivo de funciones auxiliares o, si es muy específico, duplica solo la lógica necesaria para mantener la autonomía de cada archivo.

---

## ✍️ Convenciones de Estilo y Código

Para mantener la armonía de la base de código, se definen estrictamente estas dos pautas de idioma:

### 1. Comentarios en Español
Todos los comentarios integrados en los archivos de código fuente, explicaciones de funciones y documentación complementaria deben escribirse en **español**.
```bash
# SÍ: Explicación clara en español de la función
# Obtiene el volumen actual del sistema
get_volume() {
    ...
}
```

### 2. Código en Inglés
Todos los identificadores de programación, incluyendo nombres de funciones, variables, constantes, parámetros y nombres de archivos de código deben escribirse en **inglés** de manera limpia e idiomática.
```bash
# SÍ: Variables y funciones en inglés
VOLUME_LEVEL=$(amixer get Master | grep -oE '[0-9]+%')
```

*Nota: Nunca mezclar idiomas en los nombres de variables. El estándar debe ser estrictamente código en inglés y comentarios en español.*

---

## 🚀 Flujo de Trabajo con Ramas (Git Workflow)

Para asegurar la estabilidad del proyecto, se establece el siguiente protocolo estricto:

1. **PROHIBIDO COMMIT DIRECTO**: Queda estrictamente prohibido realizar commits directamente sobre la rama principal (ej. `main` o `master`).

2. **Convenciones de Commit**:
   - `ADD(Descripción)`: Para nuevas funcionalidades o archivos.
   - `UPDATE(Descripción)`: Para actualizaciones o modificaciones.
   - `DELETE(Descripción)`: Para eliminación de código o archivos.
   - Cada archivo modificado debe ser un commit separado siguiendo el formato anterior.

3. **Verificación de Rama**:
   - ANTES de realizar cualquier modificación, crea una rama de trabajo: `git checkout -b feature/nombre-cambio`.

---


