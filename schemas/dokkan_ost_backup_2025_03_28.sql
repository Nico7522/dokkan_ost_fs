PGDMP  4    ;                }         
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
    public               postgres    false    219    7                 0    32089    cards 
   TABLE DATA           K   COPY public.cards (id, name, type, class, thumb, is_legendary) FROM stdin;
    public               postgres    false    218   L;                 0    32145 	   entrances 
   TABLE DATA           H   COPY public.entrances (id, card_id, name, bgm_id, filename) FROM stdin;
    public               postgres    false    221   G                 0    32190    finish_skills 
   TABLE DATA           K   COPY public.finish_skills (id, name, bgm_id, standby_skill_id) FROM stdin;
    public               postgres    false    223   �L                 0    32173    standby_skills 
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
       public               postgres    false    4717    222    218               �  x�uYMs�6=����a}����)%Y�ei���u�*U)j�0�SR����ucF"�!��A���ׯ�B'�Z
���g��^���U��RY��F�"9;8��N�����?
#QX_���e͘�}vUw��
��^[��Lۦﲧf\�9Mb/)�$V4]�f׫�s��8֋�Ĕ������[}�c��t~Y���.�Y5�I%��Ld������6#NO*6�%oG���z��ms﷡%�x3�����5oa�ں�߭�"�1��*��ښ�b2~�f?�xȮ���N��b!o�.IQ��NW�n;ί"���{B����w��4<'B���>��?7mO��
~����4���kݰu��宧�y���p��Ӗ������~��ww���c�w��� Z��v�j�c?m����*��K������lx��i1b��|���-mZ��e�
~�כ�Y����ĭ��eW��Ŋ�z� �:��O���ո��4dW��>|�������Xhp�/u�?8��{H>P��&@�zοp�Z�*;l�ú������`(\=9m�n�6�f"B4�(�@��/7�N<*/1|t{�*���߽��*�g���o������-Q {����1��?�|���A)b3�"�:���98������r<�H���� x�wxf��i�L��וy��2�9�g�SKK�� q�X`qEYoJl{����p����M�*�
Y��\��T.�2X$S]��ъȃ�U&ՆVX�+��bU��t��ɋ�f�t<]76x�B��P�e�S���<>D�`-�y��\o܂��cU�`m����S�2��j���Z��s��sv�n�~w����i%��$e���Z�� $�<�ٙz�Ce���2��/�D@2q4�)�6�Ԃ�j������^��e���=p�1{�1>�H-C���nh�G�kA"�*�z�Z~yI5Ws����_����wJm�O�Q��O�����}�K
,�����v��k0���ݽ���$|�*��B&��TD�I�|Yԟ���������з��"X,S�Y*��a�|�>�D�D�����+]�
]5�Qm`�8As�4�d���C�>�]�fvn����R�_�C �ѭP<J���) #0,4�Q��	���R�FM{�N'��xbU���Qd8�'׶�g7-k��h:�C�)��S�}�y���6, Nt^��{�5�������x��Z2��R���3W���$!������[*ջ?`�*��`����^4wJ��@~��6S�l�`�X.ry����(t䢡[s�
����JY2�
�8���f=�}m
N�ytZ�,-�V9���E=ܻ�z�Pˇu��TF��[�MqD��΄#�#?�C|,"�KJQ����'�=<��l�oدo ���Q�O�r��[*!�<����P����e�fYS �+���8dYXo�H>:d-&�݀��O���߾4�.&��@��@c;���/�)�X|A�ή�晚 �������e%���F��6�p���&�$����a�T���k���ؔ���u�l�u�nU1�-�W'�GH�?�34WT{��BFU�v�	4�c�D�o�,��~ER�����~C�˷�Ր��崞j�W� �u��0͐�!��U�tW�|�%��.0P���U".PJ�� r^$�<��a9��#��T�B͢�"�q�#pG=�"����,̾8�ɾo|?|����2��Ǝ��*��������JQ�ѣl���Y�{+ȾJ�A�2ֈJ�(�;��+K�S�z�}�� T�z (���T
�#"��n:��j/���jo���L�y�F�c����S/F��D�,Ej5�����C�:�����uT/!c%j��9)IH~���*Z�[�n�E�٥U��Щ?V�G������S+)ViOr����;0�,���=cQ�g�O3����y������c�)�З?����Z'!a��6EAݹ1;u�["QSD�E1�^�V�o�AU�<<��]�*f�9y���KyD��wP��fu�|)���[�$4����*D2�go'�9�R�y�?(ż$��zv�7�UKH-OW%Q[�����bG�LW���q2L��'t���9��U�A�M�,���˱�U��i�}��~L��^9G�@o�<���� G=�("q���!�W�9����P������Q�ޙ���O��R&Ŧm��<x��◡ώm�!������ ����h�u�#?5�bE
ȭ7�aE1G]���zG�"Vk������<iZ�!�L��2 N	%�<KQ	�V/������v�Mx�W2����-�L��@�dp��C"l���-��5�.��ԸR�w��q@(LH�^1$��_d�/��)4�y��DD��ھ�RĮ���0/���S7i'c�����w�P#�zIm�Ċ����Tp�b)IZ�3 ���[ Z�4�"�i��ZCS'H��YM�х�򘑛�q�Y�n�Y�E�Y��)����p/w �D���~��h �E�AHz�R��GϲϦsmR�{�w�/�k��2U̺
��*��W��-g<���zE��"�#�HN����|�X�7�ͷ��ˏ�U��4f����ѥz��/^4�?����I(��gA#�ܛ"�/���4T�qD�shت��чKŉR�x�ⱍ�����ZE����R��f�dȄKVU�>�E��������5sF��������) �h{
Dğ@�Y�26�ģ��a�
��G�������.bu��I��������&��8@���O��۴��h��$����n��>����S�m�QOeKR���z1�#e��9�U��4"}�
�2�jY(�K?����W}O����l�D��b[O�V��]e��*$i���Ҍb�m�������L��ڤ/�u3U�O���i ;�.���g�(����;j������q�����6��d�
�^*���V��G�S��~�!�m��|� K��:�E�ղ� �� VJ�7}���=���'��<<å�c ��%B��l��h��H����9}y-ɻ�P�b��I�����U�?�5��pCP��+2�� �e�أYdgu[��T��%���=_��<"jB4�Ǖ�����:��L��@,��j�y�n?fW
:,� x��z��E�^lK,�&R���ؒ�C���~L�A���g���z��Z�`\5�߅F���vZ, ��i��`M`�{�lK��;���Cͥ��厢ޙ���x� �L��p��B�>��n�=���0�l%pE�CM݃�l�:��ӘhA�|��AvBj�A�	S(���^����u��U�(�,��*�@1�N�B���ۃI��ñ��"�w�4Xd�HA��m?}���:������>VEP-����L��]��~����X63�U �[��C����4M��ug�           x�=�OO[g��5|
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
>���=��T�����t�S^�x��6��g�G�o��={�_`�>�         �  x�}W�n7}�b� ��6)�G;�� q�N�Ƣ��W\a/N���+)�R�H��̙9g�R,����׮�.m�d}u�.��K�z��O�~t]磌ι�C��uϫ7~謿q����oH��sVx?U�o�;7����߹&uExp����������l��%fԈE��v���f��ʯq1݄�N��k�e_=#�:�O�Úa��j��q�*b4R3����C�7 ����,����=�F@��/��g��-Qt�%��әo��<���*�`)G��|���}j�e{�@etb
�!,�g����Ծ�L�2�t0ゐ�y�,��κ�}O�ʒR����v��^�{�p�d�g�x�H�ƾn}��]�~Lj�q�56P��!�j��>>��m���[��l�'�%"�W��+P�D&#"���d�ٮn��(���B�E���ܧf�WvpN%�e��a����E���iV,ÑD�d!��C�3�Q�h,����:�i�\�F������*:H�%��"vP�`֬@�>��p�*�]%U�FA�Wc׸>=��.��+����������]�"�q�Ó����3$CLNBX��v���	�ه�����KhL
]aX bf�M�
LxV:F1�1Z��>�/h���^r^9���0�&�b:�ԯu7.�ΧY*���pQ�I�4��ׅ�7�<>�z�l�'�k�+񜵬���)��vm����8�d׌��t�l?�7�L�5E4�H�
>�� ���������~��e�x�%-�	����Md�B�Mzb�+`ME+;�"t:M��Iz:K�i�#۴�^��`a����	�r��ln\�NV#�i&�)�6[�|�`��P����lG\ԙ�]f�9612�0p{A`S0�a�X,��������'��E�N������IoB�6�N�� X��Py���z�Xg	�L�Abb�6��� �ֆ�d�������e��W�1���/쿩͞r$"��m4�Hg���j�qY����Y�@"R�*��9��>�0+5�H�^3Lރ���힪�U�ao��&�v�D1��.&HF����n_̝��ڠ2�i���������5g�P$'²u�#����|�����/������ ��O�^�dv)�H�� y޴]ݦ�˴�DJF6�9ݾ�1��8�8FJM�o� �=W%���:E�%��~�����&Kj��0���1c���.+�!F5�x*tPf8�\ۂ��sŢ�г�y��6��|�p�W�g5����mZ��Y�|����.��hMP/*���u����޹&iX�A���2����w�CmO�`�f[E,��z?Aæ�v�����@d��� ���|��-��*f"��q�\7�)�"FQx/� �BL���2��*��|�'�|J�x�)w�����C����$��6��F��Cu�Ξd�ev
}y���U�`         {  x�]��n�0E�ï`?����ki�RA�:]Ȇ���t(����#ً&$�{�P��l�M|�W�J�f���&�Hq%�]��/�d~�.�g�	�>�֛d��%�$ܛ?��]��N9F��W/�u��=�n��=#ߦd�7�e5k��mv�?����._2�ĆUp0v6�ʷ�ѧk��Y�������pF~pf@6�dB�>�>x��)��K�ֹ�9]�o<�~��	A)J���`�a���񿆠�$���|2�h�h@U��5po��y��w!�
հ�y8�h���3#�U�k,�5�u3�Ċ�)��b�|C��_g��,��n�k�	�	��䝑��Jj�r���`����C           x�}�1k�0�gݯ��8Kc�ɒ����v)8
Y�X$"�\\{ȿ���!��E��{��)Q�߮����ȸj�=>�M����]g��l��g,����L)3,1�0Y�cZ�C���@*�d���"#�E�Q��d��Z�L�H�P�0$���L^��o�bJ�RϮm
h��I�����dQ��\���L���^�P*�|�´�H��9�(���V�!��W�w��<�0�{�\�I]��R���X�2���9i��NM�w���w��n0y�+�N9NML�X�� ~VČ     