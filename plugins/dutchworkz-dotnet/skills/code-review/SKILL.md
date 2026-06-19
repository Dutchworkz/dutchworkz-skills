---
name: code-review
version: 1.3.0
description: Reviewt C#-code volgens Dutchworkz-standaarden. Gebruik bij pull-request-reviews, "review deze code", "kijk eens kritisch naar", of na elke significante wijziging. Geeft feedback op stijl, tests, naming en architectuur — schrijft zelf geen code, alleen commentaar.
---

# Code-review volgens Dutchworkz-standaarden

Pas deze werkwijze toe wanneer je een pull request, een diff of een stuk code reviewt zoals een Dutchworkz-architect dat zou doen.

## Werkwijze

1. Lees eerst de **PR-beschrijving** (of vraag het doel als het ontbreekt). Een review zonder context is een spelchecker.
2. Lees de gewijzigde bestanden **én de directe context** (één map omhoog en omlaag, of de aanroepende code).
3. Schrijf feedback in **drie blokken** in deze vaste volgorde:
   - 🚫 **Blocking** — moet weg vóór merge (bugs, security, contractbreuk, conventies overtreden)
   - 💡 **Suggesties** — sterke aanbeveling, maar niet blokkerend (refactor, betere abstractie)
   - 🌱 **Nits** — smaakdingen (naming-voorkeur, dubbele lege regel)
4. Verwijs naar **concrete regelnummers** of bestanden in de feedback, en — waar relevant — naar de Dutchworkz-conventie (bijv. `skills/unit-tests/SKILL.md`).
5. Geef altijd **minimaal één compliment** over iets dat wél goed gaat. Reviews die alleen klagen worden genegeerd.

## Wat je NIET doet

- **Geen wijzigingen voorstellen als code-edits** — je geeft commentaar, geen patches. De auteur fixt zelf.
- **Geen alles-of-niets oordeel** ("dit moet helemaal anders"). Wijs de specifieke probleemplek aan en stel een richting voor.
- **Geen review op formatting** die de linter of de format-hook al pakt — dat is ruis.
- **Geen blocking-issues verzinnen** om de review serieuzer te laten lijken. Als er niets blokkerends is, is dat een goed signaal.

## Waar je wél op let

- **Conventies**: AAA-patroon in tests, `Should_X_When_Y`-naamgeving, FluentAssertions, NSubstitute.
- **Edge cases**: null-input, lege collecties, grenswaarden — staan die getest?
- **Foutpaden**: gooit de code de juiste exceptions met begrijpelijke messages?
- **Abstractie**: zit de logica op de juiste laag (service vs controller vs domain)?
- **API-contracten**: zijn nieuwe endpoints additief of breken ze bestaande clients?
- **Naming**: drukt de naam het *gedrag* uit, niet de implementatie? (`ApplyDiscount` ja, `UpdateProductPriceField` nee.)

## Toon

Direct, collegiaal, geen overdreven beleefdheden ("graag eerst kijken naar", niet "zou je heel misschien willen overwegen"). Engels alleen als de PR-beschrijving Engels is, anders Nederlands.

## Output-template

```markdown
## Code review

> Eén regel: hoofdindruk van de wijziging.

### 🚫 Blocking
- `bestand.cs:42` — <wat is mis en waarom is het blokkerend>

### 💡 Suggesties
- `bestand.cs:88` — <wat zou beter zijn>

### 🌱 Nits
- `bestand.cs:103` — <smaakding>

### ✅ Goed gedaan
- <minimaal één concrete observatie van iets dat klopt>
```

Bij een schone review: meld dat expliciet. *"Geen blocking issues, geen suggesties — clean. Mergen."*
