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

In dit project worden meerdere kernconcepten van functioneel programmeren toegepast.

##### Pure functions  
Functies hebben geen bijwerkingen en produceren altijd dezelfde output voor dezelfde input.

##### Immutability  
Speltoestanden worden niet aangepast maar vervangen door nieuwe waarden.

##### Recursie  
Recursie wordt gebruikt in plaats van traditionele lussen, bijvoorbeeld in het spelverloop en het minimax-algoritme.

##### Pattern matching  
Wordt gebruikt om verschillende speltoestanden te herkennen.

##### Higher-order functions  
Functies uit de Enum module worden gebruikt om lijsten declaratief te verwerken.

---

# Challenge

## Probleemstelling

Het doel van de challenge is het ontwikkelen van een Tic-Tac-Toe spel waarin een menselijke speler het opneemt tegen een computertegenstander.

De AI neemt beslissingen op basis van de huidige speltoestand. Eerst wordt een eenvoudige willekeurige strategie geïmplementeerd om het spel speelbaar te maken. Daarna wordt het minimax-algoritme toegevoegd zodat de AI optimale zetten kan bepalen. Uiteindelijk worden meerdere moeilijkheidsniveaus toegevoegd zodat verschillende AI strategieën gebruikt kunnen worden.

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

### Fase 3 — Spelregels
- detectie van winst
- bepalen van geldige zetten
- detectie van gelijkspel

### Fase 4 — Spelverloop
- implementatie van de game loop
- beurtwisseling tussen spelers
- invoer van spelers via de command line

### Fase 5 — Simpele AI
- computer kiest willekeurige geldige zetten
- implementatie van een AI module
- integratie van AI in de game loop

### Fase 6 — Minimax AI
- implementatie van het minimax-algoritme
- evaluatie van mogelijke speltoestanden
- selectie van de optimale zet

### Fase 7 — Moeilijkheidsniveaus
- meerdere AI strategieën
- eenvoudige selectie van AI gedrag
- vergelijking tussen willekeurige en optimale strategie
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

De module `Game` beheert het spelverloop. Deze module bevat de recursieve game loop die het spel blijft uitvoeren totdat een eindtoestand wordt bereikt.

Door het spelverloop te scheiden van de bordlogica blijft de code overzichtelijk. De module `Board` bevat functies die de bordtoestand analyseren, terwijl `Game` verantwoordelijk is voor de volgorde waarin deze functies worden aangeroepen.

Deze structuur helpt om functionaliteit te scheiden in **kleine, herbruikbare functies**, wat goed aansluit bij het functionele paradigma.

## Spelbord representatie

De eerste stap in de implementatie was het ontwerpen van een geschikte datastructuur voor het spelbord.

Het bord wordt gerepresenteerd als een lijst met negen elementen. Elke positie in de lijst komt overeen met een vakje op het Tic-Tac-Toe bord.

Indexstructuur:

0 1 2  
3 4 5  
6 7 8  

Een voorbeeld van een bordtoestand:

[:x, :o, :empty,
 :empty, :x, :empty,
 :o, :empty, :empty]

Deze representatie sluit goed aan bij het functionele paradigma. In plaats van het bord direct te wijzigen, genereert elke zet een **nieuwe bordtoestand**. De oorspronkelijke toestand blijft onveranderd.

Dit illustreert het concept **immutability**.

---

## Pure functies

De bordlogica bestaat uit pure functies. Deze functies hebben geen bijwerkingen en geven altijd dezelfde output bij dezelfde input.

Voorbeelden:

* apply_move(board, position, player)  
* valid_moves(board)  
* winner(board)  
* game_over?(board)
* next_player(player)

Omdat deze functies geen externe toestand veranderen, blijven ze eenvoudig te testen en te begrijpen.

---

## Higher order functions

Voor het analyseren van het bord wordt gebruik gemaakt van functies uit de Enum module, zoals:

* Enum.filter  
* Enum.map  
* Enum.any?

Deze functies verwerken lijsten op een declaratieve manier. Hierdoor blijft de code compact en duidelijk.

---

## Wincondities

De mogelijke winnende patronen worden als data opgeslagen:

[0,1,2]  
[3,4,5]  
[6,7,8]  
[0,3,6]  
[1,4,7]  
[2,5,8]  
[0,4,8]  
[2,4,6]

De functie `winner(board)` controleert of een speler een van deze patronen bezit.

---

## Detectie van het einde van het spel

Het spel eindigt wanneer:

- een speler gewonnen heeft
- er geen geldige zetten meer zijn

Dit wordt bepaald door de functie `game_over?(board)`, die zowel `winner(board)` als `valid_moves(board)` gebruikt.

---

## Pattern matching

Pattern matching wordt gebruikt om verschillende bordwaarden om te zetten naar symbolen die op het scherm worden weergegeven.

Bijvoorbeeld:

* symbol(:x) -> "X"  
* symbol(:o) -> "O"  
* symbol(:empty) -> "_"*

Deze aanpak maakt het eenvoudig om verschillende gevallen te behandelen zonder complexe if-structuren.

--- 

## Recursie voor spelverloop

Het spelverloop wordt geïmplementeerd met recursie.  
De functie `loop(board, player)` roept zichzelf opnieuw aan na iedere zet totdat het spel afgelopen is.

Elke zet produceert een nieuw bord, waardoor er geen mutabele state nodig is.

---

## Simpele AI strategie

De eerste AI strategie kiest een willekeurige geldige zet.

De functie bepaalt eerst alle mogelijke zetten met `valid_moves(board)` en kiest daarna een willekeurige positie met:

Enum.random(valid_moves)

Deze strategie maakt het mogelijk om het spel al tegen een computer te spelen voordat de strategische AI wordt toegevoegd.

---

## Minimax algoritme

Het minimax-algoritme onderzoekt alle mogelijke toekomstige speltoestanden om de beste zet te bepalen.

Eindtoestanden krijgen een score:

- winst → 1
- gelijkspel → 0
- verlies → -1

Het algoritme gebruikt recursie om alle mogelijke zetten te simuleren en kiest uiteindelijk de zet met de beste score.

---
## Moeilijkheidsniveaus

De AI ondersteunt drie moeilijkheidsniveaus.

Easy  
De AI kiest willekeurige zetten.

Medium  
De AI combineert willekeurige zetten met minimax.

Hard  
De AI gebruikt volledig minimax en speelt optimaal.

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