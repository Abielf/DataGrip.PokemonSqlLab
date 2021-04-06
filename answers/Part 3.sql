/*What is each pokemon's primary type?*/
SELECT pokemons.name, types.name FROM pokemons
INNER JOIN types ON pokemons.primary_type=types.id;

/*What is Rufflet's secondary type?*/
SELECT pokemons.name, types.name AS 'Type2' FROM pokemons
INNER JOIN types ON pokemons.secondary_type=types.id
WHERE pokemons.name='Rufflet';


/*What are the names of the pokemon that belong to the trainer with trainerID 303?*/
SELECT pokemons.name FROM pokemons
INNER JOIN pokemon_trainer ON pokemon_trainer.pokemon_id=pokemons.id
WHERE pokemon_trainer.trainerID=303;


/*How many pokemon have a secondary type Poison?*/
SELECT COUNT(pokemons.name) AS Number_Of_Secondary_Poison_Types FROM pokemons
INNER JOIN types ON pokemons.secondary_type=types.id
WHERE types.name='poison';


/*What are all the primary types and how many pokemon have that type?*/
SELECT COUNT(pokemons.name) AS Number_of_Pkmn, types.name
FROM pokemons
INNER JOIN types ON pokemons.primary_type=types.id
GROUP BY types.name;


/*How many pokemon at level 100 does each trainer with at least one
level 100 pokemon have? (Hint: your query should not display a trainer*/
SELECT COUNT(pokelevel)
FROM pokemon_trainer
GROUP BY trainerID
HAVING COUNT(CASE WHEN pokelevel=100 THEN 1 END)>0;


/*How many pokemon only belong to one trainer and no other?*/
SELECT COUNT(*)
FROM (SELECT COUNT(trainerID)
        from pokemon_trainer
        group by pokemon_id
        HAVING COUNT(trainerID)=1) AS Pkmn_with_one_trainer;