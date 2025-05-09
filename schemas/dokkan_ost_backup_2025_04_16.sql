PGDMP      9                }        
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
    public               postgres    false    219   �7                 0    32089    cards 
   TABLE DATA           K   COPY public.cards (id, name, type, class, thumb, is_legendary) FROM stdin;
    public               postgres    false    218   �;                 0    32145 	   entrances 
   TABLE DATA           H   COPY public.entrances (id, card_id, name, bgm_id, filename) FROM stdin;
    public               postgres    false    221   �G                 0    32190    finish_skills 
   TABLE DATA           K   COPY public.finish_skills (id, name, bgm_id, standby_skill_id) FROM stdin;
    public               postgres    false    223   �M                 0    32173    standby_skills 
   TABLE DATA           J   COPY public.standby_skills (id, description, card_id, bgm_id) FROM stdin;
    public               postgres    false    222   O                  0    0    cards_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.cards_id_seq', 1, false);
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
       public               postgres    false    4717    222    218                 x�uZ]O��}���7/˕���~ZA�T@A@n�ҕ"3�0^f��!�����MsW�]���է�Ω�t:sFJU��fh��]?�����LX�m�?�ݝ��?o�ϲ��˅0�(�*�Ȏ��w�Z�c���M;d�L�Fe����>���ǥ��J!J�KIK�P"���8��Mq�ϳ�LV�e�˒W�+��̶KZz�?�!���b��5���g�������M7/m���V�%V��-���gNF�d�/���U���<�m�-�p"=�(#��:�hKY�)N���w8�軱m���llw�bj(K�[͆�L7.Z�MJ^�+�]����}�݄�6ZkrK��8T�]���ZFC�����?��p�\��M���� *�#r��tl�.D��u�,�>�ũz�Ʉ�ɇ�*w*,F�w�_R��É�m��qlf���A@ue�gt�׋f�?�Cs~.�`#t��6��`H:�Z���/?a�N׻����ګ��y�����b�E�F�)wu�^�\���O�����{����%K$/�p��ͪ�ޮ�P�������L�[����6Y�A&9�D��*!�K6���������+-���,������w�8B�V��;@8��^���z
��¤4�As�4���q��t����"3�Gpe��p�Z> �x����4֢���)*F���0Fm���f\��^�]q�,��Cq�� �;�
0�}��p�O~����i=Y��M[qH5%�������;헾�ڬ����$���W�t�d�� $u�#-�⢑�aĶR|p��s�.ƾ�@jر@;�Q:n����|�N?d�2��]��;_���}��5C�)9�Q0d,�������B'G��5���H�ttʊag��\4���vzS��,��j\`�ض.	H����p��u;�cq�,�0�ɶtVSK5b�����kG?)~�鶈hh)�T�^J��'�l<�W����ިo�N�r���D�hG7� ����H�`�5�^o�G�Ӑ�d�n��?zdmq�p|�	�*��8whM��记<��G��V.�.���QT�p������i���S&?�^�����vQ�m�[ �SӖ�HR�֢,��r%��M�?}[u�z���p�:�CE�����ϫ�y��{�h7h��j�u��O(c�8Zn�'����|N���u=ս�_���=j5()e9���q�6�H�`�)��� �@<ha]�8�5��L�(��,Xi�f�H��Q��\ �V#OQ{?o���f��*�S���SD�9�{�/����B_�_���Sx^���E����E�*S���E%G�VX|ңm��/}w������h_�p� �*�JDѨ�uTT:\��Qq^nG_\��5 ��
��(�"���)����=g����{�Z�������*yDʂ�N3�k����e���Cf�Ѯ���a3τL���*G�""��yh�~��da�Pt�@��.m�~O���?�|m��>X�I��'���INU,�YYS������?���z����~o��S�OkOE�����䘌�:	�CmS��Ώŉ�P�&�.��t�2k~��*�3$AI�akC�:�BI��"�� t.D% x�v^���dUR�1hŠ��_�vm�j�3+��~��!=a�fv�J��[��u��F#Yb��0�����Ӹ�9uN��E*���'��f�^rǖ�X4V9� ��M�}�Wk�Ά8ı_5D�6ϳ���K�$W����������# �>'��C����)u��(�'��F�}I�蠽G	A��\��6�	�=�W����/ދ�:-B���)�)�3	�bL,����1�6�E�N���d%������v��O;=��$8����:"�;`�yS�ݳ�T9�r�4��-������ŇQ��X����A�ʈ��6W��%F��Х�^���}��Tyt����q��[Dz�05�zYP�ſ���K*�=<��-7���Sg~9�7�O����Z�� �y ��o��8�-�553��^�S��Bα��a;���~�&����#�n�RWHaR�x���]��/�sFf��)�B�$Ft����7�����v�ˇ��,	� ����)nȄK��P�M�'4G���APkQ5��Hj�!q�ʲS+�R��e�X(�*T��8�H�F,;����:]Z��[��笛aAQ�j�&`=����+��!g�}?h�[�=}����29,� F�˵������wCϚ"�ɚ��a&T��]�	�,��z��~Q�E7Nj2AH�Z����G��Mg��$<_D�E?��{eL�\1	P�ND��8�'Ѱ��zZRm8��F̐�]ȇ��c��\�w\�~�x�������0��i�B�K�f�3��ĺ��:�\��6��`�p� %F��@�ێ#��R�b(�J@q��:��*�"*(<�X;�4~m�;6��1�X�	듺� |:!��
�<mR9*�,���0I'`�!�vJ� ��AO�0Q�	��*��E#�I�Si��
�:D�K�͟yz���TA��VS��c0�eT[��A
H-���`;�n��@�JF|JR������W���Y�"�&����ͿL�g�J�S���&�oCjUECV���2<Kl�^�=����(�6���c�P�N��M㫐��U���ٮ����M�u�?��Q%p�Kh�eu��/Ö�@�O�ަ���ViGiw��306x���ǥ�[!�s��r"�T4�U%}���}��'��{�@��4����4�a3<t~�)��3H&�5�J�M��{�L��p�ݠOp�˴�}�QA�����2�##r�稹%�ɽ��ݜB��b��LS���E�, ����~7�Լ&sM� ��z�����Ί�f����*��$M?_��4"�Ě�5u�S��:��\@k�XL�����\\h谨"P�����¼R�k�m��ɀt[�;�/������DAB���+5�l��V_hrߡ�l�� w�}9�_�`��`�J���q���rۡ����tG�(������D|����B�ڽ�.�n��ݰ�0L2[A���5��(V����v̴����}*އRo�8&6� {��JK(��s�����}E�D(ҡ���RU��!f�	Ο��F�fsc��w�mQN7͹&RP��_.��mǈ����I�X��[~|=�v"�̥C+��͌bv�B�����"h�J�e��5QCz��7hUȅ�/.i�m��(!�����R}C�>4���I�)k*ADS�M��.��3M"_8ʴ@�hZ�^X������G�L�<.���s3��x~\ʜ�0R�6'������􊼖a�T-M���-i�h f"
*��,UT��QA�9���h�5�h���G�F4���Ӗ2����
��;ۛ~��7������e^�!.��06���޾�gz���ͨj����v ��+�|�G�-=��+8M:B�ͤu�iDU���D��L�Z"��8���'1�.���[CV�2t������C�$�U����������h         #  x�E�OO[g��5|
/aQ�s����*�JU"�t�EV� q����������\,�8���<�����gߞ�ُ��O�y|���t|���r|��g����ƣ���"�2�BT���k\5�W���U�b�>�+ŕb~�Jq���]�q�x�x�x�x�7�����������2V�X)c���2򧬔�R�J+e���R�J�*e���R&�#�2U�T)S�̕2W�\)s�̕2W��?���_j|��Ɨ_j|����Q)K����V�Z)k����V�Z)k����F�*6б���l�f=(ڰ�Sc��v[����.,�� �ꆺ�|.��7�oP��A��%ZnK�<
4:�t���A��Z��l��Q���A��v��<hxP�[;y�<�y���AӃ�]��=�>>ȣ�A���J�>�}����1�yD�@A� p@$b��<4�@D@"0�T,p!\p!\�&/�(&��\�>��C�P���P�����>��x���>���Ǉ�!|�}Y���C�>��C�>�e�>��B�.��B�.��}����B�.��B�.�M}/���B�.��B�.��}ђ��B�.��B�.�-}s���B�.��B�.���
�.�2���80���8p�2�<���80���80��N�Áq`Ɓq��uz��m���ӛO�>����80����ƃ�`<ƃ�`<{#ƃ�`<ƃ�`<ƃ�^��Ã�`<ƃ�`<ƃ���Ã�`<ƃq`^z%Ɓq`��������I��'�Ar$���A��R�����A� q�8H$��T���� q�8H$����I��^g���t�{�7����o7����������nsq����is����rs���_ۧ�͛��������������������g��������~yy��g���s{u��|�r������׻�ǟ��u{{����Vqx�zS�^��j�G�;`����Sʏ_��������no         �  x��Z�rܸ}���5*�I��(�"�emi��S�Bk �E�8{�?��ȏ��Dc�M��[yH�+4�F_N�nL�*̣�i�σ���m����^��I����oW����߻�>�E�ˇ��Y�q�F��������'�l[�����ɇE�b���7԰ce��`�m+��g�� �y-.��A�<mj����DP�H�8Z0��W{k��� 9�CG���Jj�L����Fy�L�;[�o?���m 1� �R-��`���vw#�aٝ�#-�m7eS�.�Ͷ7�d� �P�j��D�|����=X���c�~ث��q�@���x�x*9������&��ַ퍽�׶�z��Z����LMl�ǁ��.a�̈́���^�M��?E���?��3�nq���릩�TA��|`ҩ����U0��(�{[���M����㪸����f�?�U�=�zy?.�us}�M +�[�\����v�_u'���������T�Ts���]��`�xW��q�D�/[[c�TUp�|��8�!J\�=�ؕE��qy0[&�3�s���򨾵74��ѓ��Nv�0�igB����ʺ��wM�p����;I�\�Ra��8QQ��B@��f�bA����R�Z��,���K$����}�\�f�6"�Xum�\o����xJ�ܐq�(�Q���d����]^ii��O0>)��\�X��.��vc�q�ig���LKKg�R���} f}�0��E��o?n���=�@[X��rm+r�w�@���GD���yY7]Y�\�(�r�#�P��=r���hq��x(��N��&j��Wwź��i�ۦ�L�H��,�(����  �Ʊ�\Q��U���ܶ׶F���F�y���>�Sl� )��!��q��B �$H6KIv���2�>S���s�P�cү�mU���gEe���O���]�a
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
�EN�<��l�Ǔ�%�F��NF�7�Dg�Ȝ��\0�a��c1��!A-��|�=�7"������/��%wC�� �FS�]���c����;����V�e8���Z���9Ŭ�=���Ư{_:�~m��v=�Q�9@�{/��ܔ�C���q矎�ss���x�.�z�Gl�n�T&�&Dm��	�%��}B���	J�x�����'	��h�a��%�A��(G4���1<^�Q��}#��L*V:#�zb&S�xB9q�:y�@ �[?�b��<�}����Q%�d�3�q��,u�4�/���_�e)�p.��s���<b�[�|b�qX�&/�|h8�<8jJ+�e�F�v�P�O��3��-�6�T��wO� l�泘:f��Mg��7/{kG�
@���G���<C }Ӿ
�ygm�L�پ����|����4�gZ��v���@�C�Pv;.A� X��֍l�t�|<?b?�)�&;���S�$�������������^={���V6         �  x�}W�n7}�b� ��6)�G;���q�N�Ƣm֫]c/N���+��R�H��̙9g�R,����\W]X�d��]V�u?V�����U��s�����^V�͵[p�_CR-f�������~��ݺ�V�Gͭ�SW�W��+�X��>O�a�\bF�X�W���]W��� ƣ��Q��Z��DU𩟭V�ovjw�0�R F�!5��/����w@3���2���A��)�YòuK��E�@4��t�o<�~-��4Xʑ$!_��x�n�^�'P��pHK��,��?�)/ӲLA#̸ dq��K�T'�w?R����1D�d��]׷��-1Y�G&^ ����mS�mW��Zc�DfD�<b��oڶ��O|c���Vi� [�q�H�U���
�)Q��Ĉ�h�1Y|���=
�1�P`�%$����nͩĲ���#,��P�H�3�L�b�\ �',�S��ɎrDcQ%�Uԙ�H��B4RU�� U�A�,��`��*�zR�����P��*���6
¼������pAL_aN��ܭ�.�\ӵ)��A1<i�߀:A2��$t��'���i���ޏM����]BcR�
��3#X�KV`³�1���j,w�~A�-=w��ҹ&���ShB)�CK��q	�vMj������	�tu]~t]Hy����˗�Zz2�ƿ�Y�*�8��k�q��O�!+�����Hv��M���Cz#�4ZSD�����̎
p�[H{�釹1^6Q��^���}xhS�Ťa�����
XDS��N3��N��i��Β`��6� �7�a�0[N}�]9}A6�.K'����4���g�f�|0�@�BbjqM6#.��i�.3���v�� �)��0F,�M	@����M��]`ѹ�)w�|��1�M(�zש^P���*�?W�}�0�$N$&�i�@0����jm�L6@�:_׀��/{Ė�b^1�K��#��=���6;�e��(,6�@"���7�����ۼ���Jg���P�~�����wi�Y��D"���`�D�Y���_e��� �ak�Kә�b�dd���-�}�j�ܔ�]�N��5?�,L�x���8��"9����:2��8�7A�,��r�(8<��Y}{���([��K	E�On �Ӻ�|�.Ӓ)-؜�t�^(�X��L�)5��yl�\ٗ+�3��������e��y�M��r�a	6�c�Ơ��]VnC�j$�T��pp�`���Qt�F�C��J��c[?��]�i^u؞�4Lо��naX�wfu��޻�7��nF�h�zQ9-h��o��՟w��I��"�J����O�;j;��6��(b1'�����6e�}�}�+?�88ȲN� ���6-[>K%T�D��k�عn�SpE.���^dA�ׄ�6�Hep�U�`�5�fOT�� ��Sn5����>�߈�D��HFA���6Cu��=�4��RS���^�3�$[O)��!�9��         {  x�]��n�0E�ï`?����ki�RA�:]Ȇ���t(����#ً&$�{�P��l�M|�W�J�f���&�Hq%�]��/�d~�.�g�	�>�֛d��%�$ܛ?��]��N9F��W/�u��=�n��=#ߦd�7�e5k��mv�?����._2�ĆUp0v6�ʷ�ѧk��Y�������pF~pf@6�dB�>�>x��)��K�ֹ�9]�o<�~��	A)J���`�a���񿆠�$���|2�h�h@U��5po��y��w!�
հ�y8�h���3#�U�k,�5�u3�Ċ�)��b�|C��_g��,��n�k�	�	��䝑��Jj�r���`����C           x�}�1k�0�gݯ��8Kc�ɒ����v)8
Y�X$"�\\{ȿ���!��E��{��)Q�߮����ȸj�=>�M����]g��l��g,����L)3,1�0Y�cZ�C���@*�d���"#�E�Q��d��Z�L�H�P�0$���L^��o�bJ�RϮm
h��I�����dQ��\���L���^�P*�|�´�H��9�(���V�!��W�w��<�0�{�\�I]��R���X�2���9i��NM�w���w��n0y�+�N9NML�X�� ~VČ     