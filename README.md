# Clase 08 - Data Warehouse y Data Mart

Repositorio student-facing de la octava sesion de **Sistemas Avanzados de Bases de Datos**.

## Objetivo de la clase

En esta sesion trabajaremos una pregunta nueva:

**¿cuando conviene una capa analitica mas integrada y cuando conviene una mas enfocada?**

Aqui veremos:

- data warehouse
- data mart
- integracion
- consistencia
- consumo analitico

## Que incluye este repo

- `slides/session.pdf`: material publicado para alumnos
- `demo/`: escenario guiado para comparar una capa mas central con una mas especializada
- `activities/`: dos actividades de clase y una actividad de casa
- `scripts/`: validacion publica y utilidades del entorno
- `docs/evaluation-check.md`: relacion entre resultados, procedimiento y pregunta oral
- `docs/project-checkpoint.md`: checkpoint formal del proyecto final
- `diagrams/`: espacio para apoyo visual publicable si hiciera falta

## Quick Start para Windows

La forma recomendada es usar **VS Code + Dev Containers + Docker Desktop**.

### Prerrequisitos

- Docker Desktop abierto
- VS Code
- extension `Dev Containers`
- Git

### Flujo recomendado

1. Clona el repositorio.
2. Abre el repo en VS Code.
3. Ejecuta `Dev Containers: Reopen in Container`.
4. Espera a que arranquen `postgres`, `workspace` y `adminer`.
5. Abre una terminal dentro del devcontainer.
6. Si limpiaste la pantalla, corre `connection-info`.
7. Lee `demo/walkthrough.md`.
8. Completa en este orden:
   - `class-activity-01`
   - `class-activity-02`
   - `home-activity`
9. Revisa tambien:
   - `docs/project-checkpoint.md`
10. Valida con `check class-activity-01`, `check class-activity-02`, `check home-activity` o `check all`.

## Extensiones utiles dentro del devcontainer

El devcontainer instala:

- PostgreSQL Client
- Rainbow CSV
- PowerShell
- Markdown All in One
- Docker

## Comandos recomendados dentro del devcontainer

```bash
connection-info
check class-activity-01
check class-activity-02
check home-activity
check all
```

Dentro del devcontainer normalmente no necesitas `up`.

## Comandos utiles fuera del devcontainer

Bash:

```bash
./scripts/session.sh up
./scripts/session.sh reset
./scripts/session.sh seed
./scripts/session.sh psql
./scripts/session.sh test
./scripts/run-activity.sh class-activity-01
./scripts/run-activity.sh class-activity-02
./scripts/run-activity.sh home-activity
./scripts/run-all.sh
```

PowerShell:

```powershell
.\scripts\session.ps1 up
.\scripts\session.ps1 reset
.\scripts\session.ps1 seed
.\scripts\session.ps1 psql
.\scripts\session.ps1 test
.\scripts\run-activity.ps1 class-activity-01
.\scripts\run-activity.ps1 class-activity-02
.\scripts\run-activity.ps1 home-activity
.\scripts\run-all.ps1
```

## Datos de conexion

PostgreSQL corre con:

- usuario: `developer`
- password: `developer`
- base de datos: `advanced_databases`

Dentro del devcontainer:

- host: `postgres`
- port: `5432`

Desde Windows o desde cualquier cliente fuera del contenedor:

- host: `localhost`
- port: `5432`

## Cliente web opcional

Si la extension de PostgreSQL no conecta, usa Adminer:

- URL: `http://localhost:8080`
- sistema: `PostgreSQL`
- servidor: `postgres`
- usuario: `developer`
- password: `developer`
- base de datos: `advanced_databases`

## Que archivos debes editar

- `activities/class-activity-01/submission.sql`
- `activities/class-activity-01/REPORT.md`
- `activities/class-activity-02/submission.sql`
- `activities/class-activity-02/REPORT.md`
- `activities/home-activity/submission.sql`
- `activities/home-activity/REPORT.md`

## Que entregar

Para cada actividad:

- `submission.sql`
- `REPORT.md`

La validacion publica tambien genera evidencia en:

- `activities/<activity>/actual/validation.txt`

## Como funciona la evaluacion de actividades

Cada actividad evaluada usa:

- Resultados: 4 puntos
- Procedimiento: 2 puntos
- Pregunta oral: 2 puntos
- Total: 8 puntos

En Clase 08, **resultados** significa que tu entrega:

- existe
- tiene la estructura minima
- distingue warehouse y datamart con claridad suficiente
- pasa la validacion publica

## Que valida el script

El script revisa cosas formales, por ejemplo:

- que exista `submission.sql`
- que exista `REPORT.md`
- que no esten vacios
- que aparezcan secciones como capa elegida, beneficio, limitacion o tradeoff
- que la estructura minima coincida con la intencion de la actividad

## Que no valida el script

El script no decide si tu arquitectura analitica es la mejor posible.

No valida automaticamente:

- si debiste elegir warehouse en vez de datamart
- si tu justificacion es la unica correcta
- si tu capa resolveria todos los casos posibles

Eso lo revisa el instructor.

## Checkpoint formal del proyecto final

Clase 08 **si** incluye el checkpoint formal del proyecto final.

Revisa:

- [docs/project-checkpoint.md](docs/project-checkpoint.md)

Ese checkpoint:

- no es la entrega final
- no pide frontend
- no pide backend completo
- no pide dashboard final
- no pide despliegue

Busca validar direccion, alcance y criterio.

Casos asignados:

- `CafeNube` - Ruano Galvez Joseph Emiliano
- `FleetGo` - Carrera Hernandez Claudio
- `MercadoMax` - Fernandez Gonzalez Alexis Emmanuel
- `TaskHive` - Lara Castro Jesus Alejandro
- `Webflix` - Nogales Escalona Daniel de Jesus

La presentacion del checkpoint es individual y tiene hasta `5 minutos` para explicar:

1. caso y problema central
2. diagrama o esquema logico actual
3. propuesta inicial de solucion

## Troubleshooting

### No veo datos de conexion en la terminal

Corre:

```bash
connection-info
```

### La extension de PostgreSQL no conecta

Usa Adminer en `http://localhost:8080`.

### El script marca error

Revisa que tu `submission.sql` y tu `REPORT.md` incluyan las secciones minimas pedidas por la actividad.

### El stack no arranca

- confirma que Docker Desktop este abierto
- revisa si el puerto `5432` ya esta ocupado por otro stack
- prueba `./scripts/session.sh reset`

## IA responsable

La IA puede ayudarte a ordenar ideas o revisar redaccion.

Pero sigue siendo tu responsabilidad:

- decidir si conviene una capa mas integrada o mas enfocada
- justificar la eleccion
- explicar beneficios y tradeoffs
- presentar un checkpoint claro y defendible
