# Tic-Tac-Toe AI in Elixir  
## Functioneel Paradigma Challenge

---

# Inleiding

Voor de opdracht *Functioneel Paradigma* wordt een Tic-Tac-Toe AI ontwikkeld in de functionele programmeertaal **Elixir**.  
Het doel van deze opdracht is om functionele programmeerconcepten niet alleen theoretisch te begrijpen, maar deze ook concreet toe te passen binnen een algoritmische implementatie.

Hoewel Tic-Tac-Toe een relatief eenvoudig spel lijkt, biedt het voldoende structuur om belangrijke functionele concepten te demonstreren. In het bijzonder is het **minimax-algoritme** geschikt om recursie, immutability en declaratief denken toe te passen.

De implementatie zal stapsgewijs worden opgebouwd. In elke fase wordt nieuwe functionaliteit toegevoegd terwijl tegelijkertijd wordt onderzocht hoe functionele programmeerconcepten in de praktijk worden gebruikt.

---

# Onderzoek

## Gekozen programmeertaal: Elixir

Voor deze opdracht is gekozen voor **Elixir**, een functionele programmeertaal die draait op de Erlang Virtual Machine (BEAM). Elixir combineert een relatief toegankelijke syntaxis met sterke ondersteuning voor functionele programmeerprincipes.

Belangrijke eigenschappen van Elixir zijn:

- Data is **immutabel**
- **Pattern matching** is een kernmechanisme van de taal
- Recursie wordt gebruikt in plaats van traditionele lussen
- Functies zijn **first-class citizens**
- De taal ondersteunt **higher-order functions**

Deze eigenschappen maken Elixir geschikt om het functionele paradigma in een relatief zuivere vorm te onderzoeken.

---

## Functionele concepten

### Pure Functions

Een pure functie is een functie die:

- altijd dezelfde output geeft voor dezelfde input
- geen bijwerkingen heeft

Dit betekent dat de functie geen globale variabelen verandert en geen externe toestand beïnvloedt.

Voorbeelden in het Tic-Tac-Toe project zullen onder andere functies zijn die:

- controleren of een speler gewonnen heeft
- mogelijke zetten genereren
- een nieuwe speltoestand berekenen

---

### Immutability

Immutability betekent dat data niet kan worden aangepast nadat deze is aangemaakt. In plaats daarvan wordt een nieuwe waarde gecreëerd.

Binnen het Tic-Tac-Toe spel betekent dit dat een nieuwe spelzet niet het bestaande bord verandert, maar een **nieuw bord genereert**.

Dit voorkomt onverwachte bijwerkingen en maakt het eenvoudiger om speltoestanden te analyseren.

---

### Recursie

In functionele talen wordt herhaling vaak gerealiseerd met **recursie** in plaats van lussen.

Een recursieve functie roept zichzelf aan met een kleinere versie van het probleem totdat een basisgeval wordt bereikt.

In deze opdracht zal recursie vooral gebruikt worden in:

- het **minimax-algoritme**
- het doorlopen van mogelijke speltoestanden

---

### Pattern Matching

Pattern matching is een techniek waarbij een functie verschillende uitvoeringen kan hebben afhankelijk van de structuur van de input.

Dit kan bijvoorbeeld gebruikt worden om verschillende speltoestanden te herkennen, zoals:

- winst
- verlies
- gelijkspel

---

### Higher-Order Functions

Higher-order functions zijn functies die andere functies als argument kunnen ontvangen of functies kunnen retourneren.

Elixir bevat hiervoor verschillende standaardfuncties in de `Enum` module, zoals:

- `Enum.map`
- `Enum.reduce`
- `Enum.filter`

Deze functies maken het mogelijk om collecties op een declaratieve manier te verwerken.

---

# Challenge

## Probleemstelling

Het doel van de challenge is het ontwikkelen van een Tic-Tac-Toe spel waarin een menselijke speler het opneemt tegen een computertegenstander.

De AI moet zelfstandig beslissingen nemen op basis van de huidige speltoestand en proberen een optimale zet te kiezen.

---

## Scope van de implementatie

De focus van de implementatie ligt op:

- correcte spelregels
- het modelleren van speltoestanden
- het implementeren van een AI-algoritme

De gebruikersinterface wordt eenvoudig gehouden en zal via de **command line** verlopen.

---

## Gefaseerde implementatie

De implementatie wordt opgesplitst in meerdere fasen:

### Fase 1 — Projectsetup en onderzoek
- installatie van Elixir
- opzetten van de projectstructuur
- onderzoek naar functionele programmeerconcepten

### Fase 2 — Basis Tic-Tac-Toe
- representatie van het spelbord
- validatie van zetten
- detectie van winst of gelijkspel

### Fase 3 — Simpele AI
- computer kiest willekeurige geldige zetten

### Fase 4 — Minimax AI
- implementatie van het minimax-algoritme

### Fase 5 — Moeilijkheidsniveaus
- verschillende AI strategieën (easy, medium, hard)

---

# Implementatie

## Ontwikkelomgeving

Voor dit project wordt gebruik gemaakt van **Elixir** en het build-systeem **Mix**.

Een nieuw project werd aangemaakt met het volgende commando:

```bash
mix new tic_tac_toe
```

Dit genereert automatisch een projectstructuur met mappen voor broncode en tests.

---

## Projectstructuur

De logica van het programma wordt verdeeld over meerdere modules:

| Module | Verantwoordelijkheid |
|------|------|
| `board.ex` | representatie van het spelbord |
| `game.ex` | spelregels |
| `ai.ex` | AI beslislogica |
| `cli.ex` | interactie met de speler |

Deze structuur helpt om functionaliteit te scheiden in **kleine, herbruikbare functies**, wat goed aansluit bij het functionele paradigma.

---

## Versiebeheer

Voor versiebeheer wordt **GitHub Desktop** gebruikt.  
Hiermee worden wijzigingen in het project bijgehouden en gecommit gedurende het ontwikkelproces.

Het gebruik van versiebeheer maakt het mogelijk om de ontwikkeling van het project stap voor stap te volgen.

---

# Reflectie

*(Wordt later ingevuld tijdens verdere implementatiefasen.)*

---

# Conclusie

*(Wordt ingevuld nadat de implementatie voltooid is.)*

---

# Gebruik van GenAI

Tijdens het schrijven van dit rapport is **ChatGPT** gebruikt als hulpmiddel.

De rol van ChatGPT in dit proces was:

- het structureren van reeds geschreven inhoud
- het herschrijven van tekst voor betere leesbaarheid
- het formatteren van de tekst in Markdown

De inhoudelijke keuzes, structuur van de opdracht en technische beslissingen zijn door de student zelf gemaakt. ChatGPT werd uitsluitend gebruikt om bestaande ideeën duidelijker en consistenter te formuleren.

---

# Bronvermelding

*(Wordt later aangevuld)*