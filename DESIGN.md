---
name: Electric Zest
colors:
  surface: '#131313'
  surface-dim: '#131313'
  surface-bright: '#3a3939'
  surface-container-lowest: '#0e0e0e'
  surface-container-low: '#1c1b1b'
  surface-container: '#201f1f'
  surface-container-high: '#2a2a2a'
  surface-container-highest: '#353534'
  on-surface: '#e5e2e1'
  on-surface-variant: '#c4c9ac'
  inverse-surface: '#e5e2e1'
  inverse-on-surface: '#313030'
  outline: '#8e9379'
  outline-variant: '#444933'
  surface-tint: '#abd600'
  primary: '#ffffff'
  on-primary: '#283500'
  primary-container: '#c3f400'
  on-primary-container: '#556d00'
  inverse-primary: '#506600'
  secondary: '#e9b3ff'
  on-secondary: '#510074'
  secondary-container: '#7d01b1'
  on-secondary-container: '#e5a9ff'
  tertiary: '#ffffff'
  on-tertiary: '#5a1c00'
  tertiary-container: '#ffdbce'
  on-tertiary-container: '#b03f00'
  error: '#ffb4ab'
  on-error: '#690005'
  error-container: '#93000a'
  on-error-container: '#ffdad6'
  primary-fixed: '#c3f400'
  primary-fixed-dim: '#abd600'
  on-primary-fixed: '#161e00'
  on-primary-fixed-variant: '#3c4d00'
  secondary-fixed: '#f6d9ff'
  secondary-fixed-dim: '#e9b3ff'
  on-secondary-fixed: '#310048'
  on-secondary-fixed-variant: '#7200a3'
  tertiary-fixed: '#ffdbce'
  tertiary-fixed-dim: '#ffb599'
  on-tertiary-fixed: '#370e00'
  on-tertiary-fixed-variant: '#7f2b00'
  background: '#131313'
  on-background: '#e5e2e1'
  surface-variant: '#353534'
typography:
  display-lg:
    fontFamily: Anybody
    fontSize: 80px
    fontWeight: '800'
    lineHeight: 88px
    letterSpacing: -0.04em
  headline-lg:
    fontFamily: Anybody
    fontSize: 48px
    fontWeight: '700'
    lineHeight: 56px
    letterSpacing: -0.02em
  headline-lg-mobile:
    fontFamily: Anybody
    fontSize: 32px
    fontWeight: '700'
    lineHeight: 38px
  body-md:
    fontFamily: Hanken Grotesk
    fontSize: 16px
    fontWeight: '400'
    lineHeight: 24px
  label-caps:
    fontFamily: Space Grotesk
    fontSize: 12px
    fontWeight: '600'
    lineHeight: 16px
    letterSpacing: 0.1em
spacing:
  base: 8px
  container-max: 1440px
  gutter: 24px
  margin-mobile: 16px
  margin-desktop: 64px
---

## Brand & Style
The design system is a high-energy, high-contrast framework built for digital experiences that need to feel immediate, vibrant, and alive. It targets a bold, forward-thinking audience that values personality over corporate blandness. 

The aesthetic is a fusion of **Modern Brutalism** and **Vaporwave-inspired Minimalism**. It utilizes raw structural elements—heavy strokes and uncompromising grids—softened by liquid-smooth transitions and electric color gradients. The emotional response is one of controlled intensity: professional enough for functional tasks, but visually caffeinated.

## Colors
This design system operates on a deep, obsidian foundation to allow the neon palette to "pop" with maximum luminance. 

- **Primary (Electric Lime):** Used for primary actions and critical focus states. It demands immediate attention.
- **Secondary (Vivid Violet):** Used for supporting interactive elements, hover states, and branding accents.
- **Tertiary (Blaze Orange):** Reserved for notifications, alerts, or breaking the visual rhythm in marketing modules.
- **Neutral:** A tiered scale of deep grays starting from a true black (#000000) for backgrounds to lighter grays for borders and secondary text.

Maintain a minimum contrast ratio of 4.5:1 for all functional text. Use the primary lime specifically against dark backgrounds to leverage its high light-reflectance value.

## Typography
The typography is designed to be as loud as the color palette. **Anybody** provides a variable-width intensity for headlines, allowing for an expressive, almost editorial feel. 

**Hanken Grotesk** is the workhorse for body copy, ensuring that even amidst high-energy visuals, readability remains professional and grounded. For technical data and UI labels, **Space Grotesk** adds a subtle geometric, futuristic "crunch" that aligns with the high-contrast aesthetic. 

- Use **display-lg** for hero sections only.
- All labels should be set in **Space Grotesk** with generous letter spacing to ensure legibility against vibrant backgrounds.

## Layout & Spacing
The design system utilizes a **rigid fluid grid**. While the layout scales, the spacing units are strictly adhered to in multiples of 8px to maintain a sense of structural integrity.

- **Desktop:** 12-column grid with 24px gutters. Content is centered with large 64px outer margins to create a "stage" effect for the UI.
- **Mobile:** 4-column grid with 16px gutters and margins.
- **Philosophy:** Use "aggressive whitespace." Do not crowd elements. The high-contrast colors require breathing room to prevent visual fatigue. Use padding to create distinct "zones" rather than relying solely on lines.

## Elevation & Depth
This system eschews traditional soft shadows for **Bold Borders** and **Tonal Layering**. 

Depth is communicated through:
1.  **Z-Index Layering:** Higher elevation elements use slightly lighter neutral shades (e.g., #1A1A1A on top of #0A0A0A).
2.  **Hard Shadows:** If depth is required for a floating element (like a dropdown), use a 100% opaque "offset" shadow in the Primary or Secondary color (e.g., 4px 4px 0px #CCFF00) to mimic a physical cutout.
3.  **Vibrant Strokes:** Interactive cards use a 1px or 2px solid border in a muted neutral, which switches to a 2px Primary lime stroke on hover.

## Shapes
The shape language is **uncompromisingly sharp**. To match the high-energy, brutalist influence, the roundedness is set to 0. 

All buttons, cards, inputs, and containers must have square corners. This architectural rigidity provides a necessary counter-balance to the wild, energetic color palette, ensuring the product feels engineered and precise rather than chaotic.

## Components
- **Buttons:** Rectangular with no radius. Primary buttons use a solid Electric Lime fill with black text. Secondary buttons use a thick 2px Vivid Violet border with no fill.
- **Inputs:** Solid black background with a 1px neutral-gray border. On focus, the border turns Electric Lime and the label (Space Grotesk) shifts to the Primary color.
- **Chips:** Small, sharp-edged blocks. Use Tertiary orange for "New" or "Hot" tags to maximize visibility.
- **Cards:** Use a "Ghost" style by default (border only). On hover, apply a hard-offset shadow in the Secondary violet color to "lift" the card.
- **Lists:** Separated by high-contrast 1px lines (#222222). Active list items should be indicated by a vertical 4px bar of Primary color on the left edge.
- **Interactive States:** Every interaction should feel "snappy." Hover states should involve immediate color shifts rather than slow fades to match the high-energy theme.