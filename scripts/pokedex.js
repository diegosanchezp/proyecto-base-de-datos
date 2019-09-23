function getRandomArbitrary(min, max) {
    return Math.random() * (max - min) + min;
}

function getRandomInt(min, max) {
    min = Math.ceil(min);
    max = Math.floor(max);
    return Math.floor(Math.random() * (max - min)) + min; //The maximum is exclusive and the minimum is inclusive
}

/**
 * addDays to a date 
 * @param {Date} date - The date to add the days
 * @param {number} days - Number of days to add
 */
function addDays(newDate, days) {
    // const newDate = new Date(date) // Create a shallow copy
    newDate.setDate(newDate.getDate() + days);
    // return newDate.toLocaleDateString("es-VE", { dateStyle: "full" });
    //Retrun date formate string DD-MM-YYYYY
    return `${newDate.getDate()}/${newDate.getMonth() + 1}/${newDate.getFullYear()}`;

}



const trainers = {
    names: ["Brendan", "May", "Lucas", "Dawn", "Hilbert", "Hilda", "Nate", "Rosa", "Calem", "Serena", "Elio", "Selene", "Chase", "Elaine", "Victor", "Gloria",
        //entrenadores de Valencia queiniciaron su viaje hace 4 años
        "Lenora", "Looker", "Lorelei"],
    towns: ["Acapulco", "Beach Rose", "Calanthe", "Daybreak", "Eggseter", "Fallarbor", "Gardenia", "HopHopHop", "Inakano", "Jacore Town", "Lacunosa", "Lavender", "Mahogany Town", "Neighborly", "O-Hina", "Pacifidlog",
        //entrenadores de Valencia queiniciaron su viaje hace 4 años
        "Valencia", "Valencia", "Valencia"],
}
const abilities = {
    names: ["Air Lock", "Arena Trap", "Battle Armor", "Blaze", "Cacophony", "Chlorophyll", "Clear Body", "Cloud Nine", "Color Change", "Compound Eyes", "Cute Charm", "Damp", "Drizzle", "Drought", "Early Bird", "Effect Spore", "Flame Body", "Flash Fire", "Forecast", "Guts"],
    descriptions: [
        "Eliminates the effects of weather",
        "Prevents non-Flying-type opposing Pokémon from fleeing",
        "Protects the Pokémon from critical hits",
        "Powers up Fire-type moves when the Pokémons HP is low",
        "The Pokémon is immune to sound-based moves",
        "Boosts the Pokémons Speed stat in harsh sunlight",
        "Prevents other Pokémons moves or Abilities from lowering the Pokémons stats",
        "Eliminates the effects of weather",
        "The Pokémons type becomes the type of the move used on it",
        "Boosts the Pokémons Accuracy stat",
        "Contact with the Pokémon may cause infatuation",
        "Prevents the use of Explosion and Self-Destruct",
        "Activates rain when the Pokémon enters battle",
        "Activates harsh sunlight when the Pokémon enters battle",
        "The Pokémon awakens twice as fast from sleep",
        "Contact with the Pokémon may inflict poison, sleep, or paralysis on its attacker",
        "Contact with the Pokémon may inflict burn the attacker",
        "Powers up the Pokémons Fire-type moves if hit by a Fire-type move",
        "The Pokémon transforms with the weather to change its type to Water, Fire, or Ice",
        "Boosts the Pokémons Attack stat when it has a status condition"
    ]
}

console.log("Pokedex\n");
for (let i = 0; i < 19; i++) {
    console.log(`INSERT INTO POKEDEX VALUES (${i}, ${getRandomInt(10, 20)}, ${getRandomInt(0, 10)});`);
}
console.log("\nTrainers\n");
console.log(trainers.names.length, trainers.towns.length);
for (let i = 0; i < 16; i++) {
    if (trainers.names.length === 19 && trainers.towns.length === 19) {
        console.log(`INSERT INTO ENTRENADOR VALUES (${i}, \'${trainers.names[i]}\', \'${trainers.towns[i]}\', ${getRandomInt(1, 100)}, TO_DATE(\'${addDays(new Date(), i)}\', \'dd/mm/yyyy hh24:mi:ss\'), ${i});`);
    }
}
for (let i = 16; i < 20; i++) {
    if (trainers.names.length === 19 && trainers.towns.length === 19) {
        console.log(`INSERT INTO ENTRENADOR VALUES (${i}, \'${trainers.names[i]}\', \'${trainers.towns[i]}\', ${getRandomInt(1, 100)}, TO_DATE(\'${'23/9/2015'}\', \'dd/mm/yyyy hh24:mi:ss\'), ${i});`);
    }
}
console.log("\nAbilities\n");
for (let i = 0; i < 19; i++) {
    if (abilities.names.length === 20 && abilities.descriptions.length === 20) {
        console.log(`INSERT INTO HABILIDAD VALUES (${i}, \'${abilities.names[i]}\', \'${abilities.descriptions[i]}\');`);
    }
}

