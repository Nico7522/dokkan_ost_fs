PGDMP                      }        
   dokkan_ost    17.0    17.0 "               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false                       1262    32075 
   dokkan_ost    DATABASE     ~   CREATE DATABASE dokkan_ost WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'French_Belgium.1252';
    DROP DATABASE dokkan_ost;
                     postgres    false            �            1259    32138    active_skills    TABLE     �   CREATE TABLE public.active_skills (
    id integer NOT NULL,
    card_id integer,
    name character varying,
    bgm_id integer,
    filename character varying
);
 !   DROP TABLE public.active_skills;
       public         heap r       postgres    false            �            1259    32126    background_music    TABLE     �   CREATE TABLE public.background_music (
    id integer NOT NULL,
    description character varying,
    extended_version_url character varying
);
 $   DROP TABLE public.background_music;
       public         heap r       postgres    false            �            1259    32089    cards    TABLE     �   CREATE TABLE public.cards (
    id integer NOT NULL,
    name character varying,
    type character varying,
    class character varying,
    thumb integer,
    is_legendary boolean
);
    DROP TABLE public.cards;
       public         heap r       postgres    false            �            1259    32088    cards_id_seq    SEQUENCE     �   CREATE SEQUENCE public.cards_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.cards_id_seq;
       public               postgres    false    218                       0    0    cards_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.cards_id_seq OWNED BY public.cards.id;
          public               postgres    false    217            �            1259    32145 	   entrances    TABLE     �   CREATE TABLE public.entrances (
    id integer NOT NULL,
    card_id integer,
    name character varying,
    bgm_id integer,
    filename character varying
);
    DROP TABLE public.entrances;
       public         heap r       postgres    false            �            1259    32190    finish_skills    TABLE     �   CREATE TABLE public.finish_skills (
    id integer NOT NULL,
    name character varying,
    bgm_id integer,
    standby_skill_id integer
);
 !   DROP TABLE public.finish_skills;
       public         heap r       postgres    false            �            1259    32173    standby_skills    TABLE     �   CREATE TABLE public.standby_skills (
    id integer NOT NULL,
    description character varying,
    card_id integer,
    bgm_id integer
);
 "   DROP TABLE public.standby_skills;
       public         heap r       postgres    false            k           2604    32092    cards id    DEFAULT     d   ALTER TABLE ONLY public.cards ALTER COLUMN id SET DEFAULT nextval('public.cards_id_seq'::regclass);
 7   ALTER TABLE public.cards ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    217    218    218                      0    32138    active_skills 
   TABLE DATA           L   COPY public.active_skills (id, card_id, name, bgm_id, filename) FROM stdin;
    public               postgres    false    220   g)                 0    32126    background_music 
   TABLE DATA           Q   COPY public.background_music (id, description, extended_version_url) FROM stdin;
    public               postgres    false    219   ,7                 0    32089    cards 
   TABLE DATA           K   COPY public.cards (id, name, type, class, thumb, is_legendary) FROM stdin;
    public               postgres    false    218   [;                 0    32145 	   entrances 
   TABLE DATA           H   COPY public.entrances (id, card_id, name, bgm_id, filename) FROM stdin;
    public               postgres    false    221   0G                 0    32190    finish_skills 
   TABLE DATA           K   COPY public.finish_skills (id, name, bgm_id, standby_skill_id) FROM stdin;
    public               postgres    false    223   M                 0    32173    standby_skills 
   TABLE DATA           J   COPY public.standby_skills (id, description, card_id, bgm_id) FROM stdin;
    public               postgres    false    222   �N                  0    0    cards_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.cards_id_seq', 1, false);
          public               postgres    false    217            q           2606    32144     active_skills active_skills_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.active_skills
    ADD CONSTRAINT active_skills_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.active_skills DROP CONSTRAINT active_skills_pkey;
       public                 postgres    false    220            o           2606    32132 &   background_music background_music_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.background_music
    ADD CONSTRAINT background_music_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.background_music DROP CONSTRAINT background_music_pkey;
       public                 postgres    false    219            m           2606    32096    cards cards_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.cards
    ADD CONSTRAINT cards_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.cards DROP CONSTRAINT cards_pkey;
       public                 postgres    false    218            s           2606    32151    entrances entrances_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.entrances
    ADD CONSTRAINT entrances_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.entrances DROP CONSTRAINT entrances_pkey;
       public                 postgres    false    221            w           2606    32196     finish_skills finish_skills_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.finish_skills
    ADD CONSTRAINT finish_skills_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.finish_skills DROP CONSTRAINT finish_skills_pkey;
       public                 postgres    false    223            u           2606    32179 "   standby_skills standby_skills_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.standby_skills
    ADD CONSTRAINT standby_skills_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.standby_skills DROP CONSTRAINT standby_skills_pkey;
       public                 postgres    false    222            x           2606    32162 '   active_skills active_skills_bgm_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.active_skills
    ADD CONSTRAINT active_skills_bgm_id_fkey FOREIGN KEY (bgm_id) REFERENCES public.background_music(id);
 Q   ALTER TABLE ONLY public.active_skills DROP CONSTRAINT active_skills_bgm_id_fkey;
       public               postgres    false    4719    220    219            y           2606    32152 (   active_skills active_skills_card_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.active_skills
    ADD CONSTRAINT active_skills_card_id_fkey FOREIGN KEY (card_id) REFERENCES public.cards(id);
 R   ALTER TABLE ONLY public.active_skills DROP CONSTRAINT active_skills_card_id_fkey;
       public               postgres    false    4717    218    220            z           2606    32167    entrances entrances_bgm_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.entrances
    ADD CONSTRAINT entrances_bgm_id_fkey FOREIGN KEY (bgm_id) REFERENCES public.background_music(id);
 I   ALTER TABLE ONLY public.entrances DROP CONSTRAINT entrances_bgm_id_fkey;
       public               postgres    false    4719    219    221            {           2606    32157     entrances entrances_card_id_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.entrances
    ADD CONSTRAINT entrances_card_id_fkey FOREIGN KEY (card_id) REFERENCES public.cards(id);
 J   ALTER TABLE ONLY public.entrances DROP CONSTRAINT entrances_card_id_fkey;
       public               postgres    false    218    221    4717            ~           2606    32202 '   finish_skills finish_skills_bgm_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.finish_skills
    ADD CONSTRAINT finish_skills_bgm_id_fkey FOREIGN KEY (bgm_id) REFERENCES public.background_music(id);
 Q   ALTER TABLE ONLY public.finish_skills DROP CONSTRAINT finish_skills_bgm_id_fkey;
       public               postgres    false    223    219    4719                       2606    32207 1   finish_skills finish_skills_standby_skill_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.finish_skills
    ADD CONSTRAINT finish_skills_standby_skill_id_fkey FOREIGN KEY (standby_skill_id) REFERENCES public.standby_skills(id);
 [   ALTER TABLE ONLY public.finish_skills DROP CONSTRAINT finish_skills_standby_skill_id_fkey;
       public               postgres    false    222    223    4725            |           2606    32180 )   standby_skills standby_skills_bgm_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.standby_skills
    ADD CONSTRAINT standby_skills_bgm_id_fkey FOREIGN KEY (bgm_id) REFERENCES public.background_music(id);
 S   ALTER TABLE ONLY public.standby_skills DROP CONSTRAINT standby_skills_bgm_id_fkey;
       public               postgres    false    219    222    4719            }           2606    32185 *   standby_skills standby_skills_card_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.standby_skills
    ADD CONSTRAINT standby_skills_card_id_fkey FOREIGN KEY (card_id) REFERENCES public.cards(id);
 T   ALTER TABLE ONLY public.standby_skills DROP CONSTRAINT standby_skills_card_id_fkey;
       public               postgres    false    4717    222    218               �  x�uZ�n�F}&�����%^�ol�S Y7��Z��5�����pH������Tk�8��KU�:u����H�}��zȆ.����͓���
�g��N$'����V��j]'V��!-%,�j��U���`��Cb�)5o#��Uu���?t~a�Hn��ݬ�퇤���ԴD�
?�n�~3���䅲�����]S�t����ƒII'��U����u�[8��.�w��H~�հJ�����v����ُ�/��n���j�0��%)
�}���i��o��U��l)�'tۡ��hw����s"�Y�`��!<��i:�6,[>L�߾����>�����?֏�N�{ڒ�WaA�f�M7���ݝo���0Δ�D��.V���mv�=�_����qH���ǆG�6˾�7c��M�p���ߟ������2;������y�"ۀ`��RZl�����M�I�>R�`0 ���~�4�@vX�g�U{?{k�}T�QrZW�l �96��<��?�d;i�9��X>��z?�*¡:ܽ�`(�>���O������a�R�����	A���>]Vu���x�J�Jt.\��sp�m5��[���H�$SKȺ�Z���i�L �W�<�S��eΨ��ؐ�e��� ���̶��O��WN������/�����
O�'gF2Ն��r�"�ݬ���d�D��g+˴�#eN^��˥o���ۡƻpw�t��u
��B�Ǉ7��!9�j����/h�=V��ٚ�R�$�����; ��ѐ;\��A��[��?g��zv���)�"rt��ُ�iz�H_]�o����������e�:�5�J��#����ۼnP	��SnFo{����Sv�W�����6 ��p�:�$��}_�F�|����]���%�&\�7K"���~5`E�F�S��pj����N�ld��,;310�lR����Uk��������a��ʔj-)U� y'��B�eQV�G6�KKK��зƅ��Tp�JEd|�-���!Q��Eho.�J���UNaTY,�N� M �{{���U��27]�h�#��&\�Ї ��[!�x8[0��fd��ta0j��@�m��pN+����t�= �7 V `�������M�{vSS�r.����8���`�?��'���k�e���+RzOZ�� $��#OqQI�0b[(v��q�j�t��p"���qKx�lT�Yl��;���������W5b��5
�&'�����3��\�tk��1����)����PŹ�~��qj��4�G��x����2' �r8��{�]o�"��j,�ѱ�V���8�ivgBe��ّ�!>%Ř�}�C�İ���b���v���z�nT���l�xK%$�'+�4�`V�2E��1H�2�F�g���.��K]�G���nD±�)Zg�w(M��	tG,К?Я`��؅�3��.��ItW�uU?So#ߑ^��(���Y��ʼ� ���5����DX$��Rh蚠|�6^J��ۺ�7���v�������#$_>�3�LT{�kBFU�.�	4�c��D�o�,�e?�"��v�{�Y�!��-j5$)e9�S��D�N��	2�:$7t���8���D�Y�YX��P�J(%g��"rA$[�<��9���T�B͢�"�q�!pG]�g7R����0���&��	m��;���;�ૌiz_DPrKE�G����ڻz���L��
h�FTb���Qɹ��r3���6���1 ՌA�\�S^*��sB7��@��}�Z�jo���H�y�F�c����S-��F�,Dj5���e�A�z�����uT-!c%j��9)HH~����22�H7���҆��7����#��k�����"M�X�=�M�Nr����gyIL���?�꾻�Ԧ���HLOsOAC�#Q9�19W�$$�ܦ�#�Z?d��yK$jM]c�e����E�3ԂR߇��u��J���"5K}�0����g'}�UI� ��Ȉ��sZ�M$� �ST r��f��!�kx��(�I����j�/u�X��~C����X���=�z��o�M94�#��x¢]�V3���@g�0���Fy!S�e8'���#6F>\oz�C��л�YI�m�7�F����e�ԩ�Fݹ0�B1�}A�z�����K�:� kR�I�a�e���>�m~t�LB�:#n�;�
�S�7���R�>/�B<i�K�eǋ�������ygx��h�v�#?��bE�̯7��E1�P�*z5��X&��������<����>�L�b���Jڤ�xU-�����}};�FN�+Y��A|<�qՓV�=D|�cG!k�MU�{\�)滒��,�!��cH��x�Y�Vg�7Q��<�b������)b�Hg�*n3��k	�9k����|iT2d�����%�EG���i��-��@ɤ�vn��Cs���M^����[D�j��.��Ǚ�+��ʷ}Ǫ2�ȒԖ�Z��0(��]�������UF*|5t!jI>,0<�>��@EP뱗��ң��s�P��ˀB1���0�UO�q��.yb���P�x雙6(�p!J�j�檾c�
�u5�]Z(�0�(��&� ӗA2:�A�~�$��ӳ ZT�"�/C��D]�rD��n�UKhAŉR�x8��9��Ɨ��cI���	��S�A�NZ�.Ye�N�t$SIT�@:�f����`a�N�<�X�i�'��qG�0��(+��͚�	�)u�Za���>��3�����JI��?��I�����q���Z����=��j�BE4�Q����x$��}��?M܍*j��t��}?y��ّ"~N�.�*W~�پ�)U1�9(L�0�{���W]Gʍ��l�D��b�@�N�ge��*$�a��hh��6��x�/��ͭ�	�F�P(y�,�>�#�@v@m�����QiGiwT��30�{�����K!&�6�Od��M�TN;3����8��%���Ї�8�|�)G*���Z�EذΠ� 
�V��7����3̓yt=n��\�<&Rq��8"D�N�`:��Ȉ�����W�ג��T�Pq-��j)҃�Z|���g�����n���kr2 ������Q/����v��	TDHrM�{���i8D�i���pOϫ�L>2��TaL-�f`�~�.{t�(f���.�0/��`[�4�A�BcK�Ջ��uO�Zg%�=+��4�RΌક�.4�mQ_��b�ݍ{����e�X+p���R����rlQs��c����g�G�l&=}�����plx�v_��k�w_�0�l�n5>\�>?s��:�w�h5��)�J������5*�PJ?� �)��]��P�Y0)(U�	b�������������[@����&�4�Ȯ����m��ב����9���2�j���`�e02�"��V��Ղbv"`���V3h�J�f����i�?,u{           x�E�OO[g��5|
/aQ�s����*�JU"�t�EV� q��X������\,�8���<�����gޜ���O��>=��O����O���\O��KMG�G�GD%DEDeD���ś׸j\5�W����x}W�+����w���]������oP"+%+%+%+%+e���R�J+e�OY)c���2V�X)S�L�2U�T)S�L�G*e���R�J�+e���R�J�+e���l��5���R�K�/5���R�K�/�R�JY+e���R�JY+e���R�JY�W��Tl�c%h�@�z6P�a�+y/�%���m��v_��46�����hoPߠ�A��:�8hq�-�g�(t���A��R�j�:�q�G��n���;�wP��A�cl�����Aσ�M�t=({����� ���*t>(}����A�����y��A !�P��8��p< ��D�"P�\p!\p!\h���裘<�r�C�>��C}��C}���������{��}��	�G<>��C�˂<|�!|�!|(��!p!\p!\h�k�<\p!\p!\h�{�<\p!\p!\h<\p!\p!\h雛<\p!\p!\h�U�w�\Ɓq`Ɓ��	�q`Ɓq`Ɓq`�vB���80�����No;/�y8p/>����ӻ���80�=a<ƃ�`<ƃ���1��`<ƃ�`<ƃ�`<x�E�<<ƃ�`<ƃ�`<x�͑<<ƃ�`<Ɓq�WPrp`Ɓq`�o�o�o���>�}r$�A� q�8H��9,��[1y8H$���A� q�8H��M���A� q�8H���;�u��NOǾ'{�?���v���������67_�67���/7��|�>]n^���o7���6���/7o߽?����������p��g���k{u��|}������ϻ�ǟ��m{{��p|�8�c��^^����+�.�w��?��N�pu~~�xm�         �  x��Z�rܸ}���5*�I��(�"�emi��S�Bk �E�8{�?��ȏ��Dc�M��[yH�+4�F_N�nL�*̣�i�σ���m����^��I����oW����߻�>�E�ˇ��Y�q�F��������'�l[�����ɇE�b���7԰ce��`�m+��g�� �y-.��A�<mj����DP�H�8Z0��W{k��� 9�CG���Jj�L����Fy�L�;[�o?���m 1� �R-��`���vw#�aٝ�#-�m7eS�.�Ͷ7�d� �P�j��D�|����=X���c�~ث��q�@���x�x*9������&��ַ퍽�׶�z��Z����LMl�ǁ��.a�̈́���^�M��?E���?��3�nq���릩�TA��|`ҩ����U0��(�{[���M����㪸����f�?�U�=�zy?.�us}�M +�[�\����v�_u'���������T�Ts���]��`�xW��q�D�/[[c�TUp�|��8�!J\�=�ؕE��qy0[&�3�s���򨾵74��ѓ��Nv�0�igB����ʺ��wM�p����;I�\�Ra��8QQ��B@��f�bA����R�Z��,���K$����}�\�f�6"�Xum�\o����xJ�ܐq�(�Q���d����]^ii��O0>)��\�X��.��vc�q�ig���LKKg�R���} f}�0��E��o?n���=�@[X��rm+r�w�@���GD���yY7]Y�\�(�r�#�P��=r���hq��x(��N��&j��Wwź��i�ۦ�L�H��,�(����  �Ʊ�\Q��U���ܶ׶F���F�y���>�Sl� )��!��q��B �$H6KIv���2�>S���s�P�cү�mU���gEe���O���]�a
v��$�Hr�> #�/��d2����*ɼ<X�/׽�$	K(Qbefʜ����Ɋ3%���<�Ք��쁰89I����d���q��:��9���w;���TFi2_�Q�D7>�ˢGG��vO)�����+�V���w��	�en���+��'��&�ź�~�̀%Bv����`�/�(e�x��>Aܘ���q�8��@J,� �EW�V�#m�H�%i)� 5�t>��k&()0Kz8���;���B@*$Y&���H�,��Mx&%�0$=�����ɉ�*�=>��M�/ �i�S.�X;;�Eb~�96-C.'��Pv4,�`��;��G̗�z�̜t?�E�M�@ Q���@�J���
���S��T<\�	
�(��Ӣ��� ��|����4K����Nq�!�||�|(:;$�0TJQ�E�f�v)/�5�,�g߬�U�!gʮ]an����ԋb�o�br��|h𮼽��ބ-�Y<���2r~���\)�G
�%=X#gm�EEΒ��r�_<���%��U�����YJ0����yP�u�@?F""3�Ma\5�b�$�����mD��mS�+���� �WoXv_��90�\Ѿ!��^Ɔ� ����j����1�iE.����@|&��K#��,?������~[o��\6?JA u�s�����^;��Ʉ��ˡ3&����N���{�MP�]8O��:jǙ�@��H{��9�>���L�n�U�i��y�4
2ǘ�PР�O�v���mk�L&��F����\���S��
=KN����,�"�7��NI�CU�p�A�7��嬬o��˷�&�┐���cFqu�{Ir=t�"�A�6�]?xl�M'b�=�)�7kS�\��
�C`����� ��K���d��<i1��	_t&��f
�Ψ-6HH�!�T�Pp�Y���/�X��cƃ�=ި���"�&����1�ѱXh�<>�n �N8>)�2E��_�����a*�_�!O.ΐ�8�xc7]���:�7k{���d����4|�C\�H��
-����N*-�8"�짙>���h�^*O0�>�wzG�R&S*�Nl�ެ����)�L���5ٻi�f&�0/���mb�b�x{9 �/2j�����d���	W������:5Ȼ��U�CE΋rBjR��l<��#С-��d�]�-x�����O
=i�es�1?�U��_���*=����ܯ�?�g�Y�L�'\��f���dJ�E�������cNl�C����_8�e_��Q�+����W�E���� <xyU��/��yH(ܿ��7N�"��8��h�E���rlU��CΓ�3�䯍�am�B2���B�z@K�H?�v���<�C�����q��Jr&��G���ʵ�6�}~9��zȯj �|��ǹ��V���H����2�ydOz���n*��(�_x��DA�>��~!Pa6����.�y�9����Sc�BZ��Iմ%��@"��h���!��hO"������_�*���p�?k<��C\&)�Q*������汬�
�EN�<��l�Ǔ�%�F��NF�7�Dg�Ȝ��\0�a��c1��!A-��|�=�7"������/��%wC�� �FS�]���c����;����V�e8���Z���9Ŭ�=���Ư{_:�~m��v=�Q�9@�{/��ܔ�C����=?W�����IN�L�C����#��Ӄ�
 ���ɗ>TO�9��ƓINq"�Q�g����#o�آ$=�FRy�/�*F�a�L�x��8'�o5y� s[?�=��;<k�����Q��<�3�q�3(u=��/����e��H-^�s����a�3Ajb��W�&��|8*8�I+�esD�,�PO��3���/2�T��'M� l��(f���d�%/{kG�
 ���G��)<Cl|Ӿ
�ygm�L&վ����|���w+�Z�~u��ݬ�C�Pv;.A�>X��֍�t�P|<?�a��)��&;��J�$������5/規��^={��םL�         �  x�}W�n7}�b� ��6)�G;���q�N�Ƣm֫]c/N���+��R�H��̙9g�R,����\W]X�d��]V�u?V�����U��s�����^V�͵[p�_CR-f�������~��ݺ�V�Gͭ�SW�W��+�X��>O�a�\bF�X�W���]W��� ƣ��Q��Z��DU𩟭V�ovjw�0�R F�!5��/����w@3���2���A��)�YòuK��E�@4��t�o<�~-��4Xʑ$!_��x�n�^�'P��pHK��,��?�)/ӲLA#̸ dq��K�T'�w?R����1D�d��]׷��-1Y�G&^ ����mS�mW��Zc�DfD�<b��oڶ��O|c���Vi� [�q�H�U���
�)Q��Ĉ�h�1Y|���=
�1�P`�%$����nͩĲ���#,��P�H�3�L�b�\ �',�S��ɎrDcQ%�Uԙ�H��B4RU�� U�A�,��`��*�zR�����P��*���6
¼������pAL_aN��ܭ�.�\ӵ)��A1<i�߀:A2��$t��'���i���ޏM����]BcR�
��3#X�KV`³�1���j,w�~A�-=w��ҹ&���ShB)�CK��q	�vMj������	�tu]~t]Hy����˗�Zz2�ƿ�Y�*�8��k�q��O�!+�����Hv��M���Cz#�4ZSD�����̎
p�[H{�釹1^6Q��^���}xhS�Ťa�����
XDS��N3��N��i��Β`��6� �7�a�0[N}�]9}A6�.K'����4���g�f�|0�@�BbjqM6#.��i�.3���v�� �)��0F,�M	@����M��]`ѹ�)w�|��1�M(�zש^P���*�?W�}�0�$N$&�i�@0����jm�L6@�:_׀��/{Ė�b^1�K��#��=���6;�e��(,6�@"���7�����ۼ���Jg���P�~�����wi�Y��D"���`�D�Y���_e��� �ak�Kә�b�dd���-�}�j�ܔ�]�N��5?�,L�x���8��"9����:2��8�7A�,��r�(8<��Y}{���([��K	E�On �Ӻ�|�.Ӓ)-؜�t�^(�X��L�)5��yl�\ٗ+�3��������e��y�M��r�a	6�c�Ơ��]VnC�j$�T��pp�`���Qt�F�C��J��c[?��]�i^u؞�4Lо��naX�wfu��޻�7��nF�h�zQ9-h��o��՟w��I��"�J����O�;j;��6��(b1'�����6e�}�}�+?�88ȲN� ���6-[>K%T�D��k�عn�SpE.���^dA�ׄ�6�Hep�U�`�5�fOT�� ��Sn5����>�߈�D��HFA���6Cu��=�4��RS���^�3�$[O)��!�9��         {  x�]��n�0E�ï`?����ki�RA�:]Ȇ���t(����#ً&$�{�P��l�M|�W�J�f���&�Hq%�]��/�d~�.�g�	�>�֛d��%�$ܛ?��]��N9F��W/�u��=�n��=#ߦd�7�e5k��mv�?����._2�ĆUp0v6�ʷ�ѧk��Y�������pF~pf@6�dB�>�>x��)��K�ֹ�9]�o<�~��	A)J���`�a���񿆠�$���|2�h�h@U��5po��y��w!�
հ�y8�h���3#�U�k,�5�u3�Ċ�)��b�|C��_g��,��n�k�	�	��䝑��Jj�r���`����C           x�}�1k�0�gݯ��8Kc�ɒ����v)8
Y�X$"�\\{ȿ���!��E��{��)Q�߮����ȸj�=>�M����]g��l��g,����L)3,1�0Y�cZ�C���@*�d���"#�E�Q��d��Z�L�H�P�0$���L^��o�bJ�RϮm
h��I�����dQ��\���L���^�P*�|�´�H��9�(���V�!��W�w��<�0�{�\�I]��R���X�2���9i��NM�w���w��n0y�+�N9NML�X�� ~VČ     