PGDMP  4                    }        
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
    public               postgres    false    219   K7                 0    32089    cards 
   TABLE DATA           K   COPY public.cards (id, name, type, class, thumb, is_legendary) FROM stdin;
    public               postgres    false    218   z;                 0    32145 	   entrances 
   TABLE DATA           H   COPY public.entrances (id, card_id, name, bgm_id, filename) FROM stdin;
    public               postgres    false    221   OG                 0    32190    finish_skills 
   TABLE DATA           K   COPY public.finish_skills (id, name, bgm_id, standby_skill_id) FROM stdin;
    public               postgres    false    223   =M                 0    32173    standby_skills 
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
       public               postgres    false    4717    222    218               �  x�uZ]oܶ}�~�҇���B$EQ|*���o۹A���K{Uk��V����{f�k�fn���=C�gΜUj�X-*aEr;��������]bU��Ң��[U���P��D��~�K��)Er�Ə������M�v�I�p[�UA)J�V.;\=��}��n�C�`II��"����e�}v2/�P|g�� l9i��͎l�~K�
%XB�e��[�<�a�2�n��y���t�d��+T�n��_��]�ŏ!�3��e�]���O��S����x#�Ot���x��i1��|���-�YòF�?��M�,`�2;q�u���e�"ْd�����������w�%��`���b�$
����"٧�!�Tw�+C�Ҳ�
%�Mݍ���e�rCT|pA�
c���̎����[����P�����*JCaT����������<��E t"r�rx{�w;@P����OWu3 (:VS�VI�[�=�������r�H�$QC�u�wx=z��~� ��$�<OeΒ9g�P/��D��g7$H����p��)q��s���ɉ�_��<�kC�B1$�?+<�K��dZh�`�u��U&-IX�+����JK�R���Y�\�����!%�NQ�e^�H2R�y|���,.�Y� l�l܂���0��NEJ©�\؀�Ά�����?�������?��.P�)"GW�����W�Բ�2��������)\�)�����G�����Uӹ�p��cBo�v@-(Qm�Zo��ͪ^����P? ?foi��/ש�`H���%�����/by�Z~y�Ew5�]�^4�Q���V�����"Ei�����D/��h�H)�Ŀ�g�@�qC�_�����oP	_�J�W�J��ґwu,��?������)A��:���*����S�|�>�B�D��������U�Ө6P�5n(8@%���Oq�\w�ٹ�"5$�`d���+|$pd��+ �=S F@�ThN�B��'� @ۛ��Nk����t�H�wI�J����E��{vm�{v�PӲ6����8����4��;8�۰m q��ʔޓ�99(������yQK�aĶT츅����g�(�7R��wԁw�AU|��A���^4��?��@}�m�aé`���
���:G�v�K�("Y��E��(��tʒ�NSǹ�4�i�{Sp�̣�*<`iY��)��9\�Ã�n6�Ќ�mU]Koa�W5�m��,�����񵈨o)Z��N{�8����`5oa��K�X�ߍ�p���D��K/����1M�H�Y�h�{�)~%��"�5�R��ɡj�Qp��~���[S��b �����U�6B*O�(J�)q!|A���n���>$���"}�(+��.�)�`����4yA$�{k�>-|&UA+�d& ��U�?}]w�fp[�-�V'����d����uv[?R�]5[4`t5�R�c.;&N0��d�q/�iQ��'����ɗﳶ %�*'y��9։�4��ă�<��]���O��ϼ����nV��A)�W��y�l
���sȧi;"��ʣ�P3�EN	����>���(~�#�	U�}qn�}�d������elo�頻���4���J��ѣm���}w�,���
h_��O�2�J�(q:��+:�v�,rnVc��T��DPs�oy��Gd/	Y:��z/�PE�{��UeJ�Cь�ɂ�N���&
e)R�Y#�\=��C�Z:j[G�22f��P���������1�"��tsO�̮l�~O���?��4�^,RG�U���d�$���y�W���h������;Gc��~N���1�������Y�ɐ�����6EAݹ1;u/[Q���KOW��wݠ*c����>\�	�}!@���(RA���q������";��N��1h�A9�~�۵���=|V|z�J�}yB�I�̔\���t�g��Xb"�ð�
����=�7�#9S$�_�_d;T�� R�dh���e�ɻ%�IY!�տ��6���+��`��r�9�e�,h�D}p����2�}�z��>y>e�2����vTC<�c}�)ޖ~�"g˖8K�LS����d�p0��J�vp���s��CnRey��E�elLAe�j^* `�:q�����>��e\�(��dƗ M&����e{����=�hL�mB1��>�w�+5��~h	�bU��ԏm��i�ώm�!���)��A������W5�bEI��O����@���R��XS]�[H?��PjZ0�!�L��2�:U�<�S�������u�ơ��v����'~P�x��z ^78C"l�;
���Աx���b�k_~���ќfSN	�B����ʖ�I�1����$��� E�qB��q��q�#�i�'�x��nA�}DU/iC6�p��m*�M1'���1��[�R~�C��!���Vv��"g09�^^���6��7+�=3�hm$+b���v.�R�rg ��%���O��zG4|R
I�������	ó����Ƥ=E���$	M�*nY
�����WQ�-W<&����K}��}m��S�|=T<�4��us���?��ti�j�ꤢ-���.�щ�{�m�P-��B�P�WE�_?ܬ@@��#���CWEp,�[JUċ<�����V��|݆�z�
�^;H*ܲ���+"J��N���%���f�G(F儜������ �o�ğ�ңRel0pϐO�h�.}� �.�³6��X�VS��	xE`k�8��PC�����E
��BJI
�O<�������i��YѨ��d�-�M�gߛ�����s�!V���~�m���`%h�x�.�}���{��n]��b�&�ĆQl=��"^�+�W�H5��<;l#ꍗ<�x��H��W�Fay��r�y��CAM���H[*��f_�c�C�?6��=m3����`c�r:�s�J���t�:��3��kX��F��؏��s[��-�a��jb��o��ߺ�]�}��gyY�1��}� �w�X�<Z�"R�s`nN_��Z�n�.��{1tx���z����@����kr�P��+R/�I�����?@�f���m��3 ��4���v���y8D4��[���E�[/�� ZQ�0����'��cv5��C���!�5�+��A�-!��@W��%�C���~�,�1_	�ދꕚc�	�ઑ��3w�/�i�@��O{��� �hؕ�.��L��=��?�;�Lw�����	�� ���j�e�u����K5��V��㽉���GL�����ƤP1tO��P�f'�F8��"�b����x�}(T4(�,�*�6
1�N�B���ÍI���j�`��|���,�	�kT�a�|�������>�<�Ogď��察gG#&h)���v�^P̎L�9�U��w�7��)����y���hU���Ϯh�j�e��1�ᒠ���Q�6�CREM'�0�7w� }[�o�h�t�׿�4�s$��           x�E�OO[g��5|
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