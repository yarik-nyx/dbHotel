PGDMP  (                    |            hotel    16.1    16.1 E    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                        1262    75125    hotel    DATABASE     y   CREATE DATABASE hotel WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE hotel;
                postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                pg_database_owner    false                       0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   pg_database_owner    false    4            �            1259    75219    check_in    TABLE     �   CREATE TABLE public.check_in (
    check_in_id integer NOT NULL,
    client_id integer NOT NULL,
    room_id integer NOT NULL,
    check_in_date date,
    check_out_date date
);
    DROP TABLE public.check_in;
       public         heap    postgres    false    4            �            1259    75218    check_in_check_in_id_seq    SEQUENCE     �   CREATE SEQUENCE public.check_in_check_in_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.check_in_check_in_id_seq;
       public          postgres    false    4    226                       0    0    check_in_check_in_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.check_in_check_in_id_seq OWNED BY public.check_in.check_in_id;
          public          postgres    false    225            �            1259    75193    client    TABLE     &  CREATE TABLE public.client (
    client_id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    phone_number character varying(20) NOT NULL,
    email_address character varying(100),
    passport character varying(20) NOT NULL
);
    DROP TABLE public.client;
       public         heap    postgres    false    4            �            1259    75192    client_client_id_seq    SEQUENCE     �   CREATE SEQUENCE public.client_client_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.client_client_id_seq;
       public          postgres    false    4    220                       0    0    client_client_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.client_client_id_seq OWNED BY public.client.client_id;
          public          postgres    false    219            �            1259    75181    employee    TABLE     E  CREATE TABLE public.employee (
    employee_id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    position_id integer NOT NULL,
    salary numeric(10,2) NOT NULL,
    phone_number character varying(20) NOT NULL,
    passport character varying(20) NOT NULL
);
    DROP TABLE public.employee;
       public         heap    postgres    false    4            �            1259    75180    employee_employee_id_seq    SEQUENCE     �   CREATE SEQUENCE public.employee_employee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.employee_employee_id_seq;
       public          postgres    false    4    218                       0    0    employee_employee_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.employee_employee_id_seq OWNED BY public.employee.employee_id;
          public          postgres    false    217            �            1259    75172    position    TABLE     �   CREATE TABLE public."position" (
    position_id integer NOT NULL,
    position_name character varying(100) NOT NULL,
    description text
);
    DROP TABLE public."position";
       public         heap    postgres    false    4            �            1259    75171    position_position_id_seq    SEQUENCE     �   CREATE SEQUENCE public.position_position_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.position_position_id_seq;
       public          postgres    false    4    216                       0    0    position_position_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.position_position_id_seq OWNED BY public."position".position_id;
          public          postgres    false    215            �            1259    75207    room    TABLE     �   CREATE TABLE public.room (
    room_id integer NOT NULL,
    room_number character varying(10) NOT NULL,
    room_type_id integer NOT NULL,
    price_per_night numeric(10,2) NOT NULL,
    availability boolean NOT NULL
);
    DROP TABLE public.room;
       public         heap    postgres    false    4            �            1259    75206    room_room_id_seq    SEQUENCE     �   CREATE SEQUENCE public.room_room_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.room_room_id_seq;
       public          postgres    false    224    4                       0    0    room_room_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.room_room_id_seq OWNED BY public.room.room_id;
          public          postgres    false    223            �            1259    75200 	   room_type    TABLE     �   CREATE TABLE public.room_type (
    room_type_id integer NOT NULL,
    type_name character varying(100) NOT NULL,
    type_description character varying(100)
);
    DROP TABLE public.room_type;
       public         heap    postgres    false    4            �            1259    75199    room_type_room_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.room_type_room_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.room_type_room_type_id_seq;
       public          postgres    false    4    222                       0    0    room_type_room_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.room_type_room_type_id_seq OWNED BY public.room_type.room_type_id;
          public          postgres    false    221            �            1259    75243    service_order    TABLE     �   CREATE TABLE public.service_order (
    order_id integer NOT NULL,
    client_id integer NOT NULL,
    service_id integer NOT NULL,
    employee_id integer,
    order_date date NOT NULL
);
 !   DROP TABLE public.service_order;
       public         heap    postgres    false    4            �            1259    75242    service_order_order_id_seq    SEQUENCE     �   CREATE SEQUENCE public.service_order_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.service_order_order_id_seq;
       public          postgres    false    230    4                       0    0    service_order_order_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.service_order_order_id_seq OWNED BY public.service_order.order_id;
          public          postgres    false    229            �            1259    75236    services    TABLE     �   CREATE TABLE public.services (
    service_id integer NOT NULL,
    name character varying(100) NOT NULL,
    price numeric(10,2)
);
    DROP TABLE public.services;
       public         heap    postgres    false    4            �            1259    75235    services_service_id_seq    SEQUENCE     �   CREATE SEQUENCE public.services_service_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.services_service_id_seq;
       public          postgres    false    228    4            	           0    0    services_service_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.services_service_id_seq OWNED BY public.services.service_id;
          public          postgres    false    227            B           2604    75222    check_in check_in_id    DEFAULT     |   ALTER TABLE ONLY public.check_in ALTER COLUMN check_in_id SET DEFAULT nextval('public.check_in_check_in_id_seq'::regclass);
 C   ALTER TABLE public.check_in ALTER COLUMN check_in_id DROP DEFAULT;
       public          postgres    false    226    225    226            ?           2604    75196    client client_id    DEFAULT     t   ALTER TABLE ONLY public.client ALTER COLUMN client_id SET DEFAULT nextval('public.client_client_id_seq'::regclass);
 ?   ALTER TABLE public.client ALTER COLUMN client_id DROP DEFAULT;
       public          postgres    false    220    219    220            >           2604    75184    employee employee_id    DEFAULT     |   ALTER TABLE ONLY public.employee ALTER COLUMN employee_id SET DEFAULT nextval('public.employee_employee_id_seq'::regclass);
 C   ALTER TABLE public.employee ALTER COLUMN employee_id DROP DEFAULT;
       public          postgres    false    218    217    218            =           2604    75175    position position_id    DEFAULT     ~   ALTER TABLE ONLY public."position" ALTER COLUMN position_id SET DEFAULT nextval('public.position_position_id_seq'::regclass);
 E   ALTER TABLE public."position" ALTER COLUMN position_id DROP DEFAULT;
       public          postgres    false    216    215    216            A           2604    75210    room room_id    DEFAULT     l   ALTER TABLE ONLY public.room ALTER COLUMN room_id SET DEFAULT nextval('public.room_room_id_seq'::regclass);
 ;   ALTER TABLE public.room ALTER COLUMN room_id DROP DEFAULT;
       public          postgres    false    223    224    224            @           2604    75203    room_type room_type_id    DEFAULT     �   ALTER TABLE ONLY public.room_type ALTER COLUMN room_type_id SET DEFAULT nextval('public.room_type_room_type_id_seq'::regclass);
 E   ALTER TABLE public.room_type ALTER COLUMN room_type_id DROP DEFAULT;
       public          postgres    false    221    222    222            D           2604    75246    service_order order_id    DEFAULT     �   ALTER TABLE ONLY public.service_order ALTER COLUMN order_id SET DEFAULT nextval('public.service_order_order_id_seq'::regclass);
 E   ALTER TABLE public.service_order ALTER COLUMN order_id DROP DEFAULT;
       public          postgres    false    230    229    230            C           2604    75239    services service_id    DEFAULT     z   ALTER TABLE ONLY public.services ALTER COLUMN service_id SET DEFAULT nextval('public.services_service_id_seq'::regclass);
 B   ALTER TABLE public.services ALTER COLUMN service_id DROP DEFAULT;
       public          postgres    false    227    228    228            �          0    75219    check_in 
   TABLE DATA           b   COPY public.check_in (check_in_id, client_id, room_id, check_in_date, check_out_date) FROM stdin;
    public          postgres    false    226   Q       �          0    75193    client 
   TABLE DATA           i   COPY public.client (client_id, first_name, last_name, phone_number, email_address, passport) FROM stdin;
    public          postgres    false    220   R       �          0    75181    employee 
   TABLE DATA           s   COPY public.employee (employee_id, first_name, last_name, position_id, salary, phone_number, passport) FROM stdin;
    public          postgres    false    218   �T       �          0    75172    position 
   TABLE DATA           M   COPY public."position" (position_id, position_name, description) FROM stdin;
    public          postgres    false    216   BV       �          0    75207    room 
   TABLE DATA           a   COPY public.room (room_id, room_number, room_type_id, price_per_night, availability) FROM stdin;
    public          postgres    false    224   cW       �          0    75200 	   room_type 
   TABLE DATA           N   COPY public.room_type (room_type_id, type_name, type_description) FROM stdin;
    public          postgres    false    222   X       �          0    75243    service_order 
   TABLE DATA           a   COPY public.service_order (order_id, client_id, service_id, employee_id, order_date) FROM stdin;
    public          postgres    false    230   �X       �          0    75236    services 
   TABLE DATA           ;   COPY public.services (service_id, name, price) FROM stdin;
    public          postgres    false    228   �Z       
           0    0    check_in_check_in_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.check_in_check_in_id_seq', 23, true);
          public          postgres    false    225                       0    0    client_client_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.client_client_id_seq', 20, true);
          public          postgres    false    219                       0    0    employee_employee_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.employee_employee_id_seq', 11, true);
          public          postgres    false    217                       0    0    position_position_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.position_position_id_seq', 5, true);
          public          postgres    false    215                       0    0    room_room_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.room_room_id_seq', 20, true);
          public          postgres    false    223                       0    0    room_type_room_type_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.room_type_room_type_id_seq', 2, true);
          public          postgres    false    221                       0    0    service_order_order_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.service_order_order_id_seq', 105, true);
          public          postgres    false    229                       0    0    services_service_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.services_service_id_seq', 5, true);
          public          postgres    false    227            P           2606    75224    check_in check_in_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.check_in
    ADD CONSTRAINT check_in_pkey PRIMARY KEY (check_in_id);
 @   ALTER TABLE ONLY public.check_in DROP CONSTRAINT check_in_pkey;
       public            postgres    false    226            J           2606    75198    client client_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (client_id);
 <   ALTER TABLE ONLY public.client DROP CONSTRAINT client_pkey;
       public            postgres    false    220            H           2606    75186    employee employee_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (employee_id);
 @   ALTER TABLE ONLY public.employee DROP CONSTRAINT employee_pkey;
       public            postgres    false    218            F           2606    75179    position position_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public."position"
    ADD CONSTRAINT position_pkey PRIMARY KEY (position_id);
 B   ALTER TABLE ONLY public."position" DROP CONSTRAINT position_pkey;
       public            postgres    false    216            N           2606    75212    room room_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.room
    ADD CONSTRAINT room_pkey PRIMARY KEY (room_id);
 8   ALTER TABLE ONLY public.room DROP CONSTRAINT room_pkey;
       public            postgres    false    224            L           2606    75205    room_type room_type_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.room_type
    ADD CONSTRAINT room_type_pkey PRIMARY KEY (room_type_id);
 B   ALTER TABLE ONLY public.room_type DROP CONSTRAINT room_type_pkey;
       public            postgres    false    222            T           2606    75248     service_order service_order_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.service_order
    ADD CONSTRAINT service_order_pkey PRIMARY KEY (order_id);
 J   ALTER TABLE ONLY public.service_order DROP CONSTRAINT service_order_pkey;
       public            postgres    false    230            R           2606    75241    services services_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pkey PRIMARY KEY (service_id);
 @   ALTER TABLE ONLY public.services DROP CONSTRAINT services_pkey;
       public            postgres    false    228            W           2606    75225     check_in check_in_client_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.check_in
    ADD CONSTRAINT check_in_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.client(client_id);
 J   ALTER TABLE ONLY public.check_in DROP CONSTRAINT check_in_client_id_fkey;
       public          postgres    false    226    4682    220            X           2606    75230    check_in check_in_room_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.check_in
    ADD CONSTRAINT check_in_room_id_fkey FOREIGN KEY (room_id) REFERENCES public.room(room_id);
 H   ALTER TABLE ONLY public.check_in DROP CONSTRAINT check_in_room_id_fkey;
       public          postgres    false    4686    224    226            U           2606    75187 "   employee employee_position_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_position_id_fkey FOREIGN KEY (position_id) REFERENCES public."position"(position_id);
 L   ALTER TABLE ONLY public.employee DROP CONSTRAINT employee_position_id_fkey;
       public          postgres    false    4678    216    218            V           2606    75213    room room_room_type_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.room
    ADD CONSTRAINT room_room_type_id_fkey FOREIGN KEY (room_type_id) REFERENCES public.room_type(room_type_id);
 E   ALTER TABLE ONLY public.room DROP CONSTRAINT room_room_type_id_fkey;
       public          postgres    false    4684    224    222            Y           2606    75249 *   service_order service_order_client_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.service_order
    ADD CONSTRAINT service_order_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.client(client_id);
 T   ALTER TABLE ONLY public.service_order DROP CONSTRAINT service_order_client_id_fkey;
       public          postgres    false    220    230    4682            Z           2606    75259 ,   service_order service_order_employee_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.service_order
    ADD CONSTRAINT service_order_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.employee(employee_id);
 V   ALTER TABLE ONLY public.service_order DROP CONSTRAINT service_order_employee_id_fkey;
       public          postgres    false    230    218    4680            [           2606    75254 +   service_order service_order_service_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.service_order
    ADD CONSTRAINT service_order_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.services(service_id);
 U   ALTER TABLE ONLY public.service_order DROP CONSTRAINT service_order_service_id_fkey;
       public          postgres    false    4690    230    228            �   �   x�mQ�� {ۻ�C6X�t�9*�^�!�"+p,���	���&s&QRƁU��,�%��^��6�GXC��KiGiU�`H�L?q:�) ��f�)ہM�B�-���Nm��vq�a�����ڔ�LVE�UX���ʜ��ǒ{[Д2o���K��*�L��R��=�}4� �+`�Ϛc�Y�H6Y>de[h�)�lJA�~j���j���?�<J�t}��P�7+`?      �   �  x����n�@��g����Q�Klߕ}yn\2��8v��Q�W jY����(�x��7��;)�R6i����?>�$������0Lݲ;��zmL�(���?e�E�gw��	<�p��H�Wp�W�!ͦ�sCj�s�c[�i�6��0������0���=,!�Ev���`7(�[�m[/l9l����>R�\�[>))�h��氩<	!t�0t6
���Or�6��z�W�sK���ɐeY:����z�i����\D��?(�q�v� YR��A�S�V�p*�ٻ]�Jmt:�S>R*d�ĵ��J�u]?*�/��+O��Ԕ��=�`��#��A�t����\�j,US&�J�0	^Ja���x�Y�lZ�A�4��� �6�є�ŅhD�e8ٴh��r�fcQ��A��a�&#>Z�N�[d�<�+4�e1?�ܣ�q��h�P�^��.�&��^~=�b(+��5����"����Bf����ϰw|��"��E��&T	bJ�:�k�*e�0Gq/n�I̴b�j�5���S����T�8�q=�m�����-.�j@�.��O|��� Cy(�D�
�j;VTP�����T�(�֫^�7�}Y_��誣������pT����O���U}ǒ�������hB�Rk[���rx$e=���X��-��_�s�      �   d  x���KN�@D�=��=R4���]8L�u$�pba��s#��,���V[�r�+tG�� ����t�s:�,��kf\�b���9��:�:Ĕ�U�:t�螕�=�0�1���nNy�k�����P_���q@�������/<��-RJ9�lu3�* =Ӿ��}r7�;a�ȹbҹ�Q�3�_4��-�Lcu��)���,vT������o��dـ��ć��#'�m�=�ώ�,���j�m��ZcREhn�����5o��ӈp�S�
-����z�-�uU�~�za��	)��*Zz�EY+����i���7>[!�:Z�)F]ΔR?�c O      �     x�MP[N�0��O�T�Q��	z�$��*�H���bp�<�0{#f����k���	^*�ޱ�Y��FB�G���Qji�9:�}�D{i���Wt�RQ��@��D��w�&��)�jt��
|n�����Wo��3Eux%| ����:&��N@.x�?W�6��]���e2Φ�P�G:x�#�^�睊�?�Z|r~�߉g���S衄�^��&0�Sk+�Jˬ�v�#�,&���Swj����y�K�|���֮��_��0�      �   �   x�U��1�7.�Ă��{�;�e�	�|G��b���z�ʧ�&��]�HCL̊6iF՝dJ�I�Ee�`<�n�:yn)�]A�b͌���)g��@I+��?��(�p�E<��U��V`�Y�k���S�Q���UW䛘6�M1hG[=�u�־=      �   �   x�e���0DϤ�T���C1I<�@�� 0""$��ۑ���m���w�������-�$�a���:L�/D��"	���͒�rB����L]�� >�H�p�1��A��{�t�">c(��{zs2�|Yt�z      �   N  x�m��q� �o�; $M���_�E�ma9��d��oJ(���'P&JYR�H�ά�Rb��z"���F*#J�3��jl�Y�)��C?��J�#�3�D=�0���\��Ē��Z���3���e�Δ�X�a�J�%�u>Ӟ
ǲ$�t�}�u��Mױƙ�T�;���OJy��M�`���TR&қ8�H�h���D�d�`"u:��D
�o'R�gx;�B�sp"���۩����*��o�
&{JJ��v�W��F6�C}�=�[�r!��ߡ��>����pE"��Hy,+��B�U��c��<�[�U��:�:Wv�t�o�ε�#��8� �6��
p|�!ll���B\����D�@ck�Pi�5\Sv�t9v�T�]�5�a�r�î��빦B슮)���0b�tH욮C�]�u0�k�'v=��I!�IA�IaŮ�:�|:��I�K�M7TK\Ӎ�!��n�,��P+qM7���eS�z���H*e�[j��<� �	(yW݄��`�`�0M0��*P�P�wM �F>���� �w�M��dɻ�J.�+�����J��|��e��[V����_��?��f�      �   s   x�3���u��450�30�2�0��.6]l һ8 ��_�vaǅ��FP!c�����*w]��in
5�^l���b��v(\�2�b���@��¾;9�v��qqq ��9     