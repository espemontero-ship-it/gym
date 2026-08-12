# Identidad estética y UX — rutina-tracker

Documento de referencia obligatorio. Ninguna propuesta visual se implementa sin comprobar antes que cumple esto. Extraído del CSS real de `index.html` (no son valores nuevos, son los que ya existen en producción, verificados contra el estado previo a la sesión del 2026-08-11/12 y aprobados en mockup).

## Colores

| Token | Valor | Uso |
|---|---|---|
| `--bg` | `#17181a` | Fondo de página |
| `--card` | `#212226` | Fondo de tarjeta |
| `--card-border` | `#2d2e33` | Borde de tarjeta |
| `--line` | `#35363b` | Bordes de inputs/chips internos |
| `--ink` | `#f2f1ec` | Texto principal |
| `--ink-dim` | `#9b9ba3` | Texto secundario/etiquetas |
| `--volt` | `#d4ff3d` | Acento único — pestaña activa, estado "hecho", foco de inputs. **No decorativo, siempre significa algo.** |
| `--volt-dim` | `#9db82b` | Variante apagada de volt (iconos, tachado) |
| `--teal` | `#33d9c4` | Solo el punto de sección "Calentamiento" |
| naranja | `#ffb547` | Solo el punto de sección "Cardio" |
| `--done` | `#2a3320` | Fondo de tarjeta cuando el ejercicio está marcado como hecho |

Regla: cada color de acento tiene un significado fijo y un solo uso. No se reutilizan como decoración. Antes de añadir color a un elemento nuevo, preguntar: ¿qué significa aquí? Si no hay respuesta clara, no lleva color, se queda en `--ink` / `--ink-dim`.

## Tipografía

- **'Bebas Neue'**: solo para títulos de página y de día — el título superior ("ESPERANZA · BLOQUE 1") y los encabezados de día ("Día A · Tren inferior"), y la fecha en Historial. Nunca para nombres de ejercicio ni texto de tarjeta.
- **'Inter'**: todo lo demás. Pesos usados: 400 (regular), 500, 600, 700 (negrita estándar de énfasis), 800 (solo en chips/valores puntuales como el nombre en historial o el valor de un stat).
- Dentro de la tarjeta de ejercicio, dos tamaños solamente, sin excepción: **17px** para el nombre del ejercicio (`.ex-body .ex-name`), **13px** para todo lo demás (stats, historial, filas de serie, notas).
- Dentro de la tarjeta de ejercicio, el texto secundario (etiquetas de stat, "Serie N", unidades, separador ×) usa `--ink` (blanco), no `--ink-dim` — se reservó `--ink-dim` para fuera de la tarjeta (subtítulos, placeholders).
- Nunca bajar de 11px para texto que haya que leer (etiquetas) ni de 12-13px para datos importantes.

## Espaciado y forma

- Radio de esquina: 14px en tarjetas grandes (`.card`), 7–12px en elementos internos (chips, inputs, fotos pequeñas), 20px en el modal de vista previa.
- Padding estándar de tarjeta: 12–14px.
- Separación entre bloques dentro de una tarjeta: ~9px (`margin-top:9px` es el patrón repetido).
- Bordes finos de 1–1.5px en `--line` o `--card-border`, nunca gruesos.

## Componentes establecidos

- **Tarjeta de ejercicio de fuerza** (`.ex-card`): foto cuadrada 150px centrada arriba (`.ex-photo-wrap--square`), con el check de "hecho" superpuesto en la esquina superior derecha de la foto (`.check-overlay`). Debajo, a ancho completo: nombre, stats, historial, series, notas — el nombre nunca va al lado de la foto (compiten por espacio).
- **Chip/stat** (`.stat`): fondo `#17181a`, borde `--volt` (verde, coincide con el punto de la sección "Entrenamiento de fuerza"), radio 7px, todo el texto (etiqueta y valor) en `--volt`.
- **Check superpuesto en la foto** (`.check-overlay`): mismo verde `--volt` que el punto de sección y el chip — un único tono de verde por tarjeta, nunca se mezcla `--volt` con `--volt-dim` dentro de la misma tarjeta.
- **Historial dentro de la tarjeta** (`.prev-history`): texto plano, sin caja ni fondo — `<b>Antes:</b>` seguido de `fecha: kg×reps, kg×reps` por sesión, sesiones separadas por `·`. Sin la palabra "kg" repetida en cada serie.
- **Caja de series** (`.sets-grid`): una sola caja contenedora con borde `--line`, radio 10px; cada `.set-row` es una fila interna sin caja propia, separada de la siguiente por una línea `--line` (no hay una caja por fila).
- **Campo de notas** (`.note-input`): subrayado (`border-bottom`), sin caja ni fondo, foco en `--volt`.
- **Check de "hecho"**: cuadrado con esquinas redondeadas (no círculo), borde `--line` en reposo (o `--volt` si está superpuesto en una foto de fuerza), relleno `--volt` cuando está marcado.
- **Sección** (`.section-label`): mayúsculas, letter-spacing 1.5px, punto de color delante (teal/volt/naranja según la sección).

## Tono de texto (copy)

- Español, directo, sin adornos. Frases cortas. "Notas (opcional)", "Sin sesiones previas", nada de relleno.

## Cómo usar este documento

Antes de proponer o implementar un cambio visual: comprobar que colores, tipografía, radios y componentes coinciden con lo de arriba. Si algo nuevo no encaja en ninguna categoría existente, decirlo explícitamente y preguntar antes de inventar un patrón nuevo. Cualquier cambio visual necesita mockup enseñado y aprobado antes de tocar `index.html` (ver `~/.claude/CLAUDE.md`).
