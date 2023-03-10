PGDMP         6                 {            school    15.1    15.1 /    0           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            1           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            2           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            3           1262    16398    school    DATABASE     z   CREATE DATABASE school WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE school;
                postgres    false            ?            1259    16432    Group    TABLE     ?   CREATE TABLE public."Group" (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    course integer NOT NULL
);
    DROP TABLE public."Group";
       public         heap    postgres    false            ?            1259    16431    Group_id_seq    SEQUENCE     ?   CREATE SEQUENCE public."Group_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public."Group_id_seq";
       public          postgres    false    220            4           0    0    Group_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public."Group_id_seq" OWNED BY public."Group".id;
          public          postgres    false    219            ?            1259    16450    Lesson    TABLE     ?   CREATE TABLE public."Lesson" (
    id integer NOT NULL,
    "teacherId" integer,
    "groupId" integer NOT NULL,
    "subjectId" integer NOT NULL
);
    DROP TABLE public."Lesson";
       public         heap    postgres    false            ?            1259    16449    Lesson_id_seq    SEQUENCE     ?   CREATE SEQUENCE public."Lesson_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public."Lesson_id_seq";
       public          postgres    false    224            5           0    0    Lesson_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public."Lesson_id_seq" OWNED BY public."Lesson".id;
          public          postgres    false    223            ?            1259    16414    Student    TABLE     ?   CREATE TABLE public."Student" (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    surname character varying(200) NOT NULL,
    "groupId" integer NOT NULL
);
    DROP TABLE public."Student";
       public         heap    postgres    false            ?            1259    16413    Student_id_seq    SEQUENCE     ?   CREATE SEQUENCE public."Student_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public."Student_id_seq";
       public          postgres    false    216            6           0    0    Student_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public."Student_id_seq" OWNED BY public."Student".id;
          public          postgres    false    215            ?            1259    16441    Subject    TABLE     ?   CREATE TABLE public."Subject" (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    description text NOT NULL
);
    DROP TABLE public."Subject";
       public         heap    postgres    false            ?            1259    16440    Subject_id_seq    SEQUENCE     ?   CREATE SEQUENCE public."Subject_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public."Subject_id_seq";
       public          postgres    false    222            7           0    0    Subject_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public."Subject_id_seq" OWNED BY public."Subject".id;
          public          postgres    false    221            ?            1259    16423    Teacher    TABLE     ?   CREATE TABLE public."Teacher" (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    surname character varying(200) NOT NULL,
    degree character varying(200) NOT NULL
);
    DROP TABLE public."Teacher";
       public         heap    postgres    false            ?            1259    16422    Teacher_id_seq    SEQUENCE     ?   CREATE SEQUENCE public."Teacher_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public."Teacher_id_seq";
       public          postgres    false    218            8           0    0    Teacher_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public."Teacher_id_seq" OWNED BY public."Teacher".id;
          public          postgres    false    217            ?            1259    16402    _prisma_migrations    TABLE     ?  CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);
 &   DROP TABLE public._prisma_migrations;
       public         heap    postgres    false            ?           2604    16435    Group id    DEFAULT     h   ALTER TABLE ONLY public."Group" ALTER COLUMN id SET DEFAULT nextval('public."Group_id_seq"'::regclass);
 9   ALTER TABLE public."Group" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    220    220            ?           2604    16453 	   Lesson id    DEFAULT     j   ALTER TABLE ONLY public."Lesson" ALTER COLUMN id SET DEFAULT nextval('public."Lesson_id_seq"'::regclass);
 :   ALTER TABLE public."Lesson" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    224    224                       2604    16417 
   Student id    DEFAULT     l   ALTER TABLE ONLY public."Student" ALTER COLUMN id SET DEFAULT nextval('public."Student_id_seq"'::regclass);
 ;   ALTER TABLE public."Student" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    216    216            ?           2604    16444 
   Subject id    DEFAULT     l   ALTER TABLE ONLY public."Subject" ALTER COLUMN id SET DEFAULT nextval('public."Subject_id_seq"'::regclass);
 ;   ALTER TABLE public."Subject" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    221    222            ?           2604    16426 
   Teacher id    DEFAULT     l   ALTER TABLE ONLY public."Teacher" ALTER COLUMN id SET DEFAULT nextval('public."Teacher_id_seq"'::regclass);
 ;   ALTER TABLE public."Teacher" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    218    218            )          0    16432    Group 
   TABLE DATA           3   COPY public."Group" (id, name, course) FROM stdin;
    public          postgres    false    220   ?4       -          0    16450    Lesson 
   TABLE DATA           K   COPY public."Lesson" (id, "teacherId", "groupId", "subjectId") FROM stdin;
    public          postgres    false    224   (5       %          0    16414    Student 
   TABLE DATA           A   COPY public."Student" (id, name, surname, "groupId") FROM stdin;
    public          postgres    false    216   Z5       +          0    16441    Subject 
   TABLE DATA           :   COPY public."Subject" (id, name, description) FROM stdin;
    public          postgres    false    222   ?5       '          0    16423    Teacher 
   TABLE DATA           >   COPY public."Teacher" (id, name, surname, degree) FROM stdin;
    public          postgres    false    218   ?5       #          0    16402    _prisma_migrations 
   TABLE DATA           ?   COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
    public          postgres    false    214   *6       9           0    0    Group_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."Group_id_seq"', 7, true);
          public          postgres    false    219            :           0    0    Lesson_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public."Lesson_id_seq"', 14, true);
          public          postgres    false    223            ;           0    0    Student_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public."Student_id_seq"', 5, true);
          public          postgres    false    215            <           0    0    Subject_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public."Subject_id_seq"', 5, true);
          public          postgres    false    221            =           0    0    Teacher_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public."Teacher_id_seq"', 8, true);
          public          postgres    false    217            ?           2606    16439    Group Group_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public."Group"
    ADD CONSTRAINT "Group_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public."Group" DROP CONSTRAINT "Group_pkey";
       public            postgres    false    220            ?           2606    16455    Lesson Lesson_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public."Lesson"
    ADD CONSTRAINT "Lesson_pkey" PRIMARY KEY (id);
 @   ALTER TABLE ONLY public."Lesson" DROP CONSTRAINT "Lesson_pkey";
       public            postgres    false    224            ?           2606    16421    Student Student_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Student"
    ADD CONSTRAINT "Student_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public."Student" DROP CONSTRAINT "Student_pkey";
       public            postgres    false    216            ?           2606    16448    Subject Subject_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Subject"
    ADD CONSTRAINT "Subject_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public."Subject" DROP CONSTRAINT "Subject_pkey";
       public            postgres    false    222            ?           2606    16430    Teacher Teacher_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Teacher"
    ADD CONSTRAINT "Teacher_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public."Teacher" DROP CONSTRAINT "Teacher_pkey";
       public            postgres    false    218            ?           2606    16410 *   _prisma_migrations _prisma_migrations_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public._prisma_migrations DROP CONSTRAINT _prisma_migrations_pkey;
       public            postgres    false    214            ?           1259    17703 &   Lesson_groupId_subjectId_teacherId_key    INDEX     ?   CREATE UNIQUE INDEX "Lesson_groupId_subjectId_teacherId_key" ON public."Lesson" USING btree ("groupId", "subjectId", "teacherId");
 <   DROP INDEX public."Lesson_groupId_subjectId_teacherId_key";
       public            postgres    false    224    224    224            ?           2606    16461    Lesson Lesson_groupId_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Lesson"
    ADD CONSTRAINT "Lesson_groupId_fkey" FOREIGN KEY ("groupId") REFERENCES public."Group"(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 H   ALTER TABLE ONLY public."Lesson" DROP CONSTRAINT "Lesson_groupId_fkey";
       public          postgres    false    3211    224    220            ?           2606    16466    Lesson Lesson_subjectId_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Lesson"
    ADD CONSTRAINT "Lesson_subjectId_fkey" FOREIGN KEY ("subjectId") REFERENCES public."Subject"(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 J   ALTER TABLE ONLY public."Lesson" DROP CONSTRAINT "Lesson_subjectId_fkey";
       public          postgres    false    224    222    3213            ?           2606    17342    Lesson Lesson_teacherId_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Lesson"
    ADD CONSTRAINT "Lesson_teacherId_fkey" FOREIGN KEY ("teacherId") REFERENCES public."Teacher"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 J   ALTER TABLE ONLY public."Lesson" DROP CONSTRAINT "Lesson_teacherId_fkey";
       public          postgres    false    3209    218    224            ?           2606    17061    Student Student_groupId_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Student"
    ADD CONSTRAINT "Student_groupId_fkey" FOREIGN KEY ("groupId") REFERENCES public."Group"(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 J   ALTER TABLE ONLY public."Student" DROP CONSTRAINT "Student_groupId_fkey";
       public          postgres    false    3211    220    216            )   "   x?3?t2?4?2?t2?4?2?t2?4?????? 2??      -   "   x?34?4B.CcN Ô???0?????? G4*      %   ,   x?3?N???????/-?4?2?t??,?tN????4?????? ?u	D      +   :   x?3??M,????-?IU???L9}??K?S9???R+?r?y?9??\1z\\\ ??i      '   :   x?3?IML?H-2?,??-?I-?p9???,8??K?Ҝ??E?@n?#L??Ԕ+F??? ???      #   ?  x?m?[n1E??U?????f]A??Tb ?????+'?拄8????dLI'UKS?
S)M? ?LCP?yGę3hՄ?<Ԭ??J?СP??L???a????z?6 ?8?>???3?An???. *$`??????????;&0??ý?)"?Il?p?$<q?Ʊ7/???Ԙ?56??=u?,Ű?j????ep?F#0?Դ?D??6?̬???O?º?֖????xZ????u?l??????-O??????ɑP??J??4Qna8)?OjP]Ї?A?=xb?)??Z?,??Х???lE?d??c??3z.$_)?a?8??A??=AH????'_6ۖ?????Q9/??6j?>?y??_|?????v???޻??a?/9&??rX0??s?c?VzN;/?H4?{???
??
W?0?W?`3% Gޱ&'F???s???0??>R|??M???w?????zGs?????r??nd?O????~?y???     