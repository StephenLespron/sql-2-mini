-- Foreign Keys - New Table
create table movie (
    movie_id serial primary key,
    title text,
    media_type_id integer references media_type(media_type_id)
);

insert into
    movie (title, media_type_id)
values
    ('Major League', 3),
    ('Bull Durham', 3);

-- Foreign Keys - Existing Table
ALTER TABLE
    movie
ADD
    COLUMN genre_id INTEGER REFERENCES genre(genre_id);

-- Updating Rows
update
    movie
set
    genre_id = 20
where
    movie_id = 1;

update
    movie
set
    genre_id = 22
where
    movie_id = 2;

-- Using Joins
select
    ar.name,
    al.title
from
    artist ar
    join album al on ar.artist_id = al.artist_id;

-- Using nested queries/sub-selects
select
    *
from
    track
where
    genre_id in (
        select
            genre_id
        from
            genre
        where
            name = 'Jazz'
            or name = 'Blues'
    );

-- Setting values to null
update
    employee
set
    phone = null
where
    employee_id = 1;

-- Query a null value
select
    *
from
    customer
where
    company is null;

-- Group by
SELECT
    ar.artist_id,
    ar.name,
    COUNT(*)
FROM
    artist ar
    JOIN album a ON ar.artist_id = a.artist_id
GROUP BY
    ar.artist_id;

-- Distinct
select
    distinct country
from
    customer;

--Delete Rows
select
    *
from
    customer
where
    fax is null;

delete from
    customer
where
    fax is null;