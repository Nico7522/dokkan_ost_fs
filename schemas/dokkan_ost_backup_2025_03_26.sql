PGDMP  '    7    	            }         
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
    public               postgres    false    219   A5                 0    32089    cards 
   TABLE DATA           K   COPY public.cards (id, name, type, class, thumb, is_legendary) FROM stdin;
    public               postgres    false    218   m9                 0    32145 	   entrances 
   TABLE DATA           H   COPY public.entrances (id, card_id, name, bgm_id, filename) FROM stdin;
    public               postgres    false    221   6E                 0    32190    finish_skills 
   TABLE DATA           K   COPY public.finish_skills (id, name, bgm_id, standby_skill_id) FROM stdin;
    public               postgres    false    223   `J                 0    32173    standby_skills 
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
       public               postgres    false    4717    222    218               �  x�uY�n��}���=7/����i`�+b��3� �Ԗ8�H����頻�LE��	��k;Uu�G��H�3ZG:��>�+����$���߁I�{�S]_]���?���GmqH'_��٫jPC�n��0�b�(,�w���Ǿj�RK�SE�e�D,0����Vw˪��x��S��,�;1�|)>�
�9%�i���|��~Y��Qn�H��-�u��|*�v��?d|(��簢~�:��ӎԙ���ㇾ��,�rVjR6���k벛/b�YF"9Y{ߕM��v���(�e[�	y�pź���v���%��gWu���lv��ޝ:�%	9\���:f�]N��u尌�fSv��R���W�:?{Rw�ʫ�r�{�ɜ �Sd�~��E������y�_����������ٳ�^�vA�(��8F�.���7�|3T���l���{��Kc�v)���HH �k&��?������d^km�X$��c�9LY�0>��G��n��VU/��>#��ac3vMS�n����)瞊㴜CJ,.X�Zݔ��;�>����?����I�-�5��}D�70�X�z�b�]�c�i˙έ�M���X׭xe٫<�;��kS!]�:$����@a��_Е\by*�_ܷ�??>�����!�pS��e�[���}�,c'�DuwB�uO�Å�@Z7$��Z�Ǻ�KD�I:A���]��j��ܯ�ګ��u�$Y�J��ėV]��%�[NFa�#2|\�G��]l;baEȑǝ�	��B�ӷ(�t�g�g��]��fu�F�����XL�K5�,��:��E����:[�e�8�c��|WQOG_�;ǰ`��X��9!�Z,Q�c��d��5�wtZ�%Y�Wk��h�g۹�Ah�q4ɦ�;�Ф(�߮T�r� �T��o���g"�7�n��D�F,�3�u�a%U��~[��Z}���_���Dhg�hf��D��CKy���!	ʴђ�����ĉ`M�3�U��㓌!�V����0��h�iki^�������g�NE���[����lY6�T�L������8#�i��=W�����j<�W����er7� }��Q��Z���	~�N��+բ����lu��p�Ť<\�p���v��>�r�؊�E�N�	󘧡qqJp�W�OT��&�0M/��rڽe��e˦a1A�O�U�EX3(q������q];�P� -F ��;��i�
�N�vnG�%�
q	prVv�'���e�D%ZHᛖ���I]��FȀN��̒`�_����}E�,��DlOi�S�S���'PKM,n&�+G��x揪���.[tʉ���"�pt\)T�M�L���|L�GuWV�e�(�TnFX��"^�	*F�q5�h�����:u���2�]aɭG����y5a6&�:��w��J��"2Ŗc
�
�1:��������A���<�T�q�2Ujl)$�c��u�-�F�IY��PwI1������}�4x}�s$�C����џl*aY᫸�Yј����FbL��"+aK���ɘ@�%$��wJ82�kJ⪙U�p��)�H/�p��mV,�)��.�52]],�z�+�AM�kɸ�U��.tC����p�K�7�O�q�@�b��,2_��J�h�8'�F���I%����ޓ�I!�f�3��)�K h&��+i����;���aۂ��$��9�ʰ�|�7]�U�dR��R���t�5��2T.�	Ƅ���rn���=ٕ	t�a�����4�ac+Y��5o\Z�*���.j�D��7!d�;]׎���i�NNpd2�@��7OEB�L��:M9�U\̅�G��j�u�{���0C��d&�,��Ti��C���m۫3"���pd2�̦���.�5}VIP(���g����_5�U�&P7��ב�vH͎O�;uhe9�*�_3D3�V3u���[�9$�s-������&H-�"G�$��6���f�ʓ���P�y���I��s�ǻ宦��y��ɏ5��DB�	�B�<ik��l8F���_����-�F�$��EVO[b�������>y�V_��Xq���Fnp�yG�`�p�r��EZ ;?���fe1���o+u�~��c}�����6�-�[^%�k�]�L��-+04Ƚc� ��*��l ��0���E�������dn�z`WA�R��{���hdɘ7����5�2"��DXC��2f��]��*����i$����)������:ݗ�q �ɛ�u\e9�+�}|�.� Yߤ���#+;b*� ��]�n	|TW�f�����"���6ne3����KÖh�le	��K�w�*{�AL�Z����lv]��T���i;�6��h�p٪�P�<+v�d�Z�4�I����'n��b���ל���e��4(�$����ھq^F�.�)�{3��fkI��=
zey�M�	�<��0��˶��p���3���D�������ذ�$<.
b~�Њ��\����f�=��].P�����HSC��I#�� H�V���|������<r��,� ކ9�p�
�m����d�R�����\И>-����h�5�#Qu���ȓ�'��7���k�J��1��D8!�FSA͕��	w���c�[^p�l剰z*n1���)/�Lo� k�KL�p�2�|g��@SӴx�;�q�(�&d.������k$�J!Aov#jMp�P�z7��j0K�3M��ߑ,������¨ʹ�o�u'��h�M�A���	~7f�qYq��Y�z�]�۱��%�.k�a����esH!�&� %6��ڇ��� (Y�$�-�C ew�>юC��4���Ƅ�c���:��7���"9M$a��:��%���M��%�i��1Y�����25�u95���i���Lz��z�&~�Y�0�SKL�m���;P+]����VIw&�4��C�H���L^fҽ��́lx1���n��=��<g�F^�0��f#���������V�           x�=�OO[g��5|
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