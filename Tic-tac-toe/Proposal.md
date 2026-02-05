# Proposal – Functioneel Paradigma Challenge

## Titel

**Tic-Tac-Toe AI in Elixir – een functionele benadering van spelstrategie**

---

## Inleiding

Voor de opdracht *Functioneel Paradigma* zal ik een Tic-Tac-Toe AI ontwikkelen in de functionele programmeertaal **Elixir**.
Het doel van deze challenge is om functionele programmeerconcepten niet alleen toe te passen, maar ook bewust te koppelen aan concrete onderdelen van een algoritme.

Hoewel Tic-Tac-Toe op het eerste gezicht een eenvoudig spel is, leent het zich uitstekend voor het demonstreren van functionele principes zoals **immutability**, **recursie** en **pure functies**. Met name het implementeren van een beslisalgoritme zoals *minimax* maakt deze challenge geschikt om functioneel denken inzichtelijk te maken.

*Opmerking:* Dit voorstel is oorspronkelijk in het Engels opgesteld en vervolgens herschreven en geformatteerd met behulp van ChatGPT.

---

## Gekozen programmeertaal: Elixir

Elixir is een functionele programmeertaal die draait op de Erlang Virtual Machine (BEAM) en staat bekend om zijn sterke ondersteuning voor immutability, pattern matching en recursie.

### Motivatie voor Elixir

Elixir is gekozen omdat de taal het functionele paradigma expliciet afdwingt en daarmee goed aansluit bij de doelstellingen van deze opdracht:

* Data is **immutabel**: wijzigingen leiden altijd tot nieuwe waarden.
* **Pattern matching** is een kernonderdeel van de taal en geschikt voor het modelleren van speltoestanden.
* Recursie wordt idiomatisch gebruikt in plaats van imperatieve lussen.
* De leesbare syntaxis maakt het eenvoudiger om functionele keuzes te verantwoorden in het verslag.
* Elixir biedt voldoende abstractie om functioneel te programmeren, zonder de focus op het algoritme te verliezen.

---

## Beschrijving van de Challenge

### Probleemstelling

Ontwerp en implementeer een Tic-Tac-Toe spel waarin een menselijke speler het opneemt tegen een computertegenstander (AI).
De AI moet op basis van de huidige speltoestand zelfstandig optimale zetten kunnen bepalen.

### Scope

* Het spel wordt uitgevoerd via de console (tekst-gebaseerd).
* De nadruk ligt op **spelregels en beslislogica**, niet op grafische presentatie.
* De AI maakt gebruik van het **minimax-algoritme** om beslissingen te nemen.

---

## Gefaseerde implementatie en moeilijkheidsniveaus

De implementatie wordt stapsgewijs opgebouwd. Elke fase introduceert extra complexiteit en verdiept het gebruik van functionele concepten.

### Fase 1 – Basis Tic-Tac-Toe (Beginner)

* Mens tegen mens
* Vast spelbord (3×3)
* Validatie van zetten
* Detectie van winst, verlies of gelijkspel

**Focus:**

* Pure functies
* Immutability
* Basale recursie en pattern matching

---

### Fase 2 – Simpele AI (Gemiddeld)

* Mens tegen computer
* AI kiest willekeurig een geldige zet

**Focus:**

* Scheiding tussen spelregels en beslislogica
* Gebruik van higher-order functions
* Voorbereiding op complexere AI-logica

---

### Fase 3 – Minimax AI (Gevorderd)

* Implementatie van het minimax-algoritme
* AI kiest optimale zetten
* Evaluatie van speltoestanden (win/verlies/gelijkspel)

**Focus:**

* Recursie
* Boomstructuren van speltoestanden
* Declaratief denken

---

### Fase 4 – Moeilijkheidsniveaus (Expert)

* Meerdere AI-niveaus:

  * *Easy*: willekeurige zetten
  * *Medium*: beperkte zoekdiepte
  * *Hard*: volledige minimax

**Focus:**

* Beheersing van complexiteit
* Performance-afwegingen
* Bewuste algoritmische keuzes

---

### (Optioneel) Fase 5 – Optimalisatie en experimentatie

* Optimalisaties zoals:

  * beperken van zoekdiepte
  * vroegtijdig afbreken van recursie
* Experimenteren met alternatieve evaluatiefuncties

**Focus:**

* Reflectie op algoritmische keuzes
* Vergelijking met een imperatieve aanpak

---

## Functionele aanpak

### Representatie van de speltoestand

* Het spelbord wordt gerepresenteerd als een **immutabele datastructuur** (bijvoorbeeld een lijst of tuple).
* Elke zet resulteert in een **nieuwe speltoestand**, waarbij eerdere toestanden behouden blijven.

### Kernfunctionaliteit (pure functies)

Voorbeelden van pure functies binnen het spel:

* `apply_move(board, position, player) -> new_board`
* `valid_moves(board) -> list_of_positions`
* `game_over?(board) -> boolean`
* `winner(board) -> :x | :o | :draw | nil`

Deze functies:

* hebben geen bijwerkingen
* leveren altijd dezelfde output bij dezelfde input

---

## AI-algoritme: Minimax

De AI maakt gebruik van het **minimax-algoritme**, waarbij recursief alle mogelijke toekomstige speltoestanden worden geëvalueerd.

### Waarom minimax geschikt is

* Het algoritme is van nature **recursief**
* Elke speltoestand leidt tot nieuwe mogelijke toestanden
* Het sluit goed aan bij immutability, omdat elke stap met een nieuwe state werkt

### Functionele concepten binnen minimax

* **Recursie** voor het doorlopen van de spelboom
* **Pattern matching** voor het herkennen van eindtoestanden
* **Higher-order functions** zoals `map` en `reduce` voor evaluatie

---

## Toegepaste functionele concepten

| Concept                  | Toepassing                     |
| ------------------------ | ------------------------------ |
| Pure functies            | Spelregels en evaluaties       |
| Immutability             | Spelbord en speltoestanden     |
| Recursie                 | Minimax-algoritme              |
| Pattern matching         | Spelstatus en wincondities     |
| Higher-order functions   | Evaluatie van mogelijke zetten |
| Declaratief programmeren | Beschrijven *wat* er gebeurt   |

---

## Implementatie en werkwijze

* De volledige implementatie wordt geschreven in **Elixir**.
* Versiebeheer via Git, met commits per ontwikkelfase:

  * Spelregels en datastructuren
  * Spelverloop en validatie
  * AI-logica (minimax)
  * Integratie en testen
* De code wordt voorzien van **commentaar** waarin functionele keuzes worden toegelicht.

---

## Planning en tijdsbesteding

Voor deze challenge wordt **ongeveer één werkweek (±40 uur)** ingepland.

| Fase                 | Activiteiten                                   | Tijd   |
| -------------------- | ---------------------------------------------- | ------ |
| Oriëntatie & ontwerp | Datastructuren, spelregels, functionele aanpak | 6 uur  |
| Basis Tic-Tac-Toe    | Spelbord, validatie, spelverloop               | 10 uur |
| AI – Minimax         | Ontwerp en implementatie minimax               | 10 uur |
| Uitbreidingen        | Moeilijkheidsniveaus, optimalisaties           | 8 uur  |
| Testen & debugging   | Randgevallen en stabiliteit                    | 4 uur  |
| Reflectie & verslag  | Documentatie en verantwoording                 | 2 uur  |

**Totaal:** ±40 uur

---

## Conclusie

Deze challenge combineert een overzichtelijk probleem met voldoende diepgang om het functionele paradigma praktisch te onderzoeken. Door de keuze voor Elixir en het minimax-algoritme wordt op een concrete en begrijpelijke manier aangetoond hoe functionele programmeerconcepten samenwerken binnen een realistisch algoritme.
