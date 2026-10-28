/*
 * List the name of all actors who have appeared in a movie that has the 'Behind the Scenes' special_feature
 */
SELECT DISTINCT first_name || ' ' || last_name AS "Actor Name"
FROM actor
WHERE actor_id IN (
    SELECT actor_id
    FROM film_actor
    JOIN film USING (film_id)
    WHERE 'Behind the Scenes' IN (
        SELECT unnest(special_features)
    )
)
ORDER BY "Actor Name";
