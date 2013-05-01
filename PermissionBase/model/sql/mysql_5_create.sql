/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2006-9-17 20:28:08                           */
/*==============================================================*/

set names gbk;

/*==============================================================*/
/* Database: PermissionBase                                     */
/*==============================================================*/
create database PermissionBase;

use PermissionBase;

/*==============================================================*/
/* Table: PB_DEPARTMENT                                         */
/*==============================================================*/
create table PB_DEPARTMENT
(
   PB_ID                varchar(15) not null,
   PB_PARENT_ID         varchar(15),
   PB_NAME              varchar(40) not null,
   PB_PHONE             varchar(40),
   PB_EXT_NUMBER        varchar(20),
   PB_FAX               varchar(40),
   PB_REMARK            varchar(200),
   PB_ORDER_ID          int not null,
   primary key (PB_ID)
);

/*==============================================================*/
/* Index: I_PB_DEPARTMENT_ORDER_ID                              */
/*==============================================================*/
create index I_PB_DEPARTMENT_ORDER_ID on PB_DEPARTMENT
(
   PB_PARENT_ID,
   PB_ORDER_ID
);

/*==============================================================*/
/* Table: PB_MODULE                                             */
/*==============================================================*/
create table PB_MODULE
(
   PB_ID                varchar(15) not null,
   PB_MODULE_TYPE_ID    varchar(15) not null,
   PB_TAG               varchar(40) not null,
   PB_NAME              varchar(40) not null,
   PB_MODULE_URL        varchar(200),
   PB_REMARK            varchar(200),
   PB_DISABLED          int not null,
   PB_ORDER_ID          int not null,
   primary key (PB_ID)
);

INSERT INTO PB_MODULE (PB_ID, PB_MODULE_TYPE_ID, PB_TAG, PB_NAME, PB_MODULE_URL, PB_DISABLED, PB_ORDER_ID) VALUES ('0000000000', '0000000000', 'SysCodeMgr', '�������', '../Modules/SysCodeMgr/Default.aspx', 0, 10);
INSERT INTO PB_MODULE (PB_ID, PB_MODULE_TYPE_ID, PB_TAG, PB_NAME, PB_MODULE_URL, PB_DISABLED, PB_ORDER_ID) VALUES ('0000000001', '0000000000', 'ModuleMgr', 'ģ�����', '../Modules/ModuleMgr/Default.aspx', 0, 20);
INSERT INTO PB_MODULE (PB_ID, PB_MODULE_TYPE_ID, PB_TAG, PB_NAME, PB_MODULE_URL, PB_DISABLED, PB_ORDER_ID) VALUES ('0000000002', '0000000001', 'RoleMgr', '��ɫ����', '../Modules/RoleMgr/Default.aspx', 0, 10);
INSERT INTO PB_MODULE (PB_ID, PB_MODULE_TYPE_ID, PB_TAG, PB_NAME, PB_MODULE_URL, PB_DISABLED, PB_ORDER_ID) VALUES ('0000000003', '0000000001', 'DepartmentMgr', '���Ź���', '../Modules/DepartmentMgr/Default.aspx', 0, 20);
INSERT INTO PB_MODULE (PB_ID, PB_MODULE_TYPE_ID, PB_TAG, PB_NAME, PB_MODULE_URL, PB_DISABLED, PB_ORDER_ID) VALUES ('0000000004', '0000000001', 'StaffMgr', 'ְԱ����', '../Modules/StaffMgr/Default.aspx', 0, 30);
INSERT INTO PB_MODULE (PB_ID, PB_MODULE_TYPE_ID, PB_TAG, PB_NAME, PB_MODULE_URL, PB_DISABLED, PB_ORDER_ID) VALUES ('0000000005', '0000000002', 'ChangeMyPwd', '�޸�����', '../Modules/ChangeMyPwd/Default.aspx', 0, 10);
INSERT INTO PB_MODULE (PB_ID, PB_MODULE_TYPE_ID, PB_TAG, PB_NAME, PB_MODULE_URL, PB_DISABLED, PB_ORDER_ID) VALUES ('0000000006', '0000000003', 'UserMgr', '�û���Ϣ����', '../Modules/UserMgr/Default.aspx', 0, 10);

/*==============================================================*/
/* Index: I_PB_MODULE_ORDER_ID                                  */
/*==============================================================*/
create index I_PB_MODULE_ORDER_ID on PB_MODULE
(
   PB_MODULE_TYPE_ID,
   PB_ORDER_ID
);

/*==============================================================*/
/* Index: I_PB_MODULE_TAG                                       */
/*==============================================================*/
create unique index I_PB_MODULE_TAG on PB_MODULE
(
   PB_TAG
);

/*==============================================================*/
/* Table: PB_MODULE_RIGHT                                       */
/*==============================================================*/
create table PB_MODULE_RIGHT
(
   PB_ID                varchar(15) not null,
   PB_MODULE_ID         varchar(15) not null,
   PB_RIGHT_TAG         varchar(40) not null,
   primary key (PB_ID)
);

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

/*==============================================================*/
/* Index: I_PB_MODULE_RIGHT_MODULE_ID                           */
/*==============================================================*/
create unique index I_PB_MODULE_RIGHT_MODULE_ID on PB_MODULE_RIGHT
(
   PB_MODULE_ID,
   PB_RIGHT_TAG
);

/*==============================================================*/
/* Table: PB_MODULE_TYPE                                        */
/*==============================================================*/
create table PB_MODULE_TYPE
(
   PB_ID                varchar(15) not null,
   PB_PARENT_ID         varchar(15),
   PB_NAME              varchar(40) not null,
   PB_REMARK            varchar(200),
   PB_ORDER_ID          int not null,
   primary key (PB_ID)
);

INSERT INTO PB_MODULE_TYPE (PB_ID, PB_NAME, PB_ORDER_ID) VALUES ('0000000000', 'ϵͳ����', 10);
INSERT INTO PB_MODULE_TYPE (PB_ID, PB_NAME, PB_ORDER_ID) VALUES ('0000000001', 'Ȩ�޹���', 20);
INSERT INTO PB_MODULE_TYPE (PB_ID, PB_NAME, PB_ORDER_ID) VALUES ('0000000002', '������Ϣ����', 30);
INSERT INTO PB_MODULE_TYPE (PB_ID, PB_NAME, PB_ORDER_ID) VALUES ('0000000003', 'ǰ̨�û�����', 40);

/*==============================================================*/
/* Index: I_PB_MODULE_TYPE_ORDER_ID                             */
/*==============================================================*/
create index I_PB_MODULE_TYPE_ORDER_ID on PB_MODULE_TYPE
(
   PB_PARENT_ID,
   PB_ORDER_ID
);

/*==============================================================*/
/* Table: PB_ROLE                                               */
/*==============================================================*/
create table PB_ROLE
(
   PB_ID                varchar(15) not null,
   PB_ROLE_TYPE_ID      varchar(15) not null,
   PB_NAME              varchar(40) not null,
   PB_REMARK            varchar(200),
   PB_ORDER_ID          int not null,
   primary key (PB_ID)
);

INSERT INTO PB_ROLE (PB_ID, PB_ROLE_TYPE_ID, PB_NAME, PB_ORDER_ID) VALUES ('0000000000', '0000000000', '��������Ա', 10);

/*==============================================================*/
/* Index: I_PB_ROLE_ORDER_ID                                    */
/*==============================================================*/
create index I_PB_ROLE_ORDER_ID on PB_ROLE
(
   PB_ROLE_TYPE_ID,
   PB_ORDER_ID
);

/*==============================================================*/
/* Table: PB_ROLE_MODULE_RIGHT_DENY                             */
/*==============================================================*/
create table PB_ROLE_MODULE_RIGHT_DENY
(
   PB_ROLE_ID           varchar(15) not null,
   PB_RIGHT_ID          varchar(15) not null,
   primary key (PB_ROLE_ID, PB_RIGHT_ID)
);

/*==============================================================*/
/* Table: PB_ROLE_MODULE_RIGHT_GRANT                            */
/*==============================================================*/
create table PB_ROLE_MODULE_RIGHT_GRANT
(
   PB_ROLE_ID           varchar(15) not null,
   PB_RIGHT_ID          varchar(15) not null,
   primary key (PB_ROLE_ID, PB_RIGHT_ID)
);

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

/*==============================================================*/
/* Table: PB_ROLE_TYPE                                          */
/*==============================================================*/
create table PB_ROLE_TYPE
(
   PB_ID                varchar(15) not null,
   PB_PARENT_ID         varchar(15),
   PB_NAME              varchar(40) not null,
   PB_REMARK            varchar(200),
   PB_ORDER_ID          int not null,
   primary key (PB_ID)
);

INSERT INTO PB_ROLE_TYPE (PB_ID, PB_NAME, PB_ORDER_ID) VALUES ('0000000000', '����Ա��', 10);

/*==============================================================*/
/* Index: I_PB_ROLE_TYPE_ORDER_ID                               */
/*==============================================================*/
create index I_PB_ROLE_TYPE_ORDER_ID on PB_ROLE_TYPE
(
   PB_PARENT_ID,
   PB_ORDER_ID
);

/*==============================================================*/
/* Table: PB_SEQUENCE                                           */
/*==============================================================*/
create table PB_SEQUENCE
(
   PB_TABLE_NAME        varchar(50) not null,
   PB_NEXT_ID           int not null,
   primary key (PB_TABLE_NAME)
);

INSERT INTO PB_SEQUENCE VALUES ('PB_DEPARTMENT', 0);
INSERT INTO PB_SEQUENCE VALUES ('PB_MODULE', 7);
INSERT INTO PB_SEQUENCE VALUES ('PB_MODULE_TYPE', 4);
INSERT INTO PB_SEQUENCE VALUES ('PB_MODULE_RIGHT', 31);
INSERT INTO PB_SEQUENCE VALUES ('PB_ROLE', 1);
INSERT INTO PB_SEQUENCE VALUES ('PB_ROLE_TYPE', 1);
INSERT INTO PB_SEQUENCE VALUES ('PB_SYSCODE_TYPE', 7);
INSERT INTO PB_SEQUENCE VALUES ('PB_SYSCODE', 65);

/*==============================================================*/
/* Table: PB_STAFF                                              */
/*==============================================================*/
create table PB_STAFF
(
   PB_LOGIN_ID          varchar(20) not null,
   PB_PASSWORD          varchar(40) not null,
   PB_DEPARTMENT_ID     varchar(15),
   PB_CODE              varchar(40),
   PB_NAME              varchar(40) not null,
   PB_SEX               int,
   PB_MARRIED           int,
   PB_ID_CARD           varchar(18),
   PB_COUNTRY_TAG       varchar(40),
   PB_NATION_TAG        varchar(40),
   PB_POSITION_TAG      varchar(40),
   PB_TITLE_TAG         varchar(40),
   PB_POLITICAL_APPEARANCE_TAG varchar(40),
   PB_DEGREE_TAG        varchar(40),
   PB_BIRTHDAY          datetime,
   PB_ENTERS_DAY        datetime,
   PB_LEAVES_DAY        datetime,
   PB_OFFICE_PHONE      varchar(40),
   PB_EXT_NUMBER        varchar(20),
   PB_FAMILY_PHONE      varchar(40),
   PB_CELL_PHONE        varchar(40),
   PB_EMAIL             varchar(100),
   PB_ADDRESS           varchar(200),
   PB_ZIP_CODE          varchar(20),
   PB_REMARK            varchar(200),
   PB_IS_INNER_USER     int not null,
   PB_DISABLED          int not null,
   PB_ORDER_ID          int not null,
   primary key (PB_LOGIN_ID)
);

INSERT INTO PB_STAFF (PB_LOGIN_ID, PB_PASSWORD, PB_NAME, PB_IS_INNER_USER, PB_DISABLED, PB_ORDER_ID) VALUES ('admin', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'admin', 1, 0, 10);
INSERT INTO PB_STAFF (PB_LOGIN_ID, PB_PASSWORD, PB_NAME, PB_IS_INNER_USER, PB_DISABLED, PB_ORDER_ID) VALUES ('sa', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'sa', 1, 0, 20);

/*==============================================================*/
/* Index: I_PB_STAFF_ORDER_ID                                   */
/*==============================================================*/
create index I_PB_STAFF_ORDER_ID on PB_STAFF
(
   PB_DEPARTMENT_ID,
   PB_DISABLED,
   PB_ORDER_ID
);

/*==============================================================*/
/* Table: PB_STAFF_MODULE_RIGHT_DENY                            */
/*==============================================================*/
create table PB_STAFF_MODULE_RIGHT_DENY
(
   PB_LOGIN_ID          varchar(20) not null,
   PB_RIGHT_ID          varchar(15) not null,
   primary key (PB_LOGIN_ID, PB_RIGHT_ID)
);

/*==============================================================*/
/* Table: PB_STAFF_MODULE_RIGHT_GRANT                           */
/*==============================================================*/
create table PB_STAFF_MODULE_RIGHT_GRANT
(
   PB_LOGIN_ID          varchar(20) not null,
   PB_RIGHT_ID          varchar(15) not null,
   primary key (PB_LOGIN_ID, PB_RIGHT_ID)
);

/*==============================================================*/
/* Table: PB_STAFF_ROLE                                         */
/*==============================================================*/
create table PB_STAFF_ROLE
(
   PB_LOGIN_ID          varchar(20) not null,
   PB_ROLE_ID           varchar(15) not null,
   primary key (PB_ROLE_ID, PB_LOGIN_ID)
);

/*==============================================================*/
/* Table: PB_SYSCODE                                            */
/*==============================================================*/
create table PB_SYSCODE
(
   PB_ID                varchar(15) not null,
   PB_SYSCODE_TYPE_ID   varchar(15) not null,
   PB_TAG               varchar(40) not null,
   PB_NAME              varchar(40) not null,
   PB_REMARK            varchar(200),
   PB_ORDER_ID          int not null,
   primary key (PB_ID)
);

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
INSERT INTO PB_SYSCODE (PB_ID, PB_SYSCODE_TYPE_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000035', '0000000002', 'nations_gao', '����', 120);
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

/*==============================================================*/
/* Index: I_PB_SYSCODE_ORDER_ID                                 */
/*==============================================================*/
create index I_PB_SYSCODE_ORDER_ID on PB_SYSCODE
(
   PB_SYSCODE_TYPE_ID,
   PB_ORDER_ID
);

/*==============================================================*/
/* Index: I_PB_SYSCODE_TAG                                      */
/*==============================================================*/
create unique index I_PB_SYSCODE_TAG on PB_SYSCODE
(
   PB_TAG
);

/*==============================================================*/
/* Table: PB_SYSCODE_TYPE                                       */
/*==============================================================*/
create table PB_SYSCODE_TYPE
(
   PB_ID                varchar(15) not null,
   PB_TAG               varchar(20) not null,
   PB_NAME              varchar(40) not null,
   PB_REMARK            varchar(200),
   PB_ORDER_ID          int not null,
   primary key (PB_ID)
);

INSERT INTO PB_SYSCODE_TYPE (PB_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000000', 'rights', 'Ȩ��', 10);
INSERT INTO PB_SYSCODE_TYPE (PB_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000001', 'countrys', '����', 20);
INSERT INTO PB_SYSCODE_TYPE (PB_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000002', 'nations', '����', 30);
INSERT INTO PB_SYSCODE_TYPE (PB_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000003', 'positions', 'ְλ', 40);
INSERT INTO PB_SYSCODE_TYPE (PB_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000004', 'titles', 'ְ��', 50);
INSERT INTO PB_SYSCODE_TYPE (PB_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000005', 'politicals', '������ò', 60);
INSERT INTO PB_SYSCODE_TYPE (PB_ID, PB_TAG, PB_NAME, PB_ORDER_ID) VALUES ('0000000006', 'degrees', '���ѧ��', 70);

/*==============================================================*/
/* Index: I_PB_SYSCODE_TYPE_ORDER_ID                            */
/*==============================================================*/
create index I_PB_SYSCODE_TYPE_ORDER_ID on PB_SYSCODE_TYPE
(
   PB_ORDER_ID
);

/*==============================================================*/
/* Index: I_PB_SYSCODE_TYPE_TAG                                 */
/*==============================================================*/
create unique index I_PB_SYSCODE_TYPE_TAG on PB_SYSCODE_TYPE
(
   PB_TAG
);

/*==============================================================*/
/* Table: PB_USER                                               */
/*==============================================================*/
create table PB_USER
(
   PB_LOGIN_ID          varchar(20) not null,
   PB_PASSWORD          varchar(40) not null,
   PB_NAME              varchar(40),
   PB_SEX               int,
   PB_BIRTHDAY          datetime,
   PB_ID_CARD           varchar(18),
   PB_OFFICE_PHONE      varchar(40),
   PB_FAMILY_PHONE      varchar(40),
   PB_CELL_PHONE        varchar(40),
   PB_EMAIL             varchar(100),
   PB_ADDRESS           varchar(200),
   PB_ZIP_CODE          varchar(20),
   PB_REMARK            varchar(200),
   PB_DISABLED          int not null,
   PB_REGISTER_DATE     datetime not null,
   primary key (PB_LOGIN_ID)
);

/*==============================================================*/
/* Index: I_PB_USER_REGISTER_DATE                               */
/*==============================================================*/
create index I_PB_USER_REGISTER_DATE on PB_USER
(
   PB_REGISTER_DATE
);

alter table PB_MODULE add constraint MODULE_TYPE_REF_MODULE foreign key (PB_MODULE_TYPE_ID)
      references PB_MODULE_TYPE (PB_ID) on delete restrict on update restrict;

alter table PB_MODULE_RIGHT add constraint MODULE_REF_MODULE_RIGHT foreign key (PB_MODULE_ID)
      references PB_MODULE (PB_ID) on delete restrict on update restrict;

alter table PB_ROLE add constraint ROLE_TYPE_REF_ROLE foreign key (PB_ROLE_TYPE_ID)
      references PB_ROLE_TYPE (PB_ID) on delete restrict on update restrict;

alter table PB_ROLE_MODULE_RIGHT_DENY add constraint M_R_REF_ROLE_M_R_DENY foreign key (PB_RIGHT_ID)
      references PB_MODULE_RIGHT (PB_ID) on delete restrict on update restrict;

alter table PB_ROLE_MODULE_RIGHT_DENY add constraint ROLE_REF_ROLE_M_R_DENY foreign key (PB_ROLE_ID)
      references PB_ROLE (PB_ID) on delete restrict on update restrict;

alter table PB_ROLE_MODULE_RIGHT_GRANT add constraint M_R_REF_ROLE_M_R_GRANT foreign key (PB_RIGHT_ID)
      references PB_MODULE_RIGHT (PB_ID) on delete restrict on update restrict;

alter table PB_ROLE_MODULE_RIGHT_GRANT add constraint ROLE_REF_ROLE_M_R_GRANT foreign key (PB_ROLE_ID)
      references PB_ROLE (PB_ID) on delete restrict on update restrict;

alter table PB_STAFF add constraint DEPARTMENT_REF_STAFF foreign key (PB_DEPARTMENT_ID)
      references PB_DEPARTMENT (PB_ID) on delete restrict on update restrict;

alter table PB_STAFF_MODULE_RIGHT_DENY add constraint M_R_REF_STAFF_M_R_DENY foreign key (PB_RIGHT_ID)
      references PB_MODULE_RIGHT (PB_ID) on delete restrict on update restrict;

alter table PB_STAFF_MODULE_RIGHT_DENY add constraint STAFF_REF_STAFF_M_R_DENY foreign key (PB_LOGIN_ID)
      references PB_STAFF (PB_LOGIN_ID) on delete restrict on update restrict;

alter table PB_STAFF_MODULE_RIGHT_GRANT add constraint M_R_REF_STAFF_M_R_GRANT foreign key (PB_RIGHT_ID)
      references PB_MODULE_RIGHT (PB_ID) on delete restrict on update restrict;

alter table PB_STAFF_MODULE_RIGHT_GRANT add constraint STAFF_REF_STAFF_M_R_GRANT foreign key (PB_LOGIN_ID)
      references PB_STAFF (PB_LOGIN_ID) on delete restrict on update restrict;

alter table PB_STAFF_ROLE add constraint ROLE_REF_STAFF_ROLE foreign key (PB_ROLE_ID)
      references PB_ROLE (PB_ID) on delete restrict on update restrict;

alter table PB_STAFF_ROLE add constraint STAFF_REF_STAFF_ROLE foreign key (PB_LOGIN_ID)
      references PB_STAFF (PB_LOGIN_ID) on delete restrict on update restrict;

alter table PB_SYSCODE add constraint SYSCODE_TYPE_REF_SYSCODE foreign key (PB_SYSCODE_TYPE_ID)
      references PB_SYSCODE_TYPE (PB_ID) on delete restrict on update restrict;



/* �����û� */
GRANT SELECT,INSERT,UPDATE,DELETE
ON PermissionBase.*
TO PB_DB_USER@'%'
IDENTIFIED BY '1234567890';

