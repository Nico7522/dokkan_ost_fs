PGDMP      -                }         
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
    public               postgres    false    219   %5                 0    32089    cards 
   TABLE DATA           K   COPY public.cards (id, name, type, class, thumb, is_legendary) FROM stdin;
    public               postgres    false    218   Q9                 0    32145 	   entrances 
   TABLE DATA           H   COPY public.entrances (id, card_id, name, bgm_id, filename) FROM stdin;
    public               postgres    false    221   E                 0    32190    finish_skills 
   TABLE DATA           K   COPY public.finish_skills (id, name, bgm_id, standby_skill_id) FROM stdin;
    public               postgres    false    223   DJ                 0    32173    standby_skills 
   TABLE DATA           J   COPY public.standby_skills (id, description, card_id, bgm_id) FROM stdin;
    public               postgres    false    222   �K                  0    0    cards_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.cards_id_seq', 1, false);
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
       public               postgres    false    4717    222    218               �  x�uY�N#I}.�"���aUy��ӈ;�aaz�H#�
;�k(WYu���~OD���f�E���'ND���.*�֑�����/�O���_�90	�g:��������*����O,j�M:)��Ɨ�^U�ZuW6�Q�Eay�+tt1�Uۨ�jX�9U�Y6I�US�j��������DY�6��k�3���GYA�Nl�b]�NG]���m�,�r���&���U�3�7�VG�m�];�겝Ey��1/�8����X��]��(w"�4�Q_˗�k�(�x!�Ss�r7��mTsAՑ?&����S�v+�5{eR��P��u�mo/U��	Y������j�Q�.[v9��t�c�(�U��IF��	�_�*8��	М���<i�OQ�7v	/�� 3L�}-�~t�(%��(�qT����F���Ǯ���_�YJ������5i�^]�S�Ð�̴0:w^]v�|?l#���O2d�:t����׽:���� ��f�R����j6��>�f�����P��4���l�R��O�Hh&C&�����J�/����m��$��1�Sf� K@�nD\�g5�݇�{����/�5��e	���e���������^�y�Q�?԰g�)�w]��^ݖ3O�}V�`%�le)��~���n��W��v5����fS�O?���䄄�za�.��=Җ]˭�u�8���[�ʲWy�|p����Blq�����+"��2�g~N���Sِ���`����7=~s�[.|��O���pҾ�����gb��>��u/���@�n$�xu�\�uOe�!�iՋ�v���)�8S~Y�^�����rT
�R ����w-e��`F��>�6�&�c+F�<�|M�n���K��LOC	q^�)
�:���
Hq}@�f3	/�ɢ��o�+稬_�G�Bdؖ9j���U����C�3�s�P��F��n��1C.�	q��;:���n�+��r9g�|� %:fM��'`���!4)��kU.��H-�{��
��Ď*p3�vJ�N���r:�����d�}\�_�Z}��ן��iV�Z�1�|�=�R`�w�t�P����v��$N,@k::��T�@Kҵ4�
I����`�9���������E:��Co�>Z�N�`��Z���Tg�|�U���N)�S���l0v+f�|E�V8�k�:�������L�ȫ�*�A��`�^)f�YB뤝�����(m��E�I�	�[�qqJt�U�Od��G{�IB/��r�}D�ăe�eӰ�����qT*?��OK�j`��}�,�c�I���ݒ����k$QDf����9J������-O�\Q�` �J�Ё�\��_/�r�7�t"Ng�;�N��*�d!�&r���=e9�
JyR� hbq3�X9jo�ST5G8��E��rW����3��i_i1x��bդ���F��nF$ў/p-��$e4jy���D�:���⸈WXr�ҥ��^m� #2���I�}RM��4�)62Y4Z����L�n/����I�-�G���+ۇ��@�c�<&�P�ݔ�ܯ�>)��������?U�>yj���9�q���!j&�+�	X�X73+'f;4Fo����
lI�y6�@B�~�@�#c\S�ʹ��p܌��n[���E8�:�U�F���E�oj�6��Hf-&��
�٥n��9�:%��R�M�ӹ n d`.Z���	`��=d6�v��Ⱦ|�"��=�g��K��r�C�T% ��	�@�J�lr,�N��G���;�z@`ĩ2,~��M�b�4���(��z�}�db2�̄c�YR*9wu��A]����	uDa�����v,��Y05�ؑ�k>���*�A�J�#S-��m�q����|���b���L����|I��o3>�4�t��4��%#��m�T�������CD�d&�̿TTi��C��i�e۫s���02�ee�R]WW��í�����j����sE��궝�:�R����t'�LrEx5��!𴚪s\�0H�`)�k�<�]�A*�����B�ZK*��Z(�0ܔv8B��=�2&~B0y���j�a�6����z_�X.��H+ȓ����ʄcD[q���2�~��ͧ�7-�z֒R��6/�*����J}_�{˭�_N\2��!�4��0�l!p����1ì�"�p����JU�_��1>M�����1M�Zܷ<J`�:����xyWVP(�{�,�#�r��P�g������ 3'=B����]�(������5���#�w���V�y=b���2�r�?�Z[����4�o�i�YV�(R�H�I�e41@�>B3�d����
�LVζ+e6����e1�N���[=�Jg�F�<���0�S��Ŝ�U|�d�����4"A*x���Iw��t#�7/R��>0�v|J��	W�����h�pvY���n�i��m)�|9�w�>�Yx�bo
���bÐ�p�-H,�JS��nz��jk��
j�[.������T��9҈�,�RgU7�#лm��K�����_d�䶡�&��d���7��K�#y�3�)�lge���5��zh9#O��p��1���ߛw��y�{��-F8��F4FA��G�-��D֓6�7��r��\�R��p��{�[P�ޖ��֨�W(��dn���F6l_M����=4�r�BS��nnRv�ڇdš��g��&<迨��frk4U6K6m@z�=��^,?M��qӅ�i�T��p�hhtk9�����S�y\_��C؊kE̶Tk&-���:�.Jڰ�ŕ���lH��&���k�`x��D%�X� iw�:юC�Bc�mc��1�O��������";M}ukdt"�奺�G��$q�f�^����e5���T�_F�]O:�S4r�!�ɏ�赘$����oK?�-�4hA3�Z�J4H~6}Y���Mc�K��L�da�3ҽ���_�>88�kΞ           x�=�OO[g��5|
/aQ�s����*�JU"�t�EV� q��X������74���3������Ƿ�q��S��O�<=��s:=��s9=��3��R�Q�Q�QQ	QQQ!�q��5�W���U�q1^�J1�C���]�q׸k<k<k<k<�ԇ�J�J�J�J�J+e���R�J�SV�X)c���2V�T)S�L�2U�T)��J�*e���R�J�+e���R�J�+e�[�s�/5���R�K�/5���R�Ũ��R�JY+e���R�JY+e���RV���a��@�Z6P���mX�J޹��uY��]��k��F�CuC]}>���7(p���A��-�%�L�T:�tP��A��^G6N�v����A��z�
4<�x���<Z�<�yP���AՃ�e�S�Q���A���Z�>�}P���<"�� A� `8 
��G�� D " �P*��B�.��B�.�}�}��Y.|�!|�Ot|�����N^��}����|��}��C�>�,�Ç�!|�!|�orp!\p!\ƾ��Åp!\p!\���Åp!\p!\�h�Åp!\p!\����Åp!\p!\�^z`��q`Ɓq`8z�`Ɓq`Ɓq`Vo'���80���8p�:����s^w�Á{��ͧW��}p`Ɓq`�	��x0���x0��������x0���x0���S/z���x0���x0���so����x0���80�/������80��������I�� ����A� ��a)�ފ��A� q�8H$���A��l�p�8H$���A���I��Wuz:�=ٛ��������~��}}������{����}�|��z�����������v�����es�����z�����O����~��=7��^��now�o��O?�iw����n����o�w�7���ϯf^�xt�#��i������4Kk�         �  x��Z�rܸ}���5*�I��(�"�emi��S�Bk �E�8{�?��ȏ��Dc�M��[yH�+4�F_N�nL�*̣�i�σ���m����^��I����oW����߻�>�E�ˇ��Y�q�F��������'�l[�����ɇE�b���7԰ce��`�m+��g�� �y-.��A�<mj����DP�H�8Z0��W{k��� 9�CG���Jj�L����Fy�L�;[�o?���m 1� �R-��`���vw#�aٝ�#-�m7eS�.�Ͷ7�d� �P�j��D�|����=X���c�~ث��q�@���x�x*9������&��ַ퍽�׶�z��Z����LMl�ǁ��.a�̈́���^�M��?E���?��3�nq���릩�TA��|`ҩ����U0��(�{[���M����㪸����f�?�U�=�zy?.�us}�M +�[�\����v�_u'���������T�Ts���]��`�xW��q�D�/[[c�TUp�|��8�!J\�=�ؕE��qy0[&�3�s���򨾵74��ѓ��Nv�0�igB����ʺ��wM�p����;I�\�Ra��8QQ��B@��f�bA����R�Z��,���K$����}�\�f�6"�Xum�\o����xJ�ܐq�(�Q���d����]^ii��O0>)��\�X��.��vc�q�ig���LKKg�R���} f}�0��E��o?n���=�@[X��rm+r�w�@���GD���yY7]Y�\�(�r�#�P��=r���hq��x(��N��&j��Wwź��i�ۦ�L�H��,�(����  �Ʊ�\Q��U���ܶ׶F���F�y���>�Sl� )��!��q��B �$H6KIv���2�>S���s�P�cү�mU���gEe���O���]�a
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
�EN�<��l�Ǔ�%�F��NF�7�Dg�Ȝ��\0�a��c1��!A-��|�=�7"������/��%wC�� �FS�]���c����;����V�e8���Z���9Ŭ�=���Ư{_:�~m��v=�Q�9@�ӛ�4������M�LL7��c����C��o�t����w>"Ob-�l�sFNX"OQ��e�����b�t�$=�FRy���E���L��x��8��//y�􁇭ǅx!)��[���dA��8�����: ��	n��ڲ�y�o�"��?�ш�(1��+V��?>�����i��� dM�*'j��ѿ��E�g��O�m�Y��P��0����5��o@HYߊ�S���!ҽi_����j&sgߎ�hj�?��{�{ �}��s�n��|(;����,�e�Fv3:r�
>���=��T�����t�S^�x��6��g�G�o��={�_`�>�           x�}W�n7}^}��6����G)���vD�%E ��h�Պ�������L�J}2dgΜ9��/J���JY2���^�Wd�Z�����;�nv�۶Vv�����o�cd�&�G�*2�e[2��\p�	M/�ܪ�%�#LzX�aB�̻���\�gHo�d>�?��/��W�x%^[`���:�%TvU���y\�8)ir�5�Y�ڨ�{��4�8�����wY�"�$�<^umW�S��b؂��s_�*r���e�VE��gX��l��bA��CXA��@H
"��z����R�4��6�UDc(*�=��Uk6��$H*B����>���U��?�oP��Zkk�c\)+�6PR�����K���󃐏��8���m��j[/n��2dX
�;�:2�Sq\��`H�D���H�C�@V>L]v]���+�4���ߐ�VZ?J *((㮫+����+Oa�~��GE�+mkw�"q9e�'m(�3��
,�#ɹƹ!*�\�j�9(a�(1;�B�����9b%��y��U�6N�cs��]��,rAs ��/h���865�
/�J= l��l�*�)�����|�� ��Zw��N���0:>
�N�9�r�U	㲫I��1-��Ƨ�]1-���ں�8 NšDr�(�>��p����2U|��f�p������^�;s���S�3�#�¯�p8�eR�rУS�;8�I�W+����Ư��0��Q�F�B�	�֮z��']�D
�F3ժi��9jI�:���SB��o�\�LQ��ʝ�n]��	�A�õoնU�rΌ}��[��@؅>�8�n%����v@x��*���3��%��(C�I�_�}�G��P�YhrA��=��̹�k�B��2r�	����PV�K��7�:�+�N÷�{�	9c��4ۓ�Ԋ|�Mk,����<��G�C��Ē
_k�BZ�\���`�/!��_nn@�v��g��V-��_{�b�Uz��J��a#�H�DK��dj���}�D%rU�������U��a��-Pyf�h͓���:��e)l��>�RM,�i���4槀�bh�p�O�a�)��C�Mk�u�EO�`8�9C�g�Te�\����GP��9��'�m|k�[|7�p;9�-��,dV�ڸ���%"x����O��W�ҁ��]�2�S^��E�O"\��I �s��[Y4���^?��^��4��Q~����N�"��Z����ذ��}��Ƚ��f�Wն���)�@#��U}9�h����a���h4�&�>         {  x�]��n�0E�ï`?����ki�RA�:]Ȇ���t(����#ً&$�{�P��l�M|�W�J�f���&�Hq%�]��/�d~�.�g�	�>�֛d��%�$ܛ?��]��N9F��W/�u��=�n��=#ߦd�7�e5k��mv�?����._2�ĆUp0v6�ʷ�ѧk��Y�������pF~pf@6�dB�>�>x��)��K�ֹ�9]�o<�~��	A)J���`�a���񿆠�$���|2�h�h@U��5po��y��w!�
հ�y8�h���3#�U�k,�5�u3�Ċ�)��b�|C��_g��,��n�k�	�	��䝑��Jj�r���`����C           x�}�1k�0�gݯ��8Kc�ɒ����v)8
Y�X$"�\\{ȿ���!��E��{��)Q�߮����ȸj�=>�M����]g��l��g,����L)3,1�0Y�cZ�C���@*�d���"#�E�Q��d��Z�L�H�P�0$���L^��o�bJ�RϮm
h��I�����dQ��\���L���^�P*�|�´�H��9�(���V�!��W�w��<�0�{�\�I]��R���X�2���9i��NM�w���w��n0y�+�N9NML�X�� ~VČ     