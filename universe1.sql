--
-- PostgreSQL database dump
--

-- Dumped from database version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)

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
    name character varying(30) NOT NULL,
    diameter_ly integer NOT NULL,
    shape character varying(20),
    distance_from_earth_millions_ly numeric(10,3)
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
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_from_its_planet_in_km integer,
    radius_in_km integer
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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_from_earth_in_ly integer,
    radius_in_km integer,
    has_life boolean,
    has_rings boolean
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
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    radius_in_km integer,
    star_type_id integer
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
-- Name: star_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star_type (
    star_type_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    source character varying(100)
);


ALTER TABLE public.star_type OWNER TO freecodecamp;

--
-- Name: star_type_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_type_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_type_type_id_seq OWNER TO freecodecamp;

--
-- Name: star_type_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_type_type_id_seq OWNED BY public.star_type.star_type_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: star_type star_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type ALTER COLUMN star_type_id SET DEFAULT nextval('public.star_type_type_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (8, 'Aquarius II', 1040, NULL, 0.352);
INSERT INTO public.galaxy VALUES (5, 'Ursa Major I Dwarf', 2000, 'dwarf spheroidal', 0.316);
INSERT INTO public.galaxy VALUES (4, 'Pictor I', 190, NULL, 0.372);
INSERT INTO public.galaxy VALUES (6, 'Pisces V', 985, 'dwarf spheroidal', 1.790);
INSERT INTO public.galaxy VALUES (7, 'Andromeda II', 6820, 'dwarf elliptical', 2.220);
INSERT INTO public.galaxy VALUES (3, 'Milky Way', 87400, 'barred spiral', 0.000);
INSERT INTO public.galaxy VALUES (9, 'Andromeda', 152000, 'barred spiral', 2.500);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 4, 'Titan', NULL, NULL);
INSERT INTO public.moon VALUES (2, 4, 'Enceladus', NULL, NULL);
INSERT INTO public.moon VALUES (3, 4, 'Mimas', NULL, NULL);
INSERT INTO public.moon VALUES (4, 4, 'Dione', NULL, NULL);
INSERT INTO public.moon VALUES (5, 4, 'Iapetus', NULL, NULL);
INSERT INTO public.moon VALUES (6, 4, 'Tethys', NULL, NULL);
INSERT INTO public.moon VALUES (7, 4, 'Hyperion', NULL, NULL);
INSERT INTO public.moon VALUES (8, 4, 'Epimetheus', NULL, NULL);
INSERT INTO public.moon VALUES (9, 4, 'Telesto', NULL, NULL);
INSERT INTO public.moon VALUES (10, 4, 'Phoebe', NULL, NULL);
INSERT INTO public.moon VALUES (11, 7, 'Europa', NULL, NULL);
INSERT INTO public.moon VALUES (12, 7, 'Io', NULL, NULL);
INSERT INTO public.moon VALUES (13, 7, 'Ganymede', NULL, NULL);
INSERT INTO public.moon VALUES (14, 7, 'Callisto', NULL, NULL);
INSERT INTO public.moon VALUES (15, 7, 'Amalthea', NULL, NULL);
INSERT INTO public.moon VALUES (17, 7, 'Philophrosyne', NULL, NULL);
INSERT INTO public.moon VALUES (18, 7, 'Cyllene', NULL, NULL);
INSERT INTO public.moon VALUES (19, 2, 'Phobos', NULL, NULL);
INSERT INTO public.moon VALUES (20, 2, 'Deimos', NULL, NULL);
INSERT INTO public.moon VALUES (21, 1, 'Luna (The Moon)', NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (9, 2, 'Proxima Centauri b', NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (10, 2, 'Proxima Centauri d', NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (1, 1, 'Earth', 0, 6371, true, false);
INSERT INTO public.planet VALUES (2, 1, 'Mars', 56, 3389, false, false);
INSERT INTO public.planet VALUES (3, 1, 'Venus', 40, 6052, false, false);
INSERT INTO public.planet VALUES (4, 1, 'Saturn', 1204, 58232, false, true);
INSERT INTO public.planet VALUES (5, 1, 'Neptune', 28817, 24622, false, true);
INSERT INTO public.planet VALUES (6, 1, 'Mercury', 82, 2439, false, false);
INSERT INTO public.planet VALUES (7, 1, 'Jupiter', 592, 69911, false, true);
INSERT INTO public.planet VALUES (8, 1, 'Uranus', 2587, 25362, false, true);
INSERT INTO public.planet VALUES (11, 7, 'Kepler-452b', NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (12, 8, 'Kepler-186f', NULL, NULL, NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 3, 'Sun', 696340, 1);
INSERT INTO public.star VALUES (2, 3, 'Proxima Centauri', 107208, 1);
INSERT INTO public.star VALUES (3, 3, 'Rigil Kentaurus', 851120, 1);
INSERT INTO public.star VALUES (4, 3, 'Toliman', NULL, 1);
INSERT INTO public.star VALUES (5, 9, 'OP Andromedae', NULL, 2);
INSERT INTO public.star VALUES (6, 3, 'UY Scuti', 1188300000, 2);
INSERT INTO public.star VALUES (7, 3, 'Kepler-452', NULL, NULL);
INSERT INTO public.star VALUES (8, 3, 'Kepler-186', NULL, NULL);


--
-- Data for Name: star_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star_type VALUES (1, 'main sequence', 'Scientists call a star that is fusing hydrogen to helium in its core a main sequence star. Main sequence stars make up around 90% of the universe’s stellar population. They range in luminosity, color, and size – from a tenth to 200 times the Sun’s mass – and live for millions to billions of years.', 'https://universe.nasa.gov/stars/types/');
INSERT INTO public.star_type VALUES (2, 'red giant', 'When a main sequence star less than eight times the Sun’s mass runs out of hydrogen in its core, it starts to collapse because the energy produced by fusion is the only force fighting gravity’s tendency to pull matter together. But squeezing the core also increases its temperature and pressure, so much so that its helium starts to fuse into carbon, which also releases energy. Hydrogen fusion begins moving into the star’s outer layers, causing them to expand. The result is a red giant, which would appear more orange than red. Eventually, the red giant becomes unstable and begins pulsating, periodically expanding and ejecting some of its atmosphere. Eventually, all of its outer layers blow away, creating an expanding cloud of dust and gas called a planetary nebula. The Sun will become a red giant in about 5 billion years.', 'https://universe.nasa.gov/stars/types/');
INSERT INTO public.star_type VALUES (3, 'white dwarf', 'After a red giant has shed all its atmosphere, only the core remains. Scientists call this kind of stellar remnant a white dwarf. A white dwarf is usually Earth-size but hundreds of thousands of times more massive. A teaspoon of its material would weigh more than a pickup truck. A white dwarf produces no new heat of its own, so it gradually cools over billions of years. Despite the name, white dwarfs can emit visible light that ranges from blue white to red. Scientists sometimes find that white dwarfs are surrounded by dusty disks of material, debris, and even planets – leftovers from the original star’s red giant phase. In about 10 billion years, after its time as a red giant, the Sun will become a white dwarf.', 'https://universe.nasa.gov/stars/types/');
INSERT INTO public.star_type VALUES (4, 'neutron', 'A neutron star forms when a main sequence star with between about eight and 20 times the Sun’s mass runs out of hydrogen in its core. (Heavier stars produce stellar-mass black holes.) The star starts fusing helium to carbon, like lower-mass stars. But then, when the core runs out of helium, it shrinks, heats up, and starts converting its carbon into neon, which releases energy. This process continues as the star converts neon into oxygen, oxygen into silicon, and finally silicon into iron. These processes produce energy that keep the core from collapsing, but each new fuel buys it less and less time. By the time silicon fuses into iron, the star runs out of fuel in a matter of days. The next step would be fusing iron into some heavier element, but doing so requires energy instead of releasing it. The core collapses and then rebounds back to its original size, creating a shock wave that travels through the star’s outer layers. The result is a huge explosion called a supernova. The remnant core is a superdense neutron star.', 'https://universe.nasa.gov/stars/types/');
INSERT INTO public.star_type VALUES (5, 'red dwarf', 'Red dwarfs are the smallest main sequence stars – just a fraction of the Sun’s size and mass. They’re also the coolest, and appear more orange in color than red. When a red dwarf produces helium via fusion in its core, the released energy brings material to the star’s surface, where it cools and sinks back down, taking along a fresh supply of hydrogen to the core. Because of this constant churning, red dwarfs can steadily burn through their entire supply of hydrogen over trillions of years without changing their internal structures, unlike other stars. Scientists think some low-mass red dwarfs, those with just a third of the Sun’s mass, have life spans longer than the current age of the universe, up to about 14 trillion years. Red dwarfs are also born in much greater numbers than more massive stars. Because of that, and because they live so long, red dwarfs make up around 75% of the Milky Way galaxy’s stellar population.', 'https://universe.nasa.gov/stars/types/');
INSERT INTO public.star_type VALUES (6, 'brown dwarf', 'Brown dwarfs aren’t technically stars. They’re more massive than planets but not quite as massive as stars. Generally, they have between 13 and 80 times the mass of Jupiter. They emit almost no visible light, but scientists have seen a few in infrared light. Some brown dwarfs form the same way as main sequence stars, from gas and dust clumps in nebulae, but they never gain enough mass to do fusion on the scale of a main sequence star. Others may form like planets, from disks of gas and dust around stars.', 'https://universe.nasa.gov/stars/types/');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 9, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: star_type_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_type_type_id_seq', 6, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


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
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: star_type star_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type
    ADD CONSTRAINT star_type_name_key UNIQUE (name);


--
-- Name: star_type star_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type
    ADD CONSTRAINT star_type_pkey PRIMARY KEY (star_type_id);


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
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star star_star_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_type_id_fkey FOREIGN KEY (star_type_id) REFERENCES public.star_type(star_type_id);


--
-- PostgreSQL database dump complete
--


