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
    name character varying(50) NOT NULL,
    galaxy_types character varying(100),
    size integer NOT NULL,
    composition text
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
    name character varying(50),
    surface_composition text,
    diameter integer NOT NULL,
    is_spherical boolean NOT NULL,
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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    has_life boolean NOT NULL,
    diameter integer,
    planet_types character varying(100),
    star_id integer
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
    name character varying(50) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_the_earth numeric(6,1),
    description text NOT NULL,
    galaxy_id integer
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
-- Name: starsystem; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.starsystem (
    starsystem_id integer NOT NULL,
    name character varying(50) NOT NULL,
    type character varying(50) NOT NULL,
    distance_light_years numeric
);


ALTER TABLE public.starsystem OWNER TO freecodecamp;

--
-- Name: starsystem_star_system_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.starsystem_star_system_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.starsystem_star_system_id_seq OWNER TO freecodecamp;

--
-- Name: starsystem_star_system_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.starsystem_star_system_id_seq OWNED BY public.starsystem.starsystem_id;


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
-- Name: starsystem starsystem_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.starsystem ALTER COLUMN starsystem_id SET DEFAULT nextval('public.starsystem_star_system_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (7, 'Milky Way', 'Barred Spiral Galaxy', 100000, 'Stars, gas, dust, and dark matter');
INSERT INTO public.galaxy VALUES (8, 'Andromeda', 'Spiral Galaxy', 110000, 'Stars, gas, dust, and dark matter');
INSERT INTO public.galaxy VALUES (9, 'Triangulum', 'Unbarred Spiral Galaxy', 5000, 'Stars, gas, dust, and dark matter');
INSERT INTO public.galaxy VALUES (10, 'Messier 87', 'Elliptical Galaxy', 20000, 'Stars and dark matter');
INSERT INTO public.galaxy VALUES (11, 'Sombrero', 'Lenticular Galaxy', 15000, 'Stars, gas, and dust');
INSERT INTO public.galaxy VALUES (12, 'Black Eye', 'Spiral Galaxy', 12000, 'Stars, gas, dust, and dark matter');
INSERT INTO public.galaxy VALUES (13, 'Whirlpool', 'Spiral Galaxy', 8000, 'Stars, gas, dust, and dark matter');
INSERT INTO public.galaxy VALUES (14, 'Cartwheel', 'Ring Galaxy', 10000, 'Stars, gas, and dust');
INSERT INTO public.galaxy VALUES (15, 'Tadpole', 'Irregular Galaxy', 7000, 'Stars, gas, and dust');
INSERT INTO public.galaxy VALUES (16, 'Cigar', 'Starburst Galaxy', 6000, 'Stars and gas');
INSERT INTO public.galaxy VALUES (17, 'Sunflower', 'Spiral Galaxy', 9000, 'Stars, gas, dust, and dark matter');
INSERT INTO public.galaxy VALUES (18, 'Pinwheel', 'Spiral Galaxy', 8500, 'Stars, gas, dust, and dark matter');
INSERT INTO public.galaxy VALUES (19, 'Antennae', 'Interacting Galaxy', 9500, 'Stars, gas, and dust');
INSERT INTO public.galaxy VALUES (20, 'Siamese Twins', 'Interacting Galaxy', 7500, 'Stars, gas, dust, and dark matter');
INSERT INTO public.galaxy VALUES (21, 'Cosmos Redshift', 'Galaxy Cluster', 300000, 'Galaxies, gas, and dark matter');
INSERT INTO public.galaxy VALUES (22, 'Hercules A', 'Radio Galaxy', 50000, 'Jets of relativistic plasma');
INSERT INTO public.galaxy VALUES (23, 'Virgo Stellar Stream', 'Stellar Stream', 1000, 'Stars and dark matter');
INSERT INTO public.galaxy VALUES (24, 'Canes Venatici I', 'Dwarf Spheroidal Galaxy', 2000, 'Stars and dark matter');
INSERT INTO public.galaxy VALUES (25, 'Leo I', 'Dwarf Spheroidal Galaxy', 2500, 'Stars and dark matter');
INSERT INTO public.galaxy VALUES (26, 'Leo II', 'Dwarf Spheroidal Galaxy', 1800, 'Stars and dark matter');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (4, 'Luna', 'Silicate rock', 3475, true, 15);
INSERT INTO public.moon VALUES (5, 'Phobos', 'Carbonaceous rock', 22, true, 16);
INSERT INTO public.moon VALUES (6, 'Deimos', 'Carbonaceous rock', 12, true, 17);
INSERT INTO public.moon VALUES (7, 'Ganymede', 'Icy and rocky', 5262, true, 18);
INSERT INTO public.moon VALUES (8, 'Titan', 'Mainly nitrogen and methane', 5150, true, 19);
INSERT INTO public.moon VALUES (9, 'Europa', 'Water ice and silicate rock', 3122, true, 20);
INSERT INTO public.moon VALUES (10, 'Io', 'Sulfur and silicate rock', 3643, true, 21);
INSERT INTO public.moon VALUES (11, 'Callisto', 'Icy and rocky', 4821, true, 22);
INSERT INTO public.moon VALUES (12, 'Enceladus', 'Water ice', 504, true, 23);
INSERT INTO public.moon VALUES (13, 'Miranda', 'Water ice and silicate rock', 471, true, 24);
INSERT INTO public.moon VALUES (14, 'Triton', 'Nitrogen ice', 2706, true, 25);
INSERT INTO public.moon VALUES (15, 'Charon', 'Water ice and tholins', 1208, true, 26);
INSERT INTO public.moon VALUES (16, 'Phoebe', 'Water ice and carbonaceous material', 214, true, 27);
INSERT INTO public.moon VALUES (17, 'Mimas', 'Water ice and silicate rock', 396, true, 28);
INSERT INTO public.moon VALUES (18, 'Dione', 'Water ice and silicate rock', 1123, true, 29);
INSERT INTO public.moon VALUES (19, 'Hyperion', 'Water ice and silicate rock', 360, true, 30);
INSERT INTO public.moon VALUES (20, 'Ariel', 'Water ice and silicate rock', 1158, true, 31);
INSERT INTO public.moon VALUES (21, 'Umbriel', 'Water ice and silicate rock', 1169, true, 32);
INSERT INTO public.moon VALUES (22, 'Rhea', 'Water ice and silicate rock', 1528, true, 33);
INSERT INTO public.moon VALUES (23, 'Iapetus', 'Water ice and dark material', 1468, true, 34);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (15, 'Mercury', false, 4879, 'Terrestrial', 31);
INSERT INTO public.planet VALUES (16, 'Venus', false, 12104, 'Terrestrial', 32);
INSERT INTO public.planet VALUES (17, 'Earth', true, 12742, 'Terrestrial', 33);
INSERT INTO public.planet VALUES (18, 'Mars', false, 6779, 'Terrestrial', 34);
INSERT INTO public.planet VALUES (19, 'Jupiter', false, 139822, 'Gas Giant', 35);
INSERT INTO public.planet VALUES (20, 'Saturn', false, 116464, 'Gas Giant', 36);
INSERT INTO public.planet VALUES (21, 'Uranus', false, 50724, 'Ice Giant', 37);
INSERT INTO public.planet VALUES (22, 'Neptune', false, 49244, 'Ice Giant', 38);
INSERT INTO public.planet VALUES (23, 'Pluto', false, 2374, 'Dwarf', 39);
INSERT INTO public.planet VALUES (24, 'Kepler-186f', true, 10000, 'Exoplanet', 40);
INSERT INTO public.planet VALUES (25, 'Gliese 581g', true, 20000, 'Exoplanet', 41);
INSERT INTO public.planet VALUES (26, 'Proxima Centauri b', true, 8600, 'Exoplanet', 42);
INSERT INTO public.planet VALUES (27, 'HD 209458 b', false, 71800, 'Exoplanet', 43);
INSERT INTO public.planet VALUES (28, 'TRAPPIST-1e', true, 9500, 'Exoplanet', 44);
INSERT INTO public.planet VALUES (29, 'K2-18b', true, 12450, 'Exoplanet', 45);
INSERT INTO public.planet VALUES (30, 'WASP-12b', false, 14900, 'Exoplanet', 46);
INSERT INTO public.planet VALUES (31, 'Tau Ceti e', true, 13500, 'Exoplanet', 47);
INSERT INTO public.planet VALUES (32, 'PSR B1257+12 A', false, 10, 'Exoplanet', 48);
INSERT INTO public.planet VALUES (33, 'HD 40307 g', true, 13200, 'Exoplanet', 49);
INSERT INTO public.planet VALUES (34, '55 Cancri e', false, 18100, 'Exoplanet', 50);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (31, 'Sun', 4600, 93.0, 'G-type main-sequence star at the center of the Solar System', 7);
INSERT INTO public.star VALUES (32, 'Sirius', 230, 8.6, 'Brightest star in the night sky, part of the Canis Major constellation', 8);
INSERT INTO public.star VALUES (33, 'Betelgeuse', 8, 643.0, 'Red supergiant star in the Orion constellation, nearing the end of its life', 9);
INSERT INTO public.star VALUES (34, 'Proxima Centauri', 6, 4.2, 'Closest known star to the Sun, part of the Alpha Centauri system', 10);
INSERT INTO public.star VALUES (35, 'Vega', 455, 25.0, 'Bright star in the Lyra constellation, relatively young and hot', 11);
INSERT INTO public.star VALUES (36, 'Alpha Centauri A', 6000, 4.4, 'Brightest star in the Alpha Centauri system, part of a binary star system', 12);
INSERT INTO public.star VALUES (37, 'Arcturus', 7000, 37.0, 'Red giant star in the Boötes constellation, one of the brightest stars in the sky', 13);
INSERT INTO public.star VALUES (38, 'Alpha Centauri B', 6000, 4.4, 'Component of the Alpha Centauri binary star system, not visible to the naked eye', 14);
INSERT INTO public.star VALUES (39, 'Aldebaran', 625, 65.1, 'Bright orange giant star in the Taurus constellation', 15);
INSERT INTO public.star VALUES (40, 'Rigel', 8, 860.0, 'Blue supergiant star in the Orion constellation, one of the most luminous stars in the sky', 16);
INSERT INTO public.star VALUES (41, 'Antares', 12, 554.0, 'Red supergiant star in the Scorpius constellation, one of the largest known stars', 17);
INSERT INTO public.star VALUES (42, 'Pollux', 800, 33.7, 'Bright giant star in the Gemini constellation, one of the brightest stars in the sky', 18);
INSERT INTO public.star VALUES (43, 'Fomalhaut', 440, 25.1, 'Bright star in the Piscis Austrinus constellation, surrounded by a debris disk', 19);
INSERT INTO public.star VALUES (44, 'Deneb', 20, 2600.0, 'Luminous supergiant star in the Cygnus constellation, one of the most distant stars visible to the naked eye', 20);
INSERT INTO public.star VALUES (45, 'Altair', 1, 16.7, 'White main-sequence star in the Aquila constellation, one of the closest stars visible to the naked eye', 21);
INSERT INTO public.star VALUES (46, 'Regulus', 250, 77.5, 'Bright star in the Leo constellation, frequently used in navigation', 22);
INSERT INTO public.star VALUES (47, 'Spica', 220, 250.0, 'Binary star system in the Virgo constellation, one of the brightest stars in the sky', 23);
INSERT INTO public.star VALUES (48, 'Achernar', 57, 139.0, 'Bright star in the Eridanus constellation, one of the flattest stars known', 24);
INSERT INTO public.star VALUES (49, 'Bellatrix', 25, 250.0, 'Blue giant star in the Orion constellation, one of the brightest stars in the sky', 25);
INSERT INTO public.star VALUES (50, 'Denebola', 36, 36.3, 'White main-sequence star in the Leo constellation, one of the brightest stars in the sky', 26);


--
-- Data for Name: starsystem; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.starsystem VALUES (1, 'Alpha Centauri', 'Binary Star System', 4.37);
INSERT INTO public.starsystem VALUES (2, 'Betelgeuse', 'Red Supergiant', 642);
INSERT INTO public.starsystem VALUES (3, 'Sirius', 'Binary Star System', 8.6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 26, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 23, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 34, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 50, true);


--
-- Name: starsystem_star_system_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.starsystem_star_system_id_seq', 3, true);


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
-- Name: starsystem starsystem_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.starsystem
    ADD CONSTRAINT starsystem_pkey PRIMARY KEY (starsystem_id);


--
-- Name: starsystem unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.starsystem
    ADD CONSTRAINT unique_name UNIQUE (name);


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
-- PostgreSQL database dump complete
--

