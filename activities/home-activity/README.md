# Home Activity 08 - Capa analitica de refuerzo

## Objetivo

Reforzar la decision entre warehouse y datamart en un caso autonomo o conectado al proyecto.

## Importante antes de empezar

En esta home activity, `submission.sql` sigue siendo una plantilla de respuesta y **no un script SQL para ejecutar**.

La idea es que practiques el razonamiento arquitectonico con mas autonomia.

## Escenario

Debes proponer un caso sencillo:

- puede ser inventado por ti
- puede parecerse a tu proyecto final
- puede inspirarse en ventas, pagos, clientes, operaciones o analitica

Sobre ese caso, debes decidir si conviene mas:

- un `warehouse`
- o un `datamart`

## Que tienes que hacer

1. Piensa en un caso analitico pequeño y concreto.
2. Abre `submission.sql`.
3. Completa todas las secciones con una explicacion breve.
4. Abre `REPORT.md`.
5. Explica tu decision con mas claridad y reflexion tecnica.

## Que debes entregar

- `submission.sql`
- `REPORT.md`

## Que debe llevar `submission.sql`

Debes completar:

- `Caso elegido:` describe la empresa o situacion
- `Capa elegida:` escribe `warehouse` o `datamart`
- `Por que:` explica por que elegiste esa capa
- `Problema que resuelve:` que necesidad analitica atiende
- `Limitacion o tradeoff:` que costo, limite o dificultad aparece

## Que debe explicar `REPORT.md`

Responde con frases breves pero claras:

- que caso elegiste
- si elegiste warehouse o datamart
- por que
- que problema resuelve esa capa
- que limitacion o tradeoff identificaste

## Que tipo de caso funciona bien

Buenos casos para esta actividad:

- una cadena que quiere integrar ventas de varias sucursales
- un equipo comercial que solo quiere analizar ventas por categoria
- una plataforma que quiere consolidar pagos y usuarios
- un area especifica que necesita una capa enfocada para reportes propios

## Ejemplo de forma esperada

No copies esto literalmente. Solo usalo como referencia:

- `Caso elegido:` empresa pequena con ventas, pagos y clientes en sistemas separados
- `Capa elegida:` warehouse
- `Por que:` necesita una vista integrada para varias preguntas compartidas
- `Problema que resuelve:` consolidar datos dispersos para comparar resultados de forma consistente
- `Limitacion o tradeoff:` requiere mas esfuerzo de integracion que una capa enfocada

## Como se evalua publicamente

Cuando corras:

```bash
check home-activity
```

el script revisa que:

- existan los archivos
- no esten vacios
- aparezcan todas las secciones pedidas

No valida por si solo si tu decision fue la mejor. Esa parte se revisa despues.
