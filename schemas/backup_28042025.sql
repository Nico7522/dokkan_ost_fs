--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0
-- Dumped by pg_dump version 17.0

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
-- Name: active_skills; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.active_skills (
    id integer NOT NULL,
    card_id integer,
    name character varying,
    bgm_id integer,
    filename character varying
);


ALTER TABLE public.active_skills OWNER TO postgres;

--
-- Name: background_music; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.background_music (
    id integer NOT NULL,
    description character varying,
    extended_version_url character varying
);


ALTER TABLE public.background_music OWNER TO postgres;

--
-- Name: cards; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cards (
    id integer NOT NULL,
    name character varying,
    type character varying,
    class character varying,
    thumb integer,
    is_legendary boolean
);


ALTER TABLE public.cards OWNER TO postgres;

--
-- Name: cards_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cards_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cards_id_seq OWNER TO postgres;

--
-- Name: cards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cards_id_seq OWNED BY public.cards.id;


--
-- Name: entrances; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.entrances (
    id integer NOT NULL,
    card_id integer,
    name character varying,
    bgm_id integer,
    filename character varying
);


ALTER TABLE public.entrances OWNER TO postgres;

--
-- Name: finish_skills; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.finish_skills (
    id integer NOT NULL,
    name character varying,
    bgm_id integer,
    standby_skill_id integer,
    card_id integer,
    filename character varying
);


ALTER TABLE public.finish_skills OWNER TO postgres;

--
-- Name: standby_skills; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.standby_skills (
    id integer NOT NULL,
    description character varying,
    card_id integer,
    bgm_id integer,
    filename character varying
);


ALTER TABLE public.standby_skills OWNER TO postgres;

--
-- Name: cards id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cards ALTER COLUMN id SET DEFAULT nextval('public.cards_id_seq'::regclass);


--
-- Data for Name: active_skills; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.active_skills (id, card_id, name, bgm_id, filename) FROM stdin;
294	9522381	Transformation	173	sp_effect_b4_00209
115	1023091	Ever-Improving Pair	155	sp_effect_b4_00203
53	4019641	Transformation	81	battle_301101
22	4017131	Monstrous God	85	battle_301000
20	4017091	Miraculous Power	86	battle_301010
28	1017631	Awakening	91	battle_301070
36	1018031	Exchange	92	battle_301072
45	1018881	Rage	105	battle_301087
47	1019141	Transformation	106	battle_301088
66	1020091	Hidden Potential Activation	116	battle_301204
74	1020501	Transformation	119	battle_301208
60	1020461	Special Fusion	117	battle_301205
78	1021051	Transformation	126	battle_301210
75	1020991	Plus Energy Emission	121	sp_effect_b4_00167
81	1021291	Transformation	129	battle_301211
90	1021971	Two Heroes	137	sp_effect_b4_00186
93	1021941	Unrelenting Final Shine Attack	141	sp_effect_a1_00290
91	1021881	Shadow Dragons' Awakening	143	sp_effect_b4_00185
95	1022121	Serious Duel!	144	sp_effect_b4_00189
96	1022221	Shield of Light	145	sp_effect_b4_00188
98	1022191	Fusion	147	battle_301214
100	1022591	Rage	148	battle_301215
102	1022651	"I am Super Vegeta!"	149	battle_301218
114	1022831	Special Fusion	154	sp_effect_b4_00201
118	1023111	Transformation	157	battle_301221
127	1023461	Transformation	165	battle_301222
136	1023771	Body Change	185	sp_effect_b4_00221
138	1023981	Final Explosion	187	sp_effect_a7_00052
142	1024141	Special Beam Cannon	189	sp_effect_a3_00090
145	1024291	Exchange	190	sp_effect_b4_00228
147	4024401	Rage	191	battle_301230
151	1024551	Father-Son Galick Gun	198	sp_effect_a1_00364
152	1024731	Farewell, Tien	199	sp_effect_b4_00240
156	1024991	Ace-in-the-Hole Kamehameha	202	sp_effect_a1_00366
157	1024831	Supernova	204	sp_effect_a2_00182
163	4024901	Power to Make the Impossible Possible	208	sp_effect_a2_00187
160	1024931	Life Force Absorption	209	sp_effect_b4_00253
164	1025071	Angry Kamehameha	214	sp_effect_a1_00372
166	1025411	Transformation	219	sp_effect_b4_00259
168	1025631	Maximum Power Kamehameha	220	sp_effect_a1_00384
169	1025801	Extra Large Spirit Ball	222	sp_effect_b4_00266
173	1025871	Full Power United Attack	225	sp_effect_a1_00387
174	1025561	Special Beam Cannon	227	sp_effect_a3_00099
178	1026161	Spirit Bomb	240	sp_effect_a2_00204
186	1026201	Special Fusion	257	sp_effect_a9_00103
182	1026281	Transformation	260	battle_301251
188	1026481	Transformation	262	sp_effect_b4_00281
189	1026431	Revenge Death Bomber	264	sp_effect_b4_00279
190	1026561	Super Explosive Wave	269	sp_effect_a7_00064
195	1026751	Live Like a Saiyan!	273	sp_effect_b4_00292
196	1026821	Super Spirit Bomb	276	sp_effect_a2_00216
197	1027041	Minus Energy Power Ball	281	sp_effect_a5_00018
203	1027221	Omnipresence	289	sp_effect_b4_00298
198	1027251	I'm Taking This Fight Somewhere Else	291	sp_effect_a2_00225
206	1027331	Another Hope	296	sp_effect_a1_00409
209	1027461	Giant Form	313	battle_301267
216	1028061	Spirit Bomb Super Saiyan	323	sp_effect_b1_00271
218	1028161	Transformation	328	battle_301278
215	1027471	Hell's Buster	330	sp_effect_a9_00118
222	4027991	How Long Do You Think You Can Keep Up with Me?	332	sp_effect_b1_00274
224	1028021	Transformation	334	battle_301279
229	1028321	Gohan's Confidence	336	battle_301283
213	1027651	Transformation	318	battle_301269
214	4027661	Absolute Release Ball	319	sp_effect_a2_00231
211	1027601	Power of Unity	321	battle_301270
149	1024441	Exchange	194	sp_effect_b4_00236
201	4027131	God Impact	287	sp_effect_b1_00261
76	1021141	Promise Made to Dad	127	sp_effect_b4_00174
18	4016881	Kakarot	87	sp_effect_b4_00097
108	1022751	I'm the One Who'll Kill You!	151	sp_effect_a1_00308
121	1023421	Exchange	164	sp_effect_a9_00089
170	1026031	Yajirobe's Senzu Bean	223	sp_effect_b4_00269
176	1025591	Giant Form	229	battle_301240
194	1026731	Planet Geyser	275	sp_effect_b1_00253
200	1027121	Special Fusion	286	sp_effect_b4_00299
110	4022951	Release Your Power!!!	153	battle_301219
25	9517161	HAIL Frieza	61	sp_effect_a2_00114
14	9514211	10x Kamehameha	58	sp_effect_a1_00144
193	9517491	Fusion with Kami	73	battle_300352
15	9514221	Final Shine Attack	76	sp_effect_a1_00143
184	9517191	Rage	79	battle_301021
257	9518191	Transformation	93	battle_301080
244	9520371	Absorption	89	battle_301206
89	9521811	Complicated Female Psyche	136	sp_effect_b4_00183
116	9022771	Kaioken	156	sp_effect_b1_00165
129	9522391	Fusion	174	sp_effect_a2_00173
130	9522431	Ultra Big Bang Kamehameha	177	sp_effect_a1_00329
298	9523521	Giant Ape Transformation	184	sp_effect_b4_00213
40	9517981	Final Kamehameha	255	sp_effect_a1_00213
41	9517971	Ultimate Kamehameha	256	sp_effect_a1_00208
132	9523621	Hope-Imbued Spirit Bomb	182	sp_effect_a2_00174
266	1029831	Final Spirit Cannon	399	sp_effect_a1_00460
296	9522421	Fusion	176	sp_effect_b4_00212
72	1020751	Fruit of the Tree of Might	120	battle_301207
39	1018541	Spirit Bomb	98	sp_effect_a2_00124
58	1019911	Strength Is Everything	115	battle_301203
70	1020221	Vegeta & Kakarot	118	sp_effect_b4_00155
79	1021331	Master of the Otherworld	128	sp_effect_b4_00175
94	1022091	Electro Eclipse Bomb	142	sp_effect_a2_00160
101	1022341	Last-Ditch Attempt	146	sp_effect_b4_00195
107	1022631	Angry Kamehameha	150	sp_effect_a1_00307
128	1023491	Evil War Cry	166	battle_301223
139	1024061	Raditz's Retribution	188	sp_effect_a2_00176
150	1024511	Earth Breaker	196	sp_effect_b4_00239
153	1024661	Lightning of Absolution	201	sp_effect_a4_00022
158	1024861	Super Saiyan Rage!!!	205	sp_effect_b1_00208
167	1025091	Final Spirit Cannon	218	sp_effect_a2_00192
172	1025651	Giant Form	224	sp_effect_b4_00264
177	1026131	Incident Under the Full Moon	238	sp_effect_a3_00101
180	1026251	Saiyan Who Absorbed the Power of God	259	sp_effect_b1_00244
191	1026611	Come Forth, Shenron!	271	sp_effect_b4_00285
205	4027011	The Man Who Lived Through Hell	284	sp_effect_a2_00223
207	1027431	Advantage of the Infinite Energy Model	308	battle_301266
300	1031081	Goku Goes Fishing	440	battle_301323
221	1027981	Transformation	331	battle_301280
228	1028281	Time Rift of Wrath	340	battle_301277
227	1028551	God of Destruction Waking Up	341	battle_301281
230	1028571	Greatest Show in the Universe	343	sp_effect_a1_00428
233	1028491	Transformation	344	sp_effect_b4_00316
232	4028501	Big Bang Attack	345	sp_effect_a2_00236
235	1028681	Transformation	347	sp_effect_b4_00318
236	4028691	Sphere of Destruction	348	sp_effect_a2_00238
237	1028721	Special Fighting Pose	350	battle_301285
239	1028791	Full Power Kamehameha	355	sp_effect_a1_00435
240	1028811	Candy Beam	357	sp_effect_a9_00129
17	1016811	Family Kamehameha	88	sp_effect_a1_00161
241	1028891	Burst Rush	360	sp_effect_b4_00326
238	1028921	Seductive Attack	362	sp_effect_b4_00325
242	1028961	Explosive Scream	365	sp_effect_a2_00240
246	1029051	Awakening	367	battle_301294
247	1029141	Turtle School's Teachings	372	sp_effect_b4_00335
250	1029401	Transformation	377	sp_effect_a9_00133
251	4029411	Saiyan Killer Instinct	378	battle_301298
253	1029441	Earth-Crushing Arm	379	sp_effect_b1_00293
258	1029571	Dirty Fireworks	390	sp_effect_a9_00134
255	1029701	Exchange	391	battle_301303
259	1029271	Ultra Genome Ray	393	sp_effect_a1_00458
260	1029731	Darkness Blaster	401	sp_effect_b4_00356
263	1029951	Unyielding Fused Kamehameha	404	sp_effect_b4_00360
280	1029981	Body Absorption	405	sp_effect_b4_00357
284	1030641	Lightning Buster	413	sp_effect_a4_00027
268	1030021	Super Ghost Kamikaze Attack	406	sp_effect_a8_00046
267	1029551	Majestic Halation	409	sp_effect_a5_00020
283	1030661	Super Kamehameha	411	sp_effect_a1_00471
288	1030431	Special Fusion	415	battle_301316
285	4030441	Pure Saiyans' Pride	416	battle_301308
289	4030451	Spirit Sword	417	sp_effect_a3_00115
292	1030341	Giant Ape Transformation	418	battle_301313
271	1030481	Fusion	422	battle_301311
272	4030491	An Unsuccessful Fusion?!	423	sp_effect_b1_00304
290	4030501	Soul Punisher	424	sp_effect_b4_00369
277	1030391	Father-Son Kamehameha	427	sp_effect_a1_00487
278	1030531	Miracle of Universe 7	429	sp_effect_b1_00314
279	4030541	Frieza's Handout	430	battle_301317
276	1030731	A Fantastic Fusion?!	435	sp_effect_a2_00256
299	1031061	Galick Gun	438	sp_effect_b4_00373
119	1023361	Hellish Game	163	sp_effect_b4_00207
55	4019601	Absorption	109	battle_301103
92	1021921	All-Out Kamehameha	140	sp_effect_a1_00291
143	1024351	Full Power Father-Son Kamehameha	192	sp_effect_a1_00352
210	1027711	Galactic Eternal Sword	317	sp_effect_b2_00061
13	1015911	Leave it to Pan!	70	sp_effect_a2_00100
16	1016571	Take This!	82	sp_effect_b4_00086
26	9517911	Solar Kamehameha	90	sp_effect_a1_00175
48	9519341	Wrath	110	sp_effect_b4_00135
56	9519761	Let's Wreck Some Faces	113	battle_301202
84	9521621	The Greatest Kamehameha	114	sp_effect_b4_00181
82	9520311	Strike of Fury	130	sp_effect_b1_00131
83	9520341	Final Explosion	131	sp_effect_a7_00042
85	9521431	Universe 7's Survival Strategy	132	battle_301212
86	9521481	Universe 7's Total Offensive	133	sp_effect_b4_00180
88	9521691	Mischievous Boys	134	battle_301213
87	9521671	Berserker's Destructive Impulse	135	sp_effect_b4_00184
265	1029851	Exchange	402	battle_301306
57	9519991	Body, Soul and Power Unleashed	114	sp_effect_b4_00152
303	1030971	Seriousness	444	sp_effect_a9_00142
\.


--
-- Data for Name: background_music; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.background_music (id, description, extended_version_url) FROM stdin;
77	test	\N
1		\N
2		\N
3		\N
4		\N
5		\N
6		\N
7		\N
8		\N
9		\N
10		\N
11		\N
12		\N
13		\N
14		\N
15		\N
16		\N
17		\N
18		\N
20		\N
21		\N
22		\N
23		\N
24		\N
25		\N
26		\N
27		\N
28		\N
29		\N
30		\N
31		\N
32		\N
33		\N
35		\N
36		\N
37		\N
38		\N
39		\N
40		\N
41		\N
42		\N
43		\N
44		\N
45		\N
46		\N
47		\N
48		\N
49		\N
50		\N
51		\N
52		\N
53		\N
54		\N
55		\N
56		\N
57		\N
58		\N
59		\N
60		\N
61		\N
62		\N
63		\N
64		\N
65		\N
66		\N
67		\N
68		\N
69		\N
70		\N
71		\N
72		\N
73		\N
74		\N
75		\N
76		\N
78		\N
79		\N
80		\N
81		\N
82		\N
83		\N
84		\N
85		\N
86		\N
87		\N
88		\N
89		\N
90		\N
91		\N
92		\N
93		\N
94		\N
95		\N
96		\N
97		\N
98		\N
99		\N
100		\N
101		\N
102		\N
103		\N
104		\N
105		\N
106		\N
107		\N
108		\N
109		\N
110		\N
111		\N
113		\N
114		\N
115		\N
116		\N
117		\N
118		\N
119		\N
120		\N
121		\N
122		\N
123		\N
124		\N
125		\N
126		\N
127		\N
128		\N
129		\N
130		\N
131		\N
132		\N
133		\N
134		\N
135		\N
136		\N
137		\N
138		\N
139		\N
140		\N
141		\N
142		\N
143		\N
144		\N
145		\N
146		\N
147		\N
148		\N
149		\N
150		\N
151		\N
152		\N
153		\N
154		\N
155		\N
156		\N
157		\N
158		\N
159		\N
160		\N
161		\N
162		\N
163		\N
164		\N
165		\N
166		\N
167		\N
168		\N
169		\N
170		\N
171		\N
172		\N
173		\N
174		\N
175		\N
176		\N
177		\N
178		\N
179		\N
180		\N
181		\N
182		\N
183		\N
184		\N
185		\N
186		\N
187		\N
188		\N
189		\N
190		\N
191		\N
192		\N
193		\N
194		\N
195		\N
196		\N
197		\N
198		\N
199		\N
200		\N
201		\N
202		\N
203		\N
204		\N
205		\N
206		\N
207		\N
208		\N
209		\N
210		\N
211		\N
212		\N
213		\N
214		\N
215		\N
216		\N
217		\N
218		\N
219		\N
220		\N
221		\N
222		\N
223		\N
224		\N
225		\N
226		\N
227		\N
228		\N
229		\N
230		\N
231		\N
232		\N
233		\N
234		\N
235		\N
236		\N
237		\N
238		\N
239		\N
240		\N
241		\N
242		\N
243		\N
245		\N
246		\N
247		\N
248		\N
249		\N
250		\N
251		\N
252		\N
253		\N
254		\N
255		\N
256		\N
257		\N
258		\N
259		\N
260		\N
261		\N
262		\N
263		\N
264		\N
265		\N
266		\N
267		\N
268		\N
269		\N
270		\N
271		\N
272		\N
273		\N
274		\N
275		\N
276		\N
277		\N
278		\N
279		\N
280		\N
281		\N
282		\N
283		\N
284		\N
285		\N
286		\N
287		\N
288		\N
289		\N
290		\N
291		\N
292		\N
293		\N
294		\N
295		\N
296		\N
297		\N
298		\N
299		\N
300		\N
301		\N
304		\N
305		\N
306		\N
307		\N
308		\N
309		\N
310		\N
311		\N
312		\N
313		\N
314		\N
315		\N
316		\N
317		\N
318		\N
319		\N
320		\N
321		\N
322		\N
323		\N
324		\N
325		\N
326		\N
327		\N
328		\N
329		\N
330		\N
331		\N
332		\N
333		\N
334		\N
335		\N
336		\N
337		\N
338		\N
339		\N
340		\N
341		\N
342		\N
343		\N
344		\N
345		\N
346		\N
347		\N
348		\N
349		\N
350		\N
351		\N
352		\N
353		\N
354		\N
355		\N
356		\N
357		\N
358		\N
359		\N
360		\N
361		\N
362		\N
363		\N
364		\N
365		\N
366		\N
367		\N
368		\N
369		\N
370		\N
371		\N
372		\N
373		\N
374		\N
375		\N
376		\N
377		\N
378		\N
379		\N
380		\N
381		\N
382		\N
384		\N
385		\N
386		\N
387		\N
388		\N
389		\N
390		\N
391		\N
392		\N
393		\N
395		\N
396		\N
397		\N
398		\N
400		\N
401		\N
402		\N
403		\N
404		\N
405		\N
406		\N
407		\N
408		\N
409		\N
410		\N
411		\N
412		\N
413		\N
414		\N
415		\N
416		\N
417		\N
418		\N
419		\N
420		\N
421		\N
422		\N
423		\N
424		\N
425		\N
426		\N
427		\N
428		\N
429		\N
435		\N
436		\N
438		\N
445		\N
446		\N
500		\N
244		\N
430	LR INT Frieza (Final Form) (Angel) Active Skill (Goku) OST	https://www.youtube.com/watch?v=oFk-UHeRROw
431	\N	\N
432	\N	\N
433	\N	\N
437	\N	\N
399	\N	\N
440	\N	\N
439	\N	\N
441	\N	\N
444		
\.


--
-- Data for Name: cards; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cards (id, name, type, class, thumb, is_legendary) FROM stdin;
1023091	Hit & Super Saiyan God Goku	STR	Extreme	1023090	t
4022951	Krillin & Gohan (Kid)	AGL	Super	4022950	t
1020751	Team Turles	STR	Extreme	1020750	t
1015911	Pan (GT) (Honey)	STR	Super	1015910	t
9514221	Super Saiyan 4 Vegeta	STR	Super	1014220	t
9517191	Super Saiyan Goku	STR	Super	4017190	f
4019641	Super Saiyan Gotenks	INT	Super	4019640	f
1016571	Goku (Youth)	INT	Super	1016570	f
4017131	Fusion Zamasu	AGL	Extreme	4017130	f
4017091	Super Saiyan Trunks (Future)	TEQ	Super	4017090	f
9520371	Majin Buu (Gotenks)	PHY	Extreme	1020370	t
9517911	Perfect Cell	INT	Extreme	4017910	t
1017631	Super Saiyan Gohan (Youth)	AGL	Super	1017630	t
1018031	Androids #17 & #18/Android #16	PHY	Extreme	1018030	t
9518191	Cooler	STR	Extreme	1018190	f
1018541	Super Saiyan God SS Goku (Kaioken)	STR	Super	1018540	f
1018881	Goku Black (Super Saiyan Rosé)	INT	Extreme	1018880	t
1019141	Bardock	AGL	Super	1019140	f
9519341	Beerus	PHY	Super	1019340	f
9519761	Super Saiyan 2 Kefla	STR	Super	4019760	f
9521621	Master Roshi	PHY	Super	1021620	t
1019911	Jiren (Full Power)	TEQ	Super	1019910	t
1020091	Gohan (Teen)	TEQ	Super	1020090	f
1020461	Goku & Vegeta (Angel)	STR	Super	1020460	t
1020221	Super Saiyan 2 Vegeta (Angel)	PHY	Super	1020220	t
1020501	Frieza (Final Form) (Angel)	PHY	Extreme	1020500	f
1020991	Super Saiyan 4 Gogeta	INT	Super	1020990	f
1021051	Boujack	STR	Extreme	1021050	f
1021331	Paikuhan	AGL	Super	1021330	f
1021291	Janemba	TEQ	Extreme	1021290	f
9520311	Goku (Ultra Instinct)	AGL	Super	1020310	t
9521431	Golden Frieza (Angel) & Android #17	PHY	Extreme	1021430	t
9521481	Android #17 (Team Universe 7)	INT	Super	1021480	t
9521691	Super Saiyan Trunks (Kid) & Super Saiyan Goten (Kid)	PHY	Super	1021690	f
9521671	Legendary Super Saiyan Broly	INT	Extreme	1021670	f
9521811	Videl	STR	Super	1021810	f
1021971	Tapion & Minotia	STR	Super	1021970	t
1021941	Super Saiyan Vegeta (GT)	INT	Super	1021940	f
1022091	Super #17	TEQ	Extreme	1022090	t
1021881	Legion of Shadow Dragons	INT	Extreme	1021880	t
1022121	Goku & Piccolo	INT	Super	1022120	t
1022221	Gohan (Kid)	AGL	Super	1022220	f
1022341	Mercenary Tao	STR	Extreme	1022340	t
1022191	Goku (Angel) & Vegeta (Angel)	TEQ	Super	1022190	t
1022591	Super Janemba	PHY	Extreme	1022590	t
1022651	Super Vegeta	STR	Super	1022650	f
1022631	Super Saiyan Goku	INT	Super	1022630	t
1022831	Caulifla & Kale	TEQ	Super	1022830	f
9022771	Goku	PHY	Super	1022770	f
1023111	Trunks (Teen)	AGL	Super	1023110	f
1023461	Super Saiyan 2 Goku	PHY	Super	1023460	f
1023491	Buu (Kid)	STR	Extreme	1023490	f
9522381	Super Saiyan God Goku & \nSuper Saiyan God Vegeta	TEQ	Super	1022380	t
9522391	Super Saiyan God SS Goku & \nSuper Saiyan God SS Vegeta	TEQ	Super	4022390	t
9522421	Super Saiyan 4 Goku & Super Saiyan 4 Vegeta	PHY	Super	1022420	t
9522431	Super Saiyan 4 Gogeta	PHY	Super	4022430	t
9523621	Goku (Kaioken)	STR	Super	1023620	t
9523521	Vegeta (Giant Ape)	TEQ	Extreme	1023520	t
1023771	Captain Ginyu	AGL	Extreme	1023770	f
1023981	Majin Vegeta	INT	Extreme	1023980	f
1024061	Raditz	PHY	Extreme	1024060	f
1024141	Goku & Piccolo/Piccolo	PHY	Super	1024140	t
1024291	Super Saiyan Goku/Super Saiyan Gohan (Youth)	STR	Super	1024290	f
4024401	Cell (Perfect Form)	AGL	Extreme	4024400	f
1024511	Golden Frieza	AGL	Extreme	1024510	t
1024551	Super Saiyan God SS Vegeta & \nSuper Saiyan Trunks (Future)	INT	Super	1024550	t
1024731	Tien	INT	Super	1024730	t
1024661	Fusion Zamasu	INT	Extreme	1024660	t
1024991	Pan (GT)	TEQ	Super	1024990	f
1024831	Cooler (Final Form)	STR	Extreme	1024830	t
1024861	Super Saiyan Goku	TEQ	Super	1024860	t
4024901	Super Saiyan Goku & Super Saiyan Vegeta	AGL	Super	4024900	t
1024931	Metal Cooler	PHY	Extreme	1024930	t
1025071	Goku (Youth)	PHY	Super	1025070	f
1025091	Bardock	TEQ	Super	1025090	f
1025411	Super Hearts	STR	Extreme	1025410	f
1025631	Jackie Chun	INT	Super	1025630	t
1025801	Yamcha	INT	Super	1025800	f
1025651	Hatchiyack (Giant Form)	TEQ	Extreme	1025650	t
1025871	Super Saiyan Goku	STR	Super	1025870	t
1025561	Ultimate Gohan	PHY	Super	1025560	t
1026131	Gohan (Kid)	INT	Super	1026130	t
1026161	Goku	AGL	Super	1026160	t
9517981	Super Saiyan God SS Vegito	TEQ	Super	4017980	t
9517971	Super Saiyan God SS Gogeta	STR	Super	4017970	t
1026201	Android #17 & Hell Fighter #17	STR	Extreme	1026200	f
1026251	Super Saiyan God Goku	PHY	Super	1026250	f
1026281	Super Saiyan Vegeta	TEQ	Super	1026280	f
1026481	Kale (Berserk)	AGL	Super	1026480	f
1026431	Buu (Super)	AGL	Extreme	1026430	t
1026561	Piccolo Jr. (Giant Form)	INT	Extreme	1026560	f
1026611	Bulma (Youth)	STR	Super	1026610	t
1026751	Turles	PHY	Extreme	1026750	f
1026821	Goku	INT	Super	1026820	t
1027041	Omega Shenron	AGL	Extreme	1027040	t
4027011	Super Trunks	TEQ	Super	4027010	f
1027221	Fusion Zamasu	TEQ	Extreme	1027220	t
1027251	Trunks (Teen) (Future)	INT	Super	1027250	f
1027331	Super Saiyan Gohan (Future)	STR	Super	1027330	t
1027431	Androids #17 & #18	INT	Super	1027430	f
1027461	Ribrianne & Kakunsa & Rozie	TEQ	Super	1027460	t
9517161	Frieza (2nd Form)	PHY	Extreme	1017160	f
1031081	Goku (Youth)	AGL	Super	1031080	f
1029831	Super Saiyan Bardock	AGL	Super	1029830	t
1029471	Super Saiyan Gohan (Teen)	STR	Super	1029470	t
1025771	Goku (GT) & Super Saiyan 4 Vegeta	STR	Super	1025770	t
1028061	Super Saiyan Goku & \nSuper Saiyan Vegeta & Super Saiyan Trunks (Teen)	INT	Super	1028060	t
1028161	Hirudegarn	INT	Extreme	1028160	f
9526391	Babidi	INT	Extreme	1026390	t
1027471	Cell (Perfect Form) (GT) & Frieza (Final Form) (GT)	PHY	Extreme	1027470	t
1027981	Super Saiyan Gogeta	PHY	Super	1027980	t
1030791	Demon King Piccolo (Elder)	AGL	Extreme	1030790	t
4027991	Super Saiyan God SS Gogeta	PHY	Super	4027990	t
1028021	Super Saiyan Broly	AGL	Extreme	1028020	t
1028321	Gohan (Beast)	STR	Super	1028320	t
1026531	Goku	TEQ	Super	1026530	f
9523891	Gohan (Teen) & Goten (Kid) & Trunks (Kid)	TEQ	Super	1023890	t
1026901	Super Saiyan 4 Goku	INT	Super	1026900	t
1028281	Goku Black (Super Saiyan Rosé)	PHY	Extreme	1028280	f
1027621	Super Saiyan 3 Goku	STR	Super	1027620	f
1028551	Beerus (Pajamas)	PHY	Super	1028550	t
1028571	Frieza (1st Form)	AGL	Extreme	1028570	f
1028491	Vegeta	TEQ	Extreme	1028490	f
4028501	Super Saiyan Vegeta	TEQ	Extreme	4028500	f
1028681	Toppo	PHY	Super	1028680	f
1028371	Gamma 1 & Gamma 2/Gamma 1	INT	Super	1028370	t
4028691	Toppo (God of Destruction Mode)	PHY	Super	4028690	f
1025531	Gamma 2	AGL	Super	1025530	f
1028721	Captain Ginyu (Ginyu Force)	INT	Extreme	1028720	t
1029091	Jiren	AGL	Super	1029090	t
1028791	Super Saiyan 3 Goku (Angel)	AGL	Super	1028790	f
1025511	Gamma 1	STR	Super	1025510	f
1028811	Majin Buu (Good)	INT	Extreme	1028810	f
1016811	Super Saiyan Gohan (Teen) & \nSuper Saiyan Goten (Kid)	TEQ	Super	1016810	t
1025731	Super Saiyan 3 Goku & Super Saiyan 2 Vegeta	PHY	SUPER	1025730	t
1029361	Super Saiyan Goku & Super Saiyan Gohan (Youth) & \nSuper Saiyan Trunks (Teen)	PHY	Super	1029360	t
1027391	Zamasu	PHY	Extreme	1027390	f
1027581	Pilaf & Shu & Mai	AGL	Extreme	1027580	t
1027681	Android #21 (Transformed, Evil)	PHY	Extreme	1027680	f
1027291	Super Saiyan Trunks (Future)	PHY	Super	1027290	t
1027651	Android #21 (Normal)	AGL	Super	1027650	f
4027661	Android #21 (Transformed, Good)	AGL	Super	4027660	f
1027601	Super Saiyan Trunks (Teen) & Super Saiyan Broly	TEQ	Super	1027600	t
1028891	Ultimate Gohan	AGL	Super	1028890	t
1028921	Goku (Youth) & Krillin (Youth) & Bulma (Youth)	TEQ	Super	1028920	t
1028961	Cell Max	STR	Extreme	1028960	t
1029051	Goku (Ultra Instinct -Sign-)	TEQ	Super	1029050	t
1029141	Master Roshi	STR	Super	1029140	f
1029401	Broly	TEQ	Extreme	1029400	t
4029411	Legendary Super Saiyan Broly	TEQ	Extreme	4029410	t
1029441	Legendary Super Saiyan Broly	INT	Extreme	1029440	t
1029571	Vegeta	AGL	Extreme	1029570	f
1029701	Gohan (Kid)/Piccolo	TEQ	Super	1029700	t
1029271	Bio-Broly	PHY	Extreme	1029270	t
1029731	Lord Slug	STR	Extreme	1029730	f
1029851	Frieza (Final Form)/Cooler (Final Form)	PHY	Extreme	1029850	f
1029951	Super Saiyan God SS Goku (Universe Tree Power)	STR	Super	1029950	f
1029981	Majin Buu (Ultimate Gohan)	TEQ	Extreme	1029980	f
1030021	Super Saiyan 3 Gotenks	TEQ	Super	1030020	t
1029551	Anilaza	STR	Extreme	1029550	t
1030661	Super Saiyan Goku (Mini) (DAIMA)	INT	Super	1030660	f
1030641	Glorio	PHY	Super	1030640	f
1030431	Super Saiyan Goku + Super Saiyan Vegeta (Angel)	TEQ	Super	1030430	t
4030441	Super Saiyan Vegeta (Angel) + Super Saiyan Goku	TEQ	Super	4030440	t
4030451	Super Vegito	TEQ	Super	4030450	t
1030341	Super Saiyan 3 Goku (GT) (Golden Giant Ape)	AGL	Super	1030340	t
1030481	Super Saiyan Vegeta (Angel) + Super Saiyan Goku (Angel)	AGL	Super	1030480	t
4030491	Super Saiyan Goku (Angel) + Super Saiyan Vegeta (Angel)	AGL	Super	4030490	t
4030501	Super Gogeta	AGL	Super	4030500	t
1030391	Super Saiyan 2 Gohan (Youth)	PHY	Super	1030390	t
1030531	Frieza (Final Form) (Angel) + Goku	INT	Extreme	1030530	t
4030541	Goku + Frieza (Final Form) (Angel)	INT	Extreme	4030540	t
4030621	Goten (Kid) + Trunks (Kid)	PHY	Super	4030620	f
1030731	Hercule	STR	Super	1030730	f
1031061	Super Saiyan 3 Vegeta (Mini) (DAIMA)	PHY	Super	1031060	f
9519991	Super Saiyan God SS Goku (Kaioken) & \nSuper Saiyan God SS Evolved Vegeta	PHY	Extreme	1019990	t
1030941	Cell (Perfect Form)	STR	Extreme	1030940	f
1030971	Paikuhan	PHY	Super	1030970	t
9526401	Majin Vegeta	INT	Extreme	4026400	t
4027631	Super Saiyan 3 Goku	STR	Super	4027630	f
4028381	Gamma 1 & Gamma 2/Gamma 1	AGL	Super	4028380	t
4029481	Super Saiyan Gohan (Teen)	STR	Super	4029480	t
4027301	Super Saiyan Trunks (Future)	PHY	Super	4027300	t
4025781	Super Saiyan Vegeta (GT)	STR	Super	4025780	t
4029101	Jiren	AGL	Super	4029100	t
9520341	Super Saiyan God SS Evolved Vegeta	INT	Super	1020340	t
1023361	Androids #17 (Future) & #18 (Future)	TEQ	Extreme	1023360	f
1024441	Super Saiyan God SS Goku/\nSuper Saiyan God SS Vegeta	INT	Super	1024440	f
4027131	Super Saiyan God SS Vegito	AGL	Super	4027130	t
4019601	Majin Buu (Pure Evil)	TEQ	Extreme	4019600	f
1021141	Super Saiyan 2 Gohan (Youth)	TEQ	Super	1021140	t
1028981	Super Saiyan 2 Trunks (Future)	AGL	Super	1028980	f
1029511	Grandpa Gohan	TEQ	Super	1029510	t
7029951	Super Saiyan God SS Goku (Universe Tree Power)	STR	Super	7029950	f
1030571	Super Saiyan God SS Evolved Vegeta	STR	Super	1030570	t
4016881	Legendary Super Saiyan Broly	TEQ	Extreme	4016880	t
1021921	Super Saiyan Goku (GT)	PHY	Super	1021920	f
1022751	Frieza (Full Power)	AGL	Extreme	1022750	t
1023421	Super Saiyan Gohan (Future) & Trunks (Youth) (Future)/\nSuper Saiyan Gohan (Future)	AGL	Super	1023420	t
1024351	Super Saiyan Goku & Super Saiyan Gohan (Youth)	TEQ	Super	1024350	t
1026031	Yajirobe	TEQ	Super	1026030	f
1025591	Piccolo (Power Awakening)	TEQ	Super	1025590	t
1026731	Dr. Wheelo	AGL	Extreme	1026730	t
1027121	Super Saiyan God SS Goku & \nSuper Saiyan God SS Vegeta	AGL	Super	1027120	t
1027711	Super Full Power Saiyan 4 Limit Breaker Vegito (Xeno)	AGL	Super	1027710	f
9514211	Super Saiyan 4 Goku	AGL	Super	1014210	t
9517491	Piccolo	PHY	Super	1017490	f
1030831	Beerus	AGL	Super	1030820	f
4030801	Demon King Piccolo (Elder)	AGL	Extreme	4030800	t
4026911	Super Saiyan 4 Goku & Majuub	INT	Super	4026910	t
4025741	Goku & Vegeta	PHY	Super	4025740	t
4029371	Super Saiyan Goku	PHY	Super	4029370	t
4026541	Goku	TEQ	Super	4026540	f
\.


--
-- Data for Name: entrances; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.entrances (id, card_id, name, bgm_id, filename) FROM stdin;
65	7029951	Super Saiyan God SS Goku (Universe Tree Power) Entrance	403	\N
67	1030431	Super Saiyan Goku + Super Saiyan Vegeta (Angel) Entrance	414	\N
33	1027331	Super Saiyan Gohan (Future) Entrance	295	sp_effect_b4_00304
34	1027431	Androids #17 & #18 Entrance	307	battle_301265
32	1027291	Super Saiyan Trunks (Future) Entrance	292	battle_301264
1	9522381	Super Saiyan God Goku & \nSuper Saiyan God Vegeta Entrance	172	sp_effect_b4_00215
2	9522421	Super Saiyan 4 Goku & Super Saiyan 4 Vegeta Entrance	175	battle_301224
61	1029831	Super Saiyan Bardock Entrance	398	battle_301307
6	1023981	Majin Vegeta Entrance	186	sp_effect_b4_00218
8	1024511	Golden Frieza Entrance	195	sp_effect_b4_00233
10	1024551	Super Saiyan God SS Vegeta & \nSuper Saiyan Trunks (Future) Entrance	197	battle_301234
9	1024661	Fusion Zamasu Entrance	200	sp_effect_a9_00094
11	1024831	Cooler (Final Form) Entrance	203	sp_effect_b4_00246
14	1025091	Bardock Entrance	217	sp_effect_b4_00260
15	1025801	Yamcha Entrance	221	sp_effect_b4_00270
16	1025561	Ultimate Gohan Entrance	226	sp_effect_b4_00273
19	1026131	Gohan (Kid) Entrance	237	battle_301245
18	1026161	Goku Entrance	239	battle_301244
20	1026251	Super Saiyan God Goku Entrance	258	battle_301250
22	1026431	Buu (Super) Entrance	263	sp_effect_b4_00280
25	1026611	Bulma (Youth) Entrance	270	battle_301256
27	1026751	Turles Entrance	272	battle_301260
28	1027041	Omega Shenron Entrance	280	sp_effect_b4_00294
30	1027221	Fusion Zamasu Entrance	288	battle_301263
36	1027461	Ribrianne & Kakunsa & Rozie Entrance	312	sp_effect_b4_00305
78	1031081	Goku (Youth) Entrance	439	battle_301320
40	1028061	Super Saiyan Goku & \nSuper Saiyan Vegeta & Super Saiyan Trunks (Teen) Entrance	322	battle_301273
41	1028161	Hirudegarn Entrance	327	battle_301276
39	1027471	Cell (Perfect Form) (GT) & Frieza (Final Form) (GT) Entrance	329	battle_301272
42	1028021	Super Saiyan Broly Entrance	333	sp_effect_b4_00315
44	1028321	Gohan (Beast) Entrance	335	battle_301282
24	1026531	Goku Entrance	265	battle_301255
45	1028571	Frieza (1st Form) Entrance	342	sp_effect_b4_00317
46	1028681	Toppo Entrance	346	battle_301287
13	1025531	Gamma 2 Entrance	216	battle_301239
12	1025511	Gamma 1 Entrance	215	battle_301238
47	1028721	Captain Ginyu (Ginyu Force) Entrance	349	battle_301290
49	1028791	Super Saiyan 3 Goku (Angel) Entrance	354	sp_effect_b4_00327
50	1028811	Majin Buu (Good) Entrance	356	battle_301288
31	1027391	Zamasu Entrance	290	sp_effect_b4_00300
35	1027581	Pilaf & Shu & Mai Entrance	314	sp_effect_a9_00114
38	1027681	Android #21 (Transformed, Evil) Entrance	320	battle_301271
51	1028891	Ultimate Gohan Entrance	359	battle_301289
48	1028921	Goku (Youth) & Krillin (Youth) & Bulma (Youth) Entrance	361	sp_effect_b4_00324
54	1028961	Cell Max Entrance	364	sp_effect_b4_00329
55	1029051	Goku (Ultra Instinct -Sign-) Entrance	366	battle_301295
56	1029141	Master Roshi Entrance	371	battle_301296
59	1029441	Legendary Super Saiyan Broly Entrance	380	battle_301299
62	1029571	Vegeta Entrance	389	battle_301301
63	1029271	Bio-Broly Entrance	392	sp_effect_b4_00355
64	1029731	Lord Slug Entrance	400	battle_301302
66	1029551	Anilaza Entrance	408	battle_301305
73	1030661	Super Saiyan Goku (Mini) (DAIMA) Entrance	410	battle_301312
74	1030641	Glorio Entrance	412	sp_effect_b4_00366
76	1030391	Super Saiyan 2 Gohan (Youth) Entrance	426	sp_effect_a9_00140
77	1031061	Super Saiyan 3 Vegeta (Mini) (DAIMA) Entrance	437	sp_effect_b4_00371
7	1024441	Super Saiyan God SS Goku/\nSuper Saiyan God SS Vegeta Entrance	193	sp_effect_b4_00232
53	1028981	Super Saiyan 2 Trunks (Future) Entrance	363	sp_effect_b4_00328
60	1029511	Grandpa Gohan Entrance	388	sp_effect_b4_00352
72	1030571	Super Saiyan God SS Evolved Vegeta Entrance	420	battle_301314
17	1025591	Piccolo (Power Awakening) Entrance	228	sp_effect_b4_00271
26	1026731	Dr. Wheelo Entrance	274	battle_301257
29	1027121	Super Saiyan God SS Goku & \nSuper Saiyan God SS Vegeta Entrance	285	battle_301262
37	1027711	Super Full Power Saiyan 4 Limit Breaker Vegito (Xeno) Entrance	316	battle_301268
69	1030831	Beerus Entrance	425	battle_301318
3	9523891	Gohan (Teen) & Goten (Kid) & Trunks (Kid) Entrance	171	sp_effect_b4_00216
4	9523621	Goku (Kaioken) Entrance	181	battle_301226
5	9523521	Vegeta (Giant Ape) Entrance	183	battle_301227
79	1030941	Cell (Perfect Form) Entrance	441	battle_301322
\.


--
-- Data for Name: finish_skills; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.finish_skills (id, name, bgm_id, standby_skill_id, card_id, filename) FROM stdin;
6	Flying Technique Attack	267	8	4026541	sp_effect_b1_00251
3	Spirit Bomb	233	4	4025741	sp_effect_a2_00203
4	Super Spirit Bomb	234	4	4025741	sp_effect_a2_00202
5	Super Ultra Spirit Bomb	236	6	4025781	sp_effect_a2_00201
7	Saiyan Power Augmentation	279	10	4026911	battle_301251
9	Super Full Power Evolution	278	10	4026911	battle_301261
23	Destruction Brought by the Demon King Himself	432	26	4030801	sp_effect_a1_00484
25	Power of Youth	433	26	4030801	battle_301324
17	Awakened Full Power	369	20	4029101	sp_effect_a9_00132
15	Resurfaced Trauma	370	20	4029101	sp_effect_b4_00338
10	Final Hope Slash	294	12	4027301	sp_effect_b4_00302
20	Kamehameha	384	24	4029481	sp_effect_a1_00451
22	Family Kamehameha	385	24	4029481	sp_effect_a1_00453
26	Brotherhood Kamehameha	384	24	4029481	sp_effect_a1_00452
14	All-Out Full Energy Release	338	18	4028381	sp_effect_a9_00121
1	Incomplete Domination	242	14	9526401	sp_effect_a1_00392
2	Majin Buu Resurrected!	243	14	9526401	sp_effect_a2_00207
11	Dragon Fist	325	16	4027631	battle_301275
19	Miraculous Punch	374	22	4029371	sp_effect_b1_00296
18	Punch of Bonds	375	22	4029371	sp_effect_b1_00289
\.


--
-- Data for Name: standby_skills; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.standby_skills (id, description, card_id, bgm_id, filename) FROM stdin;
4	Super Saiyan 3 Goku & Super Saiyan 2 Vegeta Standby Skill	1025731	232	battle_301247
6	Goku (GT) & Super Saiyan 4 Vegeta Standby Skill	1025771	235	battle_301248
14	Babidi Standby Skill	9526391	241	battle_301249
8	Goku Standby Skill	1026531	266	battle_301259
10	Super Saiyan 4 Goku Standby Skill	1026901	277	sp_effect_b4_00293
12	Super Saiyan Trunks (Future) Standby Skill	1027291	293	sp_effect_b4_00301
16	Super Saiyan 3 Goku Standby Skill	1027621	324	battle_301274
18	Gamma 1 & Gamma 2/Gamma 1 Standby Skill	1028371	337	battle_301284
20	Jiren Standby Skill	1029091	368	battle_301293
22	Super Saiyan Goku & Super Saiyan Gohan (Youth) & \nSuper Saiyan Trunks (Teen) Standby Skill	1029361	373	sp_effect_b4_00341
24	Super Saiyan Gohan (Teen) Standby Skill	1029471	382	sp_effect_b4_00350
26	Demon King Piccolo (Elder) Standby Skill	1030791	431	sp_effect_b4_00375
\.


--
-- Name: cards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cards_id_seq', 1, false);


--
-- Name: active_skills active_skills_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_skills
    ADD CONSTRAINT active_skills_pkey PRIMARY KEY (id);


--
-- Name: background_music background_music_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.background_music
    ADD CONSTRAINT background_music_pkey PRIMARY KEY (id);


--
-- Name: cards cards_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cards
    ADD CONSTRAINT cards_pkey PRIMARY KEY (id);


--
-- Name: entrances entrances_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entrances
    ADD CONSTRAINT entrances_pkey PRIMARY KEY (id);


--
-- Name: finish_skills finish_skills_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.finish_skills
    ADD CONSTRAINT finish_skills_pkey PRIMARY KEY (id);


--
-- Name: standby_skills standby_skills_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.standby_skills
    ADD CONSTRAINT standby_skills_pkey PRIMARY KEY (id);


--
-- Name: active_skills active_skills_bgm_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_skills
    ADD CONSTRAINT active_skills_bgm_id_fkey FOREIGN KEY (bgm_id) REFERENCES public.background_music(id);


--
-- Name: active_skills active_skills_card_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_skills
    ADD CONSTRAINT active_skills_card_id_fkey FOREIGN KEY (card_id) REFERENCES public.cards(id);


--
-- Name: entrances entrances_bgm_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entrances
    ADD CONSTRAINT entrances_bgm_id_fkey FOREIGN KEY (bgm_id) REFERENCES public.background_music(id);


--
-- Name: entrances entrances_card_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entrances
    ADD CONSTRAINT entrances_card_id_fkey FOREIGN KEY (card_id) REFERENCES public.cards(id);


--
-- Name: finish_skills finish_skills_bgm_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.finish_skills
    ADD CONSTRAINT finish_skills_bgm_id_fkey FOREIGN KEY (bgm_id) REFERENCES public.background_music(id);


--
-- Name: finish_skills finish_skills_card_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.finish_skills
    ADD CONSTRAINT finish_skills_card_id_fkey FOREIGN KEY (card_id) REFERENCES public.cards(id);


--
-- Name: finish_skills finish_skills_standby_skill_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.finish_skills
    ADD CONSTRAINT finish_skills_standby_skill_id_fkey FOREIGN KEY (standby_skill_id) REFERENCES public.standby_skills(id);


--
-- Name: standby_skills standby_skills_bgm_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.standby_skills
    ADD CONSTRAINT standby_skills_bgm_id_fkey FOREIGN KEY (bgm_id) REFERENCES public.background_music(id);


--
-- Name: standby_skills standby_skills_card_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.standby_skills
    ADD CONSTRAINT standby_skills_card_id_fkey FOREIGN KEY (card_id) REFERENCES public.cards(id);


--
-- PostgreSQL database dump complete
--

