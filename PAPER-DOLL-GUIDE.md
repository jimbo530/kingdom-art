# PAPER-DOLL ART — the working guide
The whole trick in one sentence: **draw one body, then draw everything else as transparent
sheets that lie on top of it — never merged, always stacked.** The code stacks the
sheets per character; the artist's job is making sheets that always line up. Alignment is the craft.

## 1. THE ONE RULE THAT MAKES IT ALL WORK: same canvas, never crop
Every file — body, shirt, hat, axe — uses the SAME canvas size with the body in the SAME spot.
A hat PNG is mostly empty space with a hat floating exactly where the head is. Because every
sheet shares the canvas, stacking them aligns automatically, forever. If you crop or re-center
even once, that piece will never fit again. (This is called "registration" — it's free if you
never move anything.)

## 2. THE BASE BODY: naked-er than you think
Your bearded fellow is wonderful — but his beard, shirt, pants and boots are all painted ON him.
For a true doll system, the base is the body UNDERNEATH:
- **base body** = skin, face, ears, hands, feet — no hair, no beard, no clothes (underwear is fine)
- everything else becomes a sheet: beard-01, shirt-plain, pants-blue, boots-black…
Your current sprite still works today as "the clothed default" — the doll system grows under it.
Same for the baby: one child base body, and the beard becomes the best beard-sheet in history.

## 3. THE LAYER STACK (bottom → top) — build your files to this order
1. body (skin)
2. pants
3. boots
4. shirt / tunic
5. belt
6. beard & hair
7. hat / helmet (hats sit OVER hair; that's why beard+hair must be their own sheet)
8. held item — back hand (spear shaft behind the body)
9. held item — front hand (axe head in front)
Draw each piece on its own sheet. A character = pick one file per slot, stack in this order.

## 4. THE WORKFLOW (any app with layers — Aseprite is the genre favorite, ~$20, built for this)
1. Open the base body file.
2. New layer ON TOP — draw the shirt right on the body so it fits perfectly.
3. Hide the body layer. Export just the shirt layer → `shirt-plain.png` (transparent PNG).
4. Unhide body, repeat for the next piece.
You're always drawing ON the doll, but SAVING only the clothes. Fit is guaranteed because you
drew it in place.

## 5. WHY THIS SCALES LIKE MAGIC
1 body × 6 shirts × 4 pants × 5 beards × 3 hats = **360 unique peasants** from 19 drawings.
Add the quality ladder: each gear piece gets tier variants — and tiers can start as PALETTE
SWAPS (same pixels, richer colors: crude = undyed cloth, masterwork = deep dye + gold trim +
a few shine pixels). 9 tiers of shirt ≈ 1 drawing + 8 recolors + extra ornament at the top tiers.

## 6. HOUSE RULES (so every sheet plays nice)
- **Native pixel size**: pick one art resolution (your sprites read ~96px tall figures) and draw
  everything at that size. Never upscale in the art file — the game upscales crisply.
- **Transparent PNG** exports (magenta background also fine — the code keys it out either way).
- **One light source** (top-left in your current pieces — keep it everywhere).
- **Outline discipline**: your dark outline style is great — keep it on every piece so mixed
  gear still looks like one drawing.
- **File names say the slot**: `body-adult-01.png`, `body-child-01.png`, `beard-braided.png`,
  `shirt-plain-crude.png`, `hat-straw.png`, `axe-stone-front.png`. The name is the wiring.

## 7. WHAT THE CODE DOES WITH YOUR SHEETS
A crew-render compositor stacks PNG layers per character state and serves the result as the
dynamic NFT card: a level-3 peasant in a crude shirt holding a stone axe = body + pants +
shirt-crude + beard + axe, composited on request. Low-backing characters fall back to a child
body. You draw sheets; characters assemble themselves forever.

## 8. START HERE (the first five sheets that unlock everything)
1. `body-adult-01.png` — your bearded man, minus beard and clothes
2. `beard-braided.png` — the beard as its own sheet
3. `shirt-plain.png` + `pants-blue.png` + `boots-black.png` — his current outfit as sheets
That exactly recreates today's sprite as a doll — and from then on, every new piece you ever
draw multiplies against everything that exists.
