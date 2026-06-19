# Demo-scenario: een API uitbreiden met een nieuwe methode

> **Het verhaal in één zin:** we voegen een korting-feature toe aan de Products API door twee plugins samen te laten werken — de **brainstorming**-skill uit `obra/superpowers` voor het ontwerp, en de **DutchWorkz**-skills voor de implementatie volgens onze conventies.

## De startsituatie

De Products API (`src/Services/ProductService.cs`) heeft drie methodes:

- `GetAll()`
- `GetById(int id)`
- `Create(string name, decimal price, string category)`

De productowner vraagt: *"Kunnen we korting geven op een product?"* Een nieuwe collega zou nu meteen gaan typen. Wij niet.

## Wat we niet doen

```
"Voeg een ApplyDiscount-methode toe aan ProductService"
```

De agent zou een redelijke implementatie schrijven. Hij weet alleen niet dat in een eerder project korting per categorie verstrekt werd, dat finance een audit-trail wil zien, en dat het kassasysteem alleen percentages aankan. Een week later komt dat allemaal terug als rework.

## Wat we wél doen

Eén prompt, één plugin-stack die hem opvangt:

```
"Ik wil een korting-feature toevoegen aan de Products API."
```

Wat er dan gebeurt, in volgorde:

### 1. brainstorming activeert (superpowers)

De skill heeft een **HARD-GATE** voor implementatie. Hij zal nu eerst:

- de huidige `ProductService.cs` lezen om de bestaande stijl te begrijpen,
- één vraag tegelijk stellen om het ontwerp scherp te krijgen:
  - *Percentage of vast bedrag?*
  - *Per product of per categorie?*
  - *Tijdgebonden of permanent?*
  - *Audit-trail nodig?*
- twee tot drie ontwerp-opties voorstellen met trade-offs,
- het ontwerp in secties presenteren en per sectie om akkoord vragen,
- het uiteindelijke ontwerp opslaan onder `docs/superpowers/specs/YYYY-MM-DD-discount-feature-design.md`.

Een voorbeeld van zo'n design-doc staat al in deze repo: [`docs/superpowers/specs/2026-06-15-discount-feature-design.md`](superpowers/specs/2026-06-15-discount-feature-design.md). Dat is wat de skill zou produceren — niet vooraf invullen tijdens een live demo, dit dient als referentie.

### 2. writing-plans activeert (superpowers)

Zodra het ontwerp goedgekeurd is, hakt deze skill het werk in taken van 2–5 minuten elk, met exacte bestandspaden en verificatiestappen.

### 3. test-driven-development activeert (superpowers)

RED → GREEN → REFACTOR. De skill **schrijft eerst een falende test**, kijkt of die echt rood is, en pas dan de implementatie. Code die buiten een test om geschreven wordt, wordt weggegooid.

### 4. unit-tests skill geeft het format (DutchWorkz)

Tests die superpowers schrijft, volgen onze conventies: xUnit, FluentAssertions, NSubstitute, `Methode_Should_X_When_Y`, AAA-patroon, `CreateSut()`-factory. Eén skill bepaalt *dat* er getest wordt, de andere bepaalt *hoe* het er bij ons uitziet.

### 5. format-csharp hook draait (DutchWorkz)

Na elke `Write` of `Edit` op een `.cs`-bestand draait `dotnet format` automatisch. De agent levert nooit ongeformatteerde code op.

### 6. code-review skill (DutchWorkz)

"Review de wijziging." De `code-review` skill activeert en doorloopt de diff volgens DutchWorkz-stijl. Hij levert feedback in drie blokken — 🚫 Blocking, 💡 Suggesties, 🌱 Nits — met regelnummers, plus minimaal één compliment. De skill schrijft zelf geen code; de auteur fixt eventuele issues zelf.

## Waarom dit een goed demo-verhaal is

- **Twee marketplaces, één workflow.** Superpowers levert het *proces* (Socratisch ontwerp, TDD, code review). DutchWorkz levert de *standaarden* (testformat, ADR-stijl, release notes). Ze interfereren niet — ze stapelen.
- **De HARD-GATE in brainstorming voorkomt voortijdig coderen.** Dat los je niet op met betere prompts; dat los je op met een betere skill.
- **Elke stap is zichtbaar.** Skills tonen zich in de chat-output zodra ze activeren, de hook draait zichtbaar na elke edit, en het design-doc verschijnt op disk.
- **De code blijft compileren.** De baseline-tests in `tests/ProductServiceTests.cs` zijn groen vóór de demo, blijven groen na de RED-fase (alleen de nieuwe test is rood), en zijn groen na GREEN.

## Voor de presentator

Zie [`demo-script.md`](demo-script.md) voor het stap-voor-stap script met timings, voorbereiding-checklist en vangnetten als de demo-goden boos zijn.
