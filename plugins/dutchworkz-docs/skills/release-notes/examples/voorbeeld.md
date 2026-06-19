# Release 2.3.0 — 14 mei 2026

> Deze release voegt korting-functionaliteit toe aan de Products API en lost twee bugs op.

## 🚀 Features
- Producten kunnen nu een percentage-korting krijgen via `POST /products/{id}/discount` (#138)
- Donkere modus toegevoegd aan het klantportaal (#141)

## 🐛 Fixes
- Negatieve prijzen worden nu correct geweigerd bij het aanmaken van een product (#139)
- Datumvelden tonen nu de juiste tijdzone voor gebruikers buiten Nederland (#143)

## ⚠️ Breaking changes
- De instelling `ReportTimeout` is hernoemd naar `Reporting:TimeoutSeconds` — **Actie vereist:** werk `appsettings.json` bij vóór het deployen.

---
*Vragen over deze release? Meld je in het #releases-kanaal.*
