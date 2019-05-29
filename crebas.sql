/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     5/28/2019 5:39:52 PM                         */
/*==============================================================*/

/*==============================================================*/
/* Drop all existing tables                                     */
/*==============================================================*/
DROP TABLE IF EXISTS "activities" CASCADE;
DROP TABLE IF EXISTS "comments" CASCADE;
DROP TABLE IF EXISTS "orders_audit" CASCADE;
DROP TABLE IF EXISTS "reservations_audit" CASCADE;
DROP TABLE IF EXISTS "resources_audit" CASCADE;
DROP TABLE IF EXISTS "users_audit" CASCADE;
DROP TABLE IF EXISTS "campuses" CASCADE;
DROP TABLE IF EXISTS "faculties" CASCADE;
DROP TABLE IF EXISTS "order_statuses" CASCADE;
DROP TABLE IF EXISTS "orders" CASCADE;
DROP TABLE IF EXISTS "buildings" CASCADE;
DROP TABLE IF EXISTS "reservation_statuses" CASCADE;
DROP TABLE IF EXISTS "reservations" CASCADE;
DROP TABLE IF EXISTS "cost_types" CASCADE;
DROP TABLE IF EXISTS "outlets" CASCADE;
DROP TABLE IF EXISTS "resource_groups" CASCADE;
DROP TABLE IF EXISTS "resources" CASCADE;
DROP TABLE IF EXISTS "resource_category_privileges" CASCADE;
DROP TABLE IF EXISTS "resource_categories" CASCADE;
DROP TABLE IF EXISTS "resource_category_statuses" CASCADE;
DROP TABLE IF EXISTS "user_types" CASCADE;
DROP TABLE IF EXISTS "privileges" CASCADE;
DROP TABLE IF EXISTS "users" CASCADE;
DROP TABLE IF EXISTS "user_privileges" CASCADE;

/*==============================================================*/
/* Table: ACTIVITIES                                            */
/*==============================================================*/
create table ACTIVITIES (
   ID                   SERIAL               not null,
   KEY                  TEXT                 not null,
   TRACKABLE_ID         INT4                 not null,
   TRACKABLE_TYPE       TEXT                 not null,
   SEND_NOTIFICATION    BOOL                 null,
   CREATED_AT           TIMESTAMP            not null,
   UPDATED_AT           TIMESTAMP            not null,
   constraint PK_ACTIVITIES primary key (ID)
);

/*==============================================================*/
/* Index: ACTIVITIES_PK                                         */
/*==============================================================*/
create unique index ACTIVITIES_PK on ACTIVITIES (
ID
);

/*==============================================================*/
/* Table: BUILDINGS                                             */
/*==============================================================*/
create table BUILDINGS (
   ID                   SERIAL               not null,
   FACULTY_ID           INT4                 null,
   CAMPUS_ID            INT4                 null,
   CODE                 CHAR(3)              not null,
   NAME                 TEXT                 null,
   ADDRESS              TEXT                 null,
   CREATED_AT           TIMESTAMP            not null,
   UPDATED_AT           TIMESTAMP            not null,
   constraint PK_BUILDINGS primary key (ID)
);

/*==============================================================*/
/* Index: BUILDINGS_PK                                          */
/*==============================================================*/
create unique index BUILDINGS_PK on BUILDINGS (
ID
);

/*==============================================================*/
/* Index: FACULTY_HAS_MANY_BUILDINGS_FK                         */
/*==============================================================*/
create  index FACULTY_HAS_MANY_BUILDINGS_FK on BUILDINGS (
FACULTY_ID
);

/*==============================================================*/
/* Index: CAMPUS_HAS_MANY_BUILDINGS_FK                          */
/*==============================================================*/
create  index CAMPUS_HAS_MANY_BUILDINGS_FK on BUILDINGS (
CAMPUS_ID
);

/*==============================================================*/
/* Table: CAMPUSES                                              */
/*==============================================================*/
create table CAMPUSES (
   ID                   SERIAL               not null,
   NAME                 TEXT                 not null,
   ADDRESS              TEXT                 not null,
   CREATED_AT           TIMESTAMP            not null,
   UPDATED_AT           TIMESTAMP            not null,
   constraint PK_CAMPUSES primary key (ID)
);

/*==============================================================*/
/* Index: CAMPUSES_PK                                           */
/*==============================================================*/
create unique index CAMPUSES_PK on CAMPUSES (
ID
);

/*==============================================================*/
/* Table: COMMENTS                                              */
/*==============================================================*/
create table COMMENTS (
   ID                   SERIAL               not null,
   COMMENTABLE_ID       INT4                 not null,
   COMMENTABLE_TYPE     TEXT                 not null,
   BODY                 TEXT                 not null,
   CREATED_AT           TIMESTAMP            not null,
   UPDATED_AT           TIMESTAMP            not null,
   constraint PK_COMMENTS primary key (ID)
);

/*==============================================================*/
/* Index: COMMENTS_PK                                           */
/*==============================================================*/
create unique index COMMENTS_PK on COMMENTS (
ID
);

/*==============================================================*/
/* Table: COST_TYPES                                            */
/*==============================================================*/
create table COST_TYPES (
   ID                   SERIAL               not null,
   RESOURCE_CATEGORY_ID INT4                 null,
   SYMBOL               VARCHAR(32)          not null,
   DESCRIPTION          TEXT                 null,
   CREATED_AT           TIMESTAMP            not null,
   UPDATED_AT           TIMESTAMP            not null,
   constraint PK_COST_TYPES primary key (ID)
);

/*==============================================================*/
/* Index: COST_TYPES_PK                                         */
/*==============================================================*/
create unique index COST_TYPES_PK on COST_TYPES (
ID
);

/*==============================================================*/
/* Index: RESOURCE_CATEGORY_HAS_MANY_COST_TYPES_FK              */
/*==============================================================*/
create  index RESOURCE_CATEGORY_HAS_MANY_COST_TYPES_FK on COST_TYPES (
RESOURCE_CATEGORY_ID
);

/*==============================================================*/
/* Table: FACULTIES                                             */
/*==============================================================*/
create table FACULTIES (
   ID                   SERIAL               not null,
   NAME                 TEXT                 not null,
   ADDRESS              TEXT                 null,
   CREATED_AT           TIMESTAMP            not null,
   UPDATED_AT           TIMESTAMP            not null,
   constraint PK_FACULTIES primary key (ID)
);

/*==============================================================*/
/* Index: FACULTIES_PK                                          */
/*==============================================================*/
create unique index FACULTIES_PK on FACULTIES (
ID
);

/*==============================================================*/
/* Table: ORDERS                                                */
/*==============================================================*/
create table ORDERS (
   ID                   SERIAL               not null,
   ORDER_STATUS_ID      INT4                 null,
   USER_ID              INT4                 not null,
   RESOURCE_ID          INT4                 not null,
   PICKUP_DATE          DATE                 not null,
   PICKUP_LOCATION      TEXT                 not null,
   NOTE                 TEXT                 null,
   CREATED_AT           TIMESTAMP            not null,
   UPDATED_AT           TIMESTAMP            not null,
   constraint PK_ORDERS primary key (ID)
);

/*==============================================================*/
/* Index: ORDERS_PK                                             */
/*==============================================================*/
create unique index ORDERS_PK on ORDERS (
ID
);

/*==============================================================*/
/* Index: RESOURCE_HAS_MANY_ORDERS_FK                           */
/*==============================================================*/
create  index RESOURCE_HAS_MANY_ORDERS_FK on ORDERS (
RESOURCE_ID
);

/*==============================================================*/
/* Index: USER_HAS_MANY_ORDERS_FK                               */
/*==============================================================*/
create  index USER_HAS_MANY_ORDERS_FK on ORDERS (
USER_ID
);

/*==============================================================*/
/* Index: ORDER_STATUS_HAS_MANY_ORDERS_FK                       */
/*==============================================================*/
create  index ORDER_STATUS_HAS_MANY_ORDERS_FK on ORDERS (
ORDER_STATUS_ID
);

/*==============================================================*/
/* Index: UNIQUE_ON_USER_ID_AND_RESOURCE_ID_AND_PICKUP_DATE     */
/*==============================================================*/
create unique index UNIQUE_ON_USER_ID_AND_RESOURCE_ID_AND_PICKUP_DATE on ORDERS (
( USER_ID ),
( RESOURCE_ID ),
( PICKUP_DATE )
);

/*==============================================================*/
/* Table: ORDERS_AUDIT                                          */
/*==============================================================*/
create table ORDERS_AUDIT (
   ID                   SERIAL               not null,
   RECORD_ID            INT4                 not null,
   OLD_PICKUP_DATE      DATE                 null,
   OLD_PICKUP_LOCATION  TEXT                 null,
   OLD_NOTE             TEXT                 null,
   OLD_STATUS_ID        INT4                 null,
   OLD_RESOURCE_ID      INT4                 null,
   OLD_USER_ID          INT4                 null,
   NEW_PICKUP_DATE      DATE                 null,
   NEW_PICKUP_LOCATION  TEXT                 null,
   NEW_NOTE             TEXT                 null,
   NEW_STATUS_ID        INT4                 null,
   NEW_RESOURCE_ID      INT4                 null,
   NEW_USER_ID          INT4                 null,
   CREATED_AT           TIMESTAMP            not null,
   constraint PK_ORDERS_AUDIT primary key (ID)
);

/*==============================================================*/
/* Index: ORDERS_AUDIT_PK                                       */
/*==============================================================*/
create unique index ORDERS_AUDIT_PK on ORDERS_AUDIT (
ID
);

/*==============================================================*/
/* Table: ORDER_STATUSES                                        */
/*==============================================================*/
create table ORDER_STATUSES (
   ID                   SERIAL               not null,
   NAME                 TEXT                 not null,
   DESCRIPTION          TEXT                 null,
   CREATED_AT           TIMESTAMP            not null,
   UPDATED_AT           TIMESTAMP            not null,
   constraint PK_ORDER_STATUSES primary key (ID)
);

/*==============================================================*/
/* Index: ORDER_STATUSES_PK                                     */
/*==============================================================*/
create unique index ORDER_STATUSES_PK on ORDER_STATUSES (
ID
);

/*==============================================================*/
/* Table: OUTLETS                                               */
/*==============================================================*/
create table OUTLETS (
   ID                   SERIAL               not null,
   USER_ID              INT4                 null,
   BUILDING_ID          INT4                 null,
   NAME                 TEXT                 not null,
   OPEN_TIME            TIME                 not null,
   CLOSE_TIME           TIME                 not null,
   CREATED_AT           TIMESTAMP            not null,
   UPDATED_AT           TIMESTAMP            not null,
   constraint PK_OUTLETS primary key (ID)
);

/*==============================================================*/
/* Index: OUTLETS_PK                                            */
/*==============================================================*/
create unique index OUTLETS_PK on OUTLETS (
ID
);

/*==============================================================*/
/* Index: USER_HAS_MANY_OUTLETS_FK                              */
/*==============================================================*/
create  index USER_HAS_MANY_OUTLETS_FK on OUTLETS (
USER_ID
);

/*==============================================================*/
/* Index: BUILDING_HAS_MANY_OUTLETS_FK                          */
/*==============================================================*/
create  index BUILDING_HAS_MANY_OUTLETS_FK on OUTLETS (
BUILDING_ID
);

/*==============================================================*/
/* Table: PRIVILEGES                                            */
/*==============================================================*/
create table PRIVILEGES (
   ID                   SERIAL               not null,
   NAME                 TEXT                 not null,
   DESCRIPTION          TEXT                 null,
   CREATED_AT           TIMESTAMP            not null,
   UPDATED_AT           TIMESTAMP            not null,
   constraint PK_PRIVILEGES primary key (ID)
);

/*==============================================================*/
/* Index: PRIVILEGES_PK                                         */
/*==============================================================*/
create unique index PRIVILEGES_PK on PRIVILEGES (
ID
);

/*==============================================================*/
/* Table: RESERVATIONS                                          */
/*==============================================================*/
create table RESERVATIONS (
   ID                   SERIAL               not null,
   RESOURCE_ID          INT4                 not null,
   RESERVATION_STATUS_ID INT4                 null,
   USER_ID              INT4                 not null,
   START_AT             TIMESTAMP            not null,
   END_AT               TIMESTAMP            not null,
   RETURNED_AT          TIMESTAMP            null,
   NOTE                 TEXT                 null,
   CREATED_AT           TIMESTAMP            not null,
   UPDATED_AT           TIMESTAMP            not null,
   constraint PK_RESERVATIONS primary key (ID)
);

/*==============================================================*/
/* Index: RESERVATIONS_PK                                       */
/*==============================================================*/
create unique index RESERVATIONS_PK on RESERVATIONS (
ID
);

/*==============================================================*/
/* Index: USER_HAS_MANY_RESERVATIONS_FK                         */
/*==============================================================*/
create  index USER_HAS_MANY_RESERVATIONS_FK on RESERVATIONS (
USER_ID
);

/*==============================================================*/
/* Index: RESOURCE_HAS_MANY_RESERVATIONS_FK                     */
/*==============================================================*/
create  index RESOURCE_HAS_MANY_RESERVATIONS_FK on RESERVATIONS (
RESOURCE_ID
);

/*==============================================================*/
/* Index: RESERVATION_STATUS_HAS_MANY_RESERVATIONS_FK           */
/*==============================================================*/
create  index RESERVATION_STATUS_HAS_MANY_RESERVATIONS_FK on RESERVATIONS (
RESERVATION_STATUS_ID
);

/*==================================================================*/
/* Index: UNIQUE_ON_USER_ID_AND_RESOURCE_ID_AND_START_AT_AND_END_AT */
/*==================================================================*/
create unique index UNIQUE_ON_USER_ID_AND_RESOURCE_ID_AND_START_AT_AND_END_AT on RESERVATIONS (
( USER_ID ),
( RESOURCE_ID ),
( START_AT ),
( END_AT )
);

/*==============================================================*/
/* Table: RESERVATIONS_AUDIT                                    */
/*==============================================================*/
create table RESERVATIONS_AUDIT (
   ID                   SERIAL               not null,
   RECORD_ID            INT4                 not null,
   OLD_START_AT         TIMESTAMP            null,
   OLD_END_AT           TIMESTAMP            null,
   OLD_RETURNED_AT      TIMESTAMP            null,
   OLD_NOTE             TEXT                 null,
   OLD_STATUS_ID        INT4                 null,
   OLD_RESOURCE_ID      INT4                 null,
   OLD_USER_ID          INT4                 null,
   NEW_START_AT         TIMESTAMP            null,
   NEW_END_AT           TIMESTAMP            null,
   NEW_RETURNED_AT      TIMESTAMP            null,
   NEW_NOTE             TEXT                 null,
   NEW_STATUS_ID        INT4                 null,
   NEW_RESOURCE_ID      INT4                 null,
   NEW_USER_ID          INT4                 null,
   CREATED_AT           TIMESTAMP            not null,
   constraint PK_RESERVATIONS_AUDIT primary key (ID)
);

/*==============================================================*/
/* Index: RESERVATIONS_AUDIT_PK                                 */
/*==============================================================*/
create unique index RESERVATIONS_AUDIT_PK on RESERVATIONS_AUDIT (
ID
);

/*==============================================================*/
/* Table: RESERVATION_STATUSES                                  */
/*==============================================================*/
create table RESERVATION_STATUSES (
   ID                   SERIAL               not null,
   NAME                 TEXT                 not null,
   DESCRIPTION          TEXT                 null,
   CREATED_AT           TIMESTAMP            not null,
   UPDATED_AT           TIMESTAMP            not null,
   constraint PK_RESERVATION_STATUSES primary key (ID)
);

/*==============================================================*/
/* Index: RESERVATION_STATUSES_PK                               */
/*==============================================================*/
create unique index RESERVATION_STATUSES_PK on RESERVATION_STATUSES (
ID
);

/*==============================================================*/
/* Table: RESOURCES                                             */
/*==============================================================*/
create table RESOURCES (
   ID                   SERIAL               not null,
   RESOURCE_CATEGORY_ID INT4                 null,
   RESOURCE_CATEGORY_STATUS_ID INT4                 null,
   RESOURCE_GROUP_ID    INT4                 null,
   COST_TYPE_ID         INT4                 null,
   NAME                 TEXT                 not null,
   DESCRIPTION          TEXT                 null,
   COST                 MONEY                null,
   QUANTITY             INT4                 not null default 1,
   CREATED_AT           TIMESTAMP            not null,
   UPDATED_AT           TIMESTAMP            not null,
   constraint PK_RESOURCES primary key (ID)
);

/*==============================================================*/
/* Index: RESOURCES_PK                                          */
/*==============================================================*/
create unique index RESOURCES_PK on RESOURCES (
ID
);

/*==============================================================*/
/* Index: COST_TYPE_HAS_MANY_RESOURCES_FK                       */
/*==============================================================*/
create  index COST_TYPE_HAS_MANY_RESOURCES_FK on RESOURCES (
COST_TYPE_ID
);

/*==============================================================*/
/* Index: RESOURCE_CATEGORY_HAS_MANY_RESOURCES_FK               */
/*==============================================================*/
create  index RESOURCE_CATEGORY_HAS_MANY_RESOURCES_FK on RESOURCES (
RESOURCE_CATEGORY_ID
);

/*==============================================================*/
/* Index: RESOURCE_GROUP_HAS_MANY_RESOURCES_FK                  */
/*==============================================================*/
create  index RESOURCE_GROUP_HAS_MANY_RESOURCES_FK on RESOURCES (
RESOURCE_GROUP_ID
);

/*==============================================================*/
/* Index: RESOURCE_CATEGORY_STATUS_HAS_MANY_RESOURCES_FK        */
/*==============================================================*/
create  index RESOURCE_CATEGORY_STATUS_HAS_MANY_RESOURCES_FK on RESOURCES (
RESOURCE_CATEGORY_STATUS_ID
);

/*==============================================================*/
/* Table: RESOURCES_AUDIT                                       */
/*==============================================================*/
create table RESOURCES_AUDIT (
   ID                   SERIAL               not null,
   RECORD_ID            INT4                 not null,
   OLD_NAME             TEXT                 null,
   OLD_DESCRIPTION      TEXT                 null,
   OLD_COST             MONEY                null,
   OLD_QUANTITY         INT4                 null,
   OLD_CATEGORY_ID      INT4                 null,
   OLD_COST_TYPE_ID     INT4                 null,
   OLD_GROUP_ID         INT4                 null,
   OLD_STATUS_ID        INT4                 null,
   NEW_NAME             TEXT                 null,
   NEW_DESCRIPTION      TEXT                 null,
   NEW_COST             MONEY                null,
   NEW_QUANTITY         INT4                 null,
   NEW_CATEGORY_ID      INT4                 null,
   NEW_COST_TYPE_ID     INT4                 null,
   NEW_GROUP_ID         INT4                 null,
   NEW_STATUS_ID        INT4                 null,
   CREATED_AT           TIMESTAMP            not null,
   constraint PK_RESOURCES_AUDIT primary key (ID)
);

/*==============================================================*/
/* Index: RESOURCES_AUDIT_PK                                    */
/*==============================================================*/
create unique index RESOURCES_AUDIT_PK on RESOURCES_AUDIT (
ID
);

/*==============================================================*/
/* Table: RESOURCE_CATEGORIES                                   */
/*==============================================================*/
create table RESOURCE_CATEGORIES (
   ID                   SERIAL               not null,
   OUTLET_ID            INT4                 null,
   PARENT_ID            INT4                 null,
   NAME                 TEXT                 not null,
   DESCRIPTION          TEXT                 null,
   CONSUMABLE           BOOL                 not null default false,
   CREATED_AT           TIMESTAMP            not null,
   UPDATED_AT           TIMESTAMP            not null,
   constraint PK_RESOURCE_CATEGORIES primary key (ID)
);

/*==============================================================*/
/* Index: RESOURCE_CATEGORIES_PK                                */
/*==============================================================*/
create unique index RESOURCE_CATEGORIES_PK on RESOURCE_CATEGORIES (
ID
);

/*==============================================================*/
/* Index: RESOURCE_CATEGORY_HAS_MANY_RESOURCE_CATEGORIES_FK     */
/*==============================================================*/
create  index RESOURCE_CATEGORY_HAS_MANY_RESOURCE_CATEGORIES_FK on RESOURCE_CATEGORIES (
PARENT_ID
);

/*==============================================================*/
/* Index: OUTLET_HAS_MANY_RESOURCE_CATEGORIES_FK                */
/*==============================================================*/
create  index OUTLET_HAS_MANY_RESOURCE_CATEGORIES_FK on RESOURCE_CATEGORIES (
OUTLET_ID
);

/*==============================================================*/
/* Table: RESOURCE_CATEGORY_PRIVILEGES                          */
/*==============================================================*/
create table RESOURCE_CATEGORY_PRIVILEGES (
   ID                   SERIAL               not null,
   PRIVILEGE_ID         INT4                 null,
   RESOURCE_CATEGORY_ID INT4                 null,
   CREATED_AT           TIMESTAMP            not null,
   UPDATED_AT           TIMESTAMP            not null,
   constraint PK_RESOURCE_CATEGORY_PRIVILEGE primary key (ID)
);

/*==============================================================*/
/* Index: RESOURCE_CATEGORY_PRIVILEGES_PK                       */
/*==============================================================*/
create unique index RESOURCE_CATEGORY_PRIVILEGES_PK on RESOURCE_CATEGORY_PRIVILEGES (
ID
);

/*==============================================================*/
/* Index: PRVILEGE_HAS_MANY_RESOURCE_CATEGORY_PRIVILEGES_FK     */
/*==============================================================*/
create  index PRVILEGE_HAS_MANY_RESOURCE_CATEGORY_PRIVILEGES_FK on RESOURCE_CATEGORY_PRIVILEGES (
PRIVILEGE_ID
);

/*===================================================================*/
/* Index: RESOURCE_CATEGORY_HAS_MANY_RESOURCE_CATEGORY_PRIVILEGES_FK */
/*===================================================================*/
create  index RESOURCE_CATEGORY_HAS_MANY_RESOURCE_CATEGORY_PRIVILEGES_FK on RESOURCE_CATEGORY_PRIVILEGES (
RESOURCE_CATEGORY_ID
);

/*==============================================================*/
/* Table: RESOURCE_CATEGORY_STATUSES                            */
/*==============================================================*/
create table RESOURCE_CATEGORY_STATUSES (
   ID                   SERIAL               not null,
   RESOURCE_CATEGORY_ID INT4                 null,
   NAME                 TEXT                 not null,
   DESCRIPTION          TEXT                 null,
   CREATED_AT           TIMESTAMP            not null,
   UPDATED_AT           TIMESTAMP            not null,
   constraint PK_RESOURCE_CATEGORY_STATUSES primary key (ID)
);

/*==============================================================*/
/* Index: RESOURCE_CATEGORY_STATUSES_PK                         */
/*==============================================================*/
create unique index RESOURCE_CATEGORY_STATUSES_PK on RESOURCE_CATEGORY_STATUSES (
ID
);

/*=================================================================*/
/* Index: RESOURCE_CATEGORY_HAS_MANY_RESOURCE_CATEGORY_STATUSES_FK */
/*=================================================================*/
create  index RESOURCE_CATEGORY_HAS_MANY_RESOURCE_CATEGORY_STATUSES_FK on RESOURCE_CATEGORY_STATUSES (
RESOURCE_CATEGORY_ID
);

/*==============================================================*/
/* Table: RESOURCE_GROUPS                                       */
/*==============================================================*/
create table RESOURCE_GROUPS (
   ID                   SERIAL               not null,
   NAME                 TEXT                 not null,
   DESCRIPTION          TEXT                 null,
   CREATED_AT           TIMESTAMP            not null,
   UPDATED_AT           TIMESTAMP            not null,
   constraint PK_RESOURCE_GROUPS primary key (ID)
);

/*==============================================================*/
/* Index: RESOURCE_GROUPS_PK                                    */
/*==============================================================*/
create unique index RESOURCE_GROUPS_PK on RESOURCE_GROUPS (
ID
);

/*==============================================================*/
/* Table: USERS                                                 */
/*==============================================================*/
create table USERS (
   ID                   SERIAL               not null,
   USER_TYPE_ID         INT4                 null,
   CIP                  CHAR(8)              null,
   FIRST_NAME           TEXT                 not null,
   LAST_NAME            TEXT                 not null,
   EMAIL                TEXT                 not null,
   CREATED_AT           TIMESTAMP            not null,
   UPDATED_AT           TIMESTAMP            not null,
   constraint PK_USERS primary key (ID)
);

/*==============================================================*/
/* Index: USERS_PK                                              */
/*==============================================================*/
create unique index USERS_PK on USERS (
ID
);

/*==============================================================*/
/* Index: USER_TYPE_HAS_MANY_USERS_FK                           */
/*==============================================================*/
create  index USER_TYPE_HAS_MANY_USERS_FK on USERS (
USER_TYPE_ID
);

/*==============================================================*/
/* Table: USERS_AUDIT                                           */
/*==============================================================*/
create table USERS_AUDIT (
   ID                   SERIAL               not null,
   RECORD_ID            INT4                 not null,
   OLD_FIRST_NAME       TEXT                 null,
   OLD_LAST_NAME        TEXT                 null,
   OLD_EMAIL            TEXT                 null,
   OLD_TYPE_ID          INT4                 null,
   NEW_FIRST_NAME       TEXT                 null,
   NEW_LAST_NAME        TEXT                 null,
   NEW_EMAIL            TEXT                 null,
   NEW_TYPE_ID          INT4                 null,
   CREATED_AT           TIMESTAMP            not null,
   constraint PK_USERS_AUDIT primary key (ID)
);

/*==============================================================*/
/* Index: USERS_AUDIT_PK                                        */
/*==============================================================*/
create unique index USERS_AUDIT_PK on USERS_AUDIT (
ID
);

/*==============================================================*/
/* Table: USER_PRIVILEGES                                       */
/*==============================================================*/
create table USER_PRIVILEGES (
   ID                   SERIAL               not null,
   PRIVILEGE_ID         INT4                 null,
   USER_ID              INT4                 null,
   CREATED_AT           TIMESTAMP            not null,
   UPDATED_AT           TIMESTAMP            not null,
   constraint PK_USER_PRIVILEGES primary key (ID)
);

/*==============================================================*/
/* Index: USER_PRIVILEGES_PK                                    */
/*==============================================================*/
create unique index USER_PRIVILEGES_PK on USER_PRIVILEGES (
ID
);

/*==============================================================*/
/* Index: USER_HAS_MANY_USER_PRIVILEGES_FK                      */
/*==============================================================*/
create  index USER_HAS_MANY_USER_PRIVILEGES_FK on USER_PRIVILEGES (
USER_ID
);

/*==============================================================*/
/* Index: PRIVILEGE_HAS_MANY_USER_PRIVILEGES_FK                 */
/*==============================================================*/
create  index PRIVILEGE_HAS_MANY_USER_PRIVILEGES_FK on USER_PRIVILEGES (
PRIVILEGE_ID
);

/*==============================================================*/
/* Table: USER_TYPES                                            */
/*==============================================================*/
create table USER_TYPES (
   ID                   SERIAL               not null,
   NAME                 TEXT                 not null,
   CREATED_AT           TIMESTAMP            not null,
   UPDATED_AT           TIMESTAMP            not null,
   constraint PK_USER_TYPES primary key (ID)
);

/*==============================================================*/
/* Index: USER_TYPES_PK                                         */
/*==============================================================*/
create unique index USER_TYPES_PK on USER_TYPES (
ID
);

alter table BUILDINGS
   add constraint FK_BUILDING_BELONGS_TO_CAMPUS foreign key (CAMPUS_ID)
      references CAMPUSES (ID)
      on delete restrict on update restrict;

alter table BUILDINGS
   add constraint FK_BUILDING_BELONGS_TO_FACULTY foreign key (FACULTY_ID)
      references FACULTIES (ID)
      on delete restrict on update restrict;

alter table COST_TYPES
   add constraint FK_COST_TYPE_BELONGS_TO_RESOURCE_CATEGORY foreign key (RESOURCE_CATEGORY_ID)
      references RESOURCE_CATEGORIES (ID)
      on delete restrict on update restrict;

alter table ORDERS
   add constraint FK_ORDER_BELONGS_TO_ORDER_STATUS foreign key (ORDER_STATUS_ID)
      references ORDER_STATUSES (ID)
      on delete restrict on update restrict;

alter table ORDERS
   add constraint FK_ORDER_BELONGS_TO_RESOURCE foreign key (RESOURCE_ID)
      references RESOURCES (ID)
      on delete restrict on update restrict;

alter table ORDERS
   add constraint FK_ORDER_BELONGS_TO_USER foreign key (USER_ID)
      references USERS (ID)
      on delete restrict on update restrict;

alter table OUTLETS
   add constraint FK_OUTLET_BELONGS_TO_BUILDING foreign key (BUILDING_ID)
      references BUILDINGS (ID)
      on delete restrict on update restrict;

alter table OUTLETS
   add constraint FK_OUTLET_BELONGS_TO_USER foreign key (USER_ID)
      references USERS (ID)
      on delete restrict on update restrict;

alter table RESERVATIONS
   add constraint FK_RESERVATION_BELONGS_TO_RESERVATION_STATUS foreign key (RESERVATION_STATUS_ID)
      references RESERVATION_STATUSES (ID)
      on delete restrict on update restrict;

alter table RESERVATIONS
   add constraint FK_RESERVATION_BELONGS_TO_RESOURCE foreign key (RESOURCE_ID)
      references RESOURCES (ID)
      on delete restrict on update restrict;

alter table RESERVATIONS
   add constraint FK_RESERVATION_BELONGS_TO_USER foreign key (USER_ID)
      references USERS (ID)
      on delete restrict on update restrict;

alter table RESOURCES
   add constraint FK_RESOURCE_BELONGS_TO_COST_TYPE foreign key (COST_TYPE_ID)
      references COST_TYPES (ID)
      on delete restrict on update restrict;

alter table RESOURCES
   add constraint FK_RESOURCE_BELONGS_TO_RESOURCE_CATEGORY foreign key (RESOURCE_CATEGORY_ID)
      references RESOURCE_CATEGORIES (ID)
      on delete restrict on update restrict;

alter table RESOURCES
   add constraint FK_RESOURCE_BELONGS_TO_RESOURCE_CATEGORY_STATUS foreign key (RESOURCE_CATEGORY_STATUS_ID)
      references RESOURCE_CATEGORY_STATUSES (ID)
      on delete restrict on update restrict;

alter table RESOURCES
   add constraint FK_RESOURCE_BELONGS_TO_RESOURCE_GROUP foreign key (RESOURCE_GROUP_ID)
      references RESOURCE_GROUPS (ID)
      on delete restrict on update restrict;

alter table RESOURCE_CATEGORIES
   add constraint FK_RESOURCE_CATEGORY_BELONGS_TO_OUTLET foreign key (OUTLET_ID)
      references OUTLETS (ID)
      on delete restrict on update restrict;

alter table RESOURCE_CATEGORIES
   add constraint FK_RESOURCE_CATEGORY_BELONGS_TO_RESOURCE_CATEGORY foreign key (PARENT_ID)
      references RESOURCE_CATEGORIES (ID)
      on delete restrict on update restrict;

alter table RESOURCE_CATEGORY_PRIVILEGES
   add constraint FK_RESOURCE_CATEGORY_PRIVILEGE_BELONGS_TO_PRIVILEGE foreign key (PRIVILEGE_ID)
      references PRIVILEGES (ID)
      on delete restrict on update restrict;

alter table RESOURCE_CATEGORY_PRIVILEGES
   add constraint FK_RESOURCE_CATEGORY_PRIVILEGE_BELONGS_TO_RESOURCE_CATEGORY foreign key (RESOURCE_CATEGORY_ID)
      references RESOURCE_CATEGORIES (ID)
      on delete restrict on update restrict;

alter table RESOURCE_CATEGORY_STATUSES
   add constraint FK_RESOURCE_CATEGORY_STATUS_BELONGS_TO_RESOURCE_CATEGORY foreign key (RESOURCE_CATEGORY_ID)
      references RESOURCE_CATEGORIES (ID)
      on delete restrict on update restrict;

alter table USERS
   add constraint FK_USER_BELONGS_TO_USER_TYPE foreign key (USER_TYPE_ID)
      references USER_TYPES (ID)
      on delete restrict on update restrict;

alter table USER_PRIVILEGES
   add constraint FK_USER_PRIVILEGE_BELONGS_TO_PRIVILEGE foreign key (PRIVILEGE_ID)
      references PRIVILEGES (ID)
      on delete restrict on update restrict;

alter table USER_PRIVILEGES
   add constraint FK_USER_PRIVILEGE_BELONGS_TO_USER foreign key (USER_ID)
      references USERS (ID)
      on delete restrict on update restrict;

/*==============================================================*/
/* FUNCTIONS                                                    */
/*==============================================================*/
CREATE OR REPLACE FUNCTION add_create_timestamp() RETURNS TRIGGER AS $create_timestamp$
    BEGIN
      IF NEW.created_at IS NULL THEN
          NEW.created_at = (now() at time zone 'utc');
          NEW.updated_at = (now() at time zone 'utc');
      END IF;
      RETURN NEW;
    END;
$create_timestamp$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION add_update_timestamp() RETURNS TRIGGER AS $update_timestamp$
    BEGIN
      NEW.updated_at = (now() at time zone 'utc');
      RETURN NEW;
    END;
$update_timestamp$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION add_user_audit() RETURNS TRIGGER AS $add_user_audit$
  BEGIN
    CASE TG_OP
      WHEN 'INSERT' THEN
        INSERT INTO users_audit
          (
            record_id,
            old_first_name,
            old_last_name,
            old_email,
            old_type_id,
            new_first_name,
            new_last_name,
            new_email,
            new_type_id,
            created_at
          )
        VALUES
          (
            NEW.id,
            NULL,
            NULL,
            NULL,
            NULL,
            NEW.first_name,
            NEW.last_name,
            NEW.email,
            NEW.user_type_id,
            (now() at time zone 'utc')
          );
      WHEN 'UPDATE' THEN
        INSERT INTO users_audit
          (
            record_id,
            old_first_name,
            old_last_name,
            old_email,
            old_type_id,
            new_first_name,
            new_last_name,
            new_email,
            new_type_id,
            created_at
          )
        VALUES
          (
            NEW.id,
            OLD.first_name,
            OLD.last_name,
            OLD.email,
            OLD.user_type_id,
            NEW.first_name,
            NEW.last_name,
            NEW.email,
            NEW.user_type_id,
            (now() at time zone 'utc')
          );
      WHEN 'DELETE' THEN
        INSERT INTO users_audit
          (
            record_id,
            old_first_name,
            old_last_name,
            old_email,
            old_type_id,
            new_first_name,
            new_last_name,
            new_email,
            new_type_id,
            created_at
          )
        VALUES
          (
            OLD.id,
            OLD.first_name,
            OLD.last_name,
            OLD.email,
            OLD.user_type_id,
            NULL,
            NULL,
            NULL,
            NULL,
            (now() at time zone 'utc')
          );
    END CASE;

    RETURN NEW;
  END;
$add_user_audit$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION add_order_audit() RETURNS TRIGGER AS $add_order_audit$
  BEGIN
    CASE TG_OP
      WHEN 'INSERT' THEN
        INSERT INTO orders_audit
          (
            record_id,
            old_pickup_date,
            old_pickup_location,
            old_note,
            old_status_id,
            old_resource_id,
            old_user_id,
            new_pickup_date,
            new_pickup_location,
            new_note,
            new_status_id,
            new_resource_id,
            new_user_id,
            created_at
          )
        VALUES
          (
            NEW.id,
            NULL,
            NULL,
            NULL,
            NULL,
            NULL,
            NULL,
            NEW.pickup_date,
            NEW.pickup_location,
            NEW.note,
            NEW.order_status_id,
            NEW.resource_id,
            NEW.user_id,
            (now() at time zone 'utc')
          );
      WHEN 'UPDATE' THEN
        INSERT INTO orders_audit
          (
            record_id,
            old_pickup_date,
            old_pickup_location,
            old_note,
            old_status_id,
            old_resource_id,
            old_user_id,
            new_pickup_date,
            new_pickup_location,
            new_note,
            new_status_id,
            new_resource_id,
            new_user_id,
            created_at
          )
        VALUES
          (
            NEW.id,
            OLD.pickup_date,
            OLD.pickup_location,
            OLD.note,
            OLD.order_status_id,
            OLD.resource_id,
            OLD.user_id,
            NEW.pickup_date,
            NEW.pickup_location,
            NEW.note,
            NEW.order_status_id,
            NEW.resource_id,
            NEW.user_id,
            (now() at time zone 'utc')
          );
      WHEN 'DELETE' THEN
        INSERT INTO orders_audit
          (
            record_id,
            old_pickup_date,
            old_pickup_location,
            old_note,
            old_status_id,
            old_resource_id,
            old_user_id,
            new_pickup_date,
            new_pickup_location,
            new_note,
            new_status_id,
            new_resource_id,
            new_user_id,
            created_at
          )
        VALUES
          (
            OLD.id,
            OLD.pickup_date,
            OLD.pickup_location,
            OLD.note,
            OLD.order_status_id,
            OLD.resource_id,
            OLD.user_id,
            NULL,
            NULL,
            NULL,
            NULL,
            NULL,
            NULL,
            (now() at time zone 'utc')
          );
    END CASE;

    RETURN NEW;
  END;
$add_order_audit$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION add_reservation_audit() RETURNS TRIGGER AS $add_reservation_audit$
  BEGIN
    CASE TG_OP
      WHEN 'INSERT' THEN
        INSERT INTO reservations_audit
          (
            record_id,
            old_start_at,
            old_end_at,
            old_returned_at,
            old_note,
            old_status_id,
            old_resource_id,
            old_user_id,
            new_start_at,
            new_end_at,
            new_returned_at,
            new_note,
            new_status_id,
            new_resource_id,
            new_user_id,
            created_at
          )
        VALUES
          (
            NEW.id,
            NULL,
            NULL,
            NULL,
            NULL,
            NULL,
            NULL,
            NULL,
            NEW.start_at,
            NEW.end_at,
            NEW.returned_at,
            NEW.note,
            NEW.reservation_status_id,
            NEW.resource_id,
            NEW.user_id,
            (now() at time zone 'utc')
          );
      WHEN 'UPDATE' THEN
        INSERT INTO reservations_audit
          (
            record_id,
            old_start_at,
            old_end_at,
            old_returned_at,
            old_note,
            old_status_id,
            old_resource_id,
            old_user_id,
            new_start_at,
            new_end_at,
            new_returned_at,
            new_note,
            new_status_id,
            new_resource_id,
            new_user_id,
            created_at
          )
        VALUES
          (
            NEW.id,
            OLD.start_at,
            OLD.end_at,
            OLD.returned_at,
            OLD.note,
            OLD.reservation_status_id,
            OLD.resource_id,
            NEW.user_id,
            NEW.start_at,
            NEW.end_at,
            NEW.returned_at,
            NEW.note,
            NEW.reservation_status_id,
            NEW.resource_id,
            NEW.user_id,
            (now() at time zone 'utc')
          );
      WHEN 'DELETE' THEN
        INSERT INTO reservations_audit
          (
            record_id,
            old_start_at,
            old_end_at,
            old_returned_at,
            old_note,
            old_status_id,
            old_resource_id,
            old_user_id,
            new_start_at,
            new_end_at,
            new_returned_at,
            new_note,
            new_status_id,
            new_resource_id,
            new_user_id,
            created_at
          )
        VALUES
          (
            OLD.id,
            OLD.start_at,
            OLD.end_at,
            OLD.returned_at,
            OLD.note,
            OLD.reservation_status_id,
            OLD.resource_id,
            OLD.user_id,
            NULL,
            NULL,
            NULL,
            NULL,
            NULL,
            NULL,
            NULL,
            (now() at time zone 'utc')
          );
    END CASE;

    RETURN NEW;
  END;
$add_reservation_audit$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION add_resource_audit() RETURNS TRIGGER AS $add_resource_audit$
  BEGIN
    CASE TG_OP
      WHEN 'INSERT' THEN
        INSERT INTO resources_audit
          (
            record_id,
            old_name,
            old_description,
            old_cost,
            old_quantity,
            old_category_id,
            old_cost_type_id,
            old_group_id,
            old_status_id,
            new_name,
            new_description,
            new_cost,
            new_quantity,
            new_category_id,
            new_cost_type_id,
            new_group_id,
            new_status_id,
            created_at
          )
        VALUES
          (
            NEW.id,
            NULL,
            NULL,
            NULL,
            NULL,
            NULL,
            NULL,
            NULL,
            NULL,
            NEW.name,
            NEW.description,
            NEW.cost,
            NEW.quantity,
            NEW.resource_category_id,
            NEW.cost_type_id,
            NEW.resource_group_id,
            NEW.resource_category_status_id,
            (now() at time zone 'utc')
          );
      WHEN 'UPDATE' THEN
        INSERT INTO resources_audit
          (
            record_id,
            old_name,
            old_description,
            old_cost,
            old_quantity,
            old_category_id,
            old_cost_type_id,
            old_group_id,
            old_status_id,
            new_name,
            new_description,
            new_cost,
            new_quantity,
            new_category_id,
            new_cost_type_id,
            new_group_id,
            new_status_id,
            created_at
          )
        VALUES
          (
            NEW.id,
            OLD.name,
            OLD.description,
            OLD.cost,
            OLD.quantity,
            OLD.resource_category_id,
            OLD.cost_type_id,
            OLD.resource_group_id,
            OLD.resource_category_status_id,
            NEW.name,
            NEW.description,
            NEW.cost,
            NEW.quantity,
            NEW.resource_category_id,
            NEW.cost_type_id,
            NEW.resource_group_id,
            NEW.resource_category_status_id,
            (now() at time zone 'utc')
          );
      WHEN 'DELETE' THEN
        INSERT INTO resources_audit
          (
            record_id,
            old_name,
            old_description,
            old_cost,
            old_quantity,
            old_category_id,
            old_cost_type_id,
            old_group_id,
            old_status_id,
            new_name,
            new_description,
            new_cost,
            new_quantity,
            new_category_id,
            new_cost_type_id,
            new_group_id,
            new_status_id,
            created_at
          )
        VALUES
          (
            OLD.id,
            OLD.name,
            OLD.description,
            OLD.cost,
            OLD.quantity,
            OLD.resource_category_id,
            OLD.cost_type_id,
            OLD.resource_group_id,
            OLD.resource_category_status_id,
            NULL,
            NULL,
            NULL,
            NULL,
            NULL,
            NULL,
            NULL,
            NULL,
            (now() at time zone 'utc')
          );
    END CASE;

    RETURN NEW;
  END;
$add_resource_audit$ LANGUAGE plpgsql;

/*==============================================================*/
/* TRIGGERS                                                     */
/*==============================================================*/
CREATE TRIGGER created_at_timestamp BEFORE INSERT ON activities
    FOR EACH ROW
        EXECUTE PROCEDURE add_create_timestamp();
        
CREATE TRIGGER updated_at_timestamp BEFORE UPDATE ON activities
    FOR EACH ROW
        EXECUTE PROCEDURE add_update_timestamp();


CREATE TRIGGER created_at_timestamp BEFORE INSERT ON buildings
    FOR EACH ROW
        EXECUTE PROCEDURE add_create_timestamp();
        
CREATE TRIGGER updated_at_timestamp BEFORE UPDATE ON buildings
    FOR EACH ROW
        EXECUTE PROCEDURE add_update_timestamp();
        

CREATE TRIGGER created_at_timestamp BEFORE INSERT ON campuses
    FOR EACH ROW
        EXECUTE PROCEDURE add_create_timestamp();
        
CREATE TRIGGER updated_at_timestamp BEFORE UPDATE ON campuses
    FOR EACH ROW
        EXECUTE PROCEDURE add_update_timestamp();


CREATE TRIGGER created_at_timestamp BEFORE INSERT ON comments
    FOR EACH ROW
        EXECUTE PROCEDURE add_create_timestamp();
        
CREATE TRIGGER updated_at_timestamp BEFORE UPDATE ON comments
    FOR EACH ROW
        EXECUTE PROCEDURE add_update_timestamp();


CREATE TRIGGER created_at_timestamp BEFORE INSERT ON cost_types
    FOR EACH ROW
        EXECUTE PROCEDURE add_create_timestamp();
        
CREATE TRIGGER updated_at_timestamp BEFORE UPDATE ON cost_types
    FOR EACH ROW
        EXECUTE PROCEDURE add_update_timestamp();


CREATE TRIGGER created_at_timestamp BEFORE INSERT ON faculties
    FOR EACH ROW
        EXECUTE PROCEDURE add_create_timestamp();
        
CREATE TRIGGER updated_at_timestamp BEFORE UPDATE ON faculties
    FOR EACH ROW
        EXECUTE PROCEDURE add_update_timestamp();
        

CREATE TRIGGER created_at_timestamp BEFORE INSERT ON orders
    FOR EACH ROW
        EXECUTE PROCEDURE add_create_timestamp();
        
CREATE TRIGGER updated_at_timestamp BEFORE UPDATE ON orders
    FOR EACH ROW
        EXECUTE PROCEDURE add_update_timestamp();

CREATE TRIGGER user_audit_trigger AFTER INSERT OR UPDATE OR DELETE ON orders
  FOR EACH ROW
    EXECUTE PROCEDURE add_order_audit();


CREATE TRIGGER created_at_timestamp BEFORE INSERT ON order_statuses
    FOR EACH ROW
        EXECUTE PROCEDURE add_create_timestamp();
        
CREATE TRIGGER updated_at_timestamp BEFORE UPDATE ON order_statuses
    FOR EACH ROW
        EXECUTE PROCEDURE add_update_timestamp();


CREATE TRIGGER created_at_timestamp BEFORE INSERT ON outlets
    FOR EACH ROW
        EXECUTE PROCEDURE add_create_timestamp();
        
CREATE TRIGGER updated_at_timestamp BEFORE UPDATE ON outlets
    FOR EACH ROW
        EXECUTE PROCEDURE add_update_timestamp();


CREATE TRIGGER created_at_timestamp BEFORE INSERT ON privileges
    FOR EACH ROW
        EXECUTE PROCEDURE add_create_timestamp();
        
CREATE TRIGGER updated_at_timestamp BEFORE UPDATE ON privileges
    FOR EACH ROW
        EXECUTE PROCEDURE add_update_timestamp();
        

CREATE TRIGGER created_at_timestamp BEFORE INSERT ON reservations
    FOR EACH ROW
        EXECUTE PROCEDURE add_create_timestamp();
        
CREATE TRIGGER updated_at_timestamp BEFORE UPDATE ON reservations
    FOR EACH ROW
        EXECUTE PROCEDURE add_update_timestamp();

CREATE TRIGGER user_audit_trigger AFTER INSERT OR UPDATE OR DELETE ON reservations
  FOR EACH ROW
    EXECUTE PROCEDURE add_reservation_audit();


CREATE TRIGGER created_at_timestamp BEFORE INSERT ON reservation_statuses
    FOR EACH ROW
        EXECUTE PROCEDURE add_create_timestamp();
        
CREATE TRIGGER updated_at_timestamp BEFORE UPDATE ON reservation_statuses
    FOR EACH ROW
        EXECUTE PROCEDURE add_update_timestamp();


CREATE TRIGGER created_at_timestamp BEFORE INSERT ON resources
    FOR EACH ROW
        EXECUTE PROCEDURE add_create_timestamp();
        
CREATE TRIGGER updated_at_timestamp BEFORE UPDATE ON resources
    FOR EACH ROW
        EXECUTE PROCEDURE add_update_timestamp();

CREATE TRIGGER user_audit_trigger AFTER INSERT OR UPDATE OR DELETE ON resources
  FOR EACH ROW
    EXECUTE PROCEDURE add_resource_audit();


CREATE TRIGGER created_at_timestamp BEFORE INSERT ON resource_categories
    FOR EACH ROW
        EXECUTE PROCEDURE add_create_timestamp();
        
CREATE TRIGGER updated_at_timestamp BEFORE UPDATE ON resource_categories
    FOR EACH ROW
        EXECUTE PROCEDURE add_update_timestamp();
        

CREATE TRIGGER created_at_timestamp BEFORE INSERT ON resource_category_privileges
    FOR EACH ROW
        EXECUTE PROCEDURE add_create_timestamp();
        
CREATE TRIGGER updated_at_timestamp BEFORE UPDATE ON resource_category_privileges
    FOR EACH ROW
        EXECUTE PROCEDURE add_update_timestamp();


CREATE TRIGGER created_at_timestamp BEFORE INSERT ON resource_category_statuses
    FOR EACH ROW
        EXECUTE PROCEDURE add_create_timestamp();
        
CREATE TRIGGER updated_at_timestamp BEFORE UPDATE ON resource_category_statuses
    FOR EACH ROW
        EXECUTE PROCEDURE add_update_timestamp();


CREATE TRIGGER created_at_timestamp BEFORE INSERT ON resource_groups
    FOR EACH ROW
        EXECUTE PROCEDURE add_create_timestamp();
        
CREATE TRIGGER updated_at_timestamp BEFORE UPDATE ON resource_groups
    FOR EACH ROW
        EXECUTE PROCEDURE add_update_timestamp();


CREATE TRIGGER created_at_timestamp BEFORE INSERT ON users
    FOR EACH ROW
        EXECUTE PROCEDURE add_create_timestamp();
        
CREATE TRIGGER updated_at_timestamp BEFORE UPDATE ON users
    FOR EACH ROW
        EXECUTE PROCEDURE add_update_timestamp();

CREATE TRIGGER user_audit_trigger AFTER INSERT OR UPDATE OR DELETE ON users
  FOR EACH ROW
    EXECUTE PROCEDURE add_user_audit();
        

CREATE TRIGGER created_at_timestamp BEFORE INSERT ON user_privileges
    FOR EACH ROW
        EXECUTE PROCEDURE add_create_timestamp();
        
CREATE TRIGGER updated_at_timestamp BEFORE UPDATE ON user_privileges
    FOR EACH ROW
        EXECUTE PROCEDURE add_update_timestamp();


CREATE TRIGGER created_at_timestamp BEFORE INSERT ON user_types
    FOR EACH ROW
        EXECUTE PROCEDURE add_create_timestamp();
        
CREATE TRIGGER updated_at_timestamp BEFORE UPDATE ON user_types
    FOR EACH ROW
        EXECUTE PROCEDURE add_update_timestamp();
