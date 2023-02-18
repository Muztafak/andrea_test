SELECT empleados.*, checador.*
FROM empleados INNER JOIN checador
                          ON empleados.id = checador.empleado_id;

SELECT empleados.name, checador.entrada, checador.salida
FROM empleados INNER JOIN checador
                          ON empleados.id = checador.empleado_id
WHERE entrada BETWEEN '2023-02-18 00:00:00' AND '2023-02-18 23:59:59'
  AND salida BETWEEN '2023-02-18 00:00:00' AND '2023-02-18 23:59:59'
group by name,entrada, salida
order by name;

SELECT  productos.name, inventario_inicial, vendido, inventario_final
from
    (SELECT ventas.producto_id,
            inventario.cantidad as inventario_inicial,
            sum(ventas.cantidad) as vendido,
            inventario.cantidad - sum(ventas.cantidad) as inventario_final
     from ventas inner join inventario  on ventas.producto_id = inventario.id
     group by producto_id) as calculo inner join productos
                                                 on calculo.producto_id = productos.id