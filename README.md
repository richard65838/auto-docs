# autoDocs

## Resumen y contexto del proyecto

El último mes he estado probando muchos temas con las reglas de Cursor y me han resultado muy interesantes. Les comparto algunos de los problemas que he tenido y algunas de las reglas que mejor me han funcionado. Estas reglas están lejos de ser perfectas, así que si les gustan y encuentran oportunidades de mejora, feliz que las conversemos o derechamente les hagan un PR.

### 1) Auto-docs
Las auto documentaciones son muy útiles pero también peligrosas: una alucinación en auto-docs termina siendo muy dolorosa porque cada vez que se utiliza, ese error se propaga y puede restar más que sumar. Probé MemoryBanks usados por la comunidad, pero la cantidad de alucinaciones que generaban terminó siendo un problema, ya que a veces se concentraban más en los siguientes pasos y mareaban sobre qué estaba implementado y qué no. 

Por otra parte, creo que la idea de un auto-docs es que sirva de índice para entender dónde y cómo buscar, o las decisiones de negocio, más que simplemente documentar la aplicación.

Por eso, hice una regla que analiza los proyectos que existen y, en base a eso, utiliza reglas por framework para hacer una documentación de proyecto. Esta regla tiene el foco de ser:
- Iterativa: puede irse profundizando con cada iteración.
- Doble checkeo para prevenir alucinaciones.
- Basada en framework para entender las decisiones importantes.

### 2) Generación de documentación en archivos
La documentación en los mismos archivos de programación va a adquirir mucha relevancia porque estos dan más contexto cuando Cursor comprende los archivos. Por eso, generé una regla que, independiente del archivo, genera una documentación estándar corta para el archivo (por ejemplo, para Ruby o TypeScript).

### 3) Scripts
Este es mi punto favorito: implementar scripts `.sh` que pueda ejecutar Cursor para recopilar contexto. Con estos scripts es como pasarle una nueva herramienta a Cursor. Yo genero la documentación con mi documentador y estos scripts, que siempre tienen un formato `@description`. Luego, con un script puedo obtener todas las `@description` y, al leer esto, Cursor entiende muy bien el modelo de datos, no solo su estructura sino cómo funciona en conjunto.

Actualmente solo tengo un script, que es para obtener descripciones de archivos, pero creo que aquí puede existir un gran potencial.

---

## ¿Qué es este repositorio?

Este repositorio contiene una colección de reglas y agentes para el sistema `.cursor` que permiten **generar y mantener actualizada la documentación de tu código de forma automática**. Está pensado para que, al integrarlo en cualquier proyecto, la documentación de archivos y del proyecto completo se mantenga siempre alineada con el estado real del código, sin esfuerzo manual.

---

## ¿Para qué sirve y por qué es útil?

- **Ahorra tiempo:** Olvídate de escribir documentación repetitiva o de actualizar manualmente descripciones cada vez que cambias el código.
- **Evita documentación desactualizada:** La documentación se actualiza automáticamente cuando hay cambios significativos en los archivos.
- **Mejora el onboarding:** Los nuevos integrantes del equipo pueden entender rápidamente el propósito y funcionamiento de cada archivo y del proyecto en general.
- **Facilita la colaboración:** Todos los miembros del equipo tienen acceso a documentación clara, concisa y siempre actualizada.
- **Extensible:** Puedes agregar soporte para cualquier framework o lenguaje creando nuevas reglas personalizadas.

---

## ¿Cómo se instala?

1. **Copia la carpeta `.cursor`** (y su contenido) en la raíz de tu proyecto.
2. **Asegúrate de tener Cursor instalado** en tu editor o entorno de desarrollo.
3. **Configura o ajusta las reglas** según los frameworks o lenguajes que uses (ver más abajo cómo hacerlo).

---

## ¿Cómo se utiliza?

- **Automático:** Una vez que las reglas están en tu proyecto, la documentación se genera y actualiza automáticamente cada vez que guardas o modificas archivos relevantes.
- **Personalizable:** Puedes modificar las reglas para adaptarlas a tus necesidades o estilo de documentación.
- **Documentación de archivos:** Por ejemplo, al modificar un componente React, se genera una breve descripción y un listado de props principales.
- **Documentación de proyecto:** Se puede generar un archivo resumen del proyecto (por ejemplo, `auto-docs/mi-proyecto.md`) con la estructura, componentes clave, integraciones, etc.
- **Scripts:** Puedes crear scripts para extraer información útil de la documentación generada y potenciar el contexto que Cursor puede utilizar.

---

## Ejemplo de utilidad

- **Proyectos React:** Al modificar un archivo `.jsx` o `.tsx`, se actualiza automáticamente la documentación del componente, incluyendo descripción y props.
- **Proyectos Ruby:** Al modificar un archivo `.rb`, se genera documentación YARD con propósito, dependencias y ejemplos de uso.
- **Cualquier otro framework:** Puedes crear tus propias reglas para que la documentación se adapte a tu stack.
- **Scripts personalizados:** Por ejemplo, puedes crear un script que extraiga todas las `@description` de tus archivos y así mejorar el contexto que Cursor utiliza.

---

## ¿Cómo agregar soporte para más frameworks?

1. **Crea un nuevo archivo de agente** en `.cursor/rules/documentation/file-documentation-agents/` o `project-documentation-agents/`.
2. **Define los patrones de archivos a observar** y las reglas de documentación que deseas aplicar.
3. **Ejemplo:**  
   Para un framework ficticio, podrías crear `.cursor/rules/documentation/file-documentation-agents/mi-framework-agent.mdc` con reglas específicas para tus archivos.

---

## Estructura del repositorio

```
.cursor/
  rules/
    documentation/
      file-documentation-agents/
        # Aquí puedes agregar tus propios agentes
      project-documentation-agents/
        react-agent.mdc
        rails-agent.mdc
        # Aquí puedes agregar tus propios agentes
  scripts/
    get_documentation.sh
auto-docs/
  # Aquí se generan los archivos de documentación global
```

---

## ¿Quién puede beneficiarse de este repositorio?

- Equipos que quieren mantener la documentación siempre actualizada sin esfuerzo manual.
- Proyectos con alta rotación de código o de integrantes.
- Cualquier desarrollador que quiera mejorar la calidad y claridad de la documentación de su código.

---

¿Tienes dudas o quieres ver un ejemplo concreto para tu stack?  
¡Abre un issue o revisa los ejemplos incluidos en la carpeta `.cursor/rules/documentation/`!
