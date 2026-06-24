# Walkthrough

## Objetivo

Comparar una capa analitica mas central con una mas especializada.

## Paso 1 - Entrar a PostgreSQL

Dentro del devcontainer:

```bash
psql postgresql://developer:developer@postgres:5432/advanced_databases
```

## Paso 2 - Observar las fuentes operativas

```sql
SELECT o.order_id, b.branch_name, c.full_name, o.order_total, o.ordered_at, p.payment_method, p.payment_status
FROM orders o
JOIN customers c ON c.customer_id = o.customer_id
JOIN branches b ON b.branch_id = o.branch_id
JOIN payments p ON p.order_id = o.order_id
ORDER BY o.order_id;
```

Aqui todavia vemos un caso operativo con varias piezas relacionadas.

## Paso 3 - Lanzar una necesidad amplia

Pregunta sugerida:

**¿Como comparar ingresos, clientes y comportamiento de pago de forma integrada?**

Eso sugiere una capa mas central porque:

- integra pedidos
- integra pagos
- integra clientes
- integra sucursales

## Paso 4 - Explicar la capa mas central

Una lectura tipo warehouse ayudaria a:

- consolidar varias piezas del negocio
- mantener definiciones mas coherentes
- servir analisis amplios

## Paso 5 - Lanzar una necesidad enfocada

Pregunta sugerida:

**¿Que categoria vende mas por sucursal y periodo para el equipo comercial?**

Eso sugiere una capa mas especializada porque el consumidor es mas puntual y la necesidad es mas directa.

## Paso 6 - Explicar la capa especializada

Una lectura tipo datamart ayudaria a:

- exponer menos complejidad visible
- servir mejor una necesidad concreta
- acercar el dato a un consumidor especifico

## Paso 7 - Cerrar con el tradeoff

- una capa mas integrada ayuda a compartir una base comun
- una capa mas enfocada ayuda a consumir mas rapido una necesidad puntual
- ninguna gana siempre; depende del problema y del consumidor
