/// @function scr_bot_escolhe_hab(arr)
/// @description Decide se o bot vai usar uma habilidade e qual delas
/// @param {Array<Asset.GMObject>} arr Array de habilidades do bot
function scr_bot_escolhe_hab(arr){
	var _chance_acerto = irandom_range(0, 1);
	var _hab_usada = -1;
	
	if (_chance_acerto) {
		for (var i = array_length(arr) - 1; i >= 0; i--) {
			if (energia_atual >= arr[i].custo) {
				_hab_usada = i;
				break;
			}
		}
	}
	
	if (_hab_usada < 0) {
		ultima_hab_usada = global.tipos_hab[HABS.PULAR];
		
		//2 Segundos mostrando a sprite de confirmação do bot. tbm presente em alarm[1] do perso
		alarm[2] = 2 * game_get_speed(gamespeed_fps);
		return;
	}
	
	ultima_hab_usada = arr[_hab_usada];
	
	if (global.modo_jogo_atual == global.modos_jogo[MODO.RAPIDO]) {
		scr_ativa_animacao(global.inst_perso_partida[1], ultima_hab_usada);
		return;
	}
	
	alarm[1] = game_get_speed(gamespeed_fps);
}

//FINISH THE PLAYER! (Highest Priority)

//Check if any of my damage skills will reduce the player's HP to 0.

//If YES: Use that skill. (This solves your "could end the player but skips" problem.)

//SAVE MYSELF! (High Priority)

//Check if my health is low (e.g., below 30%).

//If YES: Do I have a Heal or Drain skill I can use?

//If YES: Use the best one (Heal is usually better than Drain if health is critical).

//DON'T WASTE RESOURCES! (Medium Priority)

//Check if I'm about to use a skill that does nothing.

//If I'm at full energy: DO NOT use the "higher energy gain" skill.

//If I'm at full health: DO NOT use the "Heal" skill (a Drain skill is okay, since it still does damage).

//MANAGE RESOURCES (Medium Priority)

//Check if my energy is low (e.g., below 50%) and I need more for my big attack.

//If YES: Use the "higher energy gain" skill.

//CONTROL THE BATTLE (Low Priority)

//Check if the player's turn is coming up soon.

//If YES: Use the "reduce enemy turn time" skill.

//DEFAULT ATTACK (Lowest Priority)

//If none of the above conditions are met, just use my best available damage or drain skill.

//This "if-else" checklist is much smarter than your current system, immediately solves your stated problems, and is relatively easy to program.

//🧠 Solution 2: The "Utility" AI (Scoring System)
//This is the "pro" method and is way more flexible. Instead of a rigid checklist, the AI scores every possible action it could take, and then picks the one with the highest score.

//On its turn, the AI's brain does this:

//Make a list of all possible actions: [Skill 1, Skill 2, Skill 3, Skip Turn].

//Give each action a "score" (starting at 0) based on the current situation.

//Choose the action with the highest final score.

//How to Score Actions:
//This is where you give the AI a "personality."

//Action: Damage Skill

//score = 10 (this is its baseline desire to do damage)

//if (skill_damage >= player_HP): score = 1000 (The "FINISH HIM" bonus!)

//Action: Heal Skill

//score = 0

//if (my_HP < 50): score = 20

//if (my_HP < 25): score = 40

//if (my_HP == max_HP): score = -100 (A negative score to avoid doing it)

//Action: Energy Gain Skill

//score = 0

//if (my_energy < 30): score = 25 (It wants energy)

//if (my_energy == max_energy): score = -100 (The "DON'T BE STUPID" penalty. This solves your "full energy" problem.)

//Action: Reduce Enemy Turn Time

//score = 5 (a low-priority "nice to have")

//if (player_turn_bar > 80%): score = 30 (Much more valuable now!)

//After scoring all options, the AI just picks the winner.