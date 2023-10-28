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

SELECT
    PG_CATALOG.SET_CONFIG('search_path',
    '',
    FALSE);

SET check_function_bodies = false;

SET xmloption = content;

SET client_min_messages = warning;

SET row_security = off;

DROP DATABASE UNIVERSE;

--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE UNIVERSE WITH TEMPLATE = TEMPLATE0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';

ALTER DATABASE UNIVERSE OWNER TO FREECODECAMP;

\CONNECT UNIVERSE

SET statement_timeout = 0;

SET lock_timeout = 0;

SET idle_in_transaction_session_timeout = 0;

SET client_encoding = 'UTF8';

SET standard_conforming_strings = on;

SELECT
    PG_CATALOG.SET_CONFIG('search_path',
    '',
    FALSE);

SET check_function_bodies = false;

SET xmloption = content;

SET client_min_messages = warning;

SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE PUBLIC.GALAXY (
    GALAXY_ID INTEGER NOT NULL,
    NAME CHARACTER VARYING(30) NOT NULL,
    DIAMETER_LY INTEGER NOT NULL,
    SHAPE CHARACTER VARYING(20),
    DISTANCE_FROM_EARTH_MILLIONS_LY NUMERIC(10, 3)
);

ALTER TABLE PUBLIC.GALAXY OWNER TO FREECODECAMP;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE PUBLIC.GALAXY_GALAXY_ID_SEQ
    AS INTEGER
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE PUBLIC.GALAXY_GALAXY_ID_SEQ OWNER TO FREECODECAMP;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE PUBLIC.GALAXY_GALAXY_ID_SEQ OWNED BY PUBLIC.GALAXY.GALAXY_ID;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE PUBLIC.MOON (
    MOON_ID INTEGER NOT NULL,
    PLANET_ID INTEGER NOT NULL,
    NAME CHARACTER VARYING(30) NOT NULL,
    DISTANCE_FROM_ITS_PLANET_IN_KM INTEGER,
    RADIUS_IN_KM INTEGER
);

ALTER TABLE PUBLIC.MOON OWNER TO FREECODECAMP;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE PUBLIC.MOON_MOON_ID_SEQ
    AS INTEGER
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE PUBLIC.MOON_MOON_ID_SEQ OWNER TO FREECODECAMP;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE PUBLIC.MOON_MOON_ID_SEQ OWNED BY PUBLIC.MOON.MOON_ID;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE PUBLIC.PLANET (
    PLANET_ID INTEGER NOT NULL,
    STAR_ID INTEGER NOT NULL,
    NAME CHARACTER VARYING(30) NOT NULL,
    DISTANCE_FROM_EARTH_IN_LY INTEGER,
    RADIUS_IN_KM INTEGER,
    HAS_LIFE BOOLEAN,
    HAS_RINGS BOOLEAN
);

ALTER TABLE PUBLIC.PLANET OWNER TO FREECODECAMP;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE PUBLIC.PLANET_PLANET_ID_SEQ
    AS INTEGER
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE PUBLIC.PLANET_PLANET_ID_SEQ OWNER TO FREECODECAMP;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE PUBLIC.PLANET_PLANET_ID_SEQ OWNED BY PUBLIC.PLANET.PLANET_ID;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE PUBLIC.STAR (
    STAR_ID INTEGER NOT NULL,
    GALAXY_ID INTEGER NOT NULL,
    NAME CHARACTER VARYING(30) NOT NULL,
    RADIUS_IN_KM INTEGER,
    STAR_TYPE_ID INTEGER
);

ALTER TABLE PUBLIC.STAR OWNER TO FREECODECAMP;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE PUBLIC.STAR_STAR_ID_SEQ
    AS INTEGER
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE PUBLIC.STAR_STAR_ID_SEQ OWNER TO FREECODECAMP;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE PUBLIC.STAR_STAR_ID_SEQ OWNED BY PUBLIC.STAR.STAR_ID;

--
-- Name: star_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE PUBLIC.STAR_TYPE (
    STAR_TYPE_ID INTEGER NOT NULL,
    NAME CHARACTER VARYING(30) NOT NULL,
    DESCRIPTION TEXT,
    SOURCE CHARACTER VARYING(100)
);

ALTER TABLE PUBLIC.STAR_TYPE OWNER TO FREECODECAMP;

--
-- Name: star_type_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE PUBLIC.STAR_TYPE_TYPE_ID_SEQ
    AS INTEGER
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE PUBLIC.STAR_TYPE_TYPE_ID_SEQ OWNER TO FREECODECAMP;

--
-- Name: star_type_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE PUBLIC.STAR_TYPE_TYPE_ID_SEQ OWNED BY PUBLIC.STAR_TYPE.STAR_TYPE_ID;

--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY PUBLIC.GALAXY ALTER COLUMN GALAXY_ID SET DEFAULT NEXTVAL('public.galaxy_galaxy_id_seq'::REGCLASS);

--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY PUBLIC.MOON ALTER COLUMN MOON_ID SET DEFAULT NEXTVAL('public.moon_moon_id_seq'::REGCLASS);

--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY PUBLIC.PLANET ALTER COLUMN PLANET_ID SET DEFAULT NEXTVAL('public.planet_planet_id_seq'::REGCLASS);

--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY PUBLIC.STAR ALTER COLUMN STAR_ID SET DEFAULT NEXTVAL('public.star_star_id_seq'::REGCLASS);

--
-- Name: star_type star_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY PUBLIC.STAR_TYPE ALTER COLUMN STAR_TYPE_ID SET DEFAULT NEXTVAL('public.star_type_type_id_seq'::REGCLASS);

--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO PUBLIC.GALAXY VALUES (
    8,
    'Aquarius II',
    1040,
    NULL,
    0.352
);

INSERT INTO PUBLIC.GALAXY VALUES (
    5,
    'Ursa Major I Dwarf',
    2000,
    'dwarf spheroidal',
    0.316
);

INSERT INTO PUBLIC.GALAXY VALUES (
    4,
    'Pictor I',
    190,
    NULL,
    0.372
);

INSERT INTO PUBLIC.GALAXY VALUES (
    6,
    'Pisces V',
    985,
    'dwarf spheroidal',
    1.790
);

INSERT INTO PUBLIC.GALAXY VALUES (
    7,
    'Andromeda II',
    6820,
    'dwarf elliptical',
    2.220
);

INSERT INTO PUBLIC.GALAXY VALUES (
    3,
    'Milky Way',
    87400,
    'barred spiral',
    0.000
);

INSERT INTO PUBLIC.GALAXY VALUES (
    9,
    'Andromeda',
    152000,
    'barred spiral',
    2.500
);

--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO PUBLIC.MOON VALUES (
    1,
    4,
    'Titan',
    NULL,
    NULL
);

INSERT INTO PUBLIC.MOON VALUES (
    2,
    4,
    'Enceladus',
    NULL,
    NULL
);

INSERT INTO PUBLIC.MOON VALUES (
    3,
    4,
    'Mimas',
    NULL,
    NULL
);

INSERT INTO PUBLIC.MOON VALUES (
    4,
    4,
    'Dione',
    NULL,
    NULL
);

INSERT INTO PUBLIC.MOON VALUES (
    5,
    4,
    'Iapetus',
    NULL,
    NULL
);

INSERT INTO PUBLIC.MOON VALUES (
    6,
    4,
    'Tethys',
    NULL,
    NULL
);

INSERT INTO PUBLIC.MOON VALUES (
    7,
    4,
    'Hyperion',
    NULL,
    NULL
);

INSERT INTO PUBLIC.MOON VALUES (
    8,
    4,
    'Epimetheus',
    NULL,
    NULL
);

INSERT INTO PUBLIC.MOON VALUES (
    9,
    4,
    'Telesto',
    NULL,
    NULL
);

INSERT INTO PUBLIC.MOON VALUES (
    10,
    4,
    'Phoebe',
    NULL,
    NULL
);

INSERT INTO PUBLIC.MOON VALUES (
    11,
    7,
    'Europa',
    NULL,
    NULL
);

INSERT INTO PUBLIC.MOON VALUES (
    12,
    7,
    'Io',
    NULL,
    NULL
);

INSERT INTO PUBLIC.MOON VALUES (
    13,
    7,
    'Ganymede',
    NULL,
    NULL
);

INSERT INTO PUBLIC.MOON VALUES (
    14,
    7,
    'Callisto',
    NULL,
    NULL
);

INSERT INTO PUBLIC.MOON VALUES (
    15,
    7,
    'Amalthea',
    NULL,
    NULL
);

INSERT INTO PUBLIC.MOON VALUES (
    17,
    7,
    'Philophrosyne',
    NULL,
    NULL
);

INSERT INTO PUBLIC.MOON VALUES (
    18,
    7,
    'Cyllene',
    NULL,
    NULL
);

INSERT INTO PUBLIC.MOON VALUES (
    19,
    2,
    'Phobos',
    NULL,
    NULL
);

INSERT INTO PUBLIC.MOON VALUES (
    20,
    2,
    'Deimos',
    NULL,
    NULL
);

INSERT INTO PUBLIC.MOON VALUES (
    21,
    1,
    'Luna (The Moon)',
    NULL,
    NULL
);

--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO PUBLIC.PLANET VALUES (
    9,
    2,
    'Proxima Centauri b',
    NULL,
    NULL,
    NULL,
    NULL
);

INSERT INTO PUBLIC.PLANET VALUES (
    10,
    2,
    'Proxima Centauri d',
    NULL,
    NULL,
    NULL,
    NULL
);

INSERT INTO PUBLIC.PLANET VALUES (
    1,
    1,
    'Earth',
    0,
    6371,
    TRUE,
    FALSE
);

INSERT INTO PUBLIC.PLANET VALUES (
    2,
    1,
    'Mars',
    56,
    3389,
    FALSE,
    FALSE
);

INSERT INTO PUBLIC.PLANET VALUES (
    3,
    1,
    'Venus',
    40,
    6052,
    FALSE,
    FALSE
);

INSERT INTO PUBLIC.PLANET VALUES (
    4,
    1,
    'Saturn',
    1204,
    58232,
    FALSE,
    TRUE
);

INSERT INTO PUBLIC.PLANET VALUES (
    5,
    1,
    'Neptune',
    28817,
    24622,
    FALSE,
    TRUE
);

INSERT INTO PUBLIC.PLANET VALUES (
    6,
    1,
    'Mercury',
    82,
    2439,
    FALSE,
    FALSE
);

INSERT INTO PUBLIC.PLANET VALUES (
    7,
    1,
    'Jupiter',
    592,
    69911,
    FALSE,
    TRUE
);

INSERT INTO PUBLIC.PLANET VALUES (
    8,
    1,
    'Uranus',
    2587,
    25362,
    FALSE,
    TRUE
);

INSERT INTO PUBLIC.PLANET VALUES (
    11,
    7,
    'Kepler-452b',
    NULL,
    NULL,
    NULL,
    NULL
);

INSERT INTO PUBLIC.PLANET VALUES (
    12,
    8,
    'Kepler-186f',
    NULL,
    NULL,
    NULL,
    NULL
);

--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO PUBLIC.STAR VALUES (
    1,
    3,
    'Sun',
    696340,
    1
);

INSERT INTO PUBLIC.STAR VALUES (
    2,
    3,
    'Proxima Centauri',
    107208,
    1
);

INSERT INTO PUBLIC.STAR VALUES (
    3,
    3,
    'Rigil Kentaurus',
    851120,
    1
);

INSERT INTO PUBLIC.STAR VALUES (
    4,
    3,
    'Toliman',
    NULL,
    1
);

INSERT INTO PUBLIC.STAR VALUES (
    5,
    9,
    'OP Andromedae',
    NULL,
    2
);

INSERT INTO PUBLIC.STAR VALUES (
    6,
    3,
    'UY Scuti',
    1188300000,
    2
);

INSERT INTO PUBLIC.STAR VALUES (
    7,
    3,
    'Kepler-452',
    NULL,
    NULL
);

INSERT INTO PUBLIC.STAR VALUES (
    8,
    3,
    'Kepler-186',
    NULL,
    NULL
);

--
-- Data for Name: star_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO PUBLIC.STAR_TYPE VALUES (
    1,
    'main sequence',
    'Scientists call a star that is fusing hydrogen to helium in its core a main sequence star. Main sequence stars make up around 90% of the universe’s stellar population. They range in luminosity, color, and size – from a tenth to 200 times the Sun’s mass – and live for millions to billions of years.',
    'https://universe.nasa.gov/stars/types/'
);

INSERT INTO PUBLIC.STAR_TYPE VALUES (
    2,
    'red giant',
    'When a main sequence star less than eight times the Sun’s mass runs out of hydrogen in its core, it starts to collapse because the energy produced by fusion is the only force fighting gravity’s tendency to pull matter together. But squeezing the core also increases its temperature and pressure, so much so that its helium starts to fuse into carbon, which also releases energy. Hydrogen fusion begins moving into the star’s outer layers, causing them to expand. The result is a red giant, which would appear more orange than red. Eventually, the red giant becomes unstable and begins pulsating, periodically expanding and ejecting some of its atmosphere. Eventually, all of its outer layers blow away, creating an expanding cloud of dust and gas called a planetary nebula. The Sun will become a red giant in about 5 billion years.',
    'https://universe.nasa.gov/stars/types/'
);

INSERT INTO PUBLIC.STAR_TYPE VALUES (
    3,
    'white dwarf',
    'After a red giant has shed all its atmosphere, only the core remains. Scientists call this kind of stellar remnant a white dwarf. A white dwarf is usually Earth-size but hundreds of thousands of times more massive. A teaspoon of its material would weigh more than a pickup truck. A white dwarf produces no new heat of its own, so it gradually cools over billions of years. Despite the name, white dwarfs can emit visible light that ranges from blue white to red. Scientists sometimes find that white dwarfs are surrounded by dusty disks of material, debris, and even planets – leftovers from the original star’s red giant phase. In about 10 billion years, after its time as a red giant, the Sun will become a white dwarf.',
    'https://universe.nasa.gov/stars/types/'
);

INSERT INTO PUBLIC.STAR_TYPE VALUES (
    4,
    'neutron',
    'A neutron star forms when a main sequence star with between about eight and 20 times the Sun’s mass runs out of hydrogen in its core. (Heavier stars produce stellar-mass black holes.) The star starts fusing helium to carbon, like lower-mass stars. But then, when the core runs out of helium, it shrinks, heats up, and starts converting its carbon into neon, which releases energy. This process continues as the star converts neon into oxygen, oxygen into silicon, and finally silicon into iron. These processes produce energy that keep the core from collapsing, but each new fuel buys it less and less time. By the time silicon fuses into iron, the star runs out of fuel in a matter of days. The next step would be fusing iron into some heavier element, but doing so requires energy instead of releasing it. The core collapses and then rebounds back to its original size, creating a shock wave that travels through the star’s outer layers. The result is a huge explosion called a supernova. The remnant core is a superdense neutron star.',
    'https://universe.nasa.gov/stars/types/'
);

INSERT INTO PUBLIC.STAR_TYPE VALUES (
    5,
    'red dwarf',
    'Red dwarfs are the smallest main sequence stars – just a fraction of the Sun’s size and mass. They’re also the coolest, and appear more orange in color than red. When a red dwarf produces helium via fusion in its core, the released energy brings material to the star’s surface, where it cools and sinks back down, taking along a fresh supply of hydrogen to the core. Because of this constant churning, red dwarfs can steadily burn through their entire supply of hydrogen over trillions of years without changing their internal structures, unlike other stars. Scientists think some low-mass red dwarfs, those with just a third of the Sun’s mass, have life spans longer than the current age of the universe, up to about 14 trillion years. Red dwarfs are also born in much greater numbers than more massive stars. Because of that, and because they live so long, red dwarfs make up around 75% of the Milky Way galaxy’s stellar population.',
    'https://universe.nasa.gov/stars/types/'
);

INSERT INTO PUBLIC.STAR_TYPE VALUES (
    6,
    'brown dwarf',
    'Brown dwarfs aren’t technically stars. They’re more massive than planets but not quite as massive as stars. Generally, they have between 13 and 80 times the mass of Jupiter. They emit almost no visible light, but scientists have seen a few in infrared light. Some brown dwarfs form the same way as main sequence stars, from gas and dust clumps in nebulae, but they never gain enough mass to do fusion on the scale of a main sequence star. Others may form like planets, from disks of gas and dust around stars.',
    'https://universe.nasa.gov/stars/types/'
);

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT
    PG_CATALOG.SETVAL('public.galaxy_galaxy_id_seq',
    9,
    TRUE);

--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT
    PG_CATALOG.SETVAL('public.moon_moon_id_seq',
    21,
    TRUE);

--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT
    PG_CATALOG.SETVAL('public.planet_planet_id_seq',
    12,
    TRUE);

--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT
    PG_CATALOG.SETVAL('public.star_star_id_seq',
    8,
    TRUE);

--
-- Name: star_type_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT
    PG_CATALOG.SETVAL('public.star_type_type_id_seq',
    6,
    TRUE);

--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY PUBLIC.GALAXY ADD CONSTRAINT GALAXY_GALAXY_ID_KEY UNIQUE (GALAXY_ID);

--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY PUBLIC.GALAXY ADD CONSTRAINT GALAXY_NAME_KEY UNIQUE (NAME);

--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY PUBLIC.GALAXY ADD CONSTRAINT GALAXY_PKEY PRIMARY KEY (GALAXY_ID);

--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY PUBLIC.MOON ADD CONSTRAINT MOON_MOON_ID_KEY UNIQUE (MOON_ID);

--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY PUBLIC.MOON ADD CONSTRAINT MOON_PKEY PRIMARY KEY (MOON_ID);

--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY PUBLIC.PLANET ADD CONSTRAINT PLANET_PKEY PRIMARY KEY (PLANET_ID);

--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY PUBLIC.PLANET ADD CONSTRAINT PLANET_PLANET_ID_KEY UNIQUE (PLANET_ID);

--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY PUBLIC.STAR ADD CONSTRAINT STAR_PKEY PRIMARY KEY (STAR_ID);

--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY PUBLIC.STAR ADD CONSTRAINT STAR_STAR_ID_KEY UNIQUE (STAR_ID);

--
-- Name: star_type star_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY PUBLIC.STAR_TYPE ADD CONSTRAINT STAR_TYPE_NAME_KEY UNIQUE (NAME);

--
-- Name: star_type star_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY PUBLIC.STAR_TYPE ADD CONSTRAINT STAR_TYPE_PKEY PRIMARY KEY (STAR_TYPE_ID);

--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY PUBLIC.MOON ADD CONSTRAINT MOON_PLANET_ID_FKEY FOREIGN KEY (PLANET_ID) REFERENCES PUBLIC.PLANET(PLANET_ID);

--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY PUBLIC.PLANET ADD CONSTRAINT PLANET_STAR_ID_FKEY FOREIGN KEY (STAR_ID) REFERENCES PUBLIC.STAR(STAR_ID);

--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY PUBLIC.STAR ADD CONSTRAINT STAR_GALAXY_ID_FKEY FOREIGN KEY (GALAXY_ID) REFERENCES PUBLIC.GALAXY(GALAXY_ID);

--
-- Name: star star_star_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY PUBLIC.STAR ADD CONSTRAINT STAR_STAR_TYPE_ID_FKEY FOREIGN KEY (STAR_TYPE_ID) REFERENCES PUBLIC.STAR_TYPE(STAR_TYPE_ID);

--
-- PostgreSQL database dump complete
--