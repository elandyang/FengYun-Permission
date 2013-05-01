--==============================================================
-- Database name:  PERMBASE
-- DBMS name:      IBM DB2 UDB 8.x Common Server
-- Created on:     2006-10-6 11:41:36
--==============================================================


DISCONNECT ALL;

CREATE DATABASE PERMBASE 
AUTOMATIC STORAGE YES 
ON 'C:' DBPATH ON 'C:' 
USING CODESET GBK TERRITORY CN COLLATE 
USING SYSTEM PAGESIZE 4096;

CONNECT TO PERMBASE;



--==============================================================
-- Table: PB_DEPARTMENT
--==============================================================
create table PB_DEPARTMENT
(
   PB_ID                VARCHAR(15)            not null,
   PB_PARENT_ID         VARCHAR(15),
   PB_NAME              VARCHAR(40)            not null,
   PB_PHONE             VARCHAR(40),
   PB_EXT_NUMBER        VARCHAR(20),
   PB_FAX               VARCHAR(40),
   PB_REMARK            VARCHAR(200),
   PB_ORDER_ID          INTEGER                not null,
   constraint P_PK_PB_DEPARTMENT primary key (PB_ID)
);

comment on table PB_DEPARTMENT is
'����';

comment on column PB_DEPARTMENT.PB_ID is
'ID';

comment on column PB_DEPARTMENT.PB_PARENT_ID is
'�ϼ�����ID';

comment on column PB_DEPARTMENT.PB_NAME is
'����';

comment on column PB_DEPARTMENT.PB_PHONE is
'�绰';

comment on column PB_DEPARTMENT.PB_EXT_NUMBER is
'�ֻ�����';

comment on column PB_DEPARTMENT.PB_FAX is
'����';

comment on column PB_DEPARTMENT.PB_REMARK is
'��ע';

comment on column PB_DEPARTMENT.PB_ORDER_ID is
'����ID';

--==============================================================
-- Index: I_DEPART_ORDER_ID
--==============================================================
create index I_DEPART_ORDER_ID on PB_DEPARTMENT (
   PB_PARENT_ID         ASC,
   PB_ORDER_ID          ASC
);

--==============================================================
-- Table: PB_MODULE
--==============================================================
create table PB_MODULE
(
   PB_ID                VARCHAR(15)            not null,
   PB_MODULE_TYPE_ID    VARCHAR(15)            not null,
   PB_TAG               VARCHAR(40)            not null,
   PB_NAME              VARCHAR(40)            not null,
   PB_MODULE_URL        VARCHAR(200),
   PB_REMARK            VARCHAR(200),
   PB_DISABLED          INTEGER                not null,
   PB_ORDER_ID          INTEGER                not null,
   constraint P_PK_PB_MODULE primary key (PB_ID)
);

comment on table PB_MODULE is
'ģ��';

comment on column PB_MODULE.PB_ID is
'ID';

comment on column PB_MODULE.PB_MODULE_TYPE_ID is
'ģ�����ID';

comment on column PB_MODULE.PB_TAG is
'��ʾ';

comment on column PB_MODULE.PB_NAME is
'����';

comment on column PB_MODULE.PB_MODULE_URL is
'ģ���ַ';

comment on column PB_MODULE.PB_REMARK is
'��ע';

comment on column PB_MODULE.PB_DISABLED is
'�ѽ���';

comment on column PB_MODULE.PB_ORDER_ID is
'����ID';

INSERT INTO PB_MODULE (PB_ID, PB_MODULE_TYPE_ID, PB_TAG, PB_NAME, PB_MODULE_URL, PB_DISABLED, PB_ORDER_ID) VALUES ('0000000000', '0000000000', 'SysCodeMgr', '�������', '../Modules/SysCodeMgr/Default.aspx', 0, 10);
INSERT INTO PB_MODULE (PB_ID, PB_MODULE_TYPE_ID, PB_TAG, PB_NAME, PB_MODULE_URL, PB_DISABLED, PB_ORDER_ID) VALUES ('0000000001', '0000000000', 'ModuleMgr', 'ģ�����', '../Modules/ModuleMgr/Default.aspx', 0, 20);
INSERT INTO PB_MODULE (PB_ID, PB_MODULE_TYPE_ID, PB_TAG, PB_NAME, PB_MODULE_URL, PB_DISABLED, PB_ORDER_ID) VALUES ('0000000002', '0000000001', 'RoleMgr', '��ɫ����', '../Modules/RoleMgr/Default.aspx', 0, 10);
INSERT INTO PB_MODULE (PB_ID, PB_MODULE_TYPE_ID, PB_TAG, PB_NAME, PB_MODULE_URL, PB_DISABLED, PB_ORDER_ID) VALUES ('0000000003', '0000000001', 'DepartmentMgr', '���Ź���', '../Modules/DepartmentMgr/Default.aspx', 0, 20);
INSERT INTO PB_MODULE (PB_ID, PB_MODULE_TYPE_ID, PB_TAG, PB_NAME, PB_MODULE_URL, PB_DISABLED, PB_ORDER_ID) VALUES ('0000000004', '0000000001', 'StaffMgr', 'ְԱ����', '../Modules/StaffMgr/Default.aspx', 0, 30);
INSERT INTO PB_MODULE (PB_ID, PB_MODULE_TYPE_ID, PB_TAG, PB_NAME, PB_MODULE_URL, PB_DISABLED, PB_ORDER_ID) VALUES ('0000000005', '0000000002', 'ChangeMyPwd', '�޸�����', '../Modules/ChangeMyPwd/Default.aspx', 0, 10);
INSERT INTO PB_MODULE (PB_ID, PB_MODULE_TYPE_ID, PB_TAG, PB_NAME, PB_MODULE_URL, PB_DISABLED, PB_ORDER_ID) VALUES ('0000000006', '0000000003', 'UserMgr', '�û���Ϣ����', '../Modules/UserMgr/Default.aspx', 0, 10);

--==============================================================
-- Index: I_MODULE_ORDER_ID
--==============================================================
create index I_MODULE_ORDER_ID on PB_MODULE (
   PB_MODULE_TYPE_ID    ASC,
   PB_ORDER_ID          ASC
);

--==============================================================
-- Index: I_MODULE_TAG
--==============================================================
create unique index I_MODULE_TAG on PB_MODULE (
   PB_TAG               ASC
);

--==============================================================
-- Table: PB_MODULE_RIGHT
--==============================================================
create table PB_MODULE_RIGHT
(
   PB_ID                VARCHAR(15)            not null,
   PB_MODULE_ID         VARCHAR(15)            not null,
   PB_RIGHT_TAG         VARCHAR(40)            not null,
   constraint P_PK_PB_MODULE_RIG primary key (PB_ID)
);

comment on table PB_MODULE_RIGHT is
'ģ��Ȩ��';

comment on column PB_MODULE_RIGHT.PB_ID is
'ID';

comment on column PB_MODULE_RIGHT.PB_MODULE_ID is
'ģ��ID';

comment on column PB_MODULE_RIGHT.PB_RIGHT_TAG is
'Ȩ�ޱ�ʾ';

INSERT INTO PB_MODULE_RIGHT (PB_ID, PB_MODULE_ID, PB_RIGHT_TAG) VALUES ('0000000000', '0000000000', 'rights_browse');
INSERT INTO PB_MODULE_RIGHT (PB_ID, PB_MODULE_ID, PB_RIGHT_TAG) VALUES ('0000000001', '0000000000', 'rights_add');
INSERT INTO PB_MODULE_RIGHT (PB_ID, PB_MODULE_ID, PB_RIGHT_TAG) VALUES ('0000000002', '0000000000', 'rights_edit');
INSERT INTO PB_MODULE_RIGHT (PB_ID, PB_MODULE_ID, PB_RIGHT_TAG) VALUES ('0000000003', '0000000000', 'rights_delete');

INSERT INTO PB_MODULE_RIGHT (PB_ID, PB_MODULE_ID, PB_RIGHT_TAG) VALUES ('0000000004', '0000000001', 'rights_browse');
INSERT INTO PB_MODULE_RIGHT (PB_ID, PB_MODULE_ID, PB_RIGHT_TAG) VALUES ('0000000005', '0000000001', 'rights_add');
INSERT INTO PB_MODULE_RIGHT (PB_ID, PB_MODULE_ID, PB_RIGHT_TAG) VALUES ('0000000006', '0000000001', 'rights_edit');
INSERT INTO PB_MODULE_RIGHT (PB_ID, PB_MODULE_ID, PB_RIGHT_TAG) VALUES ('0000000007', '0000000001', 'rights_delete');
INSERT INTO PB_MODULE_RIGHT (PB_ID, PB_MODULE_ID, PB_RIGHT_TAG) VALUES ('0000000008', '0000000001', 'rights_move');

INSERT INTO PB_MODULE_RIGHT (PB_ID, PB_MODULE_ID, PB_RIGHT_TAG) VALUES ('0000000009', '0000000002', 'rights_browse');
INSERT INTO PB_MODULE_RIGHT (PB_ID, PB_MODULE_ID, PB_RIGHT_TAG) VALUES ('0000000010', '0000000002', 'rights_add');
INSERT INTO PB_MODULE_RIGHT (PB_ID, PB_MODULE_ID, PB_RIGHT_TAG) VALUES ('0000000011', '0000000002', 'rights_edit');
INSERT INTO PB_MODULE_RIGHT (PB_ID, PB_MODULE_ID, PB_RIGHT_TAG) VALUES ('0000000012', '0000000002', 'rights_delete');
INSERT INTO PB_MODULE_RIGHT (PB_ID, PB_MODULE_ID, PB_RIGHT_TAG) VALUES ('0000000013', '0000000002', 'rights_move');
INSERT INTO PB_MODULE_RIGHT (PB_ID, PB_MODULE_ID, PB_RIGHT_TAG) VALUES ('0000000014', '0000000002', 'rights_accredit');

INSERT INTO PB_MODULE_RIGHT (PB_ID, PB_MODULE_ID, PB_RIGHT_TAG) VALUES ('0000000015', '0000000003', 'rights_browse');
INSERT INTO PB_MODULE_RIGHT (PB_ID, PB_MODULE_ID, PB_RIGHT_TAG) VALUES ('0000000016', '0000000003', 'rights_add');
INSERT INTO PB_MODULE_RIGHT (PB_ID, PB_MODULE_ID, PB_RIGHT_TAG) VALUES ('0000000017', '0000000003', 'rights_edit');
INSERT INTO PB_MODULE_RIGHT (PB_ID, PB_MODULE_ID, PB_RIGHT_TAG) VALUES ('0000000018', '0000000003', 'rights_delete');
INSERT INTO PB_MODULE_RIGHT (PB_ID, PB_MODULE_ID, PB_RIGHT_TAG) VALUES ('0000000019', '0000000003', 'rights_move');

INSERT INTO PB_MODULE_RIGHT (PB_ID, PB_MODULE_ID, PB_RIGHT_TAG) VALUES ('0000000020', '0000000004', 'rights_browse');
INSERT INTO PB_MODULE_RIGHT (PB_ID, PB_MODULE_ID, PB_RIGHT_TAG) VALUES ('0000000021', '0000000004', 'rights_add');
INSERT INTO PB_MODULE_RIGHT (PB_ID, PB_MODULE_ID, PB_RIGHT_TAG) VALUES ('0000000022', '0000000004', 'rights_edit');
INSERT INTO PB_MODULE_RIGHT (PB_ID, PB_MODULE_ID, PB_RIGHT_TAG) VALUES ('0000000023', '0000000004', 'rights_delete');
INSERT INTO PB_MODULE_RIGHT (PB_ID, PB_MODULE_ID, PB_RIGHT_TAG) VALUES ('0000000024', '0000000004', 'rights_move');
INSERT INTO PB_MODULE_RIGHT (PB_ID, PB_MODULE_ID, PB_RIGHT_TAG) VALUES ('0000000025', '0000000004', 'rights_accredit');

INSERT INTO PB_MODULE_RIGHT (PB_ID, PB_MODULE_ID, PB_RIGHT_TAG) VALUES ('0000000026', '0000000005', 'rights_browse');

INSERT INTO PB_MODULE_RIGHT (PB_ID, PB_MODULE_ID, PB_RIGHT_TAG) VALUES ('0000000027', '0000000006', 'rights_browse');
INSERT INTO PB_MODULE_RIGHT (PB_ID, PB_MODULE_ID, PB_RIGHT_TAG) VALUES ('0000000028', '0000000006', 'rights_add');
INSERT INTO PB_MODULE_RIGHT (PB_ID, PB_MODULE_ID, PB_RIGHT_TAG) VALUES ('0000000029', '0000000006', 'rights_edit');
INSERT INTO PB_MODULE_RIGHT (PB_ID, PB_MODULE_ID, PB_RIGHT_TAG) VALUES ('0000000030', '0000000006', 'rights_delete');

--==============================================================
-- Index: I_MDL_RIGHT_MDL_ID
--==============================================================
create unique index I_MDL_RIGHT_MDL_ID on PB_MODULE_RIGHT (
   PB_MODULE_ID         ASC,
   PB_RIGHT_TAG         ASC
);

--==============================================================
-- Table: PB_MODULE_TYPE
--==============================================================
create table PB_MODULE_TYPE
(
   PB_ID                VARCHAR(15)            not null,
   PB_PARENT_ID         VARCHAR(15),
   PB_NAME              VARCHAR(40)            not null,
   PB_REMARK            VARCHAR(200),
   PB_ORDER_ID          INTEGER                not null,
   constraint P_PK_PB_MODULE_TYP primary key (PB_ID)
);

comment on table PB_MODULE_TYPE is
'ģ�����';

comment on column PB_MODULE_TYPE.PB_ID is
'ID';

comment on column PB_MODULE_TYPE.PB_PARENT_ID is
'��ģ�����ID';

comment on column PB_MODULE_TYPE.PB_NAME is
'����';

comment on column PB_MODULE_TYPE.PB_REMARK is
'��ע';

comment on column PB_MODULE_TYPE.PB_ORDER_ID is
'����ID';

INSERT INTO PB_MODULE_TYPE (PB_ID, PB_NAME, PB_ORDER_ID) VALUES ('0000000000', 'ϵͳ����', 10);
INSERT INTO PB_MODULE_TYPE (PB_ID, PB_NAME, PB_ORDER_ID) VALUES ('0000000001', 'Ȩ�޹���', 20);
INSERT INTO PB_MODULE_TYPE (PB_ID, PB_NAME, PB_ORDER_ID) VALUES ('0000000002', '������Ϣ����', 30);
INSERT INTO PB_MODULE_TYPE (PB_ID, PB_NAME, PB_ORDER_ID) VALUES ('0000000003', 'ǰ̨�û�����', 40);

--==============================================================
-- Index: I_MDL_TYPE_ODR_ID
--==============================================================
create index I_MDL_TYPE_ODR_ID on PB_MODULE_TYPE (
   PB_PARENT_ID         ASC,
   PB_ORDER_ID          ASC
);

--==============================================================
-- Table: PB_ROLE
--==============================================================
create table PB_ROLE
(
   PB_ID                VARCHAR(15)            not null,
   PB_ROLE_TYPE_ID      VARCHAR(15)            not null,
   PB_NAME              VARCHAR(40)            not null,
   PB_REMARK            VARCHAR(200),
   PB_ORDER_ID          INTEGER                not null,
   constraint P_PK_PB_ROLE primary key (PB_ID)
);

comment on table PB_ROLE is
'��ɫ';

comment on column PB_ROLE.PB_ID is
'ID';

comment on column PB_ROLE.PB_ROLE_TYPE_ID is
'��ɫ����ID';

comment on column PB_ROLE.PB_NAME is
'����';

comment on column PB_ROLE.PB_REMARK is
'��ע';

comment on column PB_ROLE.PB_ORDER_ID is
'����ID';

INSERT INTO PB_ROLE (PB_ID, PB_ROLE_TYPE_ID, PB_NAME, PB_ORDER_ID) VALUES ('0000000000', '0000000000', '��������Ա', 10);

--==============================================================
-- Index: I_ROLE_ORDER_ID
--==============================================================
create index I_ROLE_ORDER_ID on PB_ROLE (
   PB_ROLE_TYPE_ID      ASC,
   PB_ORDER_ID          ASC
);

--==============================================================
-- Table: PB_ROLE_MODULE_RIGHT_DENY
--==============================================================
create table PB_ROLE_MODULE_RIGHT_DENY
(
   PB_ROLE_ID           VARCHAR(15)            not null,
   PB_RIGHT_ID          VARCHAR(15)            not null,
   constraint P_PK_PB_ROLE_MODUL primary key (PB_ROLE_ID, PB_RIGHT_ID)
);

comment on table PB_ROLE_MODULE_RIGHT_DENY is
'��ɫģ��Ȩ�޶��ձ��񶨣�';

comment on column PB_ROLE_MODULE_RIGHT_DENY.PB_ROLE_ID is
'��ɫID';

comment on column PB_ROLE_MODULE_RIGHT_DENY.PB_RIGHT_ID is
'Ȩ��ID';

--==============================================================
-- Table: PB_ROLE_MODULE_RIGHT_GRANT
--==============================================================
create table PB_ROLE_MODULE_RIGHT_GRANT
(
   PB_ROLE_ID           VARCHAR(15)            not null,
   PB_RIGHT_ID          VARCHAR(15)            not null,
   constraint P_PK_PB_ROLE_MODUL primary key (PB_ROLE_ID, PB_RIGHT_ID)
);

comment on table PB_ROLE_MODULE_RIGHT_GRANT is
'��ɫģ��Ȩ�޶��ձ��϶���';

comment on column PB_ROLE_MODULE_RIGHT_GRANT.PB_ROLE_ID is
'��ɫID';

comment on column PB_ROLE_MODULE_RIGHT_GRANT.PB_RIGHT_ID is
'Ȩ��ID';

INSERT INTO PB_ROLE_MODULE_RIGHT_GRANT (PB_ROLE_ID, PB_RIGHT_ID) VALUES ('0000000000', '0000000000');
INSERT INTO PB_ROLE_MODULE_RIGHT_GRANT (PB_ROLE_ID, PB_RIGHT_ID) VALUES ('0000000000', '0000000001');
INSERT INTO PB_ROLE_MODULE_RIGHT_GRANT (PB_ROLE_ID, PB_RIGHT_ID) VALUES ('0000000000', '0000000002');
INSERT INTO PB_ROLE_MODULE_RIGHT_GRANT (PB_ROLE_ID, PB_RIGHT_ID) VALUES ('0000000000', '0000000003');
INSERT INTO PB_ROLE_MODULE_RIGHT_GRANT (PB_ROLE_ID, PB_RIGHT_ID) VALUES ('0000000000', '0000000004');
INSERT INTO PB_ROLE_MODULE_RIGHT_GRANT (PB_ROLE_ID, PB_RIGHT_ID) VALUES ('0000000000', '0000000005');
INSERT INTO PB_ROLE_MODULE_RIGHT_GRANT (PB_ROLE_ID, PB_RIGHT_ID) VALUES ('0000000000', '0000000006');
INSERT INTO PB_ROLE_MODULE_RIGHT_GRANT (PB_ROLE_ID, PB_RIGHT_ID) VALUES ('0000000000', '0000000007');
INSERT INTO PB_ROLE_MODULE_RIGHT_GRANT (PB_ROLE_ID, PB_RIGHT_ID) VALUES ('0000000000', '0000000008');
INSERT INTO PB_ROLE_MODULE_RIGHT_GRANT (PB_ROLE_ID, PB_RIGHT_ID) VALUES ('0000000000', '0000000009');
INSERT INTO PB_ROLE_MODULE_RIGHT_GRANT (PB_ROLE_ID, PB_RIGHT_ID) VALUES ('0000000000', '0000000010');
INSERT INTO PB_ROLE_MODULE_RIGHT_GRANT (PB_ROLE_ID, PB_RIGHT_ID) VALUES ('0000000000', '0000000011');
INSERT INTO PB_ROLE_MODULE_RIGHT_GRANT (PB_ROLE_ID, PB_RIGHT_ID) VALUES ('0000000000', '0000000012');
INSERT INTO PB_ROLE_MODULE_RIGHT_GRANT (PB_ROLE_ID, PB_RIGHT_ID) VALUES ('0000000000', '0000000013');
INSERT INTO PB_ROLE_MODULE_RIGHT_GRANT (PB_ROLE_ID, PB_RIGHT_ID) VALUES ('0000000000', '0000000014');
INSERT INTO PB_ROLE_MODULE_RIGHT_GRANT (PB_ROLE_ID, PB_RIGHT_ID) VALUES ('0000000000', '0000000015');
INSERT INTO PB_ROLE_MODULE_RIGHT_GRANT (PB_ROLE_ID, PB_RIGHT_ID) VALUES ('0000000000', '0000000016');
INSERT INTO PB_ROLE_MODULE_RIGHT_GRANT (PB_ROLE_ID, PB_RIGHT_ID) VALUES ('0000000000', '0000000017');
INSERT INTO PB_ROLE_MODULE_RIGHT_GRANT (PB_ROLE_ID, PB_RIGHT_ID) VALUES ('0000000000', '0000000018');
INSERT INTO PB_ROLE_MODULE_RIGHT_GRANT (PB_ROLE_ID, PB_RIGHT_ID) VALUES ('0000000000', '0000000019');
INSERT INTO PB_ROLE_MODULE_RIGHT_GRANT (PB_ROLE_ID, PB_RIGHT_ID) VALUES ('0000000000', '0000000020');
INSERT INTO PB_ROLE_MODULE_RIGHT_GRANT (PB_ROLE_ID, PB_RIGHT_ID) VALUES ('0000000000', '0000000021');
INSERT INTO PB_ROLE_MODULE_RIGHT_GRANT (PB_ROLE_ID, PB_RIGHT_ID) VALUES ('0000000000', '0000000022');
INSERT INTO PB_ROLE_MODULE_RIGHT_GRANT (PB_ROLE_ID, PB_RIGHT_ID) VALUES ('0000000000', '0000000023');
INSERT INTO PB_ROLE_MODULE_RIGHT_GRANT (PB_ROLE_ID, PB_RIGHT_ID) VALUES ('0000000000', '0000000024');
INSERT INTO PB_ROLE_MODULE_RIGHT_GRANT (PB_ROLE_ID, PB_RIGHT_ID) VALUES ('0000000000', '0000000025');
INSERT INTO PB_ROLE_MODULE_RIGHT_GRANT (PB_ROLE_ID, PB_RIGHT_ID) VALUES ('0000000000', '0000000026');
INSERT INTO PB_ROLE_MODULE_RIGHT_GRANT (PB_ROLE_ID, PB_RIGHT_ID) VALUES ('0000000000', '0000000027');
INSERT INTO PB_ROLE_MODULE_RIGHT_GRANT (PB_ROLE_ID, PB_RIGHT_ID) VALUES ('0000000000', '0000000028');
INSERT INTO PB_ROLE_MODULE_RIGHT_GRANT (PB_ROLE_ID, PB_RIGHT_ID) VALUES ('0000000000', '0000000029');
INSERT INTO PB_ROLE_MODULE_RIGHT_GRANT (PB_ROLE_ID, PB_RIGHT_ID) VALUES ('0000000000', '0000000030');

--==============================================================
-- Table: PB_ROLE_TYPE
--==============================================================
create table PB_ROLE_TYPE
(
   PB_ID                VARCHAR(15)            not null,
   PB_PARENT_ID         VARCHAR(15),
   PB_NAME              VARCHAR(40)            not null,
   PB_REMARK            VARCHAR(200),
   PB_ORDER_ID          INTEGER                not null,
   constraint P_PK_PB_ROLE_TYPE primary key (PB_ID)
);

comment on table PB_ROLE_TYPE is
'��ɫ����';

comment on column PB_ROLE_TYPE.PB_ID is
'ID';

comment on column PB_ROLE_TYPE.PB_PARENT_ID is
'����ɫ����ID';

comment on column PB_ROLE_TYPE.PB_NAME is
'����';

comment on column PB_ROLE_TYPE.PB_REMARK is
'��ע';

comment on column PB_ROLE_TYPE.PB_ORDER_ID is
'����ID';

INSERT INTO PB_ROLE_TYPE (PB_ID, PB_NAME, PB_ORDER_ID) VALUES ('0000000000', '����Ա��', 10);

--==============================================================
-- Index: I_ROLE_TYPE_ODR_ID
--==============================================================
create index I_ROLE_TYPE_ODR_ID on PB_ROLE_TYPE (
   PB_PARENT_ID         ASC,
   PB_ORDER_ID          ASC
);

--==============================================================
-- Table: PB_SEQUENCE
--==============================================================
create table PB_SEQUENCE
(
   PB_TABLE_NAME        VARCHAR(50)            not null,
   PB_NEXT_ID           INTEGER                not null,
   constraint P_PK_PB_SEQUENCE primary key (PB_TABLE_NAME)
);

comment on table PB_SEQUENCE is
'����';

comment on column PB_SEQUENCE.PB_TABLE_NAME is
'����';

comment on column PB_SEQUENCE.PB_NEXT_ID is
'��һ������ֵ';

INSERT INTO PB_SEQUENCE VALUES ('PB_DEPARTMENT', 0);
INSERT INTO PB_SEQUENCE VALUES ('PB_MODULE', 7);
INSERT INTO PB_SEQUENCE VALUES ('PB_MODULE_TYPE', 4);
INSERT INTO PB_SEQUENCE VALUES ('PB_MODULE_RIGHT', 31);
INSERT INTO PB_SEQUENCE VALUES ('PB_ROLE', 1);
INSERT INTO PB_SEQUENCE VALUES ('PB_ROLE_TYPE', 1);
INSERT INTO PB_SEQUENCE VALUES ('PB_SYSCODE_TYPE', 7);
INSERT INTO PB_SEQUENCE VALUES ('PB_SYSCODE', 65);

--==============================================================
-- Table: PB_STAFF
--==============================================================
create table PB_STAFF
(
   PB_LOGIN_ID          VARCHAR(20)            not null,
   PB_PASSWORD          VARCHAR(40)            not null,
   PB_DEPARTMENT_ID     VARCHAR(15),
   PB_CODE              VARCHAR(40),
   PB_NAME              VARCHAR(40)            not null,
   PB_SEX               INTEGER,
   PB_MARRIED           INTEGER,
   PB_ID_CARD           VARCHAR(18),
   PB_COUNTRY_TAG       VARCHAR(40),
   PB_NATION_TAG        VARCHAR(40),
   PB_POSITION_TAG      VARCHAR(40),
   PB_TITLE_TAG         VARCHAR(40),
   PB_POLITICAL_APPEARANCE_TAG VARCHAR(40),
   PB_DEGREE_TAG        VARCHAR(40),
   PB_BIRTHDAY          DATE,
   PB_ENTERS_DAY        DATE,
   PB_LEAVES_DAY        DATE,
   PB_OFFICE_PHONE      VARCHAR(40),
   PB_EXT_NUMBER        VARCHAR(20),
   PB_FAMILY_PHONE      VARCHAR(40),
   PB_CELL_PHONE        VARCHAR(40),
   PB_EMAIL             VARCHAR(100),
   PB_ADDRESS           VARCHAR(200),
   PB_ZIP_CODE          VARCHAR(20),
   PB_REMARK            VARCHAR(200),
   PB_IS_INNER_USER     INTEGER                not null,
   PB_DISABLED          INTEGER                not null,
   PB_ORDER_ID          INTEGER                not null,
   constraint P_PK_PB_STAFF primary key (PB_LOGIN_ID)
);

comment on table PB_STAFF is
'ְԱ';

comment on column PB_STAFF.PB_LOGIN_ID is
'��¼ID';

comment on column PB_STAFF.PB_PASSWORD is
'��¼����';

comment on column PB_STAFF.PB_DEPARTMENT_ID is
'����ID';

comment on column PB_STAFF.PB_CODE is
'���';

comment on column PB_STAFF.PB_NAME is
'����';

comment on column PB_STAFF.PB_SEX is
'�Ա�';

comment on column PB_STAFF.PB_MARRIED is
'���';

comment on column PB_STAFF.PB_ID_CARD is
'���֤��';

comment on column PB_STAFF.PB_COUNTRY_TAG is
'����';

comment on column PB_STAFF.PB_NATION_TAG is
'����';

comment on column PB_STAFF.PB_POSITION_TAG is
'ְλ';

comment on column PB_STAFF.PB_TITLE_TAG is
'ְ��';

comment on column PB_STAFF.PB_POLITICAL_APPEARANCE_TAG is
'������ò';

comment on column PB_STAFF.PB_DEGREE_TAG is
'���ѧ��';

comment on column PB_STAFF.PB_BIRTHDAY is
'��������';

comment on column PB_STAFF.PB_ENTERS_DAY is
'��ְ����';

comment on column PB_STAFF.PB_LEAVES_DAY is
'��ְ����';

comment on column PB_STAFF.PB_OFFICE_PHONE is
'�칫�绰';

comment on column PB_STAFF.PB_EXT_NUMBER is
'�ֻ�����';

comment on column PB_STAFF.PB_FAMILY_PHONE is
'��ͥ�绰';

comment on column PB_STAFF.PB_CELL_PHONE is
'�ֻ�';

comment on column PB_STAFF.PB_EMAIL is
'Email';

comment on column PB_STAFF.PB_ADDRESS is
'��ͥסַ';

comment on column PB_STAFF.PB_ZIP_CODE is
'�ʱ�';

comment on column PB_STAFF.PB_REMARK is
'��ע';

comment on column PB_STAFF.PB_IS_INNER_USER is
'�Ƿ������û�';

comment on column PB_STAFF.PB_DISABLED is
'�ѽ���';

comment on column PB_STAFF.PB_ORDER_ID is
'����ID';

INSERT INTO PB_STAFF (PB_LOGIN_ID, PB_PASSWORD, PB_NAME, PB_IS_INNER_USER, PB_DISABLED, PB_ORDER_ID) VALUES ('admin', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'admin', 1, 0, 10);
INSERT INTO PB_STAFF (PB_LOGIN_ID, PB_PASSWORD, PB_NAME, PB_IS_INNER_USER, PB_DISABLED, PB_ORDER_ID) VALUES ('sa', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'sa', 1, 0, 20);

--==============================================================
-- Index: I_STAFF_ORDER_ID
--==============================================================
create index I_STAFF_ORDER_ID on PB_STAFF (
   PB_DEPARTMENT_ID     ASC,
   PB_DISABLED          ASC,
   PB_ORDER_ID          ASC
);

--==============================================================
-- Table: PB_STAFF_MODULE_RIGHT_DENY
--==============================================================
create table PB_STAFF_MODULE_RIGHT_DENY
(
   PB_LOGIN_ID          VARCHAR(20)            not null,
   PB_RIGHT_ID          VARCHAR(15)            not null,
   constraint P_PK_PB_STAFF_MODU primary key (PB_LOGIN_ID, PB_RIGHT_ID)
);

comment on table PB_STAFF_MODULE_RIGHT_DENY is
'ְԱģ��Ȩ�޶��ձ��񶨣�';

comment on column PB_STAFF_MODULE_RIGHT_DENY.PB_LOGIN_ID is
'��¼ID';

comment on column PB_STAFF_MODULE_RIGHT_DENY.PB_RIGHT_ID is
'Ȩ��ID';

--==============================================================
-- Table: PB_STAFF_MODULE_RIGHT_GRANT
--==============================================================
create table PB_STAFF_MODULE_RIGHT_GRANT
(
   PB_LOGIN_ID          VARCHAR(20)            not null,
   PB_RIGHT_ID          VARCHAR(15)            not null,
   constraint P_PK_PB_STAFF_MODU primary key (PB_LOGIN_ID, PB_RIGHT_ID)
);

comment on table PB_STAFF_MODULE_RIGHT_GRANT is
'ְԱģ��Ȩ�޶��ձ��϶���';

comment on column PB_STAFF_MODULE_RIGHT_GRANT.PB_LOGIN_ID is
'��¼ID';

comment on column PB_STAFF_MODULE_RIGHT_GRANT.PB_RIGHT_ID is
'Ȩ��ID';

--==============================================================
-- Table: PB_STAFF_ROLE
--==============================================================
create table PB_STAFF_ROLE
(
   PB_LOGIN_ID          VARCHAR(20)            not null,
   PB_ROLE_ID           VARCHAR(15)            not null,
   constraint P_PK_PB_STAFF_ROLE primary key (PB_ROLE_ID, PB_LOGIN_ID)
);

comment on table PB_STAFF_ROLE is
'ְԱ��ɫ���ձ�';

comment on column PB_STAFF_ROLE.PB_LOGIN_ID is
'��¼ID';

comment on column PB_STAFF_ROLE.PB_ROLE_ID is
'��ɫID';

--==============================================================
-- Table: PB_SYSCODE
--==============================================================
create table PB_SYSCODE
(
   PB_ID                VARCHAR(15)            not null,
   PB_SYSCODE_TYPE_ID   VARCHAR(15)            not null,
   PB_TAG               VARCHAR(40)            not null,
   PB_NAME              VARCHAR(40)            not null,
   PB_REMARK            VARCHAR(200),
   PB_ORDER_ID          INTEGER                not null,
   constraint P_PK_PB_SYSCODE primary key (PB_ID)
);

comment on table PB_SYSCODE is
'����';

comment on column PB_SYSCODE.PB_ID is
'ID';

comment on column PB_SYSCODE.PB_SYSCODE_TYPE_ID is
'�������ID';

comment on column PB_SYSCODE.PB_TAG is
'��ʾ';

comment on column PB_SYSCODE.PB_NAME is
'����';

comment on column PB_SYSCODE.PB_REMARK is
'��ע';

comment on column PB_SYSCODE.PB_ORDER_ID is
'����ID';

INSERT INTO PB_SYSCODE (PB_ID, PB_SYSCODE_TYPE_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000000', '0000000000', 'rights_browse', '���', 10);
INSERT INTO PB_SYSCODE (PB_ID, PB_SYSCODE_TYPE_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000001', '0000000000', 'rights_add', '����', 20);
INSERT INTO PB_SYSCODE (PB_ID, PB_SYSCODE_TYPE_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000002', '0000000000', 'rights_edit', '�༭', 30);
INSERT INTO PB_SYSCODE (PB_ID, PB_SYSCODE_TYPE_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000004', '0000000000', 'rights_delete', 'ɾ��', 40);
INSERT INTO PB_SYSCODE (PB_ID, PB_SYSCODE_TYPE_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000003', '0000000000', 'rights_move', '�ƶ�', 50);
INSERT INTO PB_SYSCODE (PB_ID, PB_SYSCODE_TYPE_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000005', '0000000000', 'rights_print', '��ӡ', 60);
INSERT INTO PB_SYSCODE (PB_ID, PB_SYSCODE_TYPE_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000006', '0000000000', 'rights_download', '����', 70);
INSERT INTO PB_SYSCODE (PB_ID, PB_SYSCODE_TYPE_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000007', '0000000000', 'rights_audit', '���', 80);
INSERT INTO PB_SYSCODE (PB_ID, PB_SYSCODE_TYPE_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000008', '0000000000', 'rights_accredit', '��Ȩ', 90);

INSERT INTO PB_SYSCODE (PB_ID, PB_SYSCODE_TYPE_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000009', '0000000001', 'countrys_china', '�й�', 10);
INSERT INTO PB_SYSCODE (PB_ID, PB_SYSCODE_TYPE_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000010', '0000000001', 'countrys_taiwai', '����', 20);
INSERT INTO PB_SYSCODE (PB_ID, PB_SYSCODE_TYPE_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000011', '0000000001', 'countrys_usa', '�ձ�', 30);
INSERT INTO PB_SYSCODE (PB_ID, PB_SYSCODE_TYPE_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000012', '0000000001', 'countrys_japan', '����', 40);
INSERT INTO PB_SYSCODE (PB_ID, PB_SYSCODE_TYPE_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000013', '0000000001', 'countrys_korea', '����', 50);
INSERT INTO PB_SYSCODE (PB_ID, PB_SYSCODE_TYPE_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000014', '0000000001', 'countrys_singapore', '�¼���', 60);
INSERT INTO PB_SYSCODE (PB_ID, PB_SYSCODE_TYPE_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000015', '0000000001', 'countrys_germany', '�¹�', 70);
INSERT INTO PB_SYSCODE (PB_ID, PB_SYSCODE_TYPE_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000016', '0000000001', 'countrys_france', '����', 80);
INSERT INTO PB_SYSCODE (PB_ID, PB_SYSCODE_TYPE_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000017', '0000000001', 'countrys_italy', '�����', 90);
INSERT INTO PB_SYSCODE (PB_ID, PB_SYSCODE_TYPE_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000018', '0000000001', 'countrys_spain', '������', 100);
INSERT INTO PB_SYSCODE (PB_ID, PB_SYSCODE_TYPE_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000019', '0000000001', 'countrys_switzerland', '��ʿ', 110);
INSERT INTO PB_SYSCODE (PB_ID, PB_SYSCODE_TYPE_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000020', '0000000001', 'countrys_england', 'Ӣ��', 120);
INSERT INTO PB_SYSCODE (PB_ID, PB_SYSCODE_TYPE_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000021', '0000000001', 'countrys_russia', '����˹', 130);
INSERT INTO PB_SYSCODE (PB_ID, PB_SYSCODE_TYPE_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000022', '0000000001', 'countrys_australia', '�Ĵ�����', 140);
INSERT INTO PB_SYSCODE (PB_ID, PB_SYSCODE_TYPE_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000023', '0000000001', 'countrys_india', 'ӡ��', 150);

INSERT INTO PB_SYSCODE (PB_ID, PB_SYSCODE_TYPE_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000024', '0000000002', 'nations_han', '����', 10);
INSERT INTO PB_SYSCODE (PB_ID, PB_SYSCODE_TYPE_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000025', '0000000002', 'nations_chuang', '׳��', 20);
INSERT INTO PB_SYSCODE (PB_ID, PB_SYSCODE_TYPE_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000026', '0000000002', 'nations_manchu', '����', 30);
INSERT INTO PB_SYSCODE (PB_ID, PB_SYSCODE_TYPE_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000027', '0000000002', 'nations_hui', '����', 40);
INSERT INTO PB_SYSCODE (PB_ID, PB_SYSCODE_TYPE_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000028', '0000000002', 'nations_miao', '����', 50);
INSERT INTO PB_SYSCODE (PB_ID, PB_SYSCODE_TYPE_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000029', '0000000002', 'nations_wei', 'ά�����', 60);
INSERT INTO PB_SYSCODE (PB_ID, PB_SYSCODE_TYPE_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000030', '0000000002', 'nations_yi', '����', 70);
INSERT INTO PB_SYSCODE (PB_ID, PB_SYSCODE_TYPE_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000031', '0000000002', 'nations_tu', '������', 80);
INSERT INTO PB_SYSCODE (PB_ID, PB_SYSCODE_TYPE_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000032', '0000000002', 'nations_meng', '�ɹ���', 90);
INSERT INTO PB_SYSCODE (PB_ID, PB_SYSCODE_TYPE_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000033', '0000000002', 'nations_zang', '����', 100);
INSERT INTO PB_SYSCODE (PB_ID, PB_SYSCODE_TYPE_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000034', '0000000002', 'nations_dong', '����', 110);
INSERT INTO PB_SYSCODE (PB_ID, PB_SYSCODE_TYPE_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000035', '0000000002', 'nations_yao', '����', 120);
INSERT INTO PB_SYSCODE (PB_ID, PB_SYSCODE_TYPE_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000036', '0000000002', 'nations_chao', '������', 130);
INSERT INTO PB_SYSCODE (PB_ID, PB_SYSCODE_TYPE_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000037', '0000000002', 'nations_bai', '����', 140);
INSERT INTO PB_SYSCODE (PB_ID, PB_SYSCODE_TYPE_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000038', '0000000002', 'nations_hani', '������', 150);
INSERT INTO PB_SYSCODE (PB_ID, PB_SYSCODE_TYPE_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000039', '0000000002', 'nations_hasake', '��������', 160);
INSERT INTO PB_SYSCODE (PB_ID, PB_SYSCODE_TYPE_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000040', '0000000002', 'nations_li', '����', 170);
INSERT INTO PB_SYSCODE (PB_ID, PB_SYSCODE_TYPE_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000041', '0000000002', 'nations_dai', '����', 180);
INSERT INTO PB_SYSCODE (PB_ID, PB_SYSCODE_TYPE_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000042', '0000000002', 'nations_she', '���', 190);

INSERT INTO PB_SYSCODE (PB_ID, PB_SYSCODE_TYPE_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000043', '0000000003', 'positions_chairman', '���³�', 10);
INSERT INTO PB_SYSCODE (PB_ID, PB_SYSCODE_TYPE_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000044', '0000000003', 'positions_director', '����', 20);
INSERT INTO PB_SYSCODE (PB_ID, PB_SYSCODE_TYPE_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000045', '0000000003', 'positions_generalmanager', '�ܾ���', 30);
INSERT INTO PB_SYSCODE (PB_ID, PB_SYSCODE_TYPE_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000046', '0000000003', 'positions_manager', '���ܾ���', 40);
INSERT INTO PB_SYSCODE (PB_ID, PB_SYSCODE_TYPE_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000047', '0000000003', 'positions_departmanager', '���ž���', 50);
INSERT INTO PB_SYSCODE (PB_ID, PB_SYSCODE_TYPE_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000048', '0000000003', 'positions_employee', 'Ա��', 60);

INSERT INTO PB_SYSCODE (PB_ID, PB_SYSCODE_TYPE_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000049', '0000000004', 'titles_high', '�߼�ְ��', 10);
INSERT INTO PB_SYSCODE (PB_ID, PB_SYSCODE_TYPE_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000050', '0000000004', 'titles_middle', '�м�ְ��', 20);
INSERT INTO PB_SYSCODE (PB_ID, PB_SYSCODE_TYPE_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000051', '0000000004', 'titles_primary', '����ְ��', 30);

INSERT INTO PB_SYSCODE (PB_ID, PB_SYSCODE_TYPE_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000052', '0000000005', 'politicals_cpcmembers', '�й���Ա', 10);
INSERT INTO PB_SYSCODE (PB_ID, PB_SYSCODE_TYPE_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000053', '0000000005', 'politicals_youths', '������Ա', 20);
INSERT INTO PB_SYSCODE (PB_ID, PB_SYSCODE_TYPE_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000054', '0000000005', 'politicals_democratics', '��������', 30);
INSERT INTO PB_SYSCODE (PB_ID, PB_SYSCODE_TYPE_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000055', '0000000005', 'politicals_non', '�޵���', 40);

INSERT INTO PB_SYSCODE (PB_ID, PB_SYSCODE_TYPE_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000056', '0000000006', 'degrees_postdoctoral', '��ʿ��', 10);
INSERT INTO PB_SYSCODE (PB_ID, PB_SYSCODE_TYPE_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000057', '0000000006', 'degrees_doctor', '��ʿ', 20);
INSERT INTO PB_SYSCODE (PB_ID, PB_SYSCODE_TYPE_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000058', '0000000006', 'degrees_master', '˶ʿ', 30);
INSERT INTO PB_SYSCODE (PB_ID, PB_SYSCODE_TYPE_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000059', '0000000006', 'degrees_bachelor', '����', 40);
INSERT INTO PB_SYSCODE (PB_ID, PB_SYSCODE_TYPE_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000060', '0000000006', 'degrees_college', '��ר', 50);
INSERT INTO PB_SYSCODE (PB_ID, PB_SYSCODE_TYPE_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000061', '0000000006', 'degrees_highschool', '����', 60);
INSERT INTO PB_SYSCODE (PB_ID, PB_SYSCODE_TYPE_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000062', '0000000006', 'degrees_junior', '����', 70);
INSERT INTO PB_SYSCODE (PB_ID, PB_SYSCODE_TYPE_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000063', '0000000006', 'degrees_primary', 'Сѧ', 80);
INSERT INTO PB_SYSCODE (PB_ID, PB_SYSCODE_TYPE_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000064', '0000000006', 'degrees_illiteracy', 'Сѧ����', 90);

--==============================================================
-- Index: I_SYSCODE_ORDER_ID
--==============================================================
create index I_SYSCODE_ORDER_ID on PB_SYSCODE (
   PB_SYSCODE_TYPE_ID   ASC,
   PB_ORDER_ID          ASC
);

--==============================================================
-- Index: I_SYSCODE_TAG
--==============================================================
create unique index I_SYSCODE_TAG on PB_SYSCODE (
   PB_TAG               ASC
);

--==============================================================
-- Table: PB_SYSCODE_TYPE
--==============================================================
create table PB_SYSCODE_TYPE
(
   PB_ID                VARCHAR(15)            not null,
   PB_TAG               VARCHAR(20)            not null,
   PB_NAME              VARCHAR(40)            not null,
   PB_REMARK            VARCHAR(200),
   PB_ORDER_ID          INTEGER                not null,
   constraint P_PK_PB_SYSCODE_TY primary key (PB_ID)
);

comment on table PB_SYSCODE_TYPE is
'�������';

comment on column PB_SYSCODE_TYPE.PB_ID is
'ID';

comment on column PB_SYSCODE_TYPE.PB_TAG is
'��ʾ';

comment on column PB_SYSCODE_TYPE.PB_NAME is
'����';

comment on column PB_SYSCODE_TYPE.PB_REMARK is
'��ע';

comment on column PB_SYSCODE_TYPE.PB_ORDER_ID is
'����ID';

INSERT INTO PB_SYSCODE_TYPE (PB_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000000', 'rights', 'Ȩ��', 10);
INSERT INTO PB_SYSCODE_TYPE (PB_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000001', 'countrys', '����', 20);
INSERT INTO PB_SYSCODE_TYPE (PB_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000002', 'nations', '����', 30);
INSERT INTO PB_SYSCODE_TYPE (PB_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000003', 'positions', 'ְλ', 40);
INSERT INTO PB_SYSCODE_TYPE (PB_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000004', 'titles', 'ְ��', 50);
INSERT INTO PB_SYSCODE_TYPE (PB_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000005', 'politicals', '������ò', 60);
INSERT INTO PB_SYSCODE_TYPE (PB_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000006', 'degrees', '���ѧ��', 70);

--==============================================================
-- Index: I_SYSC_TYPE_ODR_ID
--==============================================================
create index I_SYSC_TYPE_ODR_ID on PB_SYSCODE_TYPE (
   PB_ORDER_ID          ASC
);

--==============================================================
-- Index: I_SYSCODE_TYPE_TAG
--==============================================================
create unique index I_SYSCODE_TYPE_TAG on PB_SYSCODE_TYPE (
   PB_TAG               ASC
);

--==============================================================
-- Table: PB_USER
--==============================================================
create table PB_USER
(
   PB_LOGIN_ID          VARCHAR(20)            not null,
   PB_PASSWORD          VARCHAR(40)            not null,
   PB_NAME              VARCHAR(40),
   PB_SEX               INTEGER,
   PB_BIRTHDAY          DATE,
   PB_ID_CARD           VARCHAR(18),
   PB_OFFICE_PHONE      VARCHAR(40),
   PB_FAMILY_PHONE      VARCHAR(40),
   PB_CELL_PHONE        VARCHAR(40),
   PB_EMAIL             VARCHAR(100),
   PB_ADDRESS           VARCHAR(200),
   PB_ZIP_CODE          VARCHAR(20),
   PB_REMARK            VARCHAR(200),
   PB_DISABLED          INTEGER                not null,
   PB_REGISTER_DATE     DATE                   not null,
   constraint P_PK_PB_USER primary key (PB_LOGIN_ID)
);

comment on table PB_USER is
'ǰ̨�û���';

comment on column PB_USER.PB_LOGIN_ID is
'��¼ID';

comment on column PB_USER.PB_PASSWORD is
'��¼����';

comment on column PB_USER.PB_NAME is
'����';

comment on column PB_USER.PB_SEX is
'�Ա�';

comment on column PB_USER.PB_BIRTHDAY is
'��������';

comment on column PB_USER.PB_ID_CARD is
'���֤��';

comment on column PB_USER.PB_OFFICE_PHONE is
'�칫�绰';

comment on column PB_USER.PB_FAMILY_PHONE is
'��ͥ�绰';

comment on column PB_USER.PB_CELL_PHONE is
'�ֻ�';

comment on column PB_USER.PB_EMAIL is
'Email';

comment on column PB_USER.PB_ADDRESS is
'ͨѶ��ַ';

comment on column PB_USER.PB_ZIP_CODE is
'�ʱ�';

comment on column PB_USER.PB_REMARK is
'��ע';

comment on column PB_USER.PB_DISABLED is
'�ѽ���';

comment on column PB_USER.PB_REGISTER_DATE is
'ע��ʱ��';

--==============================================================
-- Index: I_USER_REG_DATE
--==============================================================
create index I_USER_REG_DATE on PB_USER (
   PB_REGISTER_DATE     DESC
);

alter table PB_MODULE
   add constraint MDL_TYPE_REF_MDL foreign key (PB_MODULE_TYPE_ID)
      references PB_MODULE_TYPE (PB_ID)
      on delete restrict on update restrict;

alter table PB_MODULE_RIGHT
   add constraint MDL_REF_MDL_RIT foreign key (PB_MODULE_ID)
      references PB_MODULE (PB_ID)
      on delete restrict on update restrict;

alter table PB_ROLE
   add constraint ROLE_TYPE_REF_ROLE foreign key (PB_ROLE_TYPE_ID)
      references PB_ROLE_TYPE (PB_ID)
      on delete restrict on update restrict;

alter table PB_ROLE_MODULE_RIGHT_DENY
   add constraint M_R_REF_RL_M_R_DN foreign key (PB_RIGHT_ID)
      references PB_MODULE_RIGHT (PB_ID)
      on delete restrict on update restrict;

alter table PB_ROLE_MODULE_RIGHT_DENY
   add constraint RL_REF_RL_M_R_DN foreign key (PB_ROLE_ID)
      references PB_ROLE (PB_ID)
      on delete restrict on update restrict;

alter table PB_ROLE_MODULE_RIGHT_GRANT
   add constraint M_R_REF_RL_M_R_GRT foreign key (PB_RIGHT_ID)
      references PB_MODULE_RIGHT (PB_ID)
      on delete restrict on update restrict;

alter table PB_ROLE_MODULE_RIGHT_GRANT
   add constraint RL_REF_RL_M_R_GRT foreign key (PB_ROLE_ID)
      references PB_ROLE (PB_ID)
      on delete restrict on update restrict;

alter table PB_STAFF
   add constraint DEPART_REF_STF foreign key (PB_DEPARTMENT_ID)
      references PB_DEPARTMENT (PB_ID)
      on delete restrict on update restrict;

alter table PB_STAFF_MODULE_RIGHT_DENY
   add constraint M_R_REF_STF_M_R_DN foreign key (PB_RIGHT_ID)
      references PB_MODULE_RIGHT (PB_ID)
      on delete restrict on update restrict;

alter table PB_STAFF_MODULE_RIGHT_DENY
   add constraint STF_REF_STF_M_R_DN foreign key (PB_LOGIN_ID)
      references PB_STAFF (PB_LOGIN_ID)
      on delete restrict on update restrict;

alter table PB_STAFF_MODULE_RIGHT_GRANT
   add constraint M_R_REF_STF_M_R_GT foreign key (PB_RIGHT_ID)
      references PB_MODULE_RIGHT (PB_ID)
      on delete restrict on update restrict;

alter table PB_STAFF_MODULE_RIGHT_GRANT
   add constraint STF_REF_STF_M_R_GT foreign key (PB_LOGIN_ID)
      references PB_STAFF (PB_LOGIN_ID)
      on delete restrict on update restrict;

alter table PB_STAFF_ROLE
   add constraint RL_REF_STF_RL foreign key (PB_ROLE_ID)
      references PB_ROLE (PB_ID)
      on delete restrict on update restrict;

alter table PB_STAFF_ROLE
   add constraint STF_REF_STF_RL foreign key (PB_LOGIN_ID)
      references PB_STAFF (PB_LOGIN_ID)
      on delete restrict on update restrict;

alter table PB_SYSCODE
   add constraint SYS_TYPE_REF_SYS foreign key (PB_SYSCODE_TYPE_ID)
      references PB_SYSCODE_TYPE (PB_ID)
      on delete restrict on update restrict;

