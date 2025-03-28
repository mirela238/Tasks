PGDMP      $                }         
   company_db    17.4 (Debian 17.4-1.pgdg120+2)    17.4 (Debian 17.4-1.pgdg120+2)     7           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            8           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            9           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            :           1262    16384 
   company_db    DATABASE     u   CREATE DATABASE company_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';
    DROP DATABASE company_db;
                     ituser    false            �            1259    16386    departments    TABLE     }   CREATE TABLE public.departments (
    department_id integer NOT NULL,
    department_name character varying(255) NOT NULL
);
    DROP TABLE public.departments;
       public         heap r       ituser    false            �            1259    16385    departments_department_id_seq    SEQUENCE     �   CREATE SEQUENCE public.departments_department_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.departments_department_id_seq;
       public               ituser    false    218            ;           0    0    departments_department_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.departments_department_id_seq OWNED BY public.departments.department_id;
          public               ituser    false    217            �            1259    16395 	   employees    TABLE     �   CREATE TABLE public.employees (
    employee_id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    department_id integer
);
    DROP TABLE public.employees;
       public         heap r       ituser    false            �            1259    16394    employees_employee_id_seq    SEQUENCE     �   CREATE SEQUENCE public.employees_employee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.employees_employee_id_seq;
       public               ituser    false    220            <           0    0    employees_employee_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.employees_employee_id_seq OWNED BY public.employees.employee_id;
          public               ituser    false    219            �            1259    16406    salaries    TABLE     f   CREATE TABLE public.salaries (
    employee_id integer NOT NULL,
    salary numeric(10,2) NOT NULL
);
    DROP TABLE public.salaries;
       public         heap r       ituser    false            �           2604    16389    departments department_id    DEFAULT     �   ALTER TABLE ONLY public.departments ALTER COLUMN department_id SET DEFAULT nextval('public.departments_department_id_seq'::regclass);
 H   ALTER TABLE public.departments ALTER COLUMN department_id DROP DEFAULT;
       public               ituser    false    217    218    218            �           2604    16398    employees employee_id    DEFAULT     ~   ALTER TABLE ONLY public.employees ALTER COLUMN employee_id SET DEFAULT nextval('public.employees_employee_id_seq'::regclass);
 D   ALTER TABLE public.employees ALTER COLUMN employee_id DROP DEFAULT;
       public               ituser    false    219    220    220            1          0    16386    departments 
   TABLE DATA           E   COPY public.departments (department_id, department_name) FROM stdin;
    public               ituser    false    218   �       3          0    16395 	   employees 
   TABLE DATA           V   COPY public.employees (employee_id, first_name, last_name, department_id) FROM stdin;
    public               ituser    false    220   U       4          0    16406    salaries 
   TABLE DATA           7   COPY public.salaries (employee_id, salary) FROM stdin;
    public               ituser    false    221   �       =           0    0    departments_department_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.departments_department_id_seq', 8, true);
          public               ituser    false    217            >           0    0    employees_employee_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.employees_employee_id_seq', 53, true);
          public               ituser    false    219            �           2606    16393 +   departments departments_department_name_key 
   CONSTRAINT     q   ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_department_name_key UNIQUE (department_name);
 U   ALTER TABLE ONLY public.departments DROP CONSTRAINT departments_department_name_key;
       public                 ituser    false    218            �           2606    16391    departments departments_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (department_id);
 F   ALTER TABLE ONLY public.departments DROP CONSTRAINT departments_pkey;
       public                 ituser    false    218            �           2606    16400    employees employees_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (employee_id);
 B   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_pkey;
       public                 ituser    false    220            �           2606    16410    salaries salaries_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.salaries
    ADD CONSTRAINT salaries_pkey PRIMARY KEY (employee_id);
 @   ALTER TABLE ONLY public.salaries DROP CONSTRAINT salaries_pkey;
       public                 ituser    false    221            �           2606    16401 &   employees employees_department_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_department_id_fkey FOREIGN KEY (department_id) REFERENCES public.departments(department_id) ON DELETE SET NULL;
 P   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_department_id_fkey;
       public               ituser    false    220    218    3224            �           2606    16411 "   salaries salaries_employee_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.salaries
    ADD CONSTRAINT salaries_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.employees(employee_id) ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.salaries DROP CONSTRAINT salaries_employee_id_fkey;
       public               ituser    false    3226    221    220            1   [   x��M
� ��|��A��((�l�f�A�RQ��4�(i>P�h,�KP���d�FC��hi�br��L}޻����%p2�F����g�;�      3   a  x�=�[s�0��W?��o\	�IS�Ȕ�N_[�d�����=k�>�g��uFsgkM��&C���A���i����
Z[�mh�}=�w���ɰ�G��v �����w�_��.�)/%r5���謦��B�H���9&�Q6W3�����h���,��p�g�l[�{�ܾ������p�BT��\sGw|�(i~aZ^�)��sRu��m�l<Tl>�tT�lB�:�^Lhy Sz��H{c��xF���6�e��*y��ꐒ��~�:��!W�-�r����s�TyA�9j����G�cO{Hn���~��/ᘖξA�ghs+�1�]#{ Ni��=���+�ϐ��C��Gv������6�F;',CTF���Cj�c54�����-��;�߸�����x���"͂���h�_���h/�\��=-����*&8�d��iP�p*w���a�<�N�ܧ��r�������B�4P���̙�1H?�������]'H�Oɠ�"�P�\����.�6<�;��l`��w�o�]'KOi%���4U%Lh������F2�>փd��&�>�FHN�����T��|����2U��(���u(      4   �   x�E���0Ckx����]��aa0� �Ig��9�"╆�W:�^��^$e�(IB#I���ԂbDE��q�v��w�'�r
w9��iԂ�Ԋd^%Ԏ�|�6QM���z���;h�M��B/`6�73�����;f	�n5��[�!��\��@	�Y��,��]�,��[�,���ab�1�������?��� =�m4     