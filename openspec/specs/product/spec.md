# Especificación: producto (LuminaWriters)

## Resumen

**LuminaWriters** es una aplicación pensada para **acompañar la escritura creativa**: ofrecer un punto de entrada claro (landing), acceso a cuentas de usuario y un espacio de trabajo posterior al inicio de sesión.

## Objetivos

1. **Descubrimiento:** comunicar de forma clara el valor del producto en la zona pública.
2. **Acceso:** permitir registro, inicio de sesión y recuperación de credenciales (flujo de autenticación desde la UI).
3. **Continuidad:** tras autenticarse, dirigir al usuario a un **shell** (layout principal) preparado para evolucionar hacia herramientas de escritura.

## Audiencia

- Escritores y escritoras que buscan una experiencia guiada y moderna.
- Uso previsto en **web** y **Android** (misma base de código Flutter).

## Alcance actual (MVP de interfaz)

- Navegación por rutas con nombre (`MaterialApp` / `routes`).
- Pantallas de landing, login, registro, recuperación de contraseña y shell principal.
- Pruebas de widget sobre flujos básicos de navegación donde existan.

## Fuera de alcance (por ahora)

- Backend de autenticación persistente obligatorio (el código puede simular éxito o dejar hooks).
- Sincronización en la nube, colaboración en tiempo real o editor rico de documentos (salvo que un cambio OpenSpec los introduzca de forma explícita).

## Principios de diseño

- **Material 3** como base visual; coherencia entre pantallas públicas y área autenticada.
- Textos y rutas **estables** donde se usen como contrato (p. ej. constantes compartidas con tests).
- Accesibilidad: objetivos táctiles razonables, contraste y navegación predecible.

## Dependencias con otras capacidades

- La realización técnica vive en la especificación **client** (`../client/spec.md`).
