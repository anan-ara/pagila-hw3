/*
 * List the title of all movies that have both the 'Behind the Scenes' and the 'Trailers' special_feature
 *
 * HINT:
 * Create a select statement that lists the titles of all tables with the 'Behind the Scenes' special_feature.
 * Create a select statement that lists the titles of all tables with the 'Trailers' special_feature.
 * Inner join the queries above.
 */
SELECT
	title
FROM (
	SELECT
		title,
		unnest
	FROM (
		SELECT
			title,
			unnest(special_features)
		FROM film
	) AS t1sub
	WHERE unnest = 'Behind the Scenes'
) AS t1
INNER JOIN (
	SELECT
		title,
		unnest
	FROM (
		SELECT
			title,
			unnest(special_features)
		FROM film
	) AS t2sub
	WHERE unnest = 'Trailers'
) AS t2
USING (title)
ORDER BY title
;
