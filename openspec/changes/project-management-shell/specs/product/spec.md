# Delta: product (project-management-shell)

## ADDED Requirements

### Requirement: Shell autenticado con secciones y drawer

El producto SHALL ofrecer tras el login un layout principal con al menos las secciones Inicio, Proyectos y Comunidad, navegación por drawer y cierre de sesión.

#### Scenario: Usuario abre el menú lateral

- **WHEN** el usuario abre el drawer en `/home`
- **THEN** puede elegir Inicio, Proyectos o Comunidad, abrir Ajustes, cerrar sesión o cambiar el idioma desde el pie del drawer

### Requirement: Obras literarias en Proyectos (demo)

El producto SHALL permitir gestionar un conjunto de obras literarias en memoria con CRUD básico y metadatos definidos en la especificación cliente.

#### Scenario: Usuario crea una obra

- **WHEN** el usuario completa el formulario de nueva obra y guarda
- **THEN** la obra aparece en la lista de Proyectos hasta fin de sesión o recarga

## MODIFIED Requirements

_(Los requisitos anteriores del documento estable `openspec/specs/product/spec.md` se sustituyen por la versión actual del mismo archivo en el repositorio; este delta documenta el incremento para el cambio OpenSpec.)_
