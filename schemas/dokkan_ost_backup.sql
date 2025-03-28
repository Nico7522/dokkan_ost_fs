PGDMP                      }         
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
    bgm_id integer
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
    bgm_id integer
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
   TABLE DATA           B   COPY public.active_skills (id, card_id, name, bgm_id) FROM stdin;
    public               postgres    false    220   )                 0    32126    background_music 
   TABLE DATA           Q   COPY public.background_music (id, description, extended_version_url) FROM stdin;
    public               postgres    false    219   l4                 0    32089    cards 
   TABLE DATA           K   COPY public.cards (id, name, type, class, thumb, is_legendary) FROM stdin;
    public               postgres    false    218   �8                 0    32145 	   entrances 
   TABLE DATA           >   COPY public.entrances (id, card_id, name, bgm_id) FROM stdin;
    public               postgres    false    221   gD                 0    32190    finish_skills 
   TABLE DATA           K   COPY public.finish_skills (id, name, bgm_id, standby_skill_id) FROM stdin;
    public               postgres    false    223   PI                 0    32173    standby_skills 
   TABLE DATA           J   COPY public.standby_skills (id, description, card_id, bgm_id) FROM stdin;
    public               postgres    false    222   �J                  0    0    cards_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.cards_id_seq', 1, false);
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
       public               postgres    false    4717    222    218               I  x�uX�R�J]K_!�bzs�P=��Z���@4D@q#f#���E��M���4�n3�� ���|�<Y�&�PV+���g��Z�9�K
�ꂄN�*�8��ʾ�u�U%�J���*>���K��!��j��*���|Wu�f��0���ęTr���n�&���m̎���<'�L��r5��f1q!-LbsJ����jWO]����xT�Ae� ��cv?�W�ש���SF%�]��n\e��4�E�s�����ؐ�{�}���ޫ�[�\�ݐx�*�7y���4o�A��%�un`����bcHu�>Q��?y�=�JXz�
ں�%A��]�9~?�9�W-��X��8O!�-��&�G�u��{��[<&���`	yőUy�Z�)��Ъ�L�B��8��ZO&���j�'J�i�nWRm_V�C'��]����jW�2)'X�%p?��y�!���(eӂ�8fC���r�����m�S��*ҒB�sJ�E=��Ib;�(���P���QeZ�jK
L���T(�.u"���O�š�����^)�:��"��
��,uJ���)��}#�}]��8G�+X~%7j��-;[�+�E�ԑ��ٿK��c�����]̮�i�.<��P�3�U�~�b�n�w�׿v}Cz>����~!��k)g�@�̞|��D�<�F�����~.�N|0*�g�m���L����d�?�n�ө/E���}�P����~�.��K�p�&�:�P�wo�/cS�D�.<������S�X?RI��r��W�>�:u�I�X6�fM��qQ51�Y�M�X��+�`�v�E�;�h�ҠE��9j����n1�<F4,��ǆ*��e�@ Қ�5ME}��	�+;�4�A�^~�ARG�|7���kv�W3�ܗ�C�4p�!�P�}M�:cs �Mג�����R���Xm��YNI�B!���dN��ŒT/�o��*s�.�Q�ŏ']����̪�a�ڔ~;�JJN��Y�������F��/)k��a�}i��[����F�W`8(z�K�-�^!�������$���CCa!��j���w/����Ha���Ȩ;$ �c�(�=��b⤸S��A��^ͳs���fi������U� �DP�Z�-wZ��n�L�j۲Lu`����K�Yo��Y|��ɔ������3uy��Ύ�YvCw���a01���2"��#�l{D)ځ�۠#��j��hI0�k�Gx8jC?�o��:>���H ���h���6/�:����p�q���T��j��~�qDўTm�:(V��J��&:z���bz�����چ�Ĉ2�"�d$P>�U�=��?�v�x8_p{�UuV���ǘ��9H��B����8���=g�#lP���i����gv_S��V��%sB"��I�p��<XhG�xX�����xn���
U.[�mF��v/$!�Hʵ$��귪�(vԥ� z�cS�&�5Q>� �d�	�H���_�M�6��	D��'1ۢ3�Yh1��u0���D!l��T�����P�y���bv�(y*���b]�w�"`����)��UWU?��^��z��p������?u�=F����5R��Z��nR�JG!���3r��)HL`�������(?��t�{���{����D�/�I�6��)��㫯;:� ��~JU�X�kjs�ћ�ގP}�r�pT#��EH������;�kd/1Ոֺ1X�\�W��V�e#i�hS���#��i�AĆf��nY����7zZ��(�M��!l�k�`���,s��a�'Fl��vhX!%��+����]��8�A�)	n���Cv�Vd�C5k(��t�v�h.N��-q����J褂������]�d�^���b���6�g4��)$��1��-w��(�t�RC�PM�D\鎈��E[/����a#���Q`�$��E���+p4fgD�8����P6��!Y"�SJ��/h��;�l�j���\w��$X$��ʝ2X����!R r�UO�30{�"0�)��?���� ��d!�5���qV�J���ZXN��l'�7n���Ͷ��d3�ի}�b4S��N���x�e%1X/�����?�z�y���?�߫;��Q��g��}�q��X�3�u���ۀ�'���4'�b!�.l;鐷)�T�9���v[?��'백�W��9L��f	�<~�2���22�(#���n����}/�6Bk8���on�^���mu���xn��������������b�-��wm��g�=�ݍ�.L�;�t]��.�̘-T6 n�;k�V��s4^ �1V��=�r;���Ζ�m�����O@��CI��/�&=^ҽ\ˁV폵ɔt-{'/#c?4�ݼ�L�c5��Ub=ǰ���?����*��j3QhGA.�b�2�^܌�bה�𤇟�#� ����DN�~xC��ۺ���3R�Y.ߢ�������i�yli>�Vh�r��O����+4c�O�9�[G�+�lZ�~�o�B�b;� �[I�`yZfk��fʾE�,�f�d�|3W��<��կMf�ۡ+�޺��Ai/ ���-o��r31��Q��[Q��wA�0׋=v-�
�z^�C̈��b��Ё����Sl�R��X��'����X�m���پ,�&�NԻ@����{���� �p$�Hpp�Az3��4�M�@��f��ua;Z�w�I0
�~2m�z,�_k���;�^���r����!���MN�v����S�a�AdիQ4a��v(O��`�J܆���J�l�������8>c���aR��<���Vi�s�%�����;M����9�           x�=�OO[g��5|
/aQ�s����*�JU"�t�EV� q��X������7��8���<_����^���O��>=��O����O���\O�ꥦ�ƣ���"�2�BT���k\5�W���U�b���+ŕb~�Jq���]�q�x�x�x�x�7�/����������2V�X)c���2򧬔�R�J+e���R�J�*e���R&�#�2U�T)S�̕2W�\)s�̕2W��?���_j|��Ɨ_j|����Q)K����V�Z)k����V�Z)k����F�*6б���l�f=(ڰ�J޹��uY��]��k��F�CuC]}����7(p���A��-�%�L�T:�tP��A��^G6N�v����A��z�
4<�x���<Z�<�yP���AՃ�e�S�Q���A���Z�>�}P���<"�� A� `8 
��G�� D " �P*��B�.��B�.�}�}��Y.|�!|�Ot|�����N^��}����|��}��C�>�,�Ç�!|�!|�orp!\p!\ƾ��Åp!\p!\���Åp!\p!\�h�Åp!\p!\����Åp!\p!\�^z`��q`Ɓq`8z�`Ɓq`Ɓq`Vo'���80���8p�:����s^w�Á{��ͧW��}p`Ɓq`�	��x0���x0��������x0���x0���S/z���x0���x0���so����x0���80�/������80��������I�� ����A� ��a)�ފ��A� q�8H$���A��l�p�8H$���A���I��Wuz:�=ٛ��������~��}}������{����}�|��z�����������v�����es�����z�����O����~��=7��^��now�o��O?�iw����n�����O������f��xt�#�z������?�i�         �  x��Z�rܸ}���5*�I��(�"�emi��S�Bk �E�8{�?��ȏ��Dc�M��[yH�+4�F_N�nL�*̣�i�σ���m����^��I����oW����߻�>�E�ˇ��Y�q�F��������'�l[�����ɇE�b���7԰ce��`�m+��g�� �y-.��A�<mj����DP�H�8Z0��W{k��� 9�CG���Jj�L����Fy�L�;[�o?���m 1� �R-��`���vw#�aٝ�#-�m7eS�.�Ͷ7�d� �P�j��D�|����=X���c�~ث��q�@���x�x*9������&��ַ퍽�׶�z��Z����LMl�ǁ��.a�̈́���^�M��?E���?��3�nq���릩�TA��|`ҩ����U0��(�{[���M����㪸����f�?�U�=�zy?.�us}�M +�[�\����v�_u'���������T�Ts���]��`�xW��q�D�/[[c�TUp�|��8�!J\�=�ؕE��qy0[&�3�s���򨾵74��ѓ��Nv�0�igB����ʺ��wM�p����;I�\�Ra��8QQ��B@��f�bA����R�Z��,���K$����}�\�f�6"�Xum�\o����xJ�ܐq�(�Q���d����]^ii��O0>)��\�X��.��vc�q�ig���LKKg�R���} f}�0��E��o?n���=�@[X��rm+r�w�@���GD���yY7]Y�\�(�r�#�P��=r���hq��x(��N��&j��Wwź��i�ۦ�L�H��,�(����  �Ʊ�\Q��U���ܶ׶F���F�y���>�Sl� )��!��q��B �$H6KIv���2�>S���s�P�cү�mU���gEe���O���]�a
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
�EN�<��l�Ǔ�%�F��NF�7�Dg�Ȝ��\0�a��c1��!A-��|�=�7"������/��%wC�� �FS�]���c����;����V�e8���Z���9Ŭ�=���Ư{_:�~m��v=�Q�9@�ӛ�4������M�LL7��c����C��o�t����w>"Ob-�l�sFNX"OQ��e�����b�t�$=�FRy���E���L��x��8��//y�􁇭ǅx!�������>���[����A��ڊ��	��Z��n�������#~�ߔ��!�~e"8ML?���䭐�G3G:ie�l��_e*㉚z�4<�AF������y�|��,T���w��eo���[�Sַ��Կ�g�o�W�?שּׂ�ɠ��o:���O?��f���@k߮�\��|(�b��%���ٺ�폎���'>�R EC�dg4�K)��8Ou?���|���^={���DL�         �  x�}V�n7}�b� �����<J���� v/)��J��zE{q�|}��$S�RC;���3��UB%���O�)n�}ѮX��=��ŝE�0��Ņ��f�A$12 b;���1D�h��R��¯!kzk�;����yeW��mӻ�v�3��E N l:���?��,�Q�*��1]X��b�d2)�\���k��u�%G"�0Ǝxs��!4S�V�p�zg�l��~�T!�8Ǔ˾���n��$R��	�:^�v�Qww�^�]�С����x���VM/��uq��Y�?E���*Eo6��YW���8��a�%�a���_>�q���qY���Y�3���$�^wv�;S$Qei��Hi��'�\���O�+�l�U�r�{��E$±E��^�T!�R��|�QB"�1�k� ���D9�y��KrDN�T�H�! ��<�X@<O���[��D$��@�o���*���H)P�m�Ԧ��0��Q���1��Y���o	�D��D6-��ȼ	���� %�Q��B�GaU"J�ur�"�҄IG'�}?������3�j�]��,��o�|M��@4�MT2����@ׁ�km�L��	���Ӏ�9yW��wm�����5�(>�R�+����"	����vż10M`�v0��r4�hj=��co�������~*.�m��#�{`'��~2ͽYv[;�.n��o��ib(�R�E!Ȓ��qLQ{�;��t�d��� ����+x���I�=o|���R�Xԁ�dos��.ߓV�E	�
��q��n赔AuQ24��?=�<��͖v{��:��º�>\{� .�"�[*��&ݚ誱u�_N�
�p���p�h��t�́**���I�w�n������D��ԓ�\8e�R���(�9=�L�J=R|+�k�-O�:c{TY�(�"]|pmg����>��T�9vJa�vP�g߮�WLYS�I���V�y)�WS�<Ҧ�}_WOzD8!��)9����G�$A��C)�R�Gb��dn���&�H9T�V��0�x�`�J��D@�:�J���iZ3&��Y�Dkx���e�bb%�$� -�ج���7����k��8�47��;��
	Á�c��x�����x��q)?�_�k�,���ه��AI���� �E���0A��0N �]Tñe�*�.<2S�'�TA�2-���'�����"����\         {  x�]��n�0E�ï`?����ki�RA�:]Ȇ���t(����#ً&$�{�P��l�M|�W�J�f���&�Hq%�]��/�d~�.�g�	�>�֛d��%�$ܛ?��]��N9F��W/�u��=�n��=#ߦd�7�e5k��mv�?����._2�ĆUp0v6�ʷ�ѧk��Y�������pF~pf@6�dB�>�>x��)��K�ֹ�9]�o<�~��	A)J���`�a���񿆠�$���|2�h�h@U��5po��y��w!�
հ�y8�h���3#�U�k,�5�u3�Ċ�)��b�|C��_g��,��n�k�	�	��䝑��Jj�r���`����C           x�}�1k�0�gݯ��8Kc�ɒ����v)8
Y�X$"�\\{ȿ���!��E��{��)Q�߮����ȸj�=>�M����]g��l��g,����L)3,1�0Y�cZ�C���@*�d���"#�E�Q��d��Z�L�H�P�0$���L^��o�bJ�RϮm
h��I�����dQ��\���L���^�P*�|�´�H��9�(���V�!��W�w��<�0�{�\�I]��R���X�2���9i��NM�w���w��n0y�+�N9NML�X�� ~VČ     