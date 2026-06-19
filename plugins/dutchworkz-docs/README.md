# dutchworkz-docs

Dutchworkz documentatie-conventies voor coding agents.

## Skills

- **adr** — schrijft Architecture Decision Records volgens het Dutchworkz-format (Context / Overwogen opties / Beslissing / Consequenties), in het Nederlands, maximaal één A4.
- **release-notes** — genereert release notes en changelogs gegroepeerd in Features / Fixes / Breaking changes / Overig. Gebruikt progressive disclosure: het volledige format staat in `skills/release-notes/references/format.md`, een voorbeeld in `skills/release-notes/examples/voorbeeld.md`.

## Installeren

```
/plugin marketplace add <owner>/skills-demo
/plugin install dutchworkz-docs@skills-demo
```

## Project-skill zonder install

Dezelfde `SKILL.md`-bestanden werken óók als project-skill: kopieer een skill-map naar `.github/skills/` in je eigen repo en de agent ontdekt 'm automatisch — zonder marketplace of install. De marketplace-route is bedoeld om dezelfde conventies over meerdere repo's te delen en te versioneren.
