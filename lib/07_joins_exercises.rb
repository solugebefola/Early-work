# == Schema Information
#
# Table name: actors
#
#  id          :integer      not null, primary key
#  name        :string
#
# Table name: movies
#
#  id          :integer      not null, primary key
#  title       :string
#  yr          :integer
#  score       :float
#  votes       :integer
#  director_id :integer
#
# Table name: castings
#
#  movie_id    :integer      not null, primary key
#  actor_id    :integer      not null, primary key
#  ord         :integer

require_relative './sqlzoo.rb'

def example_join
  execute(<<-SQL)
    SELECT
      *
    FROM
      movies
    JOIN
      castings ON movies.id = castings.movie_id
    JOIN
      actors ON castings.actor_id = actors.id
    WHERE
      actors.name = 'Sean Connery'
  SQL
end

def ford_films
  # List the films in which 'Harrison Ford' has appeared.
  execute(<<-SQL)
    SELECT
      title
    FROM
      movies
    JOIN
      castings ON movies.id = castings.movie_id
    JOIN
      actors ON castings.actor_id = actors.id
    WHERE
      actors.name = 'Harrison Ford'
  SQL
end

def ford_supporting_films
  # List the films where 'Harrison Ford' has appeared - but not in the star
  # role. [Note: the ord field of casting gives the position of the actor. If
  # ord=1 then this actor is in the starring role]
  execute(<<-SQL)
  SELECT
    title
  FROM
    movies
  JOIN
    castings ON movies.id = castings.movie_id
  JOIN
    actors ON castings.actor_id = actors.id
  WHERE
    actors.name = 'Harrison Ford' AND castings.ord > 1

  SQL
end

def films_and_stars_from_sixty_two
  # List the title and leading star of every 1962 film.
  execute(<<-SQL)
    SELECT
      movies.title, actors.name
    FROM
      movies
    JOIN
      castings ON movies.id = castings.movie_id
    JOIN
      actors ON castings.actor_id = actors.id
    WHERE
      movies.yr = 1962 AND castings.ord = 1
  SQL
end

def travoltas_busiest_years
  # Which were the busiest years for 'John Travolta'? Show the year and the
  # number of movies he made for any year in which he made at least 2 movies.
  execute(<<-SQL)
    SELECT
      yr, COUNT(title)
    FROM
      movies
    JOIN
      castings ON movies.id = castings.movie_id
    JOIN
      actors ON castings.actor_id = actors.id
    WHERE
      actors.name = 'John Travolta'
    GROUP BY
      yr
    HAVING
      COUNT(title) > 1
  SQL
end

def andrews_films_and_leads
  # List the film title and the leading actor for all of the films 'Julie
  # Andrews' played in.
  execute(<<-SQL)
    SELECT
      julie_movies.title, co_stars.name
    FROM
      actors AS julie
    JOIN
      castings AS julie_castings
    ON
      julie.id = julie_castings.actor_id
    JOIN
      movies AS julie_movies
    ON
      julie_castings.movie_id = julie_movies.id
    JOIN
      castings AS co_star_castings
    ON
      julie_movies.id = co_star_castings.movie_id
    JOIN
      actors AS co_stars
    ON
      co_star_castings.actor_id = co_stars.id
    WHERE
      julie.name = 'Julie Andrews' AND co_star_castings.ord = 1
  SQL
end

def prolific_actors
  # Obtain a list in alphabetical order of actors who've had at least 15
  # starring roles.
  execute(<<-SQL)
    SELECT
      lead_actors.name
    FROM
      actors AS lead_actors
    JOIN
      castings AS lead_casting
    ON
      lead_actors.id = lead_casting.actor_id
    WHERE
      lead_casting.ord = 1
    GROUP BY
      lead_actors.id
    HAVING
      COUNT(lead_casting.movie_id) >= 15
    ORDER BY
      lead_actors.name




  SQL
end

def films_by_cast_size
  # List the films released in the year 1978 ordered by the number of actors
  # in the cast (descending), then by title (ascending).
  execute(<<-SQL)
  SELECT
    movies.title, COUNT(castings.actor_id)
  FROM
    movies
  JOIN
    castings ON movies.id = castings.movie_id
  WHERE
    movies.yr = 1978
  GROUP BY
    movies.id
  ORDER BY
    COUNT(castings.actor_id) DESC, movies.title

  SQL
end

def colleagues_of_garfunkel
  # List all the people who have played alongside 'Art Garfunkel'.
  execute(<<-SQL)
  SQL
end
