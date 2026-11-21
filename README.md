# Kingdom Art

Original, hand-made game art for the **Kingdom Builder** (the companion to the `kingdom-game`
hex client). Character sprites, hex terrain tiles, and a small chroma-key helper script.

## Contents

- **Characters** — `peasant-01.png`, `peasant-02.png`, `child-01.png` (full-figure sprites).
- **Hex terrain tiles** — one per land type: `hex-forest.png`, `hex-grassland.png`,
  `hex-hills.png`, `hex-mountains.png`, `hex-mountains-river.png`, `hex-river.png`,
  `hex-dry_grass.png` (+ a camp variant `hex-drygrass-camp.png`).
- **`key-tile.ps1`** — PowerShell chroma-key tool (keys the corner color to transparent).
- **`PAPER-DOLL-GUIDE.md`** — the layered paper-doll technique for building many characters
  from a few drawings (registration, layer stack, palette-swap tiers).

## Tile naming conventions

The game client discovers art by filename, so the name is the wiring:

| Pattern | Meaning | Example |
|---------|---------|---------|
| `hex-<biome>.png` | a world-map terrain tile | `hex-forest.png` |
| `hex-<biome>-camp.png` | the same biome with a camp on it | `hex-drygrass-camp.png` |
| `wild-<site>.png` | a nature "workshop" sprite on a local hex | `wild-stone.png` |
| `building-<kind>.png` | a built structure | `building-campfire.png` |
| `pattern-<terrain>.png` | a seamless-tiling map fill motif | `pattern-forest.png` |

Notes: biome keys use an underscore where the terrain id has one (`dry_grass`). The map uses
pointy-top axial hexes. Sprites are transparent PNGs; terrain tiles are full squares.

## Chroma-key workflow

Draw a sprite on a flat solid background (magenta works well), then key that background to
transparent:

```
powershell -File key-tile.ps1 input.jpg output.png [tolerance=900]
```

It samples the color at pixel (5,5) as the key color and makes every pixel within `tolerance`
(squared RGB distance) fully transparent. Raise the tolerance to catch anti-aliased edges, lower
it to protect near-key colors in the art.

## License

**Art (all `.png` files): © Meme for Trees — all rights reserved.** The image assets are not
open-source; they are published here for reference and for use within the official Kingdom
Builder. Do not redistribute, modify, mint, or reuse the artwork without written permission.

**Code (`key-tile.ps1`): MIT** — see [LICENSE](./LICENSE).
