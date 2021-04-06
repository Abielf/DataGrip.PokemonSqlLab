/*
Directions: Write a query that returns the following collumns:

Pokemon Name	Trainer Name	  Level	           Primary Type        Secondary Type
Pokemon's name	Trainer's name	Current Level	Primary Type Name	Secondary Type Name

Sort the data by finding out which trainer has the strongest pokemon so that this will act
as a ranking of strongest to weakest trainer. You may interpret strongest in whatever way
you want, but you will have to explain your decision.




I judged the strongest trainer based on the total of their pokemon party's level and stats.*/

SELECT pkmn.name, trainers.trainername, party.pokelevel, type1.name, type2.name
FROM pokemon_trainer AS party
         INNER JOIN pokemons AS pkmn ON party.pokemon_id=pkmn.Id
         INNER JOIN trainers ON trainers.trainerID=party.trainerID
         LEFT JOIN types AS type1 ON type1.id=pkmn.primary_type
         LEFT JOIN types AS type2 ON type2.id=pkmn.secondary_type
         LEFT JOIN (SELECT SUM(hp+attack+defense+spatk+spdef+speed) AS  totalPWR, trainerID
                    FROM pokemon_trainer GROUP BY trainerID)AS power_level ON power_level.trainerID=party.trainerID
ORDER BY totalPWR DESC;