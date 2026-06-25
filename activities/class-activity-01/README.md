# Class Activity 08.01 - Elegir la capa correcta

## Objetivo

Relacionar una necesidad analitica con warehouse o datamart.

## Pregunta guia

**¿Esta necesidad requiere una capa mas central e integrada o una mas enfocada y especializada?**

## Importante antes de empezar

En esta clase, `submission.sql` **no se usa para ejecutar SQL real**.

Aqui lo usaremos como una plantilla de respuesta corta y estructurada.

Tu trabajo es leer el caso, pensar la decision y completar el archivo con texto breve.

## Escenario

Imagina esta necesidad:

> Un equipo comercial quiere revisar ventas por sucursal y por categoria para detectar rapidamente que lineas venden mejor en cada zona.

Tu tarea es decidir si esa necesidad se atiende mejor con:

- un `warehouse`
- o un `datamart`

## Que tienes que hacer

1. Abre `submission.sql`.
2. Completa las tres secciones pedidas.
3. Abre `REPORT.md`.
4. Explica la misma decision con tus propias palabras, de forma breve.

## Que debes entregar

- `submission.sql`
- `REPORT.md`

## Que debe llevar `submission.sql`

Debes completar:

- `Capa elegida:` escribe `warehouse` o `datamart`
- `Necesidad analitica:` resume la necesidad en una frase
- `Justificacion:` explica por que esa capa tiene sentido

## Que debe explicar `REPORT.md`

Responde con frases cortas:

- que capa elegiste
- que necesidad viste
- que ventaja te da esa capa
- que limitacion o tradeoff identificaste

## Ejemplo de forma esperada

No copies esto literalmente. Solo usalo como referencia de nivel de detalle:

- `Capa elegida:` datamart
- `Necesidad analitica:` seguimiento de ventas por sucursal y categoria para el equipo comercial
- `Justificacion:` el consumidor es especifico y necesita una capa enfocada para una pregunta puntual

## Como se evalua publicamente

Cuando corras:

```bash
check class-activity-01
```

el script solo revisa que:

- existan los archivos
- no esten vacios
- aparezcan las secciones requeridas

No revisa si tu razonamiento es el mejor posible. Esa parte la revisa el instructor.
