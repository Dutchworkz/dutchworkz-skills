# DutchWorkz Plugin Marketplace

> [!WARNING]
> **⚠️ This repository exists for demo and educational purposes only.**
> It was built to accompany the DutchWorkz knowledge session *"Skills, plugins & marketplaces voor GitHub Copilot"*.
> The plugins and skills are **not production-ready**, are **not actively maintained**, and should **not be used in real projects**.

This repository contains DutchWorkz's demo set of skills and custom agents for coding agents. For information about the Agent Skills standard, see [agentskills.io](https://agentskills.io).

## What's Included

| Plugin | Description |
|--------|-------------|
| [dutchworkz-dotnet](plugins/dutchworkz-dotnet/) | DutchWorkz .NET conventions: C# code review, xUnit unit tests, and an auto-format hook after every C# edit. |
| [dutchworkz-docs](plugins/dutchworkz-docs/) | DutchWorkz documentation conventions: Architecture Decision Records (ADRs) and release notes. |

## Installation

### 🚀 Copilot CLI / Claude Code

1. Add the marketplace:
   ```
   /plugin marketplace add Dutchworkz/demo-skills
   ```
2. Install a plugin:
   ```
   /plugin install dutchworkz-dotnet@demo-skills
   /plugin install dutchworkz-docs@demo-skills
   ```
3. Restart to load the new plugins.
4. View available skills:
   ```
   /skills
   ```
5. Update plugins on demand:
   ```
   /plugin update dutchworkz-dotnet@demo-skills
   ```

### VS Code / VS Code Insiders (Preview)

> [!IMPORTANT]
> VS Code plugin support is a preview feature and subject to change. You may need to enable it first.

```jsonc
// settings.json
{
  "chat.plugins.enabled": true,
  "chat.plugins.marketplaces": ["Dutchworkz/demo-skills"]
}
```

Once configured, type `/plugins` in Copilot Chat or use the `@agentPlugins` filter in Extensions to browse and install plugins from the marketplace.

### Codex CLI

Skills in this repository follow the [agentskills.io](https://agentskills.io) open standard and are compatible with OpenAI Codex.

1. Add the marketplace:
   ```bash
   codex plugin marketplace add Dutchworkz/demo-skills
   ```
2. Launch Codex and open the plugin browser:
   ```
   /plugins
   ```
3. Browse the `demo-skills` tab and install the desired plugins.

## Contributing

This is a demo repository. For the real-world pattern this repo is based on, see [dotnet/skills](https://github.com/dotnet/skills) and its [CONTRIBUTING.md](https://github.com/dotnet/skills/blob/main/CONTRIBUTING.md).

## License

See [LICENSE](LICENSE) for details.
