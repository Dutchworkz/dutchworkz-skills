# dutchworkz-dotnet

Dutchworkz .NET-conventies voor coding agents.

## Skills

- **code-review** — reviewt C#-code volgens Dutchworkz-standaarden (blocking / suggesties / nits), schrijft commentaar, geen patches.
- **unit-tests** — schrijft xUnit-tests met FluentAssertions en NSubstitute volgens het AAA-patroon en de Dutchworkz-naamgeving.

## Hook

- **PostToolUse** — draait `scripts/format-csharp.sh` (`dotnet format whitespace`) na elke `Write`/`Edit` op een `.cs`-bestand. Het script wordt aangeroepen via `${CLAUDE_PLUGIN_ROOT}`, dus het werkt vanuit elke gebruikersrepo.

> ⚠️ De hook voert een script op je machine uit bij agent-events. Lees `scripts/format-csharp.sh` door vóór installatie.

## Installeren

```
/plugin marketplace add <owner>/skills-demo
/plugin install dutchworkz-dotnet@skills-demo
```
