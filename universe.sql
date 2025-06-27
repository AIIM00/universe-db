--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_type text NOT NULL,
    has_black_hole boolean NOT NULL,
    age_million_years integer NOT NULL,
    diameter_lightyears numeric(10,2)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    diameter_km integer NOT NULL,
    distance_from_planet_km numeric(10,2),
    surface_type text,
    is_spherical boolean,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: observation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.observation (
    observation_id integer NOT NULL,
    name character varying(100) NOT NULL,
    object_type text NOT NULL,
    description text NOT NULL,
    date_recorded date NOT NULL,
    is_confirmed boolean NOT NULL
);


ALTER TABLE public.observation OWNER TO freecodecamp;

--
-- Name: observation_observation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.observation_observation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.observation_observation_id_seq OWNER TO freecodecamp;

--
-- Name: observation_observation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.observation_observation_id_seq OWNED BY public.observation.observation_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    has_rings boolean NOT NULL,
    orbital_period_days integer NOT NULL,
    mass_earth_units numeric(6,2),
    has_life boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    is_main_sequence boolean NOT NULL,
    temperature_k integer NOT NULL,
    mass_solar_units numeric(6,2),
    spectral_type text
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: observation observation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.observation ALTER COLUMN observation_id SET DEFAULT nextval('public.observation_observation_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', true, 13600, 105700.00);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', true, 10000, 220000.00);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', false, 10000, 60000.00);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', true, 400, 76000.00);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Elliptical', true, 9000, 50000.00);
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 'Irregular', false, 13000, 14000.00);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (41, 'Moon', 3474, 384400.00, 'Rocky', true, 5);
INSERT INTO public.moon VALUES (42, 'Phobos', 22, 9376.00, 'Rocky', false, 6);
INSERT INTO public.moon VALUES (43, 'Deimos', 12, 23460.00, 'Rocky', false, 6);
INSERT INTO public.moon VALUES (44, 'Io', 3643, 421700.00, 'Volcanic', true, 7);
INSERT INTO public.moon VALUES (45, 'Europa', 3122, 670900.00, 'Icy', true, 7);
INSERT INTO public.moon VALUES (46, 'Ganymede', 5268, 1070400.00, 'Icy', true, 7);
INSERT INTO public.moon VALUES (47, 'Callisto', 4820, 1882700.00, 'Icy', true, 7);
INSERT INTO public.moon VALUES (48, 'Titan', 5150, 1221870.00, 'Icy', true, 12);
INSERT INTO public.moon VALUES (49, 'Enceladus', 504, 238000.00, 'Icy', true, 12);
INSERT INTO public.moon VALUES (50, 'Triton', 2706, 354800.00, 'Icy', true, 11);
INSERT INTO public.moon VALUES (51, 'Miranda', 472, 129900.00, 'Icy', true, 16);
INSERT INTO public.moon VALUES (52, 'Ariel', 1158, 191000.00, 'Icy', true, 16);
INSERT INTO public.moon VALUES (53, 'Umbriel', 1170, 266000.00, 'Icy', true, 16);
INSERT INTO public.moon VALUES (54, 'Titania', 1577, 436000.00, 'Icy', true, 16);
INSERT INTO public.moon VALUES (55, 'Oberon', 1523, 583000.00, 'Icy', true, 16);
INSERT INTO public.moon VALUES (56, 'Rhea', 1528, 527000.00, 'Icy', true, 12);
INSERT INTO public.moon VALUES (57, 'Dione', 1123, 377000.00, 'Icy', true, 12);
INSERT INTO public.moon VALUES (58, 'Mimas', 396, 185000.00, 'Icy', true, 12);
INSERT INTO public.moon VALUES (59, 'Charon', 1212, 19571.00, 'Icy', true, 9);
INSERT INTO public.moon VALUES (60, 'Nereid', 340, 5513819.00, 'Icy', false, 11);


--
-- Data for Name: observation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.observation VALUES (1, 'Kepler-22b', 'planet', 'Possible Earth-like planet located in the habitable zone.', '2024-11-15', false);
INSERT INTO public.observation VALUES (2, 'Betelgeuse', 'star', 'Observed dimming significantly, possible supernova precursor.', '2023-12-02', true);
INSERT INTO public.observation VALUES (3, 'Europa', 'moon', 'Evidence of subsurface ocean detected via magnetic field data.', '2022-06-01', true);
INSERT INTO public.observation VALUES (4, 'Gliese 581c', 'planet', 'Temperature range may allow for liquid water under certain conditions.', '2021-05-20', false);
INSERT INTO public.observation VALUES (5, 'Titan', 'moon', 'Thick atmosphere and lakes of liquid methane observed.', '2020-08-13', true);
INSERT INTO public.observation VALUES (6, 'Proxima Centauri', 'star', 'Detected solar flare that may impact surrounding exoplanets.', '2023-03-14', true);
INSERT INTO public.observation VALUES (7, 'HD 209458 b', 'planet', 'First exoplanet with confirmed atmospheric evaporation.', '2019-10-05', true);
INSERT INTO public.observation VALUES (8, 'Mimas', 'moon', 'Surface resembles the Death Star; suspected subsurface ocean.', '2021-11-30', false);
INSERT INTO public.observation VALUES (9, 'Kepler-186f', 'planet', 'Orbiting within the habitable zone of its red dwarf star.', '2023-07-18', false);
INSERT INTO public.observation VALUES (10, 'Rigel', 'star', 'Unstable massive star with high luminosity variation.', '2024-01-25', true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (5, 'Earth', 1, false, 365, 1.00, true);
INSERT INTO public.planet VALUES (6, 'Mars', 1, false, 687, 0.11, false);
INSERT INTO public.planet VALUES (7, 'Jupiter', 1, true, 4333, 317.80, false);
INSERT INTO public.planet VALUES (8, 'Kepler-22b', 6, false, 289, 36.00, NULL);
INSERT INTO public.planet VALUES (9, 'Venus', 1, false, 225, 0.82, false);
INSERT INTO public.planet VALUES (10, 'Mercury', 1, false, 88, 0.06, false);
INSERT INTO public.planet VALUES (11, 'Neptune', 1, true, 60190, 17.10, false);
INSERT INTO public.planet VALUES (12, 'Saturn', 1, true, 10759, 95.20, false);
INSERT INTO public.planet VALUES (13, 'Gliese 581c', 2, false, 13, 5.50, NULL);
INSERT INTO public.planet VALUES (14, 'HD 209458 b', 3, false, 4, 0.69, false);
INSERT INTO public.planet VALUES (15, 'Kepler-186f', 6, false, 130, 1.40, NULL);
INSERT INTO public.planet VALUES (16, 'Uranus', 1, true, 30687, 14.50, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, true, 5778, 1.00, 'G2V');
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, true, 3042, 0.12, 'M5.5Ve');
INSERT INTO public.star VALUES (3, 'Sirius A', 1, true, 9940, 2.02, 'A1V');
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, false, 3500, 11.60, 'M1-2Ia-ab');
INSERT INTO public.star VALUES (5, 'Alpha Centauri A', 1, true, 5790, 1.10, 'G2V');
INSERT INTO public.star VALUES (6, 'Rigel', 2, false, 12100, 21.00, 'B8Ia');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 60, true);


--
-- Name: observation_observation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.observation_observation_id_seq', 10, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 16, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: observation observation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.observation
    ADD CONSTRAINT observation_name_key UNIQUE (name);


--
-- Name: observation observation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.observation
    ADD CONSTRAINT observation_pkey PRIMARY KEY (observation_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: planet planet_star_id_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey1 FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star star_galaxy_id_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey1 FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

