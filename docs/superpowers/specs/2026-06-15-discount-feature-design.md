# Discount feature — design

> **Status:** voorbeeld. Dit is wat de `brainstorming`-skill uit `obra/superpowers` zou produceren na het ontwerp-gesprek. Niet manueel bewerken tijdens een demo; gebruik als referentie voor wat een goed design-doc bevat.

## Doel

Productowner wil korting kunnen geven op losse producten in de Products API. Korting is altijd een percentage tussen 0 en 90, geldt direct (geen scheduling), en wordt door een interne tool aangeroepen via een nieuwe REST-endpoint.

## Niet in scope

- Geen kortingen per categorie of klantsegment (komt eventueel in een volgende iteratie).
- Geen tijdgebonden of cumulatieve kortingen.
- Geen authenticatie/authorisatie — die ligt al een laag hoger in de gateway.

## Architectuur

Eén nieuwe methode op `ProductService` en één nieuwe route op `ProductsController`. Geen nieuw bounded context, geen nieuwe service. We hergebruiken `IProductRepository` voor lees- en schrijfacties.

```
POST /products/{id}/discount   →  ProductsController.ApplyDiscount(id, request)
                                  → ProductService.ApplyDiscount(id, percentage)
                                    → IProductRepository.GetById / Update
```

## API-contract

```http
POST /products/42/discount
Content-Type: application/json

{ "percentage": 15 }
```

**Responses**

| Status | Body                          | Wanneer                                    |
| ------ | ----------------------------- | ------------------------------------------ |
| 200    | het bijgewerkte `Product`     | Korting toegepast                          |
| 400    | `ValidationException`-message | Percentage buiten [0, 90] of id ≤ 0        |
| 404    | leeg                          | Product met deze id bestaat niet           |

## Servicemethode

```csharp
Product ApplyDiscount(int id, decimal percentage);
```

**Regels**

- `id ≤ 0` → `ValidationException("Product id must be greater than zero.")`
- `percentage < 0` → `ValidationException("Discount percentage cannot be negative.")`
- `percentage > 90` → `ValidationException("Discount percentage cannot exceed 90.")`
- product niet gevonden → `KeyNotFoundException`
- happy path: bereken nieuwe prijs als `oudePrijs * (1 - percentage/100)`, rond af op 2 decimalen, persist via `IProductRepository.Update`, retourneer het nieuwe product.

## Data flow

Stateless. Repository krijgt het gewijzigde `Product`-record en vervangt het bestaande. Geen events, geen audit-trail (out of scope volgens productowner).

## Error handling

Bestaande exception-handling van de controller is genoeg: `ValidationException` mapt naar 400, `KeyNotFoundException` naar 404, rest naar 500. Geen nieuwe middleware nodig.

## Testing

Volgens de DutchWorkz `unit-tests` skill. Minimaal de volgende testgevallen:

1. `ApplyDiscount_Should_ReturnDiscountedProduct_When_PercentageIsValid`
2. `ApplyDiscount_Should_ThrowValidationException_When_PercentageIsNegative`
3. `ApplyDiscount_Should_ThrowValidationException_When_PercentageExceedsNinety`
4. `ApplyDiscount_Should_ThrowValidationException_When_IdIsZero`
5. `ApplyDiscount_Should_ThrowKeyNotFound_When_ProductDoesNotExist`
6. `ApplyDiscount_Should_RoundResultToTwoDecimals_When_PercentageProducesManyDecimals`

Eén `[Theory]` voor de validatie-grenswaarden (-1, 0, 90, 91) is acceptabel.

## Migratiepad

Geen breaking changes; het is een additieve endpoint. Bestaande clients merken niets.

## Open punten

Geen op dit moment. Productowner heeft expliciet bevestigd dat er geen audit-trail nodig is voor de eerste versie.
