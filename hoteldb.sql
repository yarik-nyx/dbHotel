--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

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
-- Name: check_in; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.check_in (
    check_in_id integer NOT NULL,
    client_id integer NOT NULL,
    room_id integer NOT NULL,
    check_in_date date,
    check_out_date date
);


ALTER TABLE public.check_in OWNER TO postgres;

--
-- Name: check_in_check_in_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.check_in_check_in_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.check_in_check_in_id_seq OWNER TO postgres;

--
-- Name: check_in_check_in_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.check_in_check_in_id_seq OWNED BY public.check_in.check_in_id;


--
-- Name: client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client (
    client_id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    phone_number character varying(20) NOT NULL,
    email_address character varying(100),
    passport character varying(20) NOT NULL
);


ALTER TABLE public.client OWNER TO postgres;

--
-- Name: client_client_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.client_client_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.client_client_id_seq OWNER TO postgres;

--
-- Name: client_client_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.client_client_id_seq OWNED BY public.client.client_id;


--
-- Name: employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee (
    employee_id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    position_id integer NOT NULL,
    salary numeric(10,2) NOT NULL,
    phone_number character varying(20) NOT NULL,
    passport character varying(20) NOT NULL
);


ALTER TABLE public.employee OWNER TO postgres;

--
-- Name: employee_employee_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employee_employee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.employee_employee_id_seq OWNER TO postgres;

--
-- Name: employee_employee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employee_employee_id_seq OWNED BY public.employee.employee_id;


--
-- Name: position; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."position" (
    position_id integer NOT NULL,
    position_name character varying(100) NOT NULL,
    description text
);


ALTER TABLE public."position" OWNER TO postgres;

--
-- Name: position_position_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.position_position_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.position_position_id_seq OWNER TO postgres;

--
-- Name: position_position_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.position_position_id_seq OWNED BY public."position".position_id;


--
-- Name: room; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.room (
    room_id integer NOT NULL,
    room_number character varying(10) NOT NULL,
    room_type_id integer NOT NULL,
    price_per_night numeric(10,2) NOT NULL,
    availability boolean NOT NULL
);


ALTER TABLE public.room OWNER TO postgres;

--
-- Name: room_room_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.room_room_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.room_room_id_seq OWNER TO postgres;

--
-- Name: room_room_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.room_room_id_seq OWNED BY public.room.room_id;


--
-- Name: room_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.room_type (
    room_type_id integer NOT NULL,
    type_name character varying(100) NOT NULL,
    type_description character varying(100)
);


ALTER TABLE public.room_type OWNER TO postgres;

--
-- Name: room_type_room_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.room_type_room_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.room_type_room_type_id_seq OWNER TO postgres;

--
-- Name: room_type_room_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.room_type_room_type_id_seq OWNED BY public.room_type.room_type_id;


--
-- Name: service_order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.service_order (
    order_id integer NOT NULL,
    client_id integer NOT NULL,
    service_id integer NOT NULL,
    employee_id integer,
    order_date date NOT NULL
);


ALTER TABLE public.service_order OWNER TO postgres;

--
-- Name: service_order_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.service_order_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.service_order_order_id_seq OWNER TO postgres;

--
-- Name: service_order_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.service_order_order_id_seq OWNED BY public.service_order.order_id;


--
-- Name: services; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.services (
    service_id integer NOT NULL,
    name character varying(100) NOT NULL,
    price numeric(10,2)
);


ALTER TABLE public.services OWNER TO postgres;

--
-- Name: services_service_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.services_service_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.services_service_id_seq OWNER TO postgres;

--
-- Name: services_service_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.services_service_id_seq OWNED BY public.services.service_id;


--
-- Name: check_in check_in_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.check_in ALTER COLUMN check_in_id SET DEFAULT nextval('public.check_in_check_in_id_seq'::regclass);


--
-- Name: client client_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client ALTER COLUMN client_id SET DEFAULT nextval('public.client_client_id_seq'::regclass);


--
-- Name: employee employee_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee ALTER COLUMN employee_id SET DEFAULT nextval('public.employee_employee_id_seq'::regclass);


--
-- Name: position position_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."position" ALTER COLUMN position_id SET DEFAULT nextval('public.position_position_id_seq'::regclass);


--
-- Name: room room_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.room ALTER COLUMN room_id SET DEFAULT nextval('public.room_room_id_seq'::regclass);


--
-- Name: room_type room_type_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.room_type ALTER COLUMN room_type_id SET DEFAULT nextval('public.room_type_room_type_id_seq'::regclass);


--
-- Name: service_order order_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_order ALTER COLUMN order_id SET DEFAULT nextval('public.service_order_order_id_seq'::regclass);


--
-- Name: services service_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services ALTER COLUMN service_id SET DEFAULT nextval('public.services_service_id_seq'::regclass);


--
-- Data for Name: check_in; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.check_in (check_in_id, client_id, room_id, check_in_date, check_out_date) FROM stdin;
1	1	1	2022-03-15	2022-03-18
2	2	2	2022-04-01	2022-04-05
5	5	5	2022-07-10	2022-07-15
6	16	1	2022-05-01	2022-05-05
8	18	5	2022-07-20	2022-07-25
9	19	7	2022-08-15	2022-08-20
11	6	11	2022-10-02	2022-10-07
13	8	15	2022-12-25	2022-12-30
14	9	2	2023-01-05	2023-01-10
16	11	6	2023-03-20	2023-03-25
17	12	8	2023-04-18	\N
19	14	12	2023-07-12	\N
20	15	14	2023-08-28	\N
3	3	3	2023-05-30	\N
15	10	4	\N	\N
18	13	10	\N	\N
12	7	13	2022-11-12	\N
10	20	9	2022-09-22	\N
7	17	2	\N	\N
21	16	1	2022-05-03	2022-05-07
22	16	15	2022-06-19	2022-06-25
4	4	4	2022-04-01	2022-04-05
23	11	15	\N	\N
\.


--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client (client_id, first_name, last_name, phone_number, email_address, passport) FROM stdin;
1	Иван	Иванов	123-456-7890	ivanov@example.com	AB1234567
2	Марина	Петрова	987-654-3210	petrova@example.com	CD9876543
3	Алексей	Смирнов	555-123-4567	smirnov@example.com	EF3456789
4	Елена	Сидорова	111-222-3333	sidorova@example.com	GH4567890
5	Сергей	Козлов	444-555-6666	kozlov@example.com	IJ5678901
6	Иван	Иванов	+79001234567	ivanov@mail.ru	1234 567890
7	Мария	Петрова	+79005556677	petrova@gmail.com	2345 678901
8	Алексей	Смирнов	+79008889900	smirnov@yandex.ru	3456 789012
9	Ольга	Козлова	+79001112233	kozlova@mail.ru	4567 890123
10	Павел	Васильев	+79004445566	vasiliev@gmail.com	5678 901234
11	Елена	Никитина	+79007778899	nikitina@inbox.ru	6789 012345
12	Сергей	Александров	+79002223344	alexandrov@mail.ru	7890 123456
13	Анна	Королева	+79005556677	koroleva@gmail.com	8901 234567
14	Дмитрий	Кузнецов	+79008889900	kuznetsov@yandex.ru	9012 345678
15	Наталья	Соколова	+79001112233	sokolova@mail.ru	0123 456789
16	Игорь	Попов	+79004445566	popov@gmail.com	1234 567891
17	Людмила	Лебедева	+79007778899	lebedeva@inbox.ru	2345 678912
18	Артем	Семенов	+79002223344	semenov@mail.ru	3456 789123
19	Татьяна	Павлова	+79005556677	pavlova@gmail.com	4567 890134
20	Станислав	Сергеев	+79008889900	sergeev@yandex.ru	5678 901245
\.


--
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee (employee_id, first_name, last_name, position_id, salary, phone_number, passport) FROM stdin;
1	Иван	Сидоров	1	40000.00	+79001112233	1234 567891
2	Марина	Козлова	6	45000.00	+79004445566	2345 678912
3	Алексей	Петров	6	45000.00	+79004445566	2345 678912
4	Елена	Сидорова	3	50000.00	+79007778899	3456 789123
5	Ольга	Козлова	6	42000.00	+79002223344	4567 890134
6	Иван	Смирнов	3	47000.00	+79005556677	5678 901245
7	Марина	Васильева	4	51000.00	+79008889900	6789 012356
8	Александр	Никитин	5	43000.00	+79001112233	7890 123467
9	Евгений	Соколов	4	46000.00	+79004445566	8901 234578
10	Татьяна	Попова	4	52000.00	+79007778899	9012 345689
11	Павел	Лебедев	2	44000.00	+79002223344	0123 456790
\.


--
-- Data for Name: position; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."position" (position_id, position_name, description) FROM stdin;
1	Бармен	Обслуживает гостей в баре
2	Директор	Отвечает за стратегическое развитие отеля
3	Менеджер	Занимается управлением отеля
4	Повар	Готовит блюда для ресторана отеля
5	Рецепционист	Ответственный за помощь гостям у стойки регистрации
6	Уборщик	\N
\.


--
-- Data for Name: room; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.room (room_id, room_number, room_type_id, price_per_night, availability) FROM stdin;
16	203	1	2600.00	t
17	204	1	2900.00	t
18	205	2	2200.00	t
19	206	1	2700.00	t
20	207	1	3300.00	t
2	102	2	1500.00	f
3	103	1	3200.00	f
4	201	1	3100.00	f
8	106	2	1800.00	f
9	107	1	3000.00	f
10	108	1	2300.00	f
12	110	1	3200.00	f
13	111	1	2400.00	f
14	112	2	2100.00	f
15	113	1	3100.00	f
1	101	1	4000.00	t
5	202	2	1600.00	t
6	104	2	2000.00	t
7	105	1	2500.00	t
11	109	2	1900.00	t
\.


--
-- Data for Name: room_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.room_type (room_type_id, type_name, type_description) FROM stdin;
1	Люкс	Люксовый номер с премиальными возможностями
2	Стандарт	Стандартный номер с базовыми удобствами
\.


--
-- Data for Name: service_order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_order (order_id, client_id, service_id, employee_id, order_date) FROM stdin;
1	1	1	\N	2022-05-02
2	2	1	\N	2022-06-11
3	3	1	\N	2022-07-22
4	4	1	\N	2022-08-18
5	5	1	\N	2022-09-23
6	6	1	\N	2022-10-03
7	7	1	\N	2022-11-13
8	8	1	\N	2022-12-27
9	9	1	\N	2023-01-06
10	10	1	\N	2023-02-17
11	11	1	\N	2023-03-22
12	12	1	\N	2023-04-20
13	13	1	\N	2023-05-31
14	14	1	\N	2023-07-14
15	15	1	\N	2023-07-14
16	16	1	\N	2023-07-14
17	17	1	\N	2023-07-14
18	18	1	\N	2023-08-30
19	19	1	\N	2023-08-30
20	20	1	\N	2023-08-30
21	1	2	7	2022-05-02
22	2	2	10	2022-06-11
23	3	2	9	2022-07-22
24	4	2	7	2022-08-18
25	5	2	10	2022-09-23
26	6	2	9	2022-10-03
27	7	2	7	2022-11-13
28	8	2	9	2022-12-27
29	9	2	9	2023-01-06
30	10	2	7	2023-02-17
31	11	2	10	2023-03-22
32	12	2	7	2023-04-20
33	13	2	7	2023-05-31
34	14	2	9	2023-07-14
35	15	2	10	2023-07-14
36	16	2	7	2023-07-14
37	17	2	10	2023-07-14
38	18	2	7	2023-08-30
39	19	2	7	2023-08-30
40	20	2	9	2023-08-30
41	1	3	2	2022-05-02
42	2	3	3	2022-06-11
43	3	3	5	2022-07-22
44	4	3	5	2022-08-18
45	5	3	3	2022-09-23
46	6	3	2	2022-10-03
47	7	3	5	2022-11-13
48	8	3	3	2022-12-27
49	9	3	3	2023-01-06
50	10	3	2	2023-02-17
51	11	3	5	2023-03-22
52	12	3	5	2023-04-20
53	13	3	2	2023-05-31
54	14	3	3	2023-07-14
55	15	3	3	2023-07-14
56	16	3	2	2023-07-14
57	17	3	5	2023-07-14
58	18	3	5	2023-08-30
59	19	3	3	2023-08-30
60	20	3	2	2023-08-30
61	1	4	\N	2022-05-02
62	2	4	\N	2022-06-11
63	3	4	\N	2022-07-22
64	4	4	\N	2022-08-18
65	5	4	\N	2022-09-23
66	6	4	\N	2022-10-03
67	7	4	\N	2022-11-13
68	8	4	\N	2022-12-27
69	9	4	\N	2023-01-06
70	10	4	\N	2023-02-17
71	11	4	\N	2023-03-22
72	12	4	\N	2023-04-20
73	13	4	\N	2023-05-31
74	14	4	\N	2023-07-14
75	15	4	\N	2023-07-14
76	16	4	\N	2023-07-14
77	17	4	\N	2023-07-14
78	18	4	\N	2023-08-30
79	19	4	\N	2023-08-30
80	20	4	\N	2023-08-30
81	1	5	7	2022-05-02
82	2	5	10	2022-06-11
83	3	5	9	2022-07-22
84	4	5	9	2022-08-18
85	5	5	10	2022-09-23
86	6	5	7	2022-10-03
87	7	5	9	2022-11-13
88	8	5	10	2022-12-27
89	9	5	7	2023-01-06
90	10	5	7	2023-02-17
91	11	5	7	2023-03-22
92	12	5	10	2023-04-20
93	13	5	9	2023-05-31
94	14	5	7	2023-07-14
95	15	5	7	2023-07-14
96	16	5	7	2023-07-14
97	17	5	10	2023-07-14
98	18	5	7	2023-08-30
99	19	5	7	2023-08-30
100	20	5	9	2023-08-30
101	20	3	3	2023-08-30
102	20	3	2	2023-08-30
103	1	1	\N	2023-08-30
104	1	5	9	2023-08-30
105	2	3	5	2023-08-30
\.


--
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.services (service_id, name, price) FROM stdin;
1	Wi-Fi	500.00
2	Завтрак	1000.00
5	Ужин	2000.00
3	Уборка	750.00
4	Услуги прачечной	1500.00
\.


--
-- Name: check_in_check_in_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.check_in_check_in_id_seq', 23, true);


--
-- Name: client_client_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.client_client_id_seq', 20, true);


--
-- Name: employee_employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employee_employee_id_seq', 11, true);


--
-- Name: position_position_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.position_position_id_seq', 5, true);


--
-- Name: room_room_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.room_room_id_seq', 20, true);


--
-- Name: room_type_room_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.room_type_room_type_id_seq', 2, true);


--
-- Name: service_order_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.service_order_order_id_seq', 105, true);


--
-- Name: services_service_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.services_service_id_seq', 5, true);


--
-- Name: check_in check_in_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.check_in
    ADD CONSTRAINT check_in_pkey PRIMARY KEY (check_in_id);


--
-- Name: client client_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (client_id);


--
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (employee_id);


--
-- Name: position position_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."position"
    ADD CONSTRAINT position_pkey PRIMARY KEY (position_id);


--
-- Name: room room_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.room
    ADD CONSTRAINT room_pkey PRIMARY KEY (room_id);


--
-- Name: room_type room_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.room_type
    ADD CONSTRAINT room_type_pkey PRIMARY KEY (room_type_id);


--
-- Name: service_order service_order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_order
    ADD CONSTRAINT service_order_pkey PRIMARY KEY (order_id);


--
-- Name: services services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pkey PRIMARY KEY (service_id);


--
-- Name: check_in check_in_client_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.check_in
    ADD CONSTRAINT check_in_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.client(client_id);


--
-- Name: check_in check_in_room_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.check_in
    ADD CONSTRAINT check_in_room_id_fkey FOREIGN KEY (room_id) REFERENCES public.room(room_id);


--
-- Name: employee employee_position_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_position_id_fkey FOREIGN KEY (position_id) REFERENCES public."position"(position_id);


--
-- Name: room room_room_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.room
    ADD CONSTRAINT room_room_type_id_fkey FOREIGN KEY (room_type_id) REFERENCES public.room_type(room_type_id);


--
-- Name: service_order service_order_client_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_order
    ADD CONSTRAINT service_order_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.client(client_id);


--
-- Name: service_order service_order_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_order
    ADD CONSTRAINT service_order_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.employee(employee_id);


--
-- Name: service_order service_order_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_order
    ADD CONSTRAINT service_order_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.services(service_id);


--
-- PostgreSQL database dump complete
--

