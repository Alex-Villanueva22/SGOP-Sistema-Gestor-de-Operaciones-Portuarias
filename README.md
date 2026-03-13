# ⚓ SGOP: Sistema de Gestión de Operaciones Marítimas

> Un sistema integral de gestión portuaria diseñado para coordinar la logística de importación/exportación mediante un control estricto de roles y estados operativos en tiempo real.

---

## 🎯 El Desafío
La operación de un puerto comercial es un rompecabezas logístico que requiere sincronización exacta entre el muelle, el almacén y las embarcaciones.
* **Problema:** La complejidad de gestionar múltiples tipos de carga (químicos, congelados, alimentos, etc) y asegurar que cada operario cumpla su función sin conflictos de datos.
* **Solución:** Una aplicación robusta en Java con persistencia en MySQL que implementa un sistema de permisos basado en roles para emular el flujo de trabajo real de un puerto marítimo.

## 🛠️ Tecnologías Utilizadas
* **Lenguaje:** Java (Lógica de negocio y POO).
* **Base de Datos:** MySQL Workbench (Diseño relacional y persistencia).
* **Arquitectura:** Modelo Vista-Controlador (MVC) y Gestión de Roles (RBAC).

## 👤 Perfiles y Funcionalidades
El sistema segmenta las responsabilidades para garantizar la eficiencia operativa:

* **Operador de Muelle:** Control de tráfico marítimo. Asignación de muelles, registro de horas de llegada/zarpe y gestión de disponibilidad de infraestructura.
* **Operador de Almacén:** Logística de inventario. Clasificación de contenedores por tipo de producto (alimentos, tecnológicos, congelados, químicos, etc.), asignación de zonas y gestión de contenedores en *Stand By* (no reclamados).
* **Operador de Embarque:** Gestión de carga. Ejecución de procesos de estiba (subir/bajar contenedores) y reporte de incidencias técnicas en barcos.
* **Administrador:** Supervisión total. Gestión de usuarios, auditoría de procesos y administración maestra de activos (barcos y zonas).

## ✨ Características Técnicas
* ✅ **Gestión de Estados:** Lógica algorítmica para cambiar automáticamente la disponibilidad de muelles y zonas de almacén.
* ✅ **Seguridad por Roles:** Acceso restringido a módulos específicos según el perfil del usuario logueado.
* ✅ **Integridad de Datos:** Validaciones en Java para evitar errores comunes, como asignar un barco a un muelle ocupado o un contenedor a una zona incompatible.
* ✅ **Simulación Logística:** Flujo completo desde la llegada del barco hasta el despacho final de la carga.

## 🎓 Contexto Académico
Proyecto desarrollado para la asignatura de **Algorítmica**.
