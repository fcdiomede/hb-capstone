--
-- PostgreSQL database dump
--

-- Dumped from database version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)

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

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: cookbook_recipes; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.cookbook_recipes (
    cookbook_recipe_id integer NOT NULL,
    cookbook_id integer NOT NULL,
    recipe_id integer NOT NULL
);


ALTER TABLE public.cookbook_recipes OWNER TO vagrant;

--
-- Name: cookbook_recipes_cookbook_recipe_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE public.cookbook_recipes_cookbook_recipe_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cookbook_recipes_cookbook_recipe_id_seq OWNER TO vagrant;

--
-- Name: cookbook_recipes_cookbook_recipe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE public.cookbook_recipes_cookbook_recipe_id_seq OWNED BY public.cookbook_recipes.cookbook_recipe_id;


--
-- Name: cookbooks; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.cookbooks (
    cookbook_id integer NOT NULL,
    title character varying NOT NULL,
    cover_img character varying,
    user_id integer
);


ALTER TABLE public.cookbooks OWNER TO vagrant;

--
-- Name: cookbooks_cookbook_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE public.cookbooks_cookbook_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cookbooks_cookbook_id_seq OWNER TO vagrant;

--
-- Name: cookbooks_cookbook_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE public.cookbooks_cookbook_id_seq OWNED BY public.cookbooks.cookbook_id;


--
-- Name: recipes; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.recipes (
    recipe_id integer NOT NULL,
    title character varying NOT NULL,
    ingredients text,
    time_required character varying,
    servings integer,
    media character varying
);


ALTER TABLE public.recipes OWNER TO vagrant;

--
-- Name: recipes_recipe_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE public.recipes_recipe_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recipes_recipe_id_seq OWNER TO vagrant;

--
-- Name: recipes_recipe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE public.recipes_recipe_id_seq OWNED BY public.recipes.recipe_id;


--
-- Name: steps; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.steps (
    step_id integer NOT NULL,
    recipe_id integer NOT NULL,
    step_number integer NOT NULL,
    body text NOT NULL,
    media character varying
);


ALTER TABLE public.steps OWNER TO vagrant;

--
-- Name: steps_step_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE public.steps_step_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.steps_step_id_seq OWNER TO vagrant;

--
-- Name: steps_step_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE public.steps_step_id_seq OWNED BY public.steps.step_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    fname character varying,
    lname character varying,
    email character varying,
    password character varying NOT NULL,
    profile_picture character varying
);


ALTER TABLE public.users OWNER TO vagrant;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO vagrant;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: cookbook_recipes cookbook_recipe_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.cookbook_recipes ALTER COLUMN cookbook_recipe_id SET DEFAULT nextval('public.cookbook_recipes_cookbook_recipe_id_seq'::regclass);


--
-- Name: cookbooks cookbook_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.cookbooks ALTER COLUMN cookbook_id SET DEFAULT nextval('public.cookbooks_cookbook_id_seq'::regclass);


--
-- Name: recipes recipe_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.recipes ALTER COLUMN recipe_id SET DEFAULT nextval('public.recipes_recipe_id_seq'::regclass);


--
-- Name: steps step_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.steps ALTER COLUMN step_id SET DEFAULT nextval('public.steps_step_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: cookbook_recipes; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.cookbook_recipes (cookbook_recipe_id, cookbook_id, recipe_id) FROM stdin;
1	1	1
2	1	2
3	2	3
4	2	4
5	3	5
6	3	6
7	4	7
8	4	8
9	5	9
10	5	10
11	6	11
12	6	12
13	7	13
14	7	14
15	8	15
16	8	16
17	9	17
18	9	18
19	10	19
20	10	20
21	11	21
22	11	22
23	12	23
24	12	24
25	13	25
26	13	26
27	14	27
28	14	28
29	15	29
30	15	30
31	16	31
32	16	32
33	17	33
34	17	34
35	18	35
36	18	36
37	19	37
38	19	38
39	20	39
40	20	40
\.


--
-- Data for Name: cookbooks; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.cookbooks (cookbook_id, title, cover_img, user_id) FROM stdin;
1	Breakfast	/static/img/cooking_6.jpg	1
2	Dessert	/static/img/cooking_4.jpg	1
3	Dinner	/static/img/cooking_6.jpg	2
4	Dinner	/static/img/cooking_3.jpg	2
5	Dessert	/static/img/cooking_1.jpg	3
6	Dinner	/static/img/cooking_3.jpg	3
7	Lunch	/static/img/cooking_3.jpg	4
8	Breakfast	/static/img/cooking_3.jpg	4
9	Lunch	/static/img/cooking_2.jpg	5
10	Dinner	/static/img/cooking_7.jpg	5
11	Dessert	/static/img/cooking_2.jpg	6
12	Dessert	/static/img/cooking_2.jpg	6
13	Dessert	/static/img/cooking_7.jpg	7
14	Breakfast	/static/img/cooking_3.jpg	7
15	Dessert	/static/img/cooking_2.jpg	8
16	Dessert	/static/img/cooking_1.jpg	8
17	Dinner	/static/img/cooking_4.jpg	9
18	Breakfast	/static/img/cooking_2.jpg	9
19	Dessert	/static/img/cooking_5.jpg	10
20	Breakfast	/static/img/cooking_7.jpg	10
\.


--
-- Data for Name: recipes; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.recipes (recipe_id, title, ingredients, time_required, servings, media) FROM stdin;
1	Antipasto Squares	3 eggs, 1/2 Tsp ground black pepper, 1/4 pound thinly sliced ham, 3 Tbsp grated Parmesan cheese, 1/4 pound thinly sliced pepperoni sausage, 1/4 pound thinly sliced provolone cheese, 2 (10oz) cans refrigerated crescent dinner rolls, 1 (12oz) jar roasted red peppers, drained and sliced into strips, 1/4 pound thinly sliced Genoa salami, 1/4 pound thinly sliced swiss cheese	45 mins	6	https://spoonacular.com/recipeImages/715511-556x370.jpg
2	Philly Cheesesteak Grilled Wraps	2 steaks, BBQ'd and sliced as thin as possible, 1 tbsp vegetable oil, 2 onions, halved and sliced, 1 tsp Better than Bouillon Beef Base, 2 portobello mushrooms, stem and gills removed, 2 bell peppers, sliced, Mayonnaise, Hot Sauce, 4 - 10" tortillas	45 mins	4	https://spoonacular.com/recipeImages/655890-556x370.jpg
3	Philly Cheesesteak Grilled Wraps	2 steaks, BBQ'd and sliced as thin as possible, 1 tbsp vegetable oil, 2 onions, halved and sliced, 1 tsp Better than Bouillon Beef Base, 2 portobello mushrooms, stem and gills removed, 2 bell peppers, sliced, Mayonnaise, Hot Sauce, 4 - 10" tortillas	45 mins	4	https://spoonacular.com/recipeImages/655890-556x370.jpg
4	Philly Cheesesteak Grilled Wraps	2 steaks, BBQ'd and sliced as thin as possible, 1 tbsp vegetable oil, 2 onions, halved and sliced, 1 tsp Better than Bouillon Beef Base, 2 portobello mushrooms, stem and gills removed, 2 bell peppers, sliced, Mayonnaise, Hot Sauce, 4 - 10" tortillas	45 mins	4	https://spoonacular.com/recipeImages/655890-556x370.jpg
5	Healthy Black Forest Baked Oatmeal	1 cup rolled oats (not instant), ½ cup applesauce, ½ cup fat free milk (or dairy free milk, to make vegan), ¾ cup pitted cherries (fresh or frozen), ½ Tsp. vanilla extract, ¼ cup chocolate chips, 1 Tbsp. chia seeds, 1 Tbsp. cocoa powder	45 mins	3	https://spoonacular.com/recipeImages/646442-556x370.jpg
6	Philly Cheesesteak Grilled Wraps	2 steaks, BBQ'd and sliced as thin as possible, 1 tbsp vegetable oil, 2 onions, halved and sliced, 1 tsp Better than Bouillon Beef Base, 2 portobello mushrooms, stem and gills removed, 2 bell peppers, sliced, Mayonnaise, Hot Sauce, 4 - 10" tortillas	45 mins	4	https://spoonacular.com/recipeImages/655890-556x370.jpg
7	Healthy Black Forest Baked Oatmeal	1 cup rolled oats (not instant), ½ cup applesauce, ½ cup fat free milk (or dairy free milk, to make vegan), ¾ cup pitted cherries (fresh or frozen), ½ Tsp. vanilla extract, ¼ cup chocolate chips, 1 Tbsp. chia seeds, 1 Tbsp. cocoa powder	45 mins	3	https://spoonacular.com/recipeImages/646442-556x370.jpg
8	Fresh Apple Cake With Caramel Sauce	2 c.s sugar, 1 c. vegetable oil, 3 eggs, 3 c.s sifted flour, 1 tsp. soda, 1 tsp. salt, 1 tsp. cinnamon, 2 tsp.s vanilla, 3 c.s peeled, chopped apples, 2 c.s coconut, 1 c. chopped dates or coconut, 1 c. chopped pecans, 1 c. packed brown sugar, 1/2 c. butter, 1/2 c. milk	45 mins	1	https://spoonacular.com/recipeImages/643426-556x370.jpg
9	Turkey Tomato Cheese Pizza	green bell pepper, chopped, parsley, pepper, whole wheat crust, Roma tomato, diced, shredded Mozzarella cheese, tomato sauce, ½-3/4 cup chopped Turkey breast (cooked), white onion, chopped	15 mins	6	https://spoonacular.com/recipeImages/715495-556x370.jpg
10	Antipasto Squares	3 eggs, 1/2 Tsp ground black pepper, 1/4 pound thinly sliced ham, 3 Tbsp grated Parmesan cheese, 1/4 pound thinly sliced pepperoni sausage, 1/4 pound thinly sliced provolone cheese, 2 (10oz) cans refrigerated crescent dinner rolls, 1 (12oz) jar roasted red peppers, drained and sliced into strips, 1/4 pound thinly sliced Genoa salami, 1/4 pound thinly sliced swiss cheese	45 mins	6	https://spoonacular.com/recipeImages/715511-556x370.jpg
11	Antipasto Squares	3 eggs, 1/2 Tsp ground black pepper, 1/4 pound thinly sliced ham, 3 Tbsp grated Parmesan cheese, 1/4 pound thinly sliced pepperoni sausage, 1/4 pound thinly sliced provolone cheese, 2 (10oz) cans refrigerated crescent dinner rolls, 1 (12oz) jar roasted red peppers, drained and sliced into strips, 1/4 pound thinly sliced Genoa salami, 1/4 pound thinly sliced swiss cheese	45 mins	6	https://spoonacular.com/recipeImages/715511-556x370.jpg
12	Antipasto Squares	3 eggs, 1/2 Tsp ground black pepper, 1/4 pound thinly sliced ham, 3 Tbsp grated Parmesan cheese, 1/4 pound thinly sliced pepperoni sausage, 1/4 pound thinly sliced provolone cheese, 2 (10oz) cans refrigerated crescent dinner rolls, 1 (12oz) jar roasted red peppers, drained and sliced into strips, 1/4 pound thinly sliced Genoa salami, 1/4 pound thinly sliced swiss cheese	45 mins	6	https://spoonacular.com/recipeImages/715511-556x370.jpg
13	Healthy Black Forest Baked Oatmeal	1 cup rolled oats (not instant), ½ cup applesauce, ½ cup fat free milk (or dairy free milk, to make vegan), ¾ cup pitted cherries (fresh or frozen), ½ Tsp. vanilla extract, ¼ cup chocolate chips, 1 Tbsp. chia seeds, 1 Tbsp. cocoa powder	45 mins	3	https://spoonacular.com/recipeImages/646442-556x370.jpg
14	Fresh Apple Cake With Caramel Sauce	2 c.s sugar, 1 c. vegetable oil, 3 eggs, 3 c.s sifted flour, 1 tsp. soda, 1 tsp. salt, 1 tsp. cinnamon, 2 tsp.s vanilla, 3 c.s peeled, chopped apples, 2 c.s coconut, 1 c. chopped dates or coconut, 1 c. chopped pecans, 1 c. packed brown sugar, 1/2 c. butter, 1/2 c. milk	45 mins	1	https://spoonacular.com/recipeImages/643426-556x370.jpg
15	Healthy Black Forest Baked Oatmeal	1 cup rolled oats (not instant), ½ cup applesauce, ½ cup fat free milk (or dairy free milk, to make vegan), ¾ cup pitted cherries (fresh or frozen), ½ Tsp. vanilla extract, ¼ cup chocolate chips, 1 Tbsp. chia seeds, 1 Tbsp. cocoa powder	45 mins	3	https://spoonacular.com/recipeImages/646442-556x370.jpg
16	Antipasto Squares	3 eggs, 1/2 Tsp ground black pepper, 1/4 pound thinly sliced ham, 3 Tbsp grated Parmesan cheese, 1/4 pound thinly sliced pepperoni sausage, 1/4 pound thinly sliced provolone cheese, 2 (10oz) cans refrigerated crescent dinner rolls, 1 (12oz) jar roasted red peppers, drained and sliced into strips, 1/4 pound thinly sliced Genoa salami, 1/4 pound thinly sliced swiss cheese	45 mins	6	https://spoonacular.com/recipeImages/715511-556x370.jpg
17	Philly Cheesesteak Grilled Wraps	2 steaks, BBQ'd and sliced as thin as possible, 1 tbsp vegetable oil, 2 onions, halved and sliced, 1 tsp Better than Bouillon Beef Base, 2 portobello mushrooms, stem and gills removed, 2 bell peppers, sliced, Mayonnaise, Hot Sauce, 4 - 10" tortillas	45 mins	4	https://spoonacular.com/recipeImages/655890-556x370.jpg
18	Philly Cheesesteak Grilled Wraps	2 steaks, BBQ'd and sliced as thin as possible, 1 tbsp vegetable oil, 2 onions, halved and sliced, 1 tsp Better than Bouillon Beef Base, 2 portobello mushrooms, stem and gills removed, 2 bell peppers, sliced, Mayonnaise, Hot Sauce, 4 - 10" tortillas	45 mins	4	https://spoonacular.com/recipeImages/655890-556x370.jpg
19	Healthy Black Forest Baked Oatmeal	1 cup rolled oats (not instant), ½ cup applesauce, ½ cup fat free milk (or dairy free milk, to make vegan), ¾ cup pitted cherries (fresh or frozen), ½ Tsp. vanilla extract, ¼ cup chocolate chips, 1 Tbsp. chia seeds, 1 Tbsp. cocoa powder	45 mins	3	https://spoonacular.com/recipeImages/646442-556x370.jpg
20	Turkey Tomato Cheese Pizza	green bell pepper, chopped, parsley, pepper, whole wheat crust, Roma tomato, diced, shredded Mozzarella cheese, tomato sauce, ½-3/4 cup chopped Turkey breast (cooked), white onion, chopped	15 mins	6	https://spoonacular.com/recipeImages/715495-556x370.jpg
21	Turkey Tomato Cheese Pizza	green bell pepper, chopped, parsley, pepper, whole wheat crust, Roma tomato, diced, shredded Mozzarella cheese, tomato sauce, ½-3/4 cup chopped Turkey breast (cooked), white onion, chopped	15 mins	6	https://spoonacular.com/recipeImages/715495-556x370.jpg
22	Turkey Tomato Cheese Pizza	green bell pepper, chopped, parsley, pepper, whole wheat crust, Roma tomato, diced, shredded Mozzarella cheese, tomato sauce, ½-3/4 cup chopped Turkey breast (cooked), white onion, chopped	15 mins	6	https://spoonacular.com/recipeImages/715495-556x370.jpg
23	Antipasto Squares	3 eggs, 1/2 Tsp ground black pepper, 1/4 pound thinly sliced ham, 3 Tbsp grated Parmesan cheese, 1/4 pound thinly sliced pepperoni sausage, 1/4 pound thinly sliced provolone cheese, 2 (10oz) cans refrigerated crescent dinner rolls, 1 (12oz) jar roasted red peppers, drained and sliced into strips, 1/4 pound thinly sliced Genoa salami, 1/4 pound thinly sliced swiss cheese	45 mins	6	https://spoonacular.com/recipeImages/715511-556x370.jpg
24	Philly Cheesesteak Grilled Wraps	2 steaks, BBQ'd and sliced as thin as possible, 1 tbsp vegetable oil, 2 onions, halved and sliced, 1 tsp Better than Bouillon Beef Base, 2 portobello mushrooms, stem and gills removed, 2 bell peppers, sliced, Mayonnaise, Hot Sauce, 4 - 10" tortillas	45 mins	4	https://spoonacular.com/recipeImages/655890-556x370.jpg
25	Philly Cheesesteak Grilled Wraps	2 steaks, BBQ'd and sliced as thin as possible, 1 tbsp vegetable oil, 2 onions, halved and sliced, 1 tsp Better than Bouillon Beef Base, 2 portobello mushrooms, stem and gills removed, 2 bell peppers, sliced, Mayonnaise, Hot Sauce, 4 - 10" tortillas	45 mins	4	https://spoonacular.com/recipeImages/655890-556x370.jpg
26	Philly Cheesesteak Grilled Wraps	2 steaks, BBQ'd and sliced as thin as possible, 1 tbsp vegetable oil, 2 onions, halved and sliced, 1 tsp Better than Bouillon Beef Base, 2 portobello mushrooms, stem and gills removed, 2 bell peppers, sliced, Mayonnaise, Hot Sauce, 4 - 10" tortillas	45 mins	4	https://spoonacular.com/recipeImages/655890-556x370.jpg
27	Turkey Tomato Cheese Pizza	green bell pepper, chopped, parsley, pepper, whole wheat crust, Roma tomato, diced, shredded Mozzarella cheese, tomato sauce, ½-3/4 cup chopped Turkey breast (cooked), white onion, chopped	15 mins	6	https://spoonacular.com/recipeImages/715495-556x370.jpg
28	Healthy Black Forest Baked Oatmeal	1 cup rolled oats (not instant), ½ cup applesauce, ½ cup fat free milk (or dairy free milk, to make vegan), ¾ cup pitted cherries (fresh or frozen), ½ Tsp. vanilla extract, ¼ cup chocolate chips, 1 Tbsp. chia seeds, 1 Tbsp. cocoa powder	45 mins	3	https://spoonacular.com/recipeImages/646442-556x370.jpg
29	Antipasto Squares	3 eggs, 1/2 Tsp ground black pepper, 1/4 pound thinly sliced ham, 3 Tbsp grated Parmesan cheese, 1/4 pound thinly sliced pepperoni sausage, 1/4 pound thinly sliced provolone cheese, 2 (10oz) cans refrigerated crescent dinner rolls, 1 (12oz) jar roasted red peppers, drained and sliced into strips, 1/4 pound thinly sliced Genoa salami, 1/4 pound thinly sliced swiss cheese	45 mins	6	https://spoonacular.com/recipeImages/715511-556x370.jpg
30	Healthy Black Forest Baked Oatmeal	1 cup rolled oats (not instant), ½ cup applesauce, ½ cup fat free milk (or dairy free milk, to make vegan), ¾ cup pitted cherries (fresh or frozen), ½ Tsp. vanilla extract, ¼ cup chocolate chips, 1 Tbsp. chia seeds, 1 Tbsp. cocoa powder	45 mins	3	https://spoonacular.com/recipeImages/646442-556x370.jpg
31	Antipasto Squares	3 eggs, 1/2 Tsp ground black pepper, 1/4 pound thinly sliced ham, 3 Tbsp grated Parmesan cheese, 1/4 pound thinly sliced pepperoni sausage, 1/4 pound thinly sliced provolone cheese, 2 (10oz) cans refrigerated crescent dinner rolls, 1 (12oz) jar roasted red peppers, drained and sliced into strips, 1/4 pound thinly sliced Genoa salami, 1/4 pound thinly sliced swiss cheese	45 mins	6	https://spoonacular.com/recipeImages/715511-556x370.jpg
32	Turkey Tomato Cheese Pizza	green bell pepper, chopped, parsley, pepper, whole wheat crust, Roma tomato, diced, shredded Mozzarella cheese, tomato sauce, ½-3/4 cup chopped Turkey breast (cooked), white onion, chopped	15 mins	6	https://spoonacular.com/recipeImages/715495-556x370.jpg
33	Fresh Apple Cake With Caramel Sauce	2 c.s sugar, 1 c. vegetable oil, 3 eggs, 3 c.s sifted flour, 1 tsp. soda, 1 tsp. salt, 1 tsp. cinnamon, 2 tsp.s vanilla, 3 c.s peeled, chopped apples, 2 c.s coconut, 1 c. chopped dates or coconut, 1 c. chopped pecans, 1 c. packed brown sugar, 1/2 c. butter, 1/2 c. milk	45 mins	1	https://spoonacular.com/recipeImages/643426-556x370.jpg
34	Turkey Tomato Cheese Pizza	green bell pepper, chopped, parsley, pepper, whole wheat crust, Roma tomato, diced, shredded Mozzarella cheese, tomato sauce, ½-3/4 cup chopped Turkey breast (cooked), white onion, chopped	15 mins	6	https://spoonacular.com/recipeImages/715495-556x370.jpg
35	Antipasto Squares	3 eggs, 1/2 Tsp ground black pepper, 1/4 pound thinly sliced ham, 3 Tbsp grated Parmesan cheese, 1/4 pound thinly sliced pepperoni sausage, 1/4 pound thinly sliced provolone cheese, 2 (10oz) cans refrigerated crescent dinner rolls, 1 (12oz) jar roasted red peppers, drained and sliced into strips, 1/4 pound thinly sliced Genoa salami, 1/4 pound thinly sliced swiss cheese	45 mins	6	https://spoonacular.com/recipeImages/715511-556x370.jpg
36	Healthy Black Forest Baked Oatmeal	1 cup rolled oats (not instant), ½ cup applesauce, ½ cup fat free milk (or dairy free milk, to make vegan), ¾ cup pitted cherries (fresh or frozen), ½ Tsp. vanilla extract, ¼ cup chocolate chips, 1 Tbsp. chia seeds, 1 Tbsp. cocoa powder	45 mins	3	https://spoonacular.com/recipeImages/646442-556x370.jpg
37	Turkey Tomato Cheese Pizza	green bell pepper, chopped, parsley, pepper, whole wheat crust, Roma tomato, diced, shredded Mozzarella cheese, tomato sauce, ½-3/4 cup chopped Turkey breast (cooked), white onion, chopped	15 mins	6	https://spoonacular.com/recipeImages/715495-556x370.jpg
38	Philly Cheesesteak Grilled Wraps	2 steaks, BBQ'd and sliced as thin as possible, 1 tbsp vegetable oil, 2 onions, halved and sliced, 1 tsp Better than Bouillon Beef Base, 2 portobello mushrooms, stem and gills removed, 2 bell peppers, sliced, Mayonnaise, Hot Sauce, 4 - 10" tortillas	45 mins	4	https://spoonacular.com/recipeImages/655890-556x370.jpg
39	Antipasto Squares	3 eggs, 1/2 Tsp ground black pepper, 1/4 pound thinly sliced ham, 3 Tbsp grated Parmesan cheese, 1/4 pound thinly sliced pepperoni sausage, 1/4 pound thinly sliced provolone cheese, 2 (10oz) cans refrigerated crescent dinner rolls, 1 (12oz) jar roasted red peppers, drained and sliced into strips, 1/4 pound thinly sliced Genoa salami, 1/4 pound thinly sliced swiss cheese	45 mins	6	https://spoonacular.com/recipeImages/715511-556x370.jpg
40	Turkey Tomato Cheese Pizza	green bell pepper, chopped, parsley, pepper, whole wheat crust, Roma tomato, diced, shredded Mozzarella cheese, tomato sauce, ½-3/4 cup chopped Turkey breast (cooked), white onion, chopped	15 mins	6	https://spoonacular.com/recipeImages/715495-556x370.jpg
\.


--
-- Data for Name: steps; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.steps (step_id, recipe_id, step_number, body, media) FROM stdin;
1	1	1	Bake for 25 minutes in the preheated oven, then remove foil and bake for an additional 10-20 (I bake the full 2	\N
2	1	2	minutes, or until dough is fluffy and golden brown.	\N
3	1	3	Let stand for 5 minutes, then cut into squares, and serve warm or at room temperature.You must try this one out and let me know what you think!JOIN 500,000 SUBSCRIBERS!Join over 500,000 others who follow Pink	\N
4	1	4	When on Social Media, the Pink	\N
5	1	5	When blog, and email. Sign up to receive exclusive bonuses like this FREE Simple Fit Dinners Ebook.Don't wait! You won't want to miss a thing.Success! Now check your email to confirm your subscription and download your FREE ebook.There was an error submitting your subscription. Please try again.First Name	\N
6	1	6	Email	\N
7	1	7	Address	\N
8	1	8	Subscribe	\N
9	1	9	Powered by Convert	\N
10	1	10	Kit	\N
11	2	1	In frying pan over medium-low heat, add onions and cook on low until caramelized (when done properly, this takes about 30 min).	\N
12	2	2	Add in the Better than Bouillon Beef Base and a tbsp of water to make a faint gravy.	\N
13	2	3	Add in the mushrooms and bell peppers and cook until softened, about 5 minutes.	\N
14	2	4	On tortilla, spread a thin layer of mayonnaise and top with a few squirts of hot sauce.	\N
15	2	5	Pile on the steak and vegetables.	\N
16	2	6	Roll up, making sure the ends are sealed.	\N
17	2	7	On griddle or in large frying pan sprayed with cooking spray, over medium heat, add the wraps, seam side down, and put something heavy on top (like a smaller frying pan weighted down with something heatproof) and grill until toasted. Flip and repeat. This would work well in an electric grill (like the George Foreman or a panini press)	\N
18	2	8	Once finished, pull off and let sit for a minute before slicing in half.	\N
19	2	9	Enjoy the happy faces around you :)	\N
20	3	1	In frying pan over medium-low heat, add onions and cook on low until caramelized (when done properly, this takes about 30 min).	\N
21	3	2	Add in the Better than Bouillon Beef Base and a tbsp of water to make a faint gravy.	\N
22	3	3	Add in the mushrooms and bell peppers and cook until softened, about 5 minutes.	\N
23	3	4	On tortilla, spread a thin layer of mayonnaise and top with a few squirts of hot sauce.	\N
24	3	5	Pile on the steak and vegetables.	\N
25	3	6	Roll up, making sure the ends are sealed.	\N
26	3	7	On griddle or in large frying pan sprayed with cooking spray, over medium heat, add the wraps, seam side down, and put something heavy on top (like a smaller frying pan weighted down with something heatproof) and grill until toasted. Flip and repeat. This would work well in an electric grill (like the George Foreman or a panini press)	\N
27	3	8	Once finished, pull off and let sit for a minute before slicing in half.	\N
28	3	9	Enjoy the happy faces around you :)	\N
29	4	1	In frying pan over medium-low heat, add onions and cook on low until caramelized (when done properly, this takes about 30 min).	\N
30	4	2	Add in the Better than Bouillon Beef Base and a tbsp of water to make a faint gravy.	\N
31	4	3	Add in the mushrooms and bell peppers and cook until softened, about 5 minutes.	\N
32	4	4	On tortilla, spread a thin layer of mayonnaise and top with a few squirts of hot sauce.	\N
33	4	5	Pile on the steak and vegetables.	\N
34	4	6	Roll up, making sure the ends are sealed.	\N
35	4	7	On griddle or in large frying pan sprayed with cooking spray, over medium heat, add the wraps, seam side down, and put something heavy on top (like a smaller frying pan weighted down with something heatproof) and grill until toasted. Flip and repeat. This would work well in an electric grill (like the George Foreman or a panini press)	\N
36	4	8	Once finished, pull off and let sit for a minute before slicing in half.	\N
37	4	9	Enjoy the happy faces around you :)	\N
38	5	1	Preheat oven to 375	\N
39	5	2	Combine all ingredients in a medium bowl.	\N
40	5	3	Spray a muffin tin with cooking oil. Fill the tin to the top with oats. It should make about six  eight oatmeal cakes.	\N
41	5	4	Bake uncovered for 20 minutes. For a light crust, broil for an additional 3-5 minutes until lightly browned.	\N
42	5	5	Serve on its own or with fresh fruit, yogurt, or milk.	\N
43	6	1	In frying pan over medium-low heat, add onions and cook on low until caramelized (when done properly, this takes about 30 min).	\N
44	6	2	Add in the Better than Bouillon Beef Base and a tbsp of water to make a faint gravy.	\N
45	6	3	Add in the mushrooms and bell peppers and cook until softened, about 5 minutes.	\N
46	6	4	On tortilla, spread a thin layer of mayonnaise and top with a few squirts of hot sauce.	\N
47	6	5	Pile on the steak and vegetables.	\N
48	6	6	Roll up, making sure the ends are sealed.	\N
49	6	7	On griddle or in large frying pan sprayed with cooking spray, over medium heat, add the wraps, seam side down, and put something heavy on top (like a smaller frying pan weighted down with something heatproof) and grill until toasted. Flip and repeat. This would work well in an electric grill (like the George Foreman or a panini press)	\N
50	6	8	Once finished, pull off and let sit for a minute before slicing in half.	\N
51	6	9	Enjoy the happy faces around you :)	\N
52	7	1	Preheat oven to 375	\N
53	7	2	Combine all ingredients in a medium bowl.	\N
54	7	3	Spray a muffin tin with cooking oil. Fill the tin to the top with oats. It should make about six  eight oatmeal cakes.	\N
55	7	4	Bake uncovered for 20 minutes. For a light crust, broil for an additional 3-5 minutes until lightly browned.	\N
56	7	5	Serve on its own or with fresh fruit, yogurt, or milk.	\N
57	8	1	Mix together sugar and oil; add eggs; beat well. blend in flour, soda and salt.	\N
58	8	2	Add cinnamon and vanilla. Stir in apples, coconut, dates and pecans. Batter will be thick. Spoon into a 9" or 10" tube pan which has been greased and floured.	\N
59	8	3	Bake at 325 degrees for 1 1/2 hours, or until toothpick inserted comes out clean.	\N
124	17	6	Roll up, making sure the ends are sealed.	\N
60	8	4	Remove from oven and immediately pour caramel sauce over and allow to soak in. Cool cake completely before removing from pan. For caramel sauce, heat ingredients together. Boil for 2 minutes.	\N
61	9	1	Heat up your grill to 450 degrees.Start off with your whole wheat crust and spread the tomato sauce evenly over the top.	\N
62	9	2	Add a little cheese, bell pepper, onion, turkey and create a layer.Top with another layer of cheese, turkey, tomato, bell pepper, onion.	\N
63	9	3	Add another layer of cheese, and then sprinkle with pepper.	\N
64	9	4	Place the pizza on a ceramic grill plate and place into the grill.Grill for 6-10 minutes, or until cooked as desired.Slice, and serve immediately.	\N
65	10	1	Bake for 25 minutes in the preheated oven, then remove foil and bake for an additional 10-20 (I bake the full 2	\N
66	10	2	minutes, or until dough is fluffy and golden brown.	\N
67	10	3	Let stand for 5 minutes, then cut into squares, and serve warm or at room temperature.You must try this one out and let me know what you think!JOIN 500,000 SUBSCRIBERS!Join over 500,000 others who follow Pink	\N
68	10	4	When on Social Media, the Pink	\N
69	10	5	When blog, and email. Sign up to receive exclusive bonuses like this FREE Simple Fit Dinners Ebook.Don't wait! You won't want to miss a thing.Success! Now check your email to confirm your subscription and download your FREE ebook.There was an error submitting your subscription. Please try again.First Name	\N
70	10	6	Email	\N
71	10	7	Address	\N
72	10	8	Subscribe	\N
73	10	9	Powered by Convert	\N
74	10	10	Kit	\N
75	11	1	Bake for 25 minutes in the preheated oven, then remove foil and bake for an additional 10-20 (I bake the full 2	\N
76	11	2	minutes, or until dough is fluffy and golden brown.	\N
77	11	3	Let stand for 5 minutes, then cut into squares, and serve warm or at room temperature.You must try this one out and let me know what you think!JOIN 500,000 SUBSCRIBERS!Join over 500,000 others who follow Pink	\N
78	11	4	When on Social Media, the Pink	\N
79	11	5	When blog, and email. Sign up to receive exclusive bonuses like this FREE Simple Fit Dinners Ebook.Don't wait! You won't want to miss a thing.Success! Now check your email to confirm your subscription and download your FREE ebook.There was an error submitting your subscription. Please try again.First Name	\N
80	11	6	Email	\N
81	11	7	Address	\N
82	11	8	Subscribe	\N
83	11	9	Powered by Convert	\N
84	11	10	Kit	\N
85	12	1	Bake for 25 minutes in the preheated oven, then remove foil and bake for an additional 10-20 (I bake the full 2	\N
86	12	2	minutes, or until dough is fluffy and golden brown.	\N
87	12	3	Let stand for 5 minutes, then cut into squares, and serve warm or at room temperature.You must try this one out and let me know what you think!JOIN 500,000 SUBSCRIBERS!Join over 500,000 others who follow Pink	\N
88	12	4	When on Social Media, the Pink	\N
89	12	5	When blog, and email. Sign up to receive exclusive bonuses like this FREE Simple Fit Dinners Ebook.Don't wait! You won't want to miss a thing.Success! Now check your email to confirm your subscription and download your FREE ebook.There was an error submitting your subscription. Please try again.First Name	\N
90	12	6	Email	\N
91	12	7	Address	\N
92	12	8	Subscribe	\N
93	12	9	Powered by Convert	\N
94	12	10	Kit	\N
95	13	1	Preheat oven to 375	\N
96	13	2	Combine all ingredients in a medium bowl.	\N
97	13	3	Spray a muffin tin with cooking oil. Fill the tin to the top with oats. It should make about six  eight oatmeal cakes.	\N
98	13	4	Bake uncovered for 20 minutes. For a light crust, broil for an additional 3-5 minutes until lightly browned.	\N
99	13	5	Serve on its own or with fresh fruit, yogurt, or milk.	\N
100	14	1	Mix together sugar and oil; add eggs; beat well. blend in flour, soda and salt.	\N
101	14	2	Add cinnamon and vanilla. Stir in apples, coconut, dates and pecans. Batter will be thick. Spoon into a 9" or 10" tube pan which has been greased and floured.	\N
102	14	3	Bake at 325 degrees for 1 1/2 hours, or until toothpick inserted comes out clean.	\N
103	14	4	Remove from oven and immediately pour caramel sauce over and allow to soak in. Cool cake completely before removing from pan. For caramel sauce, heat ingredients together. Boil for 2 minutes.	\N
104	15	1	Preheat oven to 375	\N
105	15	2	Combine all ingredients in a medium bowl.	\N
106	15	3	Spray a muffin tin with cooking oil. Fill the tin to the top with oats. It should make about six  eight oatmeal cakes.	\N
107	15	4	Bake uncovered for 20 minutes. For a light crust, broil for an additional 3-5 minutes until lightly browned.	\N
108	15	5	Serve on its own or with fresh fruit, yogurt, or milk.	\N
109	16	1	Bake for 25 minutes in the preheated oven, then remove foil and bake for an additional 10-20 (I bake the full 2	\N
110	16	2	minutes, or until dough is fluffy and golden brown.	\N
111	16	3	Let stand for 5 minutes, then cut into squares, and serve warm or at room temperature.You must try this one out and let me know what you think!JOIN 500,000 SUBSCRIBERS!Join over 500,000 others who follow Pink	\N
112	16	4	When on Social Media, the Pink	\N
113	16	5	When blog, and email. Sign up to receive exclusive bonuses like this FREE Simple Fit Dinners Ebook.Don't wait! You won't want to miss a thing.Success! Now check your email to confirm your subscription and download your FREE ebook.There was an error submitting your subscription. Please try again.First Name	\N
114	16	6	Email	\N
115	16	7	Address	\N
116	16	8	Subscribe	\N
117	16	9	Powered by Convert	\N
118	16	10	Kit	\N
119	17	1	In frying pan over medium-low heat, add onions and cook on low until caramelized (when done properly, this takes about 30 min).	\N
120	17	2	Add in the Better than Bouillon Beef Base and a tbsp of water to make a faint gravy.	\N
121	17	3	Add in the mushrooms and bell peppers and cook until softened, about 5 minutes.	\N
122	17	4	On tortilla, spread a thin layer of mayonnaise and top with a few squirts of hot sauce.	\N
123	17	5	Pile on the steak and vegetables.	\N
125	17	7	On griddle or in large frying pan sprayed with cooking spray, over medium heat, add the wraps, seam side down, and put something heavy on top (like a smaller frying pan weighted down with something heatproof) and grill until toasted. Flip and repeat. This would work well in an electric grill (like the George Foreman or a panini press)	\N
126	17	8	Once finished, pull off and let sit for a minute before slicing in half.	\N
127	17	9	Enjoy the happy faces around you :)	\N
128	18	1	In frying pan over medium-low heat, add onions and cook on low until caramelized (when done properly, this takes about 30 min).	\N
129	18	2	Add in the Better than Bouillon Beef Base and a tbsp of water to make a faint gravy.	\N
130	18	3	Add in the mushrooms and bell peppers and cook until softened, about 5 minutes.	\N
131	18	4	On tortilla, spread a thin layer of mayonnaise and top with a few squirts of hot sauce.	\N
132	18	5	Pile on the steak and vegetables.	\N
133	18	6	Roll up, making sure the ends are sealed.	\N
134	18	7	On griddle or in large frying pan sprayed with cooking spray, over medium heat, add the wraps, seam side down, and put something heavy on top (like a smaller frying pan weighted down with something heatproof) and grill until toasted. Flip and repeat. This would work well in an electric grill (like the George Foreman or a panini press)	\N
135	18	8	Once finished, pull off and let sit for a minute before slicing in half.	\N
136	18	9	Enjoy the happy faces around you :)	\N
137	19	1	Preheat oven to 375	\N
138	19	2	Combine all ingredients in a medium bowl.	\N
139	19	3	Spray a muffin tin with cooking oil. Fill the tin to the top with oats. It should make about six  eight oatmeal cakes.	\N
140	19	4	Bake uncovered for 20 minutes. For a light crust, broil for an additional 3-5 minutes until lightly browned.	\N
141	19	5	Serve on its own or with fresh fruit, yogurt, or milk.	\N
142	20	1	Heat up your grill to 450 degrees.Start off with your whole wheat crust and spread the tomato sauce evenly over the top.	\N
143	20	2	Add a little cheese, bell pepper, onion, turkey and create a layer.Top with another layer of cheese, turkey, tomato, bell pepper, onion.	\N
144	20	3	Add another layer of cheese, and then sprinkle with pepper.	\N
145	20	4	Place the pizza on a ceramic grill plate and place into the grill.Grill for 6-10 minutes, or until cooked as desired.Slice, and serve immediately.	\N
146	21	1	Heat up your grill to 450 degrees.Start off with your whole wheat crust and spread the tomato sauce evenly over the top.	\N
147	21	2	Add a little cheese, bell pepper, onion, turkey and create a layer.Top with another layer of cheese, turkey, tomato, bell pepper, onion.	\N
148	21	3	Add another layer of cheese, and then sprinkle with pepper.	\N
149	21	4	Place the pizza on a ceramic grill plate and place into the grill.Grill for 6-10 minutes, or until cooked as desired.Slice, and serve immediately.	\N
150	22	1	Heat up your grill to 450 degrees.Start off with your whole wheat crust and spread the tomato sauce evenly over the top.	\N
151	22	2	Add a little cheese, bell pepper, onion, turkey and create a layer.Top with another layer of cheese, turkey, tomato, bell pepper, onion.	\N
152	22	3	Add another layer of cheese, and then sprinkle with pepper.	\N
153	22	4	Place the pizza on a ceramic grill plate and place into the grill.Grill for 6-10 minutes, or until cooked as desired.Slice, and serve immediately.	\N
154	23	1	Bake for 25 minutes in the preheated oven, then remove foil and bake for an additional 10-20 (I bake the full 2	\N
155	23	2	minutes, or until dough is fluffy and golden brown.	\N
156	23	3	Let stand for 5 minutes, then cut into squares, and serve warm or at room temperature.You must try this one out and let me know what you think!JOIN 500,000 SUBSCRIBERS!Join over 500,000 others who follow Pink	\N
157	23	4	When on Social Media, the Pink	\N
158	23	5	When blog, and email. Sign up to receive exclusive bonuses like this FREE Simple Fit Dinners Ebook.Don't wait! You won't want to miss a thing.Success! Now check your email to confirm your subscription and download your FREE ebook.There was an error submitting your subscription. Please try again.First Name	\N
159	23	6	Email	\N
160	23	7	Address	\N
161	23	8	Subscribe	\N
162	23	9	Powered by Convert	\N
163	23	10	Kit	\N
164	24	1	In frying pan over medium-low heat, add onions and cook on low until caramelized (when done properly, this takes about 30 min).	\N
165	24	2	Add in the Better than Bouillon Beef Base and a tbsp of water to make a faint gravy.	\N
166	24	3	Add in the mushrooms and bell peppers and cook until softened, about 5 minutes.	\N
167	24	4	On tortilla, spread a thin layer of mayonnaise and top with a few squirts of hot sauce.	\N
168	24	5	Pile on the steak and vegetables.	\N
169	24	6	Roll up, making sure the ends are sealed.	\N
170	24	7	On griddle or in large frying pan sprayed with cooking spray, over medium heat, add the wraps, seam side down, and put something heavy on top (like a smaller frying pan weighted down with something heatproof) and grill until toasted. Flip and repeat. This would work well in an electric grill (like the George Foreman or a panini press)	\N
171	24	8	Once finished, pull off and let sit for a minute before slicing in half.	\N
172	24	9	Enjoy the happy faces around you :)	\N
173	25	1	In frying pan over medium-low heat, add onions and cook on low until caramelized (when done properly, this takes about 30 min).	\N
174	25	2	Add in the Better than Bouillon Beef Base and a tbsp of water to make a faint gravy.	\N
175	25	3	Add in the mushrooms and bell peppers and cook until softened, about 5 minutes.	\N
176	25	4	On tortilla, spread a thin layer of mayonnaise and top with a few squirts of hot sauce.	\N
177	25	5	Pile on the steak and vegetables.	\N
178	25	6	Roll up, making sure the ends are sealed.	\N
179	25	7	On griddle or in large frying pan sprayed with cooking spray, over medium heat, add the wraps, seam side down, and put something heavy on top (like a smaller frying pan weighted down with something heatproof) and grill until toasted. Flip and repeat. This would work well in an electric grill (like the George Foreman or a panini press)	\N
180	25	8	Once finished, pull off and let sit for a minute before slicing in half.	\N
181	25	9	Enjoy the happy faces around you :)	\N
182	26	1	In frying pan over medium-low heat, add onions and cook on low until caramelized (when done properly, this takes about 30 min).	\N
183	26	2	Add in the Better than Bouillon Beef Base and a tbsp of water to make a faint gravy.	\N
184	26	3	Add in the mushrooms and bell peppers and cook until softened, about 5 minutes.	\N
185	26	4	On tortilla, spread a thin layer of mayonnaise and top with a few squirts of hot sauce.	\N
186	26	5	Pile on the steak and vegetables.	\N
187	26	6	Roll up, making sure the ends are sealed.	\N
188	26	7	On griddle or in large frying pan sprayed with cooking spray, over medium heat, add the wraps, seam side down, and put something heavy on top (like a smaller frying pan weighted down with something heatproof) and grill until toasted. Flip and repeat. This would work well in an electric grill (like the George Foreman or a panini press)	\N
189	26	8	Once finished, pull off and let sit for a minute before slicing in half.	\N
190	26	9	Enjoy the happy faces around you :)	\N
191	27	1	Heat up your grill to 450 degrees.Start off with your whole wheat crust and spread the tomato sauce evenly over the top.	\N
192	27	2	Add a little cheese, bell pepper, onion, turkey and create a layer.Top with another layer of cheese, turkey, tomato, bell pepper, onion.	\N
193	27	3	Add another layer of cheese, and then sprinkle with pepper.	\N
194	27	4	Place the pizza on a ceramic grill plate and place into the grill.Grill for 6-10 minutes, or until cooked as desired.Slice, and serve immediately.	\N
195	28	1	Preheat oven to 375	\N
196	28	2	Combine all ingredients in a medium bowl.	\N
197	28	3	Spray a muffin tin with cooking oil. Fill the tin to the top with oats. It should make about six  eight oatmeal cakes.	\N
198	28	4	Bake uncovered for 20 minutes. For a light crust, broil for an additional 3-5 minutes until lightly browned.	\N
199	28	5	Serve on its own or with fresh fruit, yogurt, or milk.	\N
200	29	1	Bake for 25 minutes in the preheated oven, then remove foil and bake for an additional 10-20 (I bake the full 2	\N
201	29	2	minutes, or until dough is fluffy and golden brown.	\N
202	29	3	Let stand for 5 minutes, then cut into squares, and serve warm or at room temperature.You must try this one out and let me know what you think!JOIN 500,000 SUBSCRIBERS!Join over 500,000 others who follow Pink	\N
203	29	4	When on Social Media, the Pink	\N
204	29	5	When blog, and email. Sign up to receive exclusive bonuses like this FREE Simple Fit Dinners Ebook.Don't wait! You won't want to miss a thing.Success! Now check your email to confirm your subscription and download your FREE ebook.There was an error submitting your subscription. Please try again.First Name	\N
205	29	6	Email	\N
206	29	7	Address	\N
207	29	8	Subscribe	\N
208	29	9	Powered by Convert	\N
209	29	10	Kit	\N
210	30	1	Preheat oven to 375	\N
211	30	2	Combine all ingredients in a medium bowl.	\N
212	30	3	Spray a muffin tin with cooking oil. Fill the tin to the top with oats. It should make about six  eight oatmeal cakes.	\N
213	30	4	Bake uncovered for 20 minutes. For a light crust, broil for an additional 3-5 minutes until lightly browned.	\N
214	30	5	Serve on its own or with fresh fruit, yogurt, or milk.	\N
215	31	1	Bake for 25 minutes in the preheated oven, then remove foil and bake for an additional 10-20 (I bake the full 2	\N
216	31	2	minutes, or until dough is fluffy and golden brown.	\N
217	31	3	Let stand for 5 minutes, then cut into squares, and serve warm or at room temperature.You must try this one out and let me know what you think!JOIN 500,000 SUBSCRIBERS!Join over 500,000 others who follow Pink	\N
218	31	4	When on Social Media, the Pink	\N
219	31	5	When blog, and email. Sign up to receive exclusive bonuses like this FREE Simple Fit Dinners Ebook.Don't wait! You won't want to miss a thing.Success! Now check your email to confirm your subscription and download your FREE ebook.There was an error submitting your subscription. Please try again.First Name	\N
220	31	6	Email	\N
221	31	7	Address	\N
222	31	8	Subscribe	\N
223	31	9	Powered by Convert	\N
224	31	10	Kit	\N
225	32	1	Heat up your grill to 450 degrees.Start off with your whole wheat crust and spread the tomato sauce evenly over the top.	\N
226	32	2	Add a little cheese, bell pepper, onion, turkey and create a layer.Top with another layer of cheese, turkey, tomato, bell pepper, onion.	\N
227	32	3	Add another layer of cheese, and then sprinkle with pepper.	\N
228	32	4	Place the pizza on a ceramic grill plate and place into the grill.Grill for 6-10 minutes, or until cooked as desired.Slice, and serve immediately.	\N
229	33	1	Mix together sugar and oil; add eggs; beat well. blend in flour, soda and salt.	\N
230	33	2	Add cinnamon and vanilla. Stir in apples, coconut, dates and pecans. Batter will be thick. Spoon into a 9" or 10" tube pan which has been greased and floured.	\N
231	33	3	Bake at 325 degrees for 1 1/2 hours, or until toothpick inserted comes out clean.	\N
232	33	4	Remove from oven and immediately pour caramel sauce over and allow to soak in. Cool cake completely before removing from pan. For caramel sauce, heat ingredients together. Boil for 2 minutes.	\N
233	34	1	Heat up your grill to 450 degrees.Start off with your whole wheat crust and spread the tomato sauce evenly over the top.	\N
234	34	2	Add a little cheese, bell pepper, onion, turkey and create a layer.Top with another layer of cheese, turkey, tomato, bell pepper, onion.	\N
235	34	3	Add another layer of cheese, and then sprinkle with pepper.	\N
236	34	4	Place the pizza on a ceramic grill plate and place into the grill.Grill for 6-10 minutes, or until cooked as desired.Slice, and serve immediately.	\N
237	35	1	Bake for 25 minutes in the preheated oven, then remove foil and bake for an additional 10-20 (I bake the full 2	\N
238	35	2	minutes, or until dough is fluffy and golden brown.	\N
239	35	3	Let stand for 5 minutes, then cut into squares, and serve warm or at room temperature.You must try this one out and let me know what you think!JOIN 500,000 SUBSCRIBERS!Join over 500,000 others who follow Pink	\N
240	35	4	When on Social Media, the Pink	\N
241	35	5	When blog, and email. Sign up to receive exclusive bonuses like this FREE Simple Fit Dinners Ebook.Don't wait! You won't want to miss a thing.Success! Now check your email to confirm your subscription and download your FREE ebook.There was an error submitting your subscription. Please try again.First Name	\N
242	35	6	Email	\N
243	35	7	Address	\N
244	35	8	Subscribe	\N
245	35	9	Powered by Convert	\N
246	35	10	Kit	\N
247	36	1	Preheat oven to 375	\N
248	36	2	Combine all ingredients in a medium bowl.	\N
249	36	3	Spray a muffin tin with cooking oil. Fill the tin to the top with oats. It should make about six  eight oatmeal cakes.	\N
250	36	4	Bake uncovered for 20 minutes. For a light crust, broil for an additional 3-5 minutes until lightly browned.	\N
251	36	5	Serve on its own or with fresh fruit, yogurt, or milk.	\N
252	37	1	Heat up your grill to 450 degrees.Start off with your whole wheat crust and spread the tomato sauce evenly over the top.	\N
253	37	2	Add a little cheese, bell pepper, onion, turkey and create a layer.Top with another layer of cheese, turkey, tomato, bell pepper, onion.	\N
254	37	3	Add another layer of cheese, and then sprinkle with pepper.	\N
255	37	4	Place the pizza on a ceramic grill plate and place into the grill.Grill for 6-10 minutes, or until cooked as desired.Slice, and serve immediately.	\N
256	38	1	In frying pan over medium-low heat, add onions and cook on low until caramelized (when done properly, this takes about 30 min).	\N
257	38	2	Add in the Better than Bouillon Beef Base and a tbsp of water to make a faint gravy.	\N
258	38	3	Add in the mushrooms and bell peppers and cook until softened, about 5 minutes.	\N
259	38	4	On tortilla, spread a thin layer of mayonnaise and top with a few squirts of hot sauce.	\N
260	38	5	Pile on the steak and vegetables.	\N
261	38	6	Roll up, making sure the ends are sealed.	\N
262	38	7	On griddle or in large frying pan sprayed with cooking spray, over medium heat, add the wraps, seam side down, and put something heavy on top (like a smaller frying pan weighted down with something heatproof) and grill until toasted. Flip and repeat. This would work well in an electric grill (like the George Foreman or a panini press)	\N
263	38	8	Once finished, pull off and let sit for a minute before slicing in half.	\N
264	38	9	Enjoy the happy faces around you :)	\N
265	39	1	Bake for 25 minutes in the preheated oven, then remove foil and bake for an additional 10-20 (I bake the full 2	\N
266	39	2	minutes, or until dough is fluffy and golden brown.	\N
267	39	3	Let stand for 5 minutes, then cut into squares, and serve warm or at room temperature.You must try this one out and let me know what you think!JOIN 500,000 SUBSCRIBERS!Join over 500,000 others who follow Pink	\N
268	39	4	When on Social Media, the Pink	\N
269	39	5	When blog, and email. Sign up to receive exclusive bonuses like this FREE Simple Fit Dinners Ebook.Don't wait! You won't want to miss a thing.Success! Now check your email to confirm your subscription and download your FREE ebook.There was an error submitting your subscription. Please try again.First Name	\N
270	39	6	Email	\N
271	39	7	Address	\N
272	39	8	Subscribe	\N
273	39	9	Powered by Convert	\N
274	39	10	Kit	\N
275	40	1	Heat up your grill to 450 degrees.Start off with your whole wheat crust and spread the tomato sauce evenly over the top.	\N
276	40	2	Add a little cheese, bell pepper, onion, turkey and create a layer.Top with another layer of cheese, turkey, tomato, bell pepper, onion.	\N
277	40	3	Add another layer of cheese, and then sprinkle with pepper.	\N
278	40	4	Place the pizza on a ceramic grill plate and place into the grill.Grill for 6-10 minutes, or until cooked as desired.Slice, and serve immediately.	\N
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.users (user_id, fname, lname, email, password, profile_picture) FROM stdin;
1	Jordan	Cross	JCross@email.com	test	/static/img/chef_hat.png
2	Elizabeth	Thompson	EThompson@email.com	test	/static/img/chef_hat.png
3	Jeffrey	Smith	JSmith@email.com	test	/static/img/chef_hat.png
4	Matthew	Allen	MAllen@email.com	test	/static/img/chef_hat.png
5	Jeanne	Moore	JMoore@email.com	test	/static/img/chef_hat.png
6	Travis	Abbott	TAbbott@email.com	test	/static/img/chef_hat.png
7	Joseph	Flores	JFlores@email.com	test	/static/img/chef_hat.png
8	Evan	Colon	EColon@email.com	test	/static/img/chef_hat.png
9	Austin	Maldonado	AMaldonado@email.com	test	/static/img/chef_hat.png
10	Sarah	Bailey	SBailey@email.com	test	/static/img/chef_hat.png
\.


--
-- Name: cookbook_recipes_cookbook_recipe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('public.cookbook_recipes_cookbook_recipe_id_seq', 40, true);


--
-- Name: cookbooks_cookbook_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('public.cookbooks_cookbook_id_seq', 20, true);


--
-- Name: recipes_recipe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('public.recipes_recipe_id_seq', 40, true);


--
-- Name: steps_step_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('public.steps_step_id_seq', 278, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('public.users_user_id_seq', 10, true);


--
-- Name: cookbook_recipes cookbook_recipes_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.cookbook_recipes
    ADD CONSTRAINT cookbook_recipes_pkey PRIMARY KEY (cookbook_recipe_id);


--
-- Name: cookbooks cookbooks_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.cookbooks
    ADD CONSTRAINT cookbooks_pkey PRIMARY KEY (cookbook_id);


--
-- Name: recipes recipes_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.recipes
    ADD CONSTRAINT recipes_pkey PRIMARY KEY (recipe_id);


--
-- Name: steps steps_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.steps
    ADD CONSTRAINT steps_pkey PRIMARY KEY (step_id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: cookbook_recipes cookbook_recipes_cookbook_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.cookbook_recipes
    ADD CONSTRAINT cookbook_recipes_cookbook_id_fkey FOREIGN KEY (cookbook_id) REFERENCES public.cookbooks(cookbook_id);


--
-- Name: cookbook_recipes cookbook_recipes_recipe_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.cookbook_recipes
    ADD CONSTRAINT cookbook_recipes_recipe_id_fkey FOREIGN KEY (recipe_id) REFERENCES public.recipes(recipe_id);


--
-- Name: cookbooks cookbooks_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.cookbooks
    ADD CONSTRAINT cookbooks_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: steps steps_recipe_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.steps
    ADD CONSTRAINT steps_recipe_id_fkey FOREIGN KEY (recipe_id) REFERENCES public.recipes(recipe_id);


--
-- PostgreSQL database dump complete
--

