# Demo-script voor de kennissessie

Stappenplan voor de presentator. Tijden zijn richtlijnen.

## Voorbereiding (vóór de sessie)

- [ ] Push deze repo naar GitHub (bijv. `dutchworkz/dutchworkz-copilot-skills-demo`) en pas in de commando's hieronder `<owner>` aan.
- [ ] `dotnet --version` ≥ 8 en `dotnet test` werkt — baseline moet groen zijn:
  ```
  dotnet test
  # 18 passed, 0 failed
  ```
- [ ] VS Code: zet de setting `chat.useAgentSkills` aan.
- [ ] Copilot CLI geïnstalleerd en ingelogd (`copilot` start zonder fouten). Voor de superpowers-demo idem voor `claude` of `copilot` met plugin-support.
- [ ] GitHub CLI v2.90+ voor het `gh skill`-blok: `gh --version`.
- [ ] Maak screenshots van elke demostap als vangnet.
- [ ] Zet je terminal-font groot (zaal-leesbaar) en schakel notificaties uit.
- [ ] Verberg of verwijder `docs/superpowers/specs/2026-06-15-discount-feature-design.md` tijdens demo 2 — anders ziet het publiek het antwoord al staan. (Of laat hem staan en gebruik hem als "kijk, dít komt eruit"-finale.)

## Demo 1 — Skill bouwen en live gebruiken (12 min)

Doel: laten zien dat een skill gewoon een map met markdown is, en dat Copilot hem zelf vindt.

1. Open deze repo in VS Code. Toon `plugins/dutchworkz-docs/skills/release-notes/SKILL.md` en loop de frontmatter langs: `name`, `description` (= de trigger). Noem dat exact ditzelfde bestand óók als project-skill werkt: drop de map in `.github/skills/` en Copilot ontdekt 'm zonder install — handig voor de "een skill is gewoon markdown"-demo.
2. Wijs op `references/` en `examples/`: progressive disclosure — dit laadt de agent alleen als het nodig is.
3. Open Copilot Chat (agent mode) en typ `/skills` → laat zien dat `release-notes` gevonden is.
4. Prompt: **"Maak release notes voor de wijzigingen sinds de vorige release."**
   Wijs aan dat de skill activeert en dat de output het format uit `examples/voorbeeld.md` volgt.
5. Zelfde skill in de terminal: start `copilot` in de repo-root, typ `/skills reload` en daarna `/skills info release-notes`.
6. Brug naar het volgende blok: *"Goed nieuws — je hoeft ze niet allemaal zelf te schrijven."*

## Demo 2 — Twee marketplaces, één workflow (8 min)

Doel: een nieuwe methode (`ApplyDiscount`) toevoegen aan de Products API door de **brainstorming**-skill uit `obra/superpowers` te combineren met de **DutchWorkz**-plugin uit deze repo. Het volledige scenario staat in [`extending-the-api.md`](extending-the-api.md).

### Stap 1 — De anti-demo (30 sec)

Eén prompt zonder plugins:

> "Voeg een ApplyDiscount-methode toe aan ProductService."

De agent schrijft iets redelijks, maar gokt op percentage-of-bedrag, mist edge cases en verzint validatie. Markeer dat dit op den duur rework wordt. Maak die wijzigingen niet definitief: `git checkout .` daarna.

### Stap 2 — Installeer de twee plugins (1 min)

In een schone agent-sessie:

```
/plugin marketplace add obra/superpowers-marketplace
/plugin install superpowers@superpowers-marketplace

/plugin marketplace add <owner>/dutchworkz-copilot-skills-demo
/plugin install dutchworkz-dotnet@dutchworkz-skills
/plugin install dutchworkz-docs@dutchworkz-skills
```

### Stap 3 — Eén prompt, complete workflow (5 min)

> "Ik wil een korting-feature toevoegen aan de Products API."

Wijs live aan wat er gebeurt:

1. **brainstorming activeert** (HARD-GATE: geen code tot ontwerp goed is). De agent leest eerst `ProductService.cs` en stelt één vraag tegelijk — percentage vs vast bedrag, edge cases, audit-trail.
2. Beantwoord de vragen kort. Pin de antwoorden vooraf op een briefje voor jezelf: *percentage 0–90, geen audit-trail, geen scheduling, additieve endpoint*.
3. De skill presenteert het ontwerp in secties, vraagt per sectie om akkoord, en schrijft het uiteindelijk naar `docs/superpowers/specs/<datum>-discount-feature-design.md`.
4. **writing-plans** breekt het werk in taken op.
5. **test-driven-development** schrijft eerst een falende test. De **DutchWorkz unit-tests** skill levert het format (xUnit + FluentAssertions + NSubstitute + naamgeving).
6. Implementatie. Na elke `Write` draait de **format-csharp** hook automatisch.
7. `dotnet test` — alles groen.

### Stap 4 — Review (1 min)

> "Review de wijziging."

De **code-review** skill activeert en levert feedback in drie blokken (🚫 Blocking / 💡 Suggesties / 🌱 Nits) volgens DutchWorkz-stijl. De skill geeft alleen commentaar, schrijft zelf geen code — wat de auteur weer in de driver's seat zet voor de fix.

### Stap 5 — De payoff (30 sec)

Vergelijk: zelfde prompt als in stap 1, maar nu met een design-doc op disk, tests die zinvol zijn, een geformatteerd bestand en een review. Eén prompt, twee plugins, vier verschillende customization-types in actie.

## Reserve: gh skill (als er tijd over is)

```
gh skill search documentation
gh skill preview github/awesome-copilot documentation-writer
gh skill install github/awesome-copilot documentation-writer
```

Benadruk: `preview` vóór `install` — je haalt instructies binnen die je AI gaat uitvoeren.

## Als de demo-goden boos zijn

- Geen netwerk of auth-problemen → schakel over op de voorbereide screenshots.
- Skill triggert niet automatisch → roep hem expliciet aan: noem `/brainstorming` of `/release-notes` in je prompt.
- `/plugin` kent de marketplace niet → check `/plugin marketplace list` en voeg opnieuw toe; let op de naam mét owner-prefix bij `install` (`plugin@marketplace`).
- brainstorming stelt te veel vragen voor een 5-minuten demo → onderbreek met: *"Genoeg context, schrijf het ontwerp en ga verder."* De skill respecteert dat.
- `dotnet test` faalt na implementatie → zeg: *"Run dotnet test en fix de fouten."* superpowers heeft hier een eigen workflow voor.
