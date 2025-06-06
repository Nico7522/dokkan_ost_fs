PGDMP                      }         
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
    public               postgres    false    219   5                 0    32089    cards 
   TABLE DATA           K   COPY public.cards (id, name, type, class, thumb, is_legendary) FROM stdin;
    public               postgres    false    218   J9                 0    32145 	   entrances 
   TABLE DATA           H   COPY public.entrances (id, card_id, name, bgm_id, filename) FROM stdin;
    public               postgres    false    221   E                 0    32190    finish_skills 
   TABLE DATA           K   COPY public.finish_skills (id, name, bgm_id, standby_skill_id) FROM stdin;
    public               postgres    false    223   2J                 0    32173    standby_skills 
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
       public               postgres    false    4717    222    218               �  x�uY]O��}v~E�7/˕��n�i� 
�  7Zi���i/{����TU�0��>$"t���TթS�2��h����R-Â�$Y����&�u�s��]\��}~V	��Em�Ig%6_��9�zTc���� �)[����R'����Z�R�:�N�e�Ln``Q�U�nu��8V����lS8�>sS=�ė���&.�e�tr�W�����j�!I!���~y�^=u�����0옡�^[�\u�0��4��n�/��������fSC���K�"މ,�G}��������S��n6�ۨ��#Ljq�����Wrk����+�z�5U���dTMA'�w?z�cm�>&%�l��"���٢jV)g��[���Ur l�[3�y��{��[�'%��e�H�r t�09�����)��e�t�Q���������ոH�f�2F��9���qP��0{R��2���,0�+sZ�#w�A����0n#���O2d%�:��}D^��9����Ӛ=�	@�R����<��ڱFf���9��ٽ<ek�faFF��0�d�b@�����J�K��Ek��;6��}5���	�O�K��F�{ׇ@?_Տ|�0v>ccx�\7H��6��tYr/�y�	�(�j�3�8h��u�awPW�<P}�TsX�{%[Y��jC���W�տt}C��f����~�FjBBT?�o���5і]+��5S��X5�xe٫"�|p�׷�Flqk�����gD�2"��#}����eC�ˆ�n��ׇ���5�%�
�7f�a���3��q�����h�T�1}�
=>x���'ʟ�.���補q�z�A|�[��z�+��簬�����قl9*%�J �t�<�U��`�Fᣦ9�:��cK+F�<�CC��>�w��BO8=�if Ju:k��b~ u�����vQͻu�W�`֏ꍣ��5�����	)4XgK�=CE��fN�p)Y�3�2�P.\"�O�q����劬�B��4,E������ �gM����BUKd�
I-�{��J��bG�>�;�3i}��Ne{�q)Ut�/��M������n�ә4+M-�0_r��T �4��2���%"��'�̉l9fH�Cd\�=S�������+醞ZX�!HX������j�Bͥo-)��4��Pg  ѹ��p�,��['ҹ��xY�����Ռ��؃�Q��?�r?�Ec�Vh=۔\҆�ݬ���;4 u\?�c\l'z��g��-
39��vTG+b����7]c	��n��>EoEJh+���;�%�^�Ҝ�q^�?A7,x?œ$?���-��i��j[6���n�m�E;P ��rL}T���R�����vh�D䇷n� ���j�=��#�d\b.C�V=��1�3��L��v�Y|Rg��3q�[2����wuWS���o&w�I0M�g��hA�����Q<��ú=�ч��v�Atl��Du\j�m�L���B�n���j�J�jD#QA�%n ���^�%J@iv���D��l�E]�Ғ[�>]?jKG�QTV0�R�@�HbSnt����:F�3����4:�ng9���rZ�\�>T�:%�)%��e�?����U��T����r������@�;�?'�q�o�XDe��R��e�Uq�[9��1�;����@�b+�e���dL��	5��ϸ�@.�Y�8�9���;\u�5+ ���u�+���g����p�6�B�(66�Lc5�������uNy�K�0��A� Ș��M�^� ��/衒h2B��}F��)�K��ѽg!�.J���잡�$RE,0@&v
<y���ȝ�Q�1q�N�$��"�Ke\�Aھ�8j���H����%}�tf+��$�D��D9�MՆQ��ׁ��%uD�����v,c�)95|�H.�ob\P��I����I�*��8�܊��q���b��9�0�E�/��"Oߤ�D��i�وUip)�'��u�֫>����CD<y�h"U�!��<�����:%5k��	#�-K��x]�w+Z��P(�G�g��r=5\�5U���n��
���|�����ex�A�xZ��)&�:L"sX��Z<��g+$H�I�Q?�-$��&�Y�By6����q�kbe�2�a�t���vÀmt�!/��,�&^,��.��DcWbeD2���?~���H�>`A.T�e���t$5)���T_BX�o+y��
���ĉK�3$7G� �:���S���9ì�2�t����J,>����f�����FZ|W b�Q�7�O��z`]Ā3� aAy������]��*�2�@'�=@ݼ �.�M�rV�'Cl�8YN��폲Vc�f��Ȍ���i��߉�)0�Ghڼ]q���C�
+�m*�e����e$1"3_�4ǭ�a��P3"C�I����"V�bN�*>s<�@�f � �<���̻v^�߈�-ʜt���og=���;p��D�6A�<^�]����ڽ�:���P��EgH��/_�M��_XlT�SeI�'�B�π�E; FЦ��=�ʷ\����z8OH�äiXRJ�����x@�v�.��2���-�l#�f�����rZ�j7�E^댈ÒZ�I�?�a 4�COnb#g��N�-fW^�q�[�JS6�L�VF8�F�BI��3Ζ
u�sC����x���1�~�~nr��ˠAZR�^U� �A��`��M����|���������V��]�������N��P�8��5��$���o�Ln���fنϥ���\���#���]l3^˥�ͨ�D���)4�� �a����i}�?`+��)���v0��Z��Hb�
W*w�m E�/ e6>z7!���0C���X�C ew��1q��j�)���H�y������)Ev�����D-˛uI͊���<�I]OMy��w^˲�+���&�@��K4q�!��{z7&mrx�������T�[�Z�d��M��Q�lm������_������ ��           x�=�OO[g��5|
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
>���=��T�����t�S^�x��6��g�G�o��={�_`�>�           x�}W�n7}�����@F�tyY.�Qrl5H��{I `$�b�"��8q��á$S�R�Y�Ù3gGlT�	FGw����N�g� 3���+����Ѵ�\���nnF��G�;�!
W%����{c�������v>�ם[5ۏIb�#�L���gV��L6&+�rD3�KEG7�_�y)`E�	!z������a��|vǾ�+�Z��r�P�um͏�Q"NJ:����G�uӽ�X��b��x��,^�^�;�����)K1��tt�}����\�z}�f�UQ�9���kMh�X��w�B�k*����^��*�ļr����>��|�����x0�G�ڵn��J��""�[;��ʓ���N��q�=��2��������U�^��e���|(UƱ�m��X�zqs��!�R@�iב1�J�JlC
%�|Fb��
a*������e�@]1�Q�m����4�IPQEDA�]]�&E0D _E���<jr�4��i7T��+h�G�I��Ĭ1=I.�0N�Br9��ࠄ���8���^v'爕X>�12T��8r,f�m,B�'nQ{�h�9-��s�^�<C1qlj�� �J?�]�n�M�[�e�h��`�� ��^u�	N����&=�N�r�U����vm[2��O�b[�����i@�>�!վDr�(�>��p���\=�*=�b3�T����,Ʒ�~0�vkN��}x*��z�[�UGV�LT&=:&����A|���<��R�4~�u��9�]��6
��O����s��8�%�8����M/�%��P9����6m�ȹ���:T�ʽ�l|
��	ԁ*��K�i5��3랻�ֆ?vn�F��۪d[_����UQ^�s�DeL�?�<�k<q��@39�>�MVt�ޣ�μ_`��<�+,#���cY9�e�^2�1�h�yl_)����SL�;Wf��4Ȧ��kZ�@���{};�M,��6-���7��
��RY�����-t�L�WzѪ%rY�k_,6z@O�U�"��od		�H`	�?�Z��_4Q�\��-��kp��{|����V �<�m	t��ԍ����"�7�H_X�&�4��DS�31�u��'r�0�яe��¦55��'T0��!"�x���'_=����,���Qw�Xg��N��Lr�gE<�U��>E`k
�ޟF�{��S,��U �t�|Oש���$qDK�o�`o��S�>��$n�)�	!�6�^[�:�t
!���^�/�}�2Z�3���x������e�[�%��
�����7ggg��K˂         {  x�]��n�0E�ï`?����ki�RA�:]Ȇ���t(����#ً&$�{�P��l�M|�W�J�f���&�Hq%�]��/�d~�.�g�	�>�֛d��%�$ܛ?��]��N9F��W/�u��=�n��=#ߦd�7�e5k��mv�?����._2�ĆUp0v6�ʷ�ѧk��Y�������pF~pf@6�dB�>�>x��)��K�ֹ�9]�o<�~��	A)J���`�a���񿆠�$���|2�h�h@U��5po��y��w!�
հ�y8�h���3#�U�k,�5�u3�Ċ�)��b�|C��_g��,��n�k�	�	��䝑��Jj�r���`����C           x�}�1k�0�gݯ��8Kc�ɒ����v)8
Y�X$"�\\{ȿ���!��E��{��)Q�߮����ȸj�=>�M����]g��l��g,����L)3,1�0Y�cZ�C���@*�d���"#�E�Q��d��Z�L�H�P�0$���L^��o�bJ�RϮm
h��I�����dQ��\���L���^�P*�|�´�H��9�(���V�!��W�w��<�0�{�\�I]��R���X�2���9i��NM�w���w��n0y�+�N9NML�X�� ~VČ     