# FruitQuest

**Autores:** Steven Soriano y Alvaro Fernandez 
**Institución:** CFGM Sistemes Microinformàtics i Xarxes (SMX)  
**Motor de Desarrollo:** Godot Engine 4.x  
**Lenguaje:** GDScript  

---

# 1. Descripción del Proyecto

FruitQuest es un videojuego de plataformas 2D desarrollado en Godot Engine.  
El jugador controla un personaje que debe superar obstáculos y recoger frutas para completar los diferentes niveles del juego.

El proyecto está diseñado aplicando una estructura modular de escenas y scripts para facilitar la organización y escalabilidad del desarrollo.

---

# 2. Especificaciones Técnicas

## 2.1. Sistema de Movimiento y Jugabilidad

- Movimiento lateral implementado mediante `CharacterBody2D`.
- Sistema de salto y gravedad programado con físicas básicas.
- Animaciones de movimiento, salto y caída.
- Recolección de frutas mediante detección de colisiones.

## 2.2. Gestión de Obstáculos

- Obstáculos dinámicos como sierras y bolas con pinchos.
- Sistema de daño y reinicio de nivel.

## 2.3. Sistema de Escenas

El proyecto está organizado mediante escenas independientes:

- Menú principal.
- Pantallas de victoria y game over.
- Niveles separados por mapas y pantallas.
- Sistema de transición entre niveles.

## 2.4. Audio y Efectos

- Música de fondo integrada.
- Efectos de sonido para acciones y eventos del juego.

---

# 3. Controles del Sistema

| Acción | Entrada |
|---|---|
| Movimiento Izquierda | Flecha Izquierda |
| Movimiento Derecha | Flecha Derecha |
| Salto | Espacio |
| Salir | click a "menu"|

---

# 4. Estructura de Directorios

```bash
/assets          -> Recursos gráficos y sprites
/escenas         -> Escenas principales del juego
/characters      -> Personajes jugables
/enemigos        -> obstáculos
/escenarios      -> Mapas y niveles
/pantallas       -> Interfaces y HUD
/sonidos         -> Música y efectos de audio
```

---

# 5. Herramientas Utilizadas

- Godot Engine 4.x
- GDScript
- GitHub
- Pixel Art Assets

---

# 6. Objetivos del Proyecto

- Desarrollar un videojuego funcional en 2D.
- Aplicar programación orientada a objetos en Godot.
- Implementar un sistema modular de escenas.
- Gestionar colisiones, físicas y animaciones.
- Mejorar la organización y mantenimiento del código.

---

# 7. Estado del Proyecto

Proyecto actualmente funcional con:

- Sistema de movimiento implementado.
- Niveles jugables.
- Obstáculos activos.
- Sistema de recolección de objetos.
- Pantallas de victoria y derrota.

---

# 8. Licencia

Proyecto desarrollado con fines educativos.
