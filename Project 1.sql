CREATE DATABASE SQL_PROJECT;

USE sql_project;
# ------------------------ GENERS -----------------------------
CREATE TABLE geners
(gen_id int PRIMARY KEY,
gen_title char(20));


#------------------------- TABLE MOVIE -----------------------
CREATE TABLE movie
(
mov_id int PRIMARY KEY,
mov_title char(50),
mov_year int,
mov_time int,
mov_lang char(50),
mov_dt_rel date,
mov_rel_country char(5)
);

# ---------------------------- MOVIE GENERS ------------------------
CREATE TABLE movie_genres
(
mov_id int,
gen_id int,
FOREIGN KEY (mov_id) REFERENCES geners (gen_id),
FOREIGN KEY (gen_id) REFERENCES movie(mov_id));


# ----------------------------- TABLE REVIEWER -----------------------
CREATE TABLE reviewer
(
rev_id int PRIMARY KEY,
rev_name char(30)
);

# --------------------------  TABLE RATING ------------------------
CREATE TABLE rating
(
mov_id int,
rev_id int,
rev_stars int,
num_o_ratings int,
FOREIGN KEY (mov_id) REFERENCES movie (mov_id),
FOREIGN KEY (rev_id) REFERENCES reviewer(rev_id)
);

# -------------------------- TABLE ACTOR --------------------------

CREATE TABLE actor
(
act_id int PRIMARY KEY,
act_fnmae char(20),
act_lname char(20),
act_gender char(1)
);

# ------------------------ MOVIE CAST -------------------------------

CREATE TABLE movie_cast
(
act_id int,
mov_id int,
`role` char(30)
);

ALTER TABLE movie_cast
ADD FOREIGN KEY (act_id) REFERENCES actor(act_id);

ALTER TABLE movie_cast
ADD FOREIGN KEY (mov_id) REFERENCES movie(mov_id);

# -------------------------- TABLE DIRECTOR ----------------------------

CREATE TABLE director
(
dir_id  int PRIMARY KEY,
dir_fname char(20),
dir_iname char(20)
);

# ------------------------- MOVIE DIRECTION ---------------------------

CREATE TABLE movie_direction
(
dir_id int,
mov_id int,
FOREIGN KEY (dir_id) REFERENCES director(dir_id),
FOREIGN KEY (mov_id) REFERENCES movie(mov_id)
);