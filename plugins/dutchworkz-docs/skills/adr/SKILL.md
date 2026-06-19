---
name: adr
version: 1.2.0
description: Schrijft Architecture Decision Records (ADR's) volgens het Dutchworkz-format. Gebruik bij architectuurbeslissingen, technologie-keuzes, design decisions of wanneer gevraagd wordt een beslissing vast te leggen of te documenteren.
---

# ADR's schrijven volgens Dutchworkz-format

Gebruik dit format wanneer de gebruiker een architectuurbeslissing wil vastleggen.

## Werkwijze

1. Bepaal het volgende ADR-nummer door bestaande bestanden in `docs/adr/` te tellen (formaat: `NNNN-korte-titel.md`, bijv. `0007-cosmos-db-voor-productdata.md`).
2. Stel gerichte vragen als context ontbreekt: wat is het probleem, welke opties zijn overwogen, wat zijn de drijvende krachten (kosten, team-kennis, klant-eisen)?
3. Schrijf het ADR volgens onderstaand template, in het Nederlands.
4. Houd het kort: een ADR dat niemand leest, bestaat niet. Maximaal één A4.

## Template

```markdown
# NNNN. <Beslissing als actieve zin, bijv. "Gebruik Cosmos DB voor productdata">

Datum: <jjjj-mm-dd>
Status: Voorgesteld | Geaccepteerd | Vervangen door NNNN

## Context
<Het probleem en de krachten die spelen. Feitelijk, geen oplossing hier.>

## Overwogen opties
1. <Optie> — <belangrijkste voor- en nadeel>
2. <Optie> — <belangrijkste voor- en nadeel>

## Beslissing
<Welke optie is gekozen en de doorslaggevende reden.>

## Consequenties
- **Positief:** <wat wordt makkelijker>
- **Negatief:** <wat accepteren we als nadeel of risico>
```

## Regels

- Status start op "Voorgesteld" tenzij de gebruiker zegt dat de beslissing al genomen is.
- Schrijf de context zó dat een nieuwe collega over twee jaar de beslissing nog begrijpt.
- Een vervangen ADR wordt nooit verwijderd of herschreven; maak een nieuw ADR en verwijs terug.
- Noem negatieve consequenties eerlijk; een ADR zonder nadelen is een verkooppraatje.
