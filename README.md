# autoDocs

## Resumen del proyecto

Este repositorio proporciona un conjunto de reglas y agentes para el sistema `.cursor`, diseñados para **facilitar la generación y mantenimiento de documentación estructurada en tu proyecto**. El objetivo principal no es crear documentación exhaustiva de manera automática, sino servir como un **índice estratégico** que ayude a Cursor a comprender mejor la estructura y los componentes del código, optimizando así el contexto disponible para la inteligencia artificial durante el desarrollo.

- Documentacion Iterativa Incremental
- Documentacion basada en framework
- Orientacion en indice, y facilitar a la IA entender el proyecto

## Auto docs
En el chat de cursor escribe:
´´´
## Generar documentación del proyecto de cero
Utiliza `@generate-project-auto-docs.mdc` para generar o actualizar la documentación global del proyecto.

## Mejorar la documentación del backend
Utiliza `@generate-project-auto-docs.mdc` para mejorar la documentacion del backend.

## Generar la documentacion de un archivo
Utiliza `@generate-file-docs.mdc` para documentar 'ruta del archivo'

## Generar la documentacion de una carpeta
Utiliza `@generate-file-docs.mdc` para documentar iterativamente cada archivo en 'ruta de la carpeta'
---

## Organización de la documentación

El proyecto distingue entre dos tipos de documentación, cada una con un propósito específico:

- **Documentación generada automáticamente (`auto-docs/`):**  
  Esta carpeta contiene la documentación que se genera mediante los scripts y agentes definidos en el proyecto. Su objetivo es servir como un índice estructurado que ayude a Cursor y a la IA a comprender la arquitectura general, los componentes y las relaciones del código. Esta documentación se actualiza bajo demanda, ejecutando los scripts correspondientes.

- **Documentación manual (`documentation/`):**  
  Aquí los desarrolladores pueden agregar documentación escrita a mano sobre partes complejas, críticas o core de la aplicación. Esta documentación es clave para proporcionar contexto adicional que la generación automática no puede captar, como decisiones de diseño, explicaciones de lógica compleja o detalles de negocio. Cursor y la IA utilizan también esta información para mejorar su comprensión del proyecto.

**¿Por qué esta separación?**  
La separación permite mantener la documentación generada y la manual organizadas y accesibles. Así, los desarrolladores pueden complementar la documentación automática con explicaciones detalladas donde sea necesario, asegurando que tanto las herramientas automáticas como los miembros del equipo tengan acceso al contexto más relevante y actualizado.

---

## Formas de generar o actualizar la documentación

El sistema permite dos enfoques principales para la generación y actualización de la documentación, ambos ejecutados de manera manual según las necesidades del equipo:

### 1. Generación o actualización de auto-docs a nivel de proyecto

- **¿Cómo se realiza?**  
  Se ejecuta manualmente la regla `.cursor/rules/documentation/generate-project-auto-docs.mdc` para generar o actualizar la documentación global del proyecto en la carpeta `auto-docs/`.
- **¿Para qué sirve?**  
  Permite crear o actualizar la documentación estructurada del proyecto completo, o de una parte específica (por ejemplo, solo backend o solo frontend).
- **¿Cuándo usarlo?**  
  - Al iniciar un nuevo proyecto.
  - Cuando se han realizado cambios significativos en la arquitectura.
  - Para profundizar o mejorar la documentación en áreas que lo requieran.

### 2. Generación de documentación por archivos

- **¿Cómo se realiza?**  
  Se ejecuta manualmente la regla `.cursor/rules/documentation/generate-file-docs.mdc` para documentar un archivo específico, o de forma iterativa para varios archivos dentro de una carpeta.
- **¿Para qué sirve?**  
  Permite documentar archivos individuales, ideal para mantener actualizada la información de componentes, módulos o scripts particulares.
- **¿Cuándo usarlo?**  
  - Al crear o modificar archivos relevantes.
  - Para reforzar la documentación en archivos críticos o de alta complejidad.

---

## Propósito y beneficios

- **Mejora del contexto para IA:** La documentación generada y la manual actúan como un índice que permite a Cursor localizar y entender más eficientemente los elementos clave del proyecto.
- **Documentación bajo demanda:** La generación de documentación automática no es completamente automática; es necesario ejecutar los scripts o agentes correspondientes para actualizarla.
- **Evita documentación innecesaria:** El objetivo no es documentar por documentar, sino aportar información relevante que facilite la navegación y comprensión del código.
- **Facilita el onboarding y la colaboración:** Proporciona una visión clara de la estructura y los componentes principales del proyecto, útil para nuevos integrantes y para el trabajo en equipo.
- **Extensible:** Permite agregar soporte para cualquier framework o lenguaje mediante reglas personalizadas.

---

## Instalación

1. Copie la carpeta `.cursor` (y su contenido) en la raíz de su proyecto.
2. Configure o ajuste las reglas según los frameworks o lenguajes utilizados (ver sección correspondiente).

---

## Uso

- **Generación manual de documentación automática:** Es necesario ejecutar los scripts o agentes definidos para que se genere o actualice la documentación en `auto-docs/`. No se actualiza automáticamente con cada cambio en el código.
- **Documentación manual:** Agregue documentación relevante en la carpeta `documentation/` para cubrir partes complejas, críticas o core del sistema (opcional).
- **Documentación como índice:** Ambas carpetas sirven como referencia para Cursor y mejoran su capacidad de búsqueda y comprensión.
- **Personalizable:** Las reglas pueden adaptarse a las necesidades o estilo de documentación del equipo.
- **Documentación de archivos:** Por ejemplo, al ejecutar el script sobre un componente React, se genera una breve descripción y un listado de las principales props en `auto-docs/`, mientras que detalles complejos pueden documentarse manualmente en `documentation/`.

---

## Extensión a nuevos frameworks

1. Cree un nuevo archivo de agente en `.cursor/rules/documentation/file-documentation-agents/` o `project-documentation-agents/`.
2. Defina los patrones de archivos a observar y las reglas de documentación a aplicar.
3. Ejemplo:  
   Para un framework personalizado, cree `.cursor/rules/documentation/file-documentation-agents/mi-framework-agent.mdc` con las reglas correspondientes.

---

## Estructura del repositorio

```
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

## Público objetivo

- Equipos que buscan mejorar el contexto de la IA durante el desarrollo, sin generar documentación innecesaria.
- Proyectos con alta rotación de código o integrantes.
- Desarrolladores interesados en optimizar la calidad y claridad del contexto disponible para herramientas inteligentes.

---

¿Dudas o necesitas un ejemplo para tu stack?  
Abre un issue o revisa los ejemplos en `.cursor/rules/documentation/`.
