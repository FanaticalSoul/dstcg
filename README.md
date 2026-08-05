<img alt="dstcg-header" src="images/dstcg-header.png" />
<div align="center">
	<a href="http://fanaticalsoul.itch.io/dstcg">
		<img src="images/itch-button.png" alt="Play Game">
	</a>
</div>
<p>This is a digital remake of <b>Dark Souls: the Card Game</b>.</p>
<p>Current hosted version on itch.io is <a href="https://github.com/FanaticalSoul/capstone-project/releases/tag/v0.2.9-alpha">v0.2.9-alpha</a> and requires a network connection ( using a VPN seems to cause issues with post request limits ).</p>
<p>Current version for this repo is <a href="https://github.com/FanaticalSoul/dstcg/releases/tag/v0.1.3-alpha">v0.1.3-alpha</a> and does not require a network connection.</p>
<p>Note that this readme file is for the current private repo of this project and as such might cover features not present in "v0.1.3-alpha" like boss encounters, but since these apply to the itch game, they should still be covered.</p>

# Game Rules

### starting deck creation
<ol>
	<li>pick a character</li>
	<li>use a premade deck associated with that character or create your own using the starting cards ( s_card )</li>
	<li>
		<details>
			<summary>select the difficulty of the game</summary>
			<ul>
				<li>impacts</li>
				<ul>
					<li>boss health</li>
					<li>amount of rewards from encounters</li>
					<li>amount of enemies in encounters</li>
					<li>levels of enemies in encounters</li>
					<li>the leaderboard point multiplier</li>
				</ul>
			</ul>
		</details>
	</li>
</ol>
<details>
	<summary>certain steps of the setup handled by program</summary>
	<ol>
		<li>starting map creation</li>
		<ol>
			<li>create three encounter card ( m_card ) decks</li>
			<ol>
				<li>shuffle each deck</li>
				<li>place a face down card on each encounter space on the map</li>
			</ol>
			<li>create three enemy card ( e_card ) decks</li>
			<ol>
				<li>shuffle each deck</li>
			</ol>
			<li>create the boss cards ( b_card ) and behaviour cards</li>
			<li>create and shuffle the common treasure deck ( s_card )</li>
			<li>create and shuffle the transposed treasure deck ( s_card )</li>
			<li>sort the bonfire deck, starting at level 1 ( with 5 at the bottom )</li>
			<ul>
				<li>to view this information during the map phase, hold the right mouse button over the bonfire icon</li>
			</ul>
			<li>create the stamina market</li>
		</ol>
	</ol>
</details>

### map phase (exploration phase)
<ol>
	<li>select a path from the bonfire or cleared encounter</li>
	<ol>
		<li>trigger a connected m_card on that route</li>
		<ul>
			<li>that m_card will be revealed for the rest of the game</li>
		</ul>
		<li>trigger a connected boss icon on that route</li>
	</ol>
	<li>select the bonfire icon to <a href="https://github.com/FanaticalSoul/dstcg?tab=readme-ov-file#bonfire-triggers">trigger a rest</a></li>
</ol>

### bonfire triggers
<ol>
	<li>increase the level of the bonfire otherwise lose the game</li>
	<ul>
		<li>the maxiumum level of a bonfire is five</li>
	</ul>
	<ul>
		<li>if the player rests after concluding an encounter</li>
		<ol>
			<li>move all cards from loot into inventory</li>
			<li>move all cards from rewards into inventory</li>
		</ol>
	</ul>
	<li>increase the deck size by three</li>
	<li>add a reward based on the level of the bonfire</li>
	<ol>
		<li></li>
		<li>gain a common treasure card</li>
		<li>gain a split stamina card from the market</li>
		<li>gain a double stamina card from the market</li>
		<li>gain a transposed treasure card</li>
	</ol>
	<li>reset the player's c_card ability usage</li>
	<li>the player can edit their deck to bring it it the new maxiumum size using</li>
	<ul>
		<li>remnant of humanity ( unlimited copies )</li>
		<li>the cards they started the game with when they built their deck</li>
		<li>the cards in their inventory</li>
		<li>the card gained from the recently resolved bonfire trigger</li>
		<li>cards purchased from the market with souls gained from encounters</li>
	</ul>
	<li>the player can choose to continue to the map phase when</li>
	<ul>
		<li>the bonfire trigger has been resolved</li>
		<li>their deck is at the specificed size</li>
		<li>they don't have any market dept</li>
	</ul>
</ol>

### resolving player damage
<ol>
	<li>while the c_card has damage counters:</li>
	<ul>
		<li>selecting the top of the deck mills it, removing one point of damage</li>
		<ul>
			<li>milling is the act of taking the top card of a deck and putting it into the discard pile</li>
		</ul>
		<li>selecting a card in hand discards it, removing one point of damage</li>
	</ul>
	<li>typically occurs after an enemy attacks or a condition ( such as poison ) triggers</li>
</ol>

### player score
<p>the player gets score based on clearing encounters and gets bonus points for winning the game</p>
<p>their score is multiplied by the difficulty they select</p>
<p>there are no major bosses currently, so the highest achivable score is 5000</p>
<table>
	<tr><td colspan="3">standard encounters</td><td colspan="2">boss encounters</td><td rowspan="2">game won</td></tr>
	<tr><td>lvl 1</td><td>lvl 2</td><td>lvl 3</td><td>minor</td><td>major</td></tr>
	<tr><td>25</td><td>50</td><td>75</td><td>125</td><td>225</td><td>10 + rests left</td></tr>
</table>

# Encounters
### 0.00 - Encounter Setup
<ol>
	<li>the player puts their c_card on an empty space on the upper encounter board</li>
	<li>the player brings their cards in hand to six cards</li>
	<ul>
		<li>if the player is unable to do this, they will lose the encounter before it starts</li>
		<li>the player can have at most six cards in hand</li>
	</ul>
	<li>if the player has no cards with attack actions in their hand, they can choose to mulligan once by:</li>
	<ol>
		<li>shuffling their hand into their deck ( reseting all states of cards within )</li>
		<li>bringing their cards in hand to six cards</li>
	</ol>
	<li>e_cards are pulled and set</li>
</ol>

### 0.25 - Encounter Loop Start
<p>this is the start of the encounter loop.</p>
<p>during this loop, if at any point the player tries to pull a card from their deck while it's empty skip to step <b><a href="https://github.com/FanaticalSoul/dstcg#300---post-encounter">3.00.2</a></b></p>

### 0.50 - Boss Activation Phase
<p>the boss follows the process outlined if the top b_card is revealed, otherwise skip that process and reveal the top b_card</p>
<ol>
	<li>e_cards are moved based on the b_card</li>
	<li>the weakness of the boss is updated to match the b_card</li>
	<li>the b_card is activated</li>
	<li>the b_card is moved the bottom of the b_deck</li>
</ol>

### 1.00 - Enemy Activation Phase
<p>also refered to as e_act</p>
<p>each enemy activates in the order shown</p>
<table>
	<tr><td>1</td><td>2</td><td>3</td></tr>
	<tr><td>4</td><td>5</td><td>6</td></tr>
</table>

### 1.50 - Reaction Phase
<p>occurs during e_act while</p>
<ul>
	<li>the enemy is in the process of attacking the player</li>
	<li>the player's c_card ability is avaliable and is reactive</li>
	<li>the player has a card in hand that can be played as a reaction</li>
	<li>the player has not made a reaction yet</li>
</ul>
<p>the player can end this phase at any point</p>

### 1.75 - Enemy Activation Phase End
<p>occurs after all e_cards are activated</p>
<ul>
	<li>the poison condition triggers for e_cards</li>
	<li>the player brings their cards in hand to six cards</li>
</ul>

### 2.00 - Character Activation Phase
<p>also refered to as c_act</p>
<p>the player can end this phase at any point</p>
<p>during this phase the player may do any combonation of the following actions ( each action can only be used once )</p>
<ul>
	<li>activate their c_card ability if it's avaliable and not reactive</li>
	<li>cycle any amount of cards</li>
	<ul>
		<li>cycling is the act of taking a card from hand, moving it to discard, and pulling (drawing) a new card from the deck</li>
	</ul>
	<li>use a s_card ability</li>
	<li>make an attack using a s_card</li>
	<ul>
		<li>this can trigger the bleed condtion on e_cards</li>
		<li>this will trigger the stagger condtion c_cards</li>
	</ul>
	<li>move their c_card</li>
	<ul>
		<li>this will trigger the frostbite condtion c_cards</li>
	</ul>
</ul>

### 2.75 - Character Activation Phase End
<p>occurs after all e_cards are activated</p>
<ul>
	<li>the poison condition triggers for c_cards</li>
	<li>if all enemies are defeated skip to step <b><a href="https://github.com/FanaticalSoul/dstcg#300---post-encounter">3.00.1</a></b></li>
	<li>the player brings their cards in hand to six cards</li>
	<li>go back to step <b><a href="https://github.com/FanaticalSoul/dstcg#025---encounter-loop-start">0.25</a></b> and repeat this loop</li>
</ul>

### 3.00 - Post Encounter
<p>the encounter is now finished and was won or lost</p>
<ol>
	<li>if the player won the encounter, they can choose to</li>
	<ol>
		<li>continue to the map phase</li>
		<ol>
			<li>the player brings their cards in hand to six cards</li>
			<li>the player doesn't shuffle their deck ( the states within their deck remain the same )</li>
			<li>the player places all cards from their hand on top of their deck</li>
			<li>cards from loot move into inventory</li>
			<li>cards from rewards move into loot</li>
			<li>the assossated boss icon or m_card becomes cleared</li>
		</ol>
		<li><a href="https://github.com/FanaticalSoul/dstcg?tab=readme-ov-file#bonfire-triggers">rest at the bonfire</a></li>
	</ol>
	<li>if the player lost the encounter</li>
	<ol>
		<li>remove all cards from loot</li>
		<li>remove all cards from rewards</li>
		<li><a href="https://github.com/FanaticalSoul/dstcg?tab=readme-ov-file#bonfire-triggers">rest at the bonfire</a></li>
	</ol>
</ol>

# Documentation Key

<table>
	<tr><td>WoL</td><td>TF</td><td>TR</td><td>CiD</td></tr>
	<tr><td>Work on Later</td><td>Test Feature</td><td>Test Removal</td><td>Currently in Development</td></tr>
</table>

```Game Maker Language
// feather ignore GM1234
/// @desc	Function description.
/// @arg	{Real}				index		The array index.
/// @arg	{Id|Id.Instance}	[p_id]		ID of player.
/// @return	{Bool}
/// @self	obj_object
/// @deprecated
```

## Game Controls
### Encounters
```[space]``` to continue to next game phase ( if option is avalible )<br/>
```[E]``` to toggle player discard reveal zone ( if cards are in zone )<br/>
```[Q]``` to toggle player deck reveal zone ( if cards are in zone )<br/>
```[L]``` to toggle player loot reveal zone ( if cards are in zone )<br/>
```[R]``` to toggle encounter reward reveal zone ( if cards are in zone )<br/>
```[B]``` to toggle encounter boss attack card reveal zone ( if cards are in zone )<br/>
```[W]```/```[A]```/```[S]```/```[D]```/```[arrow key]``` to move selected character card ( if movement is avalible )<br/>
```[1]```/```[2]```/```[3]``` to use selected card in hand ( to block, attack, or utilize an ability ) ( toggling the payment phase )<br/>
```[1]```/```[2]```/```[3]``` to make selected card's stamina payment ( if activating a card )<br/>
```[left click]``` to select card<br/>
```[right click]``` to view card<br/>
```[right click]``` on character card if selected to use ability ( if ability is avalible and can be activated during the current phase )<br/>
```[mouse scroll]``` on hand or reveal zone to see more options<br/>
```[right click]``` top of deck while selecting cards in hand to cycle those cards<br/>

### Deck Editor and Creator
```[mouse scroll]``` to see more options ( for anything excluding the play button )<br/>
```[left click]``` to add a card to the deck<br/>
```[right click]``` to remove a card from the deck

# Sources
## Absolutely Vital Sources
<ol>
	<li><a href="https://boardgamer.ru/forum/index.php?topic=18806.msg183162#msg183162">Dark Souls: The Card Game Scan Request Reply ( TheGent )</a> for card scans</li>
	<li><a href="https://youtube.com/playlist?list=PLRezuJB81E7SzoGWpvP1M9kWJSVie0gK5&si=snVl_FhaiOmIfy84">Pokemon Card Game Tutorial ( ByeTodd )</a> as a general tutorial for card game design in Game Maker Studio</li>
	<li><a href="https://www.piskelapp.com/">Piskel</a> as a sprite editing tool</li>
	<li><a href="https://cdn.1j1ju.com/medias/d3/6f/a4-dark-souls-the-card-game-rulebook.pdf">Dark Souls: The Card Game Rulebook</a> for game rules</li>
</ol>

## Full List of Sources
<p>note that all the sources I'm listing were used for this public repo, but my private repo has a larger list of sources.</p>
<h4>programming tutorials</h4>
<ol>
	<li><details>
		<summary>tutorial used for early mechanics ( heavily used )</summary>
		<h4><a href="https://youtube.com/playlist?list=PLRezuJB81E7SzoGWpvP1M9kWJSVie0gK5&si=snVl_FhaiOmIfy84">Pokemon Card Game Tutorial ( ByeTodd )</a></h4>
		<ol>
			<li>followed tutorials 1-3</li>
			<li>followed tutorial 4</li>
			<ul>
				<li>didn't create objects from hand</li>
			</ul>
			<li>followed tutorial 5</li>
			<ul>
				<li>didn't create a function that would've created a deck with every card in it</li>
				<li>didn't limit previewing to only showing a preview if the card is in it's original location</li>
			</ul>
			<li>followed tutorial 6 until mulligan design was finished</li>
			<li>skipped already completed steps and unnessary additions from tutorials 8-11</li>
		</ol>
	</details></li>
	<li><details>
		<summary>tutorial videos used for this (old) save system</summary>
		<h4><a href="https://youtu.be/muCvAmFmUXk">Full Saving and Loading Tutorial in GMS2 - Room Saving ( Peyton Burnham )</a></h4>
		<h4><a href="https://youtu.be/i6aEyrRIzTY">How to Make a Save and Load System in GameMaker ( GameMaker )</a></h4>
	</details></li>
</ol>
<h4>sprites</h4>
<ol>
	<li><a href="https://www.piskelapp.com/">Piskel</a> as a sprite editing tool</li>
	<li><a href="https://boardgamer.ru/forum/index.php?topic=18806.msg183162#msg183162">Dark Souls: The Card Game Scan Request Reply ( TheGent )</a> for card scans</li>
</ol>

# Other
<details>
<summary>Encounter Zones</summary>
<ul>
	<li>Deck ( s_deck )</li>
	<li>Enemy Deck ( e_deck )</li>
	<li>Boss Deck ( b_deck )</li>
	<li>Upper Board ( c_card )</li>
	<li>Lower Board ( e_cards )</li>
	<li>Discard Pile ( s_disc )</li>
	<li>Encounter Rewards ( r_display_1 )</li>
	<li>Player Loot ( r_display_2 )</li>
	<li>Inventory ( not shown )</li>
</ul>
</details>

<details>
<summary>bugs in v0.1.3-alpha</summary>
<ul>
	<li><a href="https://github.com/FanaticalSoul/dstcg/issues/51">talisman healing large causes FPS drop</a> (resolved in capstone/itch.io)</li>
	<li><a href="https://github.com/FanaticalSoul/dstcg/issues/45">conditional FPS drop (vague)</a> (resolved in capstone/itch.io)</li>
	<li><a href="https://github.com/FanaticalSoul/dstcg/issues/30">horizontal push bug</a> (resolved in capstone/itch.io)</li>
	<li><a href="https://github.com/FanaticalSoul/dstcg/issues/27">deck editor reset button bug</a> (resolved in capstone/itch.io)</li>
	<li><a href="https://github.com/FanaticalSoul/dstcg/issues/26">standard ranged attack action sequencing bug</a></li>
	<li><a href="https://github.com/FanaticalSoul/dstcg/issues/22">condition alignment</a> (graphical) (resolved in capstone/itch.io)</li>
</ul>
</details>

<details>
<summary>Login Information</summary>
<p>you can ask me to make you an account for the hosted game on itch or use one bellow ( "tester" will probably break if multiple people use it at once )</p>
<p>username: <b>tester</b></p>
<p>password: <b>test</b></p>
</details>