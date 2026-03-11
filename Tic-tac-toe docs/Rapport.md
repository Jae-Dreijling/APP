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

De AI neemt beslissingen op basis van de huidige speltoestand. Eerst wordt een eenvoudige willekeurige strategie geïmplementeerd om het spel speelbaar te maken. Daarna wordt het minimax-algoritme toegevoegd zodat de AI optimale zetten kan bepalen.

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

Om te bepalen of een speler gewonnen heeft, worden alle mogelijke winnende patronen gedefinieerd als data.

Voor Tic-Tac-Toe zijn dit de volgende combinaties:

[0,1,2]  
[3,4,5]  
[6,7,8]  
[0,3,6]  
[1,4,7]  
[2,5,8]  
[0,4,8]  
[2,4,6]

Door deze patronen als data te definiëren kan het programma eenvoudig controleren of een speler een winnende combinatie heeft.

De functie `winner(board)` doorloopt deze patronen en controleert of drie posities dezelfde speler bevatten.

Dit is een declaratieve aanpak: de regels van het spel worden eerst als data beschreven en daarna geëvalueerd door functies.

---

## Detectie van het einde van het spel

Het programma moet kunnen bepalen wanneer een spel afgelopen is.

Dit gebeurt in de functie:

game_over?(board)

Een spel eindigt wanneer:

- een speler heeft gewonnen
- er geen geldige zetten meer over zijn

Deze functie combineert de resultaten van `winner(board)` en `valid_moves(board)` om te bepalen of het spel beëindigd moet worden.

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

Het spelverloop wordt geïmplementeerd met behulp van **recursie**.

In plaats van een traditionele lus (zoals een while-loop) wordt een functie gebruikt die zichzelf opnieuw aanroept totdat het spel afgelopen is.

De functie `loop(board, player)` voert de volgende stappen uit:

- toon het huidige bord
- vraag een zet aan de speler
- genereer een nieuwe bordtoestand
- wissel van speler
- roep de functie opnieuw aan

Wanneer het spel afgelopen is wordt de recursie beëindigd.

Deze aanpak sluit goed aan bij het functionele paradigma, omdat:

- er geen mutabele state nodig is
- elke spelzet een nieuwe bordtoestand genereert
- de spelstroom volledig wordt bepaald door functieresultaten
---

## Simpele AI strategie

Voordat het minimax-algoritme wordt geïmplementeerd, is eerst een eenvoudige AI ontwikkeld.

Deze AI kiest willekeurig een geldige zet uit alle beschikbare zetten op het bord.

De functie in de AI module werkt als volgt:

1. bepaal alle geldige zetten met `valid_moves(board)`
2. kies willekeurig één van deze zetten
3. voer deze zet uit

De implementatie gebruikt hiervoor:

Enum.random(valid_moves)

Deze eenvoudige strategie maakt het mogelijk om het spel al volledig te spelen tegen een computertegenstander. Tegelijkertijd vormt dit een goede basis voor de latere implementatie van het minimax-algoritme, waarbij de AI niet willekeurig maar strategisch optimale zetten kiest.

---

## Minimax algoritme

Na de implementatie van een eenvoudige AI werd het minimax-algoritme toegevoegd.

Het minimax-algoritme onderzoekt alle mogelijke toekomstige speltoestanden om de beste zet te bepalen. Voor elke mogelijke zet wordt het spel verder gesimuleerd totdat een eindtoestand wordt bereikt.

Elke eindtoestand krijgt een score:

- winst voor de AI → score 1
- gelijkspel → score 0
- verlies voor de AI → score -1

Door alle mogelijke zetten te evalueren kan de AI bepalen welke zet uiteindelijk de beste uitkomst oplevert.

De implementatie maakt intensief gebruik van **recursie**. Voor elke mogelijke zet wordt de functie opnieuw aangeroepen met een nieuwe bordtoestand.

Omdat elke zet een nieuw bord genereert en het oorspronkelijke bord onveranderd blijft, sluit deze aanpak goed aan bij het concept **immutability**.

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