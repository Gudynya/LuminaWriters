# Especificación: producto (LuminaWriter)

## Resumen

**LuminaWriter** es una aplicación pensada para **acompañar la escritura creativa**: ofrecer un punto de entrada claro (landing), acceso a cuentas de usuario y un **espacio de trabajo** posterior al inicio de sesión, con una primera **gestión de obras literarias** en la sección Proyectos (demo en memoria).

## Objetivos

1. **Descubrimiento:** comunicar de forma clara el valor del producto en la zona pública.
2. **Acceso:** permitir registro, inicio de sesión y recuperación de credenciales (flujo de autenticación desde la UI).
3. **Continuidad:** tras autenticarse, dirigir al usuario a un **shell** (layout principal) con secciones navegables (**Inicio**, **Proyectos**, **Comunidad**, **Ajustes**).
4. **Proyectos (MVP):** crear, listar, editar y eliminar **obras literarias** de demostración almacenadas **solo en memoria** (sin persistencia entre sesiones), con metadatos básicos y descripción en Markdown.

## Audiencia

- Escritores y escritoras que buscan una experiencia guiada y moderna.
- Uso previsto en **web** y **Android** (misma base de código Flutter).

## Alcance actual (MVP de interfaz)

- Navegación por rutas con nombre (`MaterialApp` / `routes`).
- Pantallas de landing, login, registro, recuperación de contraseña y **shell principal** (`/home`).
- **Shell:** `IndexedStack` con secciones; **drawer** con navegación (tres entradas principales + **Ajustes** y **Cerrar sesión** en el pie); **selector de idioma** (banderas) en la parte inferior del drawer; pestaña de biblioteca pública renombrada a **Comunidad** en copy (i18n).
- **Proyectos:** CRUD de obras literarias en RAM: nombre de proyecto, nombre público, idioma de la obra (`es` / `en` / `ca`), descripción Markdown (editor con vista previa), tags; formulario en **pantalla completa**; reglas de UX para añadir obra (botón de texto vs FAB según número de obras).
- **Internacionalización** `ca` / `en` / `es` (ARB, `AppLocalizations`); idioma inicial según navegador o sistema; selector en **landing, login y registro** (esquina inferior derecha); usuario autenticado cambia idioma desde el **drawer** (sin persistencia obligatoria entre sesiones).
- Pruebas de widget sobre flujos básicos de navegación donde existan.

## Fuera de alcance (por ahora)

- Backend de autenticación persistente obligatorio (el código puede simular éxito o dejar hooks).
- **Persistencia** de obras literarias entre sesiones o sincronización en la nube.
- Colaboración en tiempo real o motor de composición larga fuera del Markdown de descripción de obra (salvo que un cambio OpenSpec lo introduzca de forma explícita).

## Principios de diseño

- **Material 3** como base visual; coherencia entre pantallas públicas y área autenticada.
- Textos y rutas **estables** donde se usen como contrato (p. ej. constantes compartidas con tests).
- Accesibilidad: objetivos táctiles razonables, contraste y navegación predecible.

## Dependencias con otras capacidades

- La realización técnica vive en la especificación **client** (`../client/spec.md`).
