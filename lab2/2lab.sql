--
-- PostgreSQL database dump
--

\restrict ldtvy3nxQa5eSeFMa3ouOTzGOvmh4iADFkFNoMPkWFWowcXRjDS05BSzXa6zYY0

-- Dumped from database version 18.6
-- Dumped by pg_dump version 18.6

-- Started on 2026-09-21 02:03:22

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 221 (class 1259 OID 16528)
-- Name: ВыполненнаяРабота; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ВыполненнаяРабота" (
    "id ВыполненнойРаботы" bigint CONSTRAINT "ВыполненнаяРа_id Выполненной_not_null" NOT NULL,
    "№ТК" bigint NOT NULL,
    "id ТипаРаботы" bigint CONSTRAINT "ВыполненнаяРабо_id ТипаРаботы_not_null" NOT NULL,
    "ДатаВыполнения" date CONSTRAINT "ВыполненнаяРа_ДатаВыполнени_not_null" NOT NULL,
    "Кол-воЧасов" numeric(8,2) CONSTRAINT "ВыполненнаяРабот_Кол-воЧасов_not_null" NOT NULL
);


ALTER TABLE public."ВыполненнаяРабота" OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16561)
-- Name: Должность; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Должность" (
    "id Должности" bigint NOT NULL,
    "НазваниеДолжности" text NOT NULL,
    "Описание" text NOT NULL
);


ALTER TABLE public."Должность" OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16573)
-- Name: НалоговыеСтавки; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."НалоговыеСтавки" (
    "id Ставки" bigint NOT NULL,
    "id Льготы" bigint NOT NULL,
    "НижняяГраница" integer CONSTRAINT "НалоговыеСтав_НижняяГраница_not_null" NOT NULL,
    "ВерхняяГраница" integer CONSTRAINT "НалоговыеСтав_ВерхняяГраниц_not_null" NOT NULL,
    "СтавкаНалога" numeric(8,2) CONSTRAINT "НалоговыеСтавк_СтавкаНалога_not_null" NOT NULL
);


ALTER TABLE public."НалоговыеСтавки" OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16550)
-- Name: НачислениеЗП; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."НачислениеЗП" (
    "id Операции" bigint NOT NULL,
    "№ТК" bigint NOT NULL,
    "id ВыполненнойРаботы" bigint CONSTRAINT "НачислениеЗП_id ВыполненнойРа_not_null" NOT NULL,
    "id Ставки" bigint NOT NULL,
    "ДатаНачисления" date NOT NULL,
    "СуммаНачисления" numeric(8,2) CONSTRAINT "НачислениеЗП_СуммаНачислени_not_null" NOT NULL
);


ALTER TABLE public."НачислениеЗП" OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16538)
-- Name: ОсвобождениеОтНалога; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ОсвобождениеОтНалога" (
    "id Льготы" bigint CONSTRAINT "ОсвобождениеОтНалог_id Льготы_not_null" NOT NULL,
    "НазваниеЛьготы" text CONSTRAINT "ОсвобождениеО_НазваниеЛьгот_not_null" NOT NULL,
    "ОписаниеЛьготы" text CONSTRAINT "ОсвобождениеО_ОписаниеЛьгот_not_null" NOT NULL
);


ALTER TABLE public."ОсвобождениеОтНалога" OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16501)
-- Name: Сотрудник; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Сотрудник" (
    "№ТК" bigint NOT NULL,
    "Фамилия" text NOT NULL,
    "Дата Устройства" date NOT NULL,
    "Дата Рождения" date NOT NULL,
    "Адрес" text NOT NULL,
    "Телефон" text NOT NULL,
    "id Должности" bigint NOT NULL
);


ALTER TABLE public."Сотрудник" OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16517)
-- Name: ТипыРабот; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ТипыРабот" (
    "id ТипаРаботы" bigint NOT NULL,
    "ТипРаботы" text NOT NULL,
    "ОписаниеТипа" text NOT NULL,
    "ЦенаЧаса" numeric(8,2) NOT NULL
);


ALTER TABLE public."ТипыРабот" OWNER TO postgres;

--
-- TOC entry 4954 (class 0 OID 16528)
-- Dependencies: 221
-- Data for Name: ВыполненнаяРабота; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ВыполненнаяРабота" ("id ВыполненнойРаботы", "№ТК", "id ТипаРаботы", "ДатаВыполнения", "Кол-воЧасов") FROM stdin;
\.


--
-- TOC entry 4957 (class 0 OID 16561)
-- Dependencies: 224
-- Data for Name: Должность; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Должность" ("id Должности", "НазваниеДолжности", "Описание") FROM stdin;
\.


--
-- TOC entry 4958 (class 0 OID 16573)
-- Dependencies: 225
-- Data for Name: НалоговыеСтавки; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."НалоговыеСтавки" ("id Ставки", "id Льготы", "НижняяГраница", "ВерхняяГраница", "СтавкаНалога") FROM stdin;
\.


--
-- TOC entry 4956 (class 0 OID 16550)
-- Dependencies: 223
-- Data for Name: НачислениеЗП; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."НачислениеЗП" ("id Операции", "№ТК", "id ВыполненнойРаботы", "id Ставки", "ДатаНачисления", "СуммаНачисления") FROM stdin;
\.


--
-- TOC entry 4955 (class 0 OID 16538)
-- Dependencies: 222
-- Data for Name: ОсвобождениеОтНалога; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ОсвобождениеОтНалога" ("id Льготы", "НазваниеЛьготы", "ОписаниеЛьготы") FROM stdin;
\.


--
-- TOC entry 4952 (class 0 OID 16501)
-- Dependencies: 219
-- Data for Name: Сотрудник; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Сотрудник" ("№ТК", "Фамилия", "Дата Устройства", "Дата Рождения", "Адрес", "Телефон", "id Должности") FROM stdin;
\.


--
-- TOC entry 4953 (class 0 OID 16517)
-- Dependencies: 220
-- Data for Name: ТипыРабот; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ТипыРабот" ("id ТипаРаботы", "ТипРаботы", "ОписаниеТипа", "ЦенаЧаса") FROM stdin;
\.


--
-- TOC entry 4785 (class 2606 OID 16537)
-- Name: ВыполненнаяРабота ВыполненнаяРабота_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ВыполненнаяРабота"
    ADD CONSTRAINT "ВыполненнаяРабота_pkey" PRIMARY KEY ("id ВыполненнойРаботы");


--
-- TOC entry 4793 (class 2606 OID 16570)
-- Name: Должность Должность_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Должность"
    ADD CONSTRAINT "Должность_pkey" PRIMARY KEY ("id Должности");


--
-- TOC entry 4795 (class 2606 OID 16572)
-- Name: Должность Должность_НазваниеДолжности_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Должность"
    ADD CONSTRAINT "Должность_НазваниеДолжности_unique" UNIQUE ("НазваниеДолжности");


--
-- TOC entry 4797 (class 2606 OID 16582)
-- Name: НалоговыеСтавки НалоговыеСтавки_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."НалоговыеСтавки"
    ADD CONSTRAINT "НалоговыеСтавки_pkey" PRIMARY KEY ("id Ставки");


--
-- TOC entry 4791 (class 2606 OID 16560)
-- Name: НачислениеЗП НачислениеЗП_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."НачислениеЗП"
    ADD CONSTRAINT "НачислениеЗП_pkey" PRIMARY KEY ("id Операции");


--
-- TOC entry 4787 (class 2606 OID 16547)
-- Name: ОсвобождениеОтНалога ОсвобождениеОтНалога_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ОсвобождениеОтНалога"
    ADD CONSTRAINT "ОсвобождениеОтНалога_pkey" PRIMARY KEY ("id Льготы");


--
-- TOC entry 4789 (class 2606 OID 16549)
-- Name: ОсвобождениеОтНалога ОсвобождениеОтНалога_НазваниеЛьг; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ОсвобождениеОтНалога"
    ADD CONSTRAINT "ОсвобождениеОтНалога_НазваниеЛьг" UNIQUE ("НазваниеЛьготы");


--
-- TOC entry 4779 (class 2606 OID 16514)
-- Name: Сотрудник Сотрудник_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Сотрудник"
    ADD CONSTRAINT "Сотрудник_pkey" PRIMARY KEY ("№ТК");


--
-- TOC entry 4781 (class 2606 OID 16516)
-- Name: Сотрудник Сотрудник_Телефон_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Сотрудник"
    ADD CONSTRAINT "Сотрудник_Телефон_unique" UNIQUE ("Телефон");


--
-- TOC entry 4783 (class 2606 OID 16527)
-- Name: ТипыРабот ТипыРабот_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ТипыРабот"
    ADD CONSTRAINT "ТипыРабот_pkey" PRIMARY KEY ("id ТипаРаботы");


--
-- TOC entry 4799 (class 2606 OID 16588)
-- Name: ВыполненнаяРабота ВыполненнаяРабота_id ТипаРаботы_fore; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ВыполненнаяРабота"
    ADD CONSTRAINT "ВыполненнаяРабота_id ТипаРаботы_fore" FOREIGN KEY ("id ТипаРаботы") REFERENCES public."ТипыРабот"("id ТипаРаботы");


--
-- TOC entry 4800 (class 2606 OID 16603)
-- Name: ВыполненнаяРабота ВыполненнаяРабота_№ТК_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ВыполненнаяРабота"
    ADD CONSTRAINT "ВыполненнаяРабота_№ТК_foreign" FOREIGN KEY ("№ТК") REFERENCES public."Сотрудник"("№ТК");


--
-- TOC entry 4804 (class 2606 OID 16583)
-- Name: НалоговыеСтавки НалоговыеСтавки_id Льготы_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."НалоговыеСтавки"
    ADD CONSTRAINT "НалоговыеСтавки_id Льготы_foreign" FOREIGN KEY ("id Льготы") REFERENCES public."ОсвобождениеОтНалога"("id Льготы");


--
-- TOC entry 4801 (class 2606 OID 16608)
-- Name: НачислениеЗП НачислениеЗП_id ВыполненнойРаботы_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."НачислениеЗП"
    ADD CONSTRAINT "НачислениеЗП_id ВыполненнойРаботы_" FOREIGN KEY ("id ВыполненнойРаботы") REFERENCES public."ВыполненнаяРабота"("id ВыполненнойРаботы");


--
-- TOC entry 4802 (class 2606 OID 16598)
-- Name: НачислениеЗП НачислениеЗП_id Ставки_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."НачислениеЗП"
    ADD CONSTRAINT "НачислениеЗП_id Ставки_foreign" FOREIGN KEY ("id Ставки") REFERENCES public."НалоговыеСтавки"("id Ставки");


--
-- TOC entry 4803 (class 2606 OID 16593)
-- Name: НачислениеЗП НачислениеЗП_№ТК_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."НачислениеЗП"
    ADD CONSTRAINT "НачислениеЗП_№ТК_foreign" FOREIGN KEY ("№ТК") REFERENCES public."Сотрудник"("№ТК");


--
-- TOC entry 4798 (class 2606 OID 16613)
-- Name: Сотрудник Сотрудник_id Должности_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Сотрудник"
    ADD CONSTRAINT "Сотрудник_id Должности_foreign" FOREIGN KEY ("id Должности") REFERENCES public."Должность"("id Должности");


-- Completed on 2026-09-21 02:03:23

--
-- PostgreSQL database dump complete
--

\unrestrict ldtvy3nxQa5eSeFMa3ouOTzGOvmh4iADFkFNoMPkWFWowcXRjDS05BSzXa6zYY0

