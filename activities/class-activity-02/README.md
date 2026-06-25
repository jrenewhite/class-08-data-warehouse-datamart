# Class Activity 08.02 - Integracion y consumo

## Objetivo

Explicar por que una capa analitica ayuda a integrar y servir datos.

## Pregunta guia

**¿Que ganas al integrar mejor y que pierdes o complicas en el camino?**

## Importante antes de empezar

En esta actividad tampoco vas a escribir SQL ejecutable.

`submission.sql` funciona como una hoja de respuesta estructurada para explicar una idea tecnica de forma breve.

## Escenario

Ahora ya no decides solo entre `warehouse` o `datamart`.

Tu trabajo es pensar en el efecto de una capa analitica sobre un caso como este:

> Una empresa quiere combinar pedidos, pagos y clientes para que varias areas consulten resultados consistentes.

La pregunta ya no es solo "que capa elegir", sino:

- que beneficio obtienes al integrar mejor
- que dificultad aparece
- cual es el tradeoff principal

## Que tienes que hacer

1. Abre `submission.sql`.
2. Completa las tres secciones con texto breve.
3. Abre `REPORT.md`.
4. Explica con mas claridad donde ayudaria esa capa y donde se complica.

## Que debes entregar

- `submission.sql`
- `REPORT.md`

## Que debe llevar `submission.sql`

Debes completar:

- `Beneficio:` que mejora al integrar o servir mejor el dato
- `Limitacion:` que costo, esfuerzo o dificultad aparece
- `Tradeoff:` que ganas y que sacrificas al mismo tiempo

## Que debe explicar `REPORT.md`

Responde con frases cortas:

- que beneficio ofrece la capa elegida
- que limitacion tiene
- que tradeoff aparece
- en que tipo de caso no la usarias

## Ejemplo de forma esperada

No copies esto literalmente. Solo usalo como referencia:

- `Beneficio:` integrar pedidos y pagos permite leer ingresos de forma mas consistente
- `Limitacion:` hace falta alinear mejor definiciones y mantener mas transformaciones
- `Tradeoff:` ganas coherencia compartida, pero aumentas complejidad de integracion

## Como se evalua publicamente

Cuando corras:

```bash
check class-activity-02
```

el script revisa que:

- existan los archivos
- no esten vacios
- aparezcan `Beneficio`, `Limitacion` y `Tradeoff`

La calidad del criterio tecnico se revisa aparte.
