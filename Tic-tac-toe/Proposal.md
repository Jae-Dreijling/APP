# Proposal – Functioneel Paradigma Challenge

## Titel
**Tic-Tac-Toe AI in Elixir – Een functionele benadering van spelstrategie**

---

## Inleiding
Voor de opdracht *Functioneel Paradigma* zal ik een Tic-Tac-Toe AI implementeren in de functionele programmeertaal **Elixir**.  
Het doel van deze challenge is om functionele programmeerconcepten niet alleen te gebruiken, maar ook bewust toe te passen en te koppelen aan concrete onderdelen van een algoritme.

Tic-Tac-Toe lijkt op het eerste gezicht een eenvoudig spel, maar leent zich uitstekend voor het toepassen van functionele concepten zoals immutability, recursie en pure functies, met name bij het implementeren van een beslisalgoritme (minimax).

* **Opmerking:** Dit voorstel is oorspronkelijk door de student in het Engels geschreven en vervolgens met behulp van ChatGPT netjes geformatteerd.

---

## Gekozen programmeertaal: Elixir

Elixir is een functionele programmeertaal die draait op de Erlang VM (BEAM) en bekend staat om zijn sterke ondersteuning voor immutability, pattern matching en recursie.

### Waarom Elixir?
- Elixir dwingt **immutability** af: data kan niet aangepast worden, alleen vervangen.
- **Pattern matching** is een kernonderdeel van de taal en zeer geschikt voor het modelleren van speltoestanden.
- Recursie wordt idiomatisch gebruikt in plaats van imperatieve loops.
- De syntaxis is leesbaar, wat helpt bij het uitleggen van de code en de functionele keuzes in het rapport.
- Elixir is functioneel genoeg om het paradigma goed te demonstreren, maar praktisch genoeg om de focus op het algoritme te houden.

---

## Beschrijving van de Challenge

### Probleemstelling
Ontwerp en implementeer een Tic-Tac-Toe spel waarbij een menselijke speler het opneemt tegen een computertegenstander (AI).  
De AI moet zelfstandig optimale zetten kunnen bepalen op basis van de huidige speltoestand.

### Scope
- Het spel wordt tekst-gebaseerd (console).
- De focus ligt op de **spelregels en beslislogica**, niet op grafische presentatie.
- De AI maakt gebruik van een **minimax-algoritme** om optimale zetten te kiezen.

--- 

## Gefaseerde Implementatie & Moeilijkheidsniveaus

De implementatie van het spel wordt gefaseerd opgebouwd, waarbij elke fase een hoger niveau van complexiteit en functioneel inzicht introduceert.  
Dit maakt het mogelijk om het project zowel toegankelijk als uitbreidbaar te houden.

### Fase 1 – Basis Tic-Tac-Toe (Beginner)
- Mens tegen mens
- Vast spelbord (3×3)
- Validatie van zetten
- Detectie van winst, verlies of gelijkspel

**Focus:**  
- Pure functies  
- Immutability  
- Basale recursie / patroonherkenning  

---

### Fase 2 – Simpele AI (Gemiddeld)
- Mens tegen computer
- AI kiest een willekeurige geldige zet

**Focus:**  
- Scheiding tussen spelregels en beslislogica  
- Gebruik van higher-order functions  
- Voorbereiding op complexere AI  

---

### Fase 3 – Minimax AI (Gevorderd)
- Implementatie van het minimax-algoritme
- AI kiest optimale zetten
- Evaluatie van speltoestanden (win/verlies/gelijkspel)

**Focus:**  
- Recursie  
- Boomstructuren van speltoestanden  
- Declaratief denken  

---

### Fase 4 – Moeilijkheidsniveaus (Expert)
- Meerdere AI-niveaus:
  - *Easy*: willekeurige zetten  
  - *Medium*: beperkte diepte in minimax  
  - *Hard*: volledige minimax  

**Focus:**  
- Beheersing van complexiteit  
- Performance-afwegingen  
- Bewuste keuzes in algoritmisch ontwerp  

---

### (Optioneel) Fase 5 – Optimalisatie & Experimentatie
- Optimalisaties zoals:
  - beperking van zoekdiepte
  - vroegtijdig afbreken van recursie
- Experimenteren met alternatieve evaluatiefuncties

**Focus:**  
- Reflectie op algoritmische keuzes  
- Vergelijking met imperatieve aanpak  


---

## Functionele aanpak

### Representatie van de speltoestand
- Het spelbord wordt gerepresenteerd als een **immutabele datastructuur** (bijvoorbeeld een lijst of tuple).
- Elke zet resulteert in een **nieuwe speltoestand**, de oude blijft onaangetast.

### Kernfunctionaliteit (pure functies)
Voorbeelden van pure functies:
- `apply_move(board, position, player) -> new_board`
- `valid_moves(board) -> list_of_positions`
- `game_over?(board) -> boolean`
- `winner(board) -> :x | :o | :draw | nil`

Deze functies hebben:
- Geen bijwerkingen
- Altijd dezelfde output voor dezelfde input

---

## AI-algoritme: Minimax

De AI maakt als goal gebruik van het **minimax-algoritme**, dat recursief alle mogelijke toekomstige speltoestanden evalueert.

### Waarom minimax geschikt is
- Het algoritme is **van nature recursief**
- Elke speltoestand splitst zich in nieuwe mogelijke toestanden
- Het past goed bij immutability: elke recursieve stap werkt met een nieuwe state

### Functionele concepten in minimax
- **Recursie** voor het doorlopen van de spelboom
- **Pattern matching** om eindtoestanden te herkennen (win/verlies/gelijkspel)
- **Higher-order functions** zoals `map` en `reduce` voor het evalueren van mogelijke zetten

---

## Toegepaste functionele concepten

| Concept | Toepassing in de challenge |
|------|----------------------------|
| Pure functions | Alle spelregels en evaluaties |
| Immutability | Spelbord en speltoestanden |
| Recursie | Minimax-algoritme |
| Pattern matching | Spelstatus, wincondities |
| Higher-order functions | Evaluatie van mogelijke zetten |
| Declaratief programmeren | Beschrijven *wat* er gebeurt i.p.v. *hoe* |

---

## Implementatie & Werkwijze

- De implementatie wordt volledig geschreven in **Elixir**.
- Er wordt gebruik gemaakt van Git, met regelmatige commits per stap:
  - Basis spelregels
  - Speltoestand en validatie
  - AI-logica (minimax)
  - Integratie en testen
- De code bevat uitgebreide **commentaren** waarin functionele keuzes worden toegelicht.

---

## Conclusie
Deze challenge combineert een overzichtelijk probleem met voldoende diepgang om het functionele paradigma te onderzoeken en toe te passen.  
Door het gebruik van Elixir en een AI-algoritme zoals minimax wordt op een concrete en begrijpelijke manier aangetoond hoe functionele programmeerconcepten samenwerken in een realistisch algoritme.

---

## Bronnen (voorlopig)
- Elixir officiële documentatie
- ChatGPT – formatteren
