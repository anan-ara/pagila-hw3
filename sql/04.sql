/*
 * List the name of all actors who have appeared in a movie that has the 'Behind the Scenes' special_feature
 */

SELECT
	first_name || ' ' || last_name AS "Actor Name"
FROM (
	SELECT
		first_name,
		last_name,
		unnest(special_features)
	FROM film
	INNER JOIN film_actor USING (film_id)
	INNER JOIN actor USING (actor_id)
) AS t
WHERE unnest = 'Behind the Scenes'
GROUP BY first_name, last_name
ORDER BY "Actor Name"
;

