---
name: release-notes
description: Genereert release notes in het Dutchworkz-format. Gebruik bij releases, changelogs, versie-aankondigingen of wanneer gevraagd wordt om een overzicht van wijzigingen sinds de vorige versie of sprint.
---

# Release notes genereren

Genereer release notes volgens het Dutchworkz-format wanneer de gebruiker vraagt om release notes, een changelog of een overzicht van wijzigingen.

## Werkwijze

1. Bepaal het bereik: vraag (of leid af) sinds welke tag, release of sprint de wijzigingen verzameld moeten worden. Gebruik waar mogelijk `git log <vorige-tag>..HEAD --oneline --no-merges` of de lijst met gemergde pull requests.
2. Groepeer elke wijziging in precies één van deze categorieën, in deze volgorde:
   - 🚀 **Features** — nieuwe functionaliteit
   - 🐛 **Fixes** — opgeloste bugs
   - ⚠️ **Breaking changes** — wijzigingen die actie van de gebruiker vereisen
   - 🔧 **Overig** — refactoring, dependencies, documentatie
3. Schrijf elke regel als één zin in de voltooide tijd, vanuit het perspectief van de gebruiker ("Exportfunctie toegevoegd aan het dashboard"), niet vanuit de code ("ExportService geïmplementeerd").
4. Sla lege categorieën over.
5. Volg de opmaak en toon van `examples/voorbeeld.md`.

## Regels

- Schrijf in het Nederlands, tenzij de repository aantoonbaar Engelstalig is.
- Noem bij breaking changes altijd de vereiste actie ("Hernoem de instelling X naar Y in appsettings.json").
- Vermeld PR-nummers tussen haakjes als die beschikbaar zijn, bijv. `(#142)`.
- Houd het beknopt: één regel per wijziging, geen implementatiedetails.

Zie `references/format.md` voor het volledige format met kop- en voettekst.
