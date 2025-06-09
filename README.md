# 🚀 autoDocs

## 📚 Resumen del Proyecto

Este repositorio proporciona reglas y agentes para el sistema `.cursor`, diseñados para **facilitar la generación y mantenimiento de documentación estructurada** en tu proyecto.  
El objetivo principal es servir como un **índice estratégico** que ayude a Cursor y a la IA a comprender mejor la estructura y los componentes del código.

---

### ✨ Características principales

- 📈 Documentación iterativa e incremental
- 🧩 Basada en frameworks
- 🗂️ Orientada a índice, para facilitar la comprensión del proyecto por la IA

## Mejorar la documentación del backend
Abre el modo agente de cursor y escribe:
```
Utiliza `@generate-project-auto-docs.mdc` para mejorar la documentacion del backend.
```

## Generar la documentacion de un archivo
```
Utiliza `@generate-file-docs.mdc` para documentar 'ruta del archivo'
```

## Generar la documentacion de una carpeta
Abre el modo agente de cursor y escribe:
```
Utiliza `@generate-file-docs.mdc` para documentar iterativamente cada archivo en 'ruta de la carpeta'
```

---

## 🏗️ Organización de la documentación

- **Documentación generada automáticamente (`auto-docs/`):**  
  Esta carpeta contiene la documentación que se genera mediante la ejecucion de la regla .cursor/rules/documentation/generate-project-auto-docs.mdc la que se encarga de llamar a los agentes de los frameworks para generar la documentacion. 
  El objetovo de la Auto-docs es servir como un índice estructurado que ayude a Cursor y a la IA a comprender la arquitectura general, los componentes y las relaciones del código. Esta documentación se actualiza bajo demanda, ejecutando la regla manualmente.

> **¿Por qué esta separación?**  
> Permite complementar la documentación automática con explicaciones detalladas, asegurando contexto relevante y actualizado.

---

## 🛠️ ¿Cómo generar o actualizar la documentación?

### 1️⃣ A nivel de proyecto

- Ejecuta la regla:  
  ```
  Abre el modo agente de cursor y escribe:
  Utiliza la regla .cursor/rules/documentation/generate-project-auto-docs.mdc para generar la documentacion del proyecto.
  ```
- Útil para:  
  - Iniciar un nuevo proyecto
  - Cambios significativos en la arquitectura
  - Mejorar áreas específicas (backend, frontend, etc.)

### 2️⃣ Por archivos o carpetas

- Ejecuta la regla:  
  ```
  Utiliza la regla 
  .cursor/rules/documentation/generate-file-docs.mdc para documentar el siguiente archivo: path archivo
  ```
- Útil para:  
  - Crear o modificar archivos relevantes
  - Documentar archivos críticos o complejos

---

## 🎯 Beneficios

- **Mejora el contexto para IA:** Facilita la comprensión de los elementos clave del proyecto.
- **Documentación bajo demanda:** Se actualiza manualmente, evitando documentación innecesaria.
- **Facilita onboarding y colaboración:** Proporciona una visión clara de la estructura del proyecto.
- **Extensible:** Soporta cualquier framework o lenguaje mediante reglas personalizadas.

---

## 🚦 Instalación

1. Copia la carpeta `.cursor` (y su contenido) en la raíz de tu proyecto.
2. Configura las reglas según los frameworks o lenguajes utilizados.

---

## 📝 Uso

- Ejecuta los scripts o agentes definidos para generar/actualizar la documentación en `auto-docs/`.
- Agrega documentación relevante en `documentation/` para cubrir partes complejas o críticas (opcional).
- Personaliza las reglas según las necesidades del equipo.

---

## 🧩 Extensión a nuevos frameworks

1. Crea un archivo de agente en `.cursor/rules/documentation/file-documentation-agents/` o `project-documentation-agents/`.
2. Define los patrones de archivos y reglas de documentación.

---

## 📁 Estructura del repositorio

```plaintext
.cursor/
  rules/
    documentation/
      file-documentation-agents/
        # Agentes personalizados para archivos
      project-documentation-agents/
        react-agent.mdc
        rails-agent.mdc
        # Agentes personalizados para generacion de auto-docs por proyecto
  scripts/
    get_documentation.sh
documentation/
  # Documentación manual agregada por los desarrolladores para partes complejas o core
auto-docs/
  # Documentación generada automáticamente mediante scripts y agentes
```

---

## 👥 Público objetivo

- Equipos que buscan mejorar el contexto de la IA durante el desarrollo.
- Proyectos con alta rotación de código o integrantes.
- Desarrolladores interesados en optimizar la calidad y claridad del contexto para herramientas inteligentes.

---

## 💡 Ejemplo de uso

### Generar la documentación de todos los modelos de un proyecto Rails

### Generar la documentacion de todos los modelos de un proyecto rails

```
1) Abre el modo agente de cursor y escribe:
Utiliza .cursor/scripts/get_documentation.sh en la carpeta de los modelos para obtener todos los modelos y sus descripciones.
2) Con este contexto, escribe:
Utiliza `@generate-file-docs.mdc` para generar la documentacion de los modelos que no tengan documentacion.
```
