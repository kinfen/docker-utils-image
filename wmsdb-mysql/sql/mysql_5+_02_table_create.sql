use wms;

drop table if exists CFS_CUSTOM_FORM;

drop table if exists CFS_CUSTOM_FORM_COLUMN;

drop table if exists CFS_FORM_COLUMN_DATA;

drop table if exists CFS_FORM_DATA;

drop table if exists CMS3_ALBUM;

drop table if exists CMS3_ARCHIVE;

drop table if exists CMS3_ARCHIVE_ATTACHMENT;

drop table if exists CMS3_ARCHIVE_COMMENT;

drop table if exists CMS3_ARCHIVE_CUSTOM_FIELD;

drop table if exists CMS3_PRODUCT_PICTURE;

drop table if exists CMS3_PRODUCT_ATTRIBUTE;

drop table if exists CMS3_PRODUCT_STOCK;

drop table if exists CMS3_PRODUCT;

drop table if exists CMS3_CATEGORY;

drop table if exists CMS3_CATEGORY_PUBLISH_TEMPLATE;

drop table if exists CMS3_CATEGORY_REFERENCE;

drop table if exists CMS3_CATEGORY_SYNC_PUBLISH;

drop table if exists CMS3_CUSTOM_FIELD_VALUE;

drop table if exists CMS3_DATA_COLLECT;

drop table if exists CMS3_DATA_COLLECT_ARCHIVE;

drop table if exists CMS3_DATA_COLLECT_CATEGORY;

drop table if exists CMS3_DATA_COLLECT_TARGET;

drop table if exists CMS3_PHOTO;

drop table if exists FMS_FILE_ASSIGN;

drop table if exists FTS_FULL_SEARCH;

drop table if exists FTS_FULL_SEARCH_HANDLER;

drop table if exists FTS_HANDLER_PARAMETER;

drop table if exists RPS_MODULE;

drop table if exists RPS_PERMISSION;

drop table if exists RPS_RESOURCE;

drop table if exists RPS_ROLE;

drop table if exists RPS_ROLE_PERMISSION;

drop table if exists RPS_SUBJECT;

drop table if exists RPS_SUBJECT_ROLE;

drop table if exists RSS_BUILDER_PARAMETER;

drop table if exists RSS_CHANNEL;

drop table if exists RSS_CHANNEL_ITEM_BUILDER;

drop table if exists RSS_RSS;

drop table if exists SEO_ROBOT;

drop table if exists SEO_ROBOT_PATH;

drop table if exists SEO_SITEMAP;

drop table if exists SEO_SITEMAP_CONFIG;

drop table if exists SEO_WORD;

drop table if exists SEO_WORD_TYPE;

drop table if exists SEO_WORD_WORD_TYPE;

drop table if exists STS_HANDLER_PARAMETER;

drop table if exists STS_SCHEDULED_TASK;

drop table if exists STS_TASK_HANDLER;

drop table if exists SYS_CONFIG;

drop table if exists SYS_DICT_ITEM;

drop table if exists SYS_DICT_TYPE;

drop table if exists SYS_MODULE;

drop table if exists SYS_OPERATION_LOG;

drop table if exists SYS_ZONE;

drop table if exists UMS_GROUP;

drop table if exists UMS_USER;

drop table if exists UMS_USER_GROUP;

drop table if exists WCS_COLLECT;

drop table if exists WCS_DATA_HANDLER;

drop table if exists WCS_FINDER;

drop table if exists WCS_HANDLER_PARAMETER;

drop table if exists WCS_MATCHER;

drop table if exists WCS_TARGET;

drop table if exists WCS_TARGET_DATA_HANDLER;

drop table if exists HRR_APPLY;

drop table if exists HRR_CANDIDATE;

drop table if exists HRR_LIBRARY;

drop table if exists HRR_LIBRARY_RESUME;

drop table if exists HRR_RECRUIT;

drop table if exists HRR_RECRUIT_REQUIREMENT;

drop table if exists HRR_RESUME;

drop table if exists HRR_RESUME_ATTACHMENT;

drop table if exists HRR_RESUME_BASE;

drop table if exists HRR_RESUME_CERTIFICATE;

drop table if exists HRR_RESUME_CONTACT;

drop table if exists HRR_RESUME_EDUCATION;

drop table if exists HRR_RESUME_EDUCATION_EXP;

drop table if exists HRR_RESUME_JOB_INTENSION;

drop table if exists HRR_RESUME_LANGUAGE;

drop table if exists HRR_RESUME_OTHER;

drop table if exists HRR_RESUME_PROJECT_EXP;

drop table if exists HRR_RESUME_SKILL;

drop table if exists HRR_RESUME_TRAINING_EXP;

drop table if exists HRR_RESUME_WORK;

drop table if exists HRR_RESUME_WORK_EXP;

drop table if exists PMS_ANSWER;

drop table if exists PMS_ANSWER_HISTORY;

drop table if exists PMS_ANSWER_SHEET;

drop table if exists PMS_ANSWER_SHEET_HISTORY;

drop table if exists PMS_PAPER;

drop table if exists PMS_PAPER_CATEGORY;

drop table if exists PMS_QUESTION;

drop table if exists PMS_QUESTION_CATEGORY;

drop table if exists PMS_QUESTION_OPTION;

drop table if exists PMS_SECTION;

drop table if exists PMS_SECTION_QUESTION;

drop table if exists PMS_SECTION_RANDOM;

drop table if exists IMS_INTEGRAL_DETAIL;

drop table if exists IMS_INTEGRAL;

drop table if exists IMS_USER;

drop table if exists WBS_GUESTBOOK;

drop table if exists WMS_WEBSITE;


/*==============================================================*/
/* Table: CFS_CUSTOM_FORM                                       */
/*==============================================================*/
create table CFS_CUSTOM_FORM
(
   ID                   int not null auto_increment comment '标识',
   WEBSITE_ID           int not null comment '站点表外键',
   CODE                 varchar(50) not null comment '表单代码',
   STATUS               tinyint not null comment '状态',
   NAME                 varchar(50) not null comment '表单名称',
   DESCRIPTION          varchar(255) comment '描述',
   primary key (ID),
   unique key AK_CFS_CF_WI_C (WEBSITE_ID, CODE)
)
;

/*==============================================================*/
/* Table: CFS_CUSTOM_FORM_COLUMN                                */
/*==============================================================*/
create table CFS_CUSTOM_FORM_COLUMN
(
   ID                   int not null auto_increment comment '标识',
   CUSTOM_FORM_ID       int not null comment '自定义表单表外键',
   CODE                 varchar(100) not null comment '字段代码',
   TYPE                 tinyint not null comment '字段类型',
   NAME                 varchar(50) not null comment '字段名称',
   DEFAULT_VALUE        varchar(255) comment '默认值',
   DICT_TYPE_CODE       varchar(50) comment '字典类型代码',
   DESCRIPTION          varchar(255) comment '描述',
   REGULAR_TYPE         tinyint not null comment '验证类型',
   REGULAR_EXPRESSION   text comment '验证表达式',
   primary key (ID),
   unique key AK_CFS_CFC_CFI_C (CUSTOM_FORM_ID, CODE)
)
;

/*==============================================================*/
/* Table: CFS_FORM_COLUMN_DATA                                  */
/*==============================================================*/
create table CFS_FORM_COLUMN_DATA
(
   ID                   int not null auto_increment,
   COLUMN_ID            int not null comment '自定义表单字段表外键',
   FORM_DATA_ID         int not null comment '自定义表单数据表外键',
   VALUE                varchar(1000) comment '字段数据值',
   primary key (ID),
   unique key AK_CFS_FCS_CI_FDI (COLUMN_ID, FORM_DATA_ID)
)
;

/*==============================================================*/
/* Table: CFS_FORM_DATA                                         */
/*==============================================================*/
create table CFS_FORM_DATA
(
   ID                   int not null auto_increment,
   CUSTOM_FORM_ID       int not null comment '自定义表单表外键',
   STATUS               tinyint not null comment '状态',
   IP                   varchar(50) comment 'IP地址',
   CREATE_USER          varchar(100) comment '创建者',
   CREATE_DATE          datetime not null comment '创建时间',
   UPDATE_USER          varchar(100) comment '更新者',
   UPDATE_DATE          datetime comment '更新时间',
   primary key (ID)
)
;

/*==============================================================*/
/* Table: CMS3_ALBUM                                            */
/*==============================================================*/
create table CMS3_ALBUM
(
   ID                   int not null auto_increment comment '标识',
   WEBSITE_ID           int not null comment '站点表外键',
   PARENT_ID            int comment '父级标识',
   CODE                 varchar(50) not null comment '相册代码',
   NAME                 varchar(50) not null comment '相册名称',
   HITS                 int not null comment '点击数',
   CREATE_USER          varchar(100) not null comment '创建者',
   CREATE_DATE          datetime not null comment '创建日期',
   UPDATE_USER          varchar(100) not null comment '修改者',
   UPDATE_DATE          datetime not null comment '更新日期',
   primary key (ID),
   unique key AK_CMS3_A_WI_C (WEBSITE_ID, CODE)
)
;

/*==============================================================*/
/* Table: CMS3_ARCHIVE                                          */
/*==============================================================*/
create table CMS3_ARCHIVE
(
   ID                   int not null auto_increment comment '标识',
   CATEGORY_ID          int not null comment '栏目表外键',
   STATUS               tinyint not null comment '状态',
   TYPE                 tinyint not null comment '文章类型',
   TITLE                varchar(255) not null comment '标题',
   SUB_TITLE            varchar(255) comment '副标题',
   KEYWORD              varchar(100) comment '关键字',
   TAG                  varchar(100) comment '标签',
   SUMMARY              varchar(255) comment '摘要',
   SOURCE               varchar(100) comment '来源',
   AUTHOR               varchar(50) comment '作者',
   PUBLISH_DATE         datetime comment '发布日期',
   CONTENT              text comment '内容',
   PHOTO                varchar(255) comment '图片',
   LINK                 varchar(255) comment '链接',
   TEMPLATE             varchar(100) comment '模板',
   ORDER_NUM            tinyint not null default 0 comment '排序号',
   HITS                 int not null comment '点击数',
   ALLOW_TOP            tinyint not null comment '置顶',
   TOP_TIMER            datetime comment '置顶有效期',
   PUBLISH_TIMER        datetime comment '定时发布时间',
   ALLOW_ANONYMOUS_COMMENT tinyint not null comment '匿名评论',
   ALLOW_COMMENT        tinyint not null comment '评论',
   CREATE_DATE          datetime not null comment '创建日期',
   CREATE_USER          varchar(100) not null comment '创建者',
   UPDATE_DATE          datetime not null comment '更新日期',
   UPDATE_USER          varchar(100) not null comment '更新者',
   primary key (ID)
)
;

/*==============================================================*/
/* Table: CMS3_ARCHIVE_ATTACHMENT                               */
/*==============================================================*/
create table CMS3_ARCHIVE_ATTACHMENT
(
   ID                   int not null auto_increment comment '标识',
   ARCHIVE_ID           int not null comment '文章表外键',
   NAME                 varchar(100) not null comment '文件名',
   DESCRIPTION          varchar(255) comment '描述',
   PATH                 varchar(255) not null comment '附件路径',
   ORDER_NUM            tinyint not null comment '排序号',
   primary key (ID)
)
;

/*==============================================================*/
/* Table: CMS3_ARCHIVE_COMMENT                                  */
/*==============================================================*/
create table CMS3_ARCHIVE_COMMENT
(
   ID                   int not null auto_increment comment '标识',
   ARCHIVE_ID           int not null comment '文章表外键',
   PARENT_ID            int comment '父级标识',
   STATUS               tinyint not null comment '状态',
   TITLE                varchar(100) not null comment '标题',
   CONTENT              varchar(1000) not null comment '内容',
   IP                   varchar(50) comment '网络地址',
   CREATE_USER          varchar(100) comment '创建人',
   CREATE_DATE          datetime not null comment '创建日期',
   UPDATE_USER          varchar(100) comment '更新人',
   UPDATE_DATE          datetime comment '更新日期',
   primary key (ID)
)
;

/*==============================================================*/
/* Table: CMS3_ARCHIVE_CUSTOM_FIELD                             */
/*==============================================================*/
create table CMS3_ARCHIVE_CUSTOM_FIELD
(
   ID                   int not null auto_increment comment '标识',
   CATEGORY_ID          int not null comment '栏目表外键',
   CODE                 varchar(50) not null comment '列代码',
   TYPE                 tinyint not null comment '输入类型',
   DICT_TYPE_CODE       varchar(50) comment '字典类型代码',
   NAME                 varchar(50) not null comment '列名称',
   DESCRIPTION          varchar(255) comment '描述',
   REGULAR_TYPE         tinyint not null comment '验证类型',
   REGULAR_EXPRESSION   text comment '正则表达式',
   DEFAULT_VALUE        varchar(255) comment '默认值',
   ALLOW_CASCADE        tinyint not null comment '沿用范围',
   primary key (ID),
   unique key AK_CMS3_ACF_CI_C (CATEGORY_ID, CODE)
)
;

/*==============================================================*/
/* Table: CMS3_CATEGORY                                         */
/*==============================================================*/
create table CMS3_CATEGORY
(
   ID                   int not null auto_increment comment '标识',
   WEBSITE_ID           int not null comment '站点表外键',
   PARENT_ID            int comment '父级标识',
   TYPE                 tinyint not null comment '栏目类型',
   STATUS               tinyint not null comment '栏目状态',
   NAME                 varchar(100) not null comment '栏目名称',
   CODE                 varchar(100) not null comment '栏目代码',
   URL                  varchar(255) comment '栏目目录URL',
   REMARK               text comment '描述',
   DESCRIPTION          varchar(255) comment '栏目描述',
   KEYWORD              varchar(100) comment '栏目关键字',
   BIG_PHOTO            varchar(255) comment '栏目大图',
   SMALL_PHOTO          varchar(255) comment '栏目小图',
   ORDER_NUM            tinyint not null comment '排序号',
   HITS                 int not null comment '点击数',
   INDEX_TEMPLATE       varchar(100) comment '栏目首页模板',
   LIST_TEMPLATE        varchar(100) comment '栏目列表页模板',
   DETAIL_TEMPLATE      varchar(100) comment '栏目内容页模板',
   ALLOW_TEMPLATE_CASCADE tinyint not null comment '模板沿用',
   ALLOW_COMMENT        tinyint not null comment '允许评论',
   ALLOW_ANONYMITY_COMMENT tinyint not null comment '允许匿名评论',
   VERIFY_COMMENT       tinyint not null comment '评论是否需要审核',
   ALLOW_COLLECT        tinyint not null comment '允许网站群采集',
   COLLECT_KEY          varchar(50) comment '网站群采集密钥',
   PAGE_SIZE            int comment '列表页显示数',
   STATIC_PATH          varchar(100) comment '静态生成路径',
   STATIC_INDEX_NAME    varchar(100) comment '首页静态生成名称',
   STATIC_LIST_NAME     varchar(100) comment '列表静态生成名称',
   STATIC_DETAIL_NAME   varchar(100) comment '列表静态生成名称',
   CREATE_USER          varchar(100) not null comment '创建者',
   CREATE_DATE          datetime not null comment '创建日期',
   UPDATE_USER          varchar(100) not null comment '更新者',
   UPDATE_DATE          datetime not null comment '更新日期',
   primary key (ID),
   unique key AK_CMS3_C_WI_C (WEBSITE_ID, CODE)
)
;

/*==============================================================*/
/* Table: CMS3_CATEGORY_PUBLISH_TEMPLATE                        */
/*==============================================================*/
create table CMS3_CATEGORY_PUBLISH_TEMPLATE
(
   ID                   int not null auto_increment comment '标识',
   CATEGORY_ID          int not null comment '栏目表外键',
   NAME                 varchar(50) not null comment '名称',
   TEMPLATE_NAME        varchar(100) not null comment '模板名称',
   STATIC_URL           varchar(255) not null comment '静态URL',
   primary key (ID)
)
;

/*==============================================================*/
/* Table: CMS3_CATEGORY_REFERENCE                               */
/*==============================================================*/
create table CMS3_CATEGORY_REFERENCE
(
   CATEGORY_ID          int not null comment '栏目表外键',
   REFERENCE_CATEGORY_ID int not null comment '关联栏目表外键',
   primary key (CATEGORY_ID, REFERENCE_CATEGORY_ID)
)
;

/*==============================================================*/
/* Table: CMS3_CATEGORY_SYNC_PUBLISH                            */
/*==============================================================*/
create table CMS3_CATEGORY_SYNC_PUBLISH
(
   CATEGORY_ID          int not null comment '栏目表外键',
   PUBLISH_CATEGORY_ID  int not null comment '同步发布栏目表外键',
   primary key (CATEGORY_ID, PUBLISH_CATEGORY_ID)
)
;

/*==============================================================*/
/* Table: CMS3_CUSTOM_FIELD_VALUE                               */
/*==============================================================*/
create table CMS3_CUSTOM_FIELD_VALUE
(
   ID                   int not null auto_increment comment '标识',
   CUSTOM_FIELD_ID      int not null comment '内容自定义字段表外键',
   ARCHIVE_ID           int not null comment '文章表外键',
   VALUE                varchar(1000) comment '值',
   primary key (ID),
   unique key AK_CMS3_CFV_CFI_AI (ARCHIVE_ID, CUSTOM_FIELD_ID)
)
;

/*==============================================================*/
/* Table: CMS3_DATA_COLLECT                                     */
/*==============================================================*/
create table CMS3_DATA_COLLECT
(
   ID                   int not null auto_increment comment '标识',
   WEBSITE_ID           int not null comment '站点表外键',
   CATEGORY_ID          int not null comment '栏目表外键',
   NAME                 varchar(50) not null comment '采集任务名称',
   STATUS               tinyint not null comment '采集状态',
   ARCHIVE_ADD_STATUS   tinyint not null comment '初次同步后文章状态',
   ARCHIVE_UPDATE_STATUS tinyint not null comment '再次同步后文章状态',
   ALLOW_SYNC_ARCHIVE_ADD tinyint not null comment '同步文章添加',
   ALLOW_SYNC_ARCHIVE_UPDATE tinyint not null comment '同步文章修改',
   ALLOW_SYNC_ARCHIVE_DELETE tinyint not null comment '同步文章删除',
   ALLOW_SYNC_CATEGORY_ADD tinyint not null comment '同步栏目添加',
   ALLOW_SYNC_CATEGORY_UPDATE tinyint not null comment '同步栏目修改',
   ALLOW_SYNC_CATEGORY_DELETE tinyint not null comment '同步栏目删除',
   CREATE_USER          varchar(100) not null comment '创建者',
   CREATE_DATE          datetime not null comment '创建日期',
   UPDATE_USER          varchar(100) not null comment '更新者',
   UPDATE_DATE          datetime not null comment '更新日期',
   primary key (ID)
)
;

/*==============================================================*/
/* Table: CMS3_DATA_COLLECT_ARCHIVE                             */
/*==============================================================*/
create table CMS3_DATA_COLLECT_ARCHIVE
(
   ID                   int not null auto_increment comment '标识',
   DATA_COLLECT_ID      int not null comment '数据分发表外键',
   ARCHIVE_ID           int not null comment '文章表外键',
   REFERENCE_ARCHIVE_ID int not null comment '关联文章表外键',
   primary key (ID),
   unique key AK_CMS3_DCA_ID2 (DATA_COLLECT_ID, ARCHIVE_ID, REFERENCE_ARCHIVE_ID)
)
;

/*==============================================================*/
/* Table: CMS3_DATA_COLLECT_CATEGORY                            */
/*==============================================================*/
create table CMS3_DATA_COLLECT_CATEGORY
(
   ID                   int not null auto_increment,
   DATA_COLLECT_ID      int not null comment '数据采集表外键',
   REFERENCE_CATEGORY_ID int not null comment '关联栏目表外键',
   CATEGORY_ID          int not null comment '栏目表外键',
   primary key (ID),
   unique key AK_CMS3_DCC_ID2 (DATA_COLLECT_ID, CATEGORY_ID, REFERENCE_CATEGORY_ID)
)
;

/*==============================================================*/
/* Table: CMS3_DATA_COLLECT_TARGET                              */
/*==============================================================*/
create table CMS3_DATA_COLLECT_TARGET
(
   ID                   int not null auto_increment comment '标识',
   DATA_COLLECT_ID      int not null comment '数据采集表外键',
   WEBSITE_ID           int not null comment '站点表外键',
   CATEGORY_ID          int not null comment '栏目表外键',
   CATEGORY_KEY         varchar(50) not null comment '栏目采集密钥',
   primary key (ID),
   unique key AK_CMS3_DCT_ID2 (DATA_COLLECT_ID, WEBSITE_ID, CATEGORY_ID)
)
;

/*==============================================================*/
/* Table: CMS3_PHOTO                                            */
/*==============================================================*/
create table CMS3_PHOTO
(
   ID                   int not null auto_increment comment '标识',
   ALBUM_ID             int not null comment '相册表外键',
   PATH                 varchar(255) not null comment '图片路径',
   NAME                 varchar(100) not null comment '图片名称',
   ALT                  varchar(100) comment '图片描述',
   TAG                  varchar(100) comment '标签',
   THUMBNAIL_PATH       varchar(255) comment '缩略图路径',
   HITS                 int not null comment '点击数',
   CREATE_USER          varchar(100) not null comment '创建者',
   CREATE_DATE          datetime not null comment '创建日期',
   UPDATE_USER          varchar(100) not null comment '更新者',
   UPDATE_DATE          datetime not null comment '更新日期',
   primary key (ID)
)
;


/*==============================================================*/
/* Table: CMS3_PRODUCT_ATTRIBUTE                                */
/*==============================================================*/
create table CMS3_PRODUCT_ATTRIBUTE
(
   ID                   bigint unsigned not null auto_increment comment '编号',
   PRODUCT_ID           bigint unsigned not null comment '产品编号',
   TYPE                 varchar(100) comment '分类',
   NAME                 varchar(100) not null comment '名字',
   VALUE                varchar(1000) not null comment '值',
   DESCRIPTION          varchar(255) comment '描述',
   primary key (ID)
);

/*==============================================================*/
/* Table: CMS3_PRODUCT_PICTURE                                  */
/*==============================================================*/
create table CMS3_PRODUCT_PICTURE
(
   ID                   bigint unsigned not null auto_increment comment '编号',
   PRODUCT_ID           bigint unsigned not null comment '产品编号',
   ORIGINAL_PATH        varchar(100) not null comment '原图',
   THUMBNAIL            varchar(100) comment '缩略图',
   ORDER_NUM            tinyint not null comment '排序号',
   primary key (ID)
);

/*==============================================================*/
/* Table: CMS3_PRODUCT                                          */
/*==============================================================*/
create table CMS3_PRODUCT
(
   ID                   bigint unsigned not null auto_increment comment '编号',
   WEBSITE_ID           int not null comment '站点编号',
   CATEGORY_ID          int not null comment '文章编号',
   NAME                 varchar(100) comment '产品名',
   CODE                 varchar(100) not null comment '产品编号',
   STATUS               tinyint not null comment '状态(0:失效,1:有效)',
   NAME_DESCRIPION      varchar(255) comment '名称说明',
   SPECIFICATIONS       varchar(255) comment '规格',
   BIG_PICTURE          varchar(255) comment '大图',
   SMALL_PICTURE        varchar(255) comment '小图',
   PRICE                decimal(9,2) comment '价格',
   ORDER_NUM            tinyint not null comment '排序号',
   SALES_QUANTITY       int not null comment '销售量',
   QUANTITY             int not null default 0 comment '产品数量',
   HITS                 int not null default 0 comment '点击数',
   COMMENT_NUM          int not null default 0 comment '评论数',
   IS_NEW               tinyint not null default 0 comment '是否最新(0:否,1:是)',
   IS_TOP               tinyint not null default 0 comment '是否置顶(0:否,1:是)',
   INTRODUCE            text comment '产品介绍',
   PARAMETER            text comment '规格参数',
   PACK_LIST            text comment '包装清单',
   AFTER_SALES_SERVICE  text comment '售后服务',
   PUBLISH_DATE         datetime comment '发布时间',
   CREATE_DATE          datetime not null comment '创建时间',
   CREATE_USER          varchar(100) not null comment '创建人',
   UPDATE_DATE          datetime not null comment '更新时间',
   UPDATE_USER          varchar(100) not null comment '更新人',
   primary key (ID),
   unique key AK_CMS_P_WI_C (CODE, WEBSITE_ID)
);

/*==============================================================*/
/* Table: CMS3_PRODUCT_STOCK                                    */
/*==============================================================*/
create table CMS3_PRODUCT_STOCK
(
   ID                   bigint unsigned not null auto_increment,
   PRODUCT_ID           bigint unsigned not null,
   QUANTITY             int not null comment '数量',
   TYPE                 tinyint not null comment '类型：0进仓1撤货 2出售3冻结',
   DESCRIPTION          varchar(255) not null,
   CREATE_DATE          datetime not null,
   primary key (ID)
);

/*==============================================================*/
/* Table: FMS_FILE_ASSIGN                                       */
/*==============================================================*/
create table FMS_FILE_ASSIGN
(
   ID                   int not null auto_increment comment '标识',
   WEBSITE_ID           int not null comment '站点表外键',
   TYPE                 tinyint not null comment '分发类型',
   STATUS               tinyint not null comment '状态',
   LOCAL_PATH           varchar(255) not null comment '源路径',
   TARGET_PATH          varchar(255) not null comment '目标路径',
   FTP_HOST             varchar(100) comment 'ftp服务器地址',
   FTP_PORT             int comment 'ftp端口',
   FTP_USERNAME         varchar(100) comment 'ftp用户名',
   FTP_PASSWORD         varchar(100) comment 'ftp密码',
   primary key (ID)
)
;

/*==============================================================*/
/* Table: FTS_FULL_SEARCH                                       */
/*==============================================================*/
create table FTS_FULL_SEARCH
(
   ID                   int not null auto_increment comment '标识',
   WEBSITE_ID           int not null comment '站点表外键',
   STATUS               tinyint not null comment '状态',
   NAME                 varchar(50) not null comment '名称',
   CODE                 varchar(50) not null comment '代码',
   DESCRIPTION          varchar(255) comment '描述',
   LAST_DATETIME        datetime comment '最后执行日期',
   primary key (ID),
   unique key AK_FTS_FS_WI_C (WEBSITE_ID, CODE)
)
;

/*==============================================================*/
/* Table: FTS_FULL_SEARCH_HANDLER                               */
/*==============================================================*/
create table FTS_FULL_SEARCH_HANDLER
(
   ID                   int not null auto_increment comment '标识',
   FULL_SEARCH_ID       int not null comment '全文检索表外键',
   HANDLER_CLASS        varchar(255) not null comment '处理器类名',
   primary key (ID)
)
;

/*==============================================================*/
/* Table: FTS_HANDLER_PARAMETER                                 */
/*==============================================================*/
create table FTS_HANDLER_PARAMETER
(
   ID                   int not null auto_increment comment '标识',
   HANDLER_ID           int not null comment '处理器表外键',
   NAME                 varchar(50) not null comment '名称',
   VALUE                varchar(255) comment '值',
   primary key (ID),
   unique key AK_FTS_HP_HI_N (HANDLER_ID, NAME)
)
;

/*==============================================================*/
/* Table: RPS_MODULE                                            */
/*==============================================================*/
create table RPS_MODULE
(
   ID                   int not null auto_increment comment '标识',
   NAME                 varchar(50) not null comment '名称',
   CODE                 varchar(50) not null comment '代码',
   DESCRIPTION          varchar(255) comment '描述',
   primary key (ID),
   unique key AK_RPS_M_CODE (CODE)
)
;

/*==============================================================*/
/* Table: RPS_PERMISSION                                        */
/*==============================================================*/
create table RPS_PERMISSION
(
   ID                   int not null auto_increment comment '标识',
   MODULE_ID            int not null comment '模块表外键',
   NAME                 varchar(100) not null comment '权限名称',
   CODE                 varchar(100) not null comment '权限代码',
   RESOURCE_ID          int not null comment '资源表外键',
   OPERATION_NAME       varchar(50) not null comment '操作名称',
   OPERATION_CODE       varchar(50) not null comment '操作代码',
   DESCRIPTION          varchar(255) comment '描述',
   primary key (ID),
   unique key AK_RPS_P_CODE (CODE)
)
;

/*==============================================================*/
/* Table: RPS_RESOURCE                                          */
/*==============================================================*/
create table RPS_RESOURCE
(
   ID                   int not null auto_increment comment '标识',
   MODULE_ID            int not null comment '模块表外键',
   NAME                 varchar(50) not null comment '资源名称',
   CODE                 varchar(50) not null comment '资源代码',
   DESCRIPTION          varchar(255) comment '描述',
   primary key (ID),
   unique key AK_RPS_R_RECODE (CODE)
)
;

/*==============================================================*/
/* Table: RPS_ROLE                                              */
/*==============================================================*/
create table RPS_ROLE
(
   ID                   int not null auto_increment comment '标识',
   MODULE_ID            int not null comment '模块表外键',
   PARENT_ID            int comment '父级标识',
   STATUS               tinyint not null comment '状态',
   NAME                 varchar(50) not null comment '角色名称',
   CODE                 varchar(50) not null comment '角色代码',
   DESCRIPTION          varchar(255) comment '描述',
   primary key (ID),
   unique key AK_RPS_R_ROCODE (CODE)
)
;

/*==============================================================*/
/* Table: RPS_ROLE_PERMISSION                                   */
/*==============================================================*/
create table RPS_ROLE_PERMISSION
(
   ROLE_ID              int not null comment '角色表外键',
   PERMISSION_ID        int not null comment '权限表外键',
   primary key (ROLE_ID, PERMISSION_ID)
)
;

/*==============================================================*/
/* Table: RPS_SUBJECT                                           */
/*==============================================================*/
create table RPS_SUBJECT
(
   ID                   int not null auto_increment comment '标识',
   TYPE                 varchar(100) not null comment '类型',
   PRIMARY_KEY          varchar(100) not null comment '主键',
   primary key (ID),
   unique key AK_RPS_S_T_PK (TYPE, PRIMARY_KEY)
)
;

/*==============================================================*/
/* Table: RPS_SUBJECT_ROLE                                      */
/*==============================================================*/
create table RPS_SUBJECT_ROLE
(
   ID                   int not null auto_increment comment '标识',
   SUBJECT_ID           int not null comment '实例表外键',
   ROLE_ID              int not null comment '角色表外键',
   RESOURCE_ID          int comment '资源表外键',
   RESOURCE_INSTANCE    varchar(255) comment '资源实体',
   primary key (ID)
)
;

/*==============================================================*/
/* Table: RSS_BUILDER_PARAMETER                                 */
/*==============================================================*/
create table RSS_BUILDER_PARAMETER
(
   ID                   int not null auto_increment comment '标识',
   BUILDER_ID           int not null comment '生成器表外键',
   NAME                 varchar(50) not null comment '参数名称',
   VALUE                varchar(255) comment '值',
   primary key (ID),
   unique key AK_RSS_BP_BI_N (BUILDER_ID, NAME)
)
;

/*==============================================================*/
/* Table: RSS_CHANNEL                                           */
/*==============================================================*/
create table RSS_CHANNEL
(
   ID                   int not null auto_increment comment '标识',
   RSS_ID               int not null comment 'RSS表外键',
   TITLE                varchar(100) not null comment '频道名称',
   LINK                 varchar(255) not null comment '响应频道的网站URL',
   DESCRIPTION          varchar(255) not null comment '频道描述',
   GENERATOR            varchar(100) comment '生成该频道的程序名称',
   LANGUAGE             varchar(10) comment '语言',
   COPYRIGHT            varchar(255) comment '版权声明',
   PUB_DATE             datetime comment '内容发布时间',
   DOCS                 varchar(255) comment '指向RSS格式文档的URL地址',
   CATEGORY             varchar(100) comment '目录',
   TTL                  int comment 'cache有效保存时间',
   primary key (ID)
)
;

/*==============================================================*/
/* Table: RSS_CHANNEL_ITEM_BUILDER                              */
/*==============================================================*/
create table RSS_CHANNEL_ITEM_BUILDER
(
   ID                   int not null auto_increment comment '标识',
   CHANNEL_ID           int not null comment '频道表外键',
   BUILDER_CLASS        varchar(255) not null comment '生成类',
   primary key (ID)
)
;

/*==============================================================*/
/* Table: RSS_RSS                                               */
/*==============================================================*/
create table RSS_RSS
(
   ID                   int not null auto_increment comment '标识',
   WEBSITE_ID           int not null comment '站点表外键',
   NAME                 varchar(50) not null comment '名称',
   VERSION              varchar(10) not null comment '版本',
   PATH                 varchar(255) not null comment '路径',
   primary key (ID)
)
;

/*==============================================================*/
/* Table: SEO_ROBOT                                             */
/*==============================================================*/
create table SEO_ROBOT
(
   ID                   int not null auto_increment comment '标识',
   WEBSITE_ID           int not null comment '站点表外键',
   STATUS               tinyint not null comment '状态',
   NAME                 varchar(50) not null comment '名称',
   SEARCH_ENGINE        varchar(100) not null comment '搜索引擎',
   primary key (ID)
)
;

/*==============================================================*/
/* Table: SEO_ROBOT_PATH                                        */
/*==============================================================*/
create table SEO_ROBOT_PATH
(
   ID                   int not null auto_increment comment '标识',
   ROBOT_ID             int not null comment '搜索引擎爬行设置表外键',
   ALLOW                tinyint not null comment '访问权限',
   PATH                 varchar(255) not null comment '访问目录',
   primary key (ID)
)
;

/*==============================================================*/
/* Table: SEO_SITEMAP                                           */
/*==============================================================*/
create table SEO_SITEMAP
(
   ID                   int not null auto_increment comment '标识',
   WEBSITE_ID           int not null comment '站点表外键',
   STATUS               tinyint not null comment '状态',
   NAME                 varchar(50) not null comment '名称',
   primary key (ID),
   unique key AK_SEO_S_WI_N (WEBSITE_ID, NAME)
)
;

/*==============================================================*/
/* Table: SEO_SITEMAP_CONFIG                                    */
/*==============================================================*/
create table SEO_SITEMAP_CONFIG
(
   ID                   int not null auto_increment comment '标识',
   SITEMAP_ID           int not null comment 'SITEMAP表外键',
   LOC                  varchar(255) not null comment '地址',
   LASTMOD              datetime comment '最后更新时间',
   CHANGEFREQ           varchar(50) comment '更新频率',
   PRIORITY             varchar(5) comment '页面重复性',
   primary key (ID)
)
;

/*==============================================================*/
/* Table: SEO_WORD                                              */
/*==============================================================*/
create table SEO_WORD
(
   ID                   int not null auto_increment comment '标识',
   WEBSITE_ID           int not null comment '站点表外键',
   NAME                 varchar(50) not null comment '词汇名',
   LINK                 varchar(255) comment '链接地址',
   ALT                  varchar(255) comment '链接提示',
   primary key (ID)
)
;

/*==============================================================*/
/* Table: SEO_WORD_TYPE                                         */
/*==============================================================*/
create table SEO_WORD_TYPE
(
   ID                   int not null auto_increment comment '标识',
   WEBSITE_ID           int not null comment '站点表外键',
   PARENT_ID            int comment '父级标识',
   NAME                 varchar(50) not null comment '类型名称',
   primary key (ID)
)
;

/*==============================================================*/
/* Table: SEO_WORD_WORD_TYPE                                    */
/*==============================================================*/
create table SEO_WORD_WORD_TYPE
(
   WORD_ID              int not null comment '词汇表外键',
   WORD_TYPE_ID         int not null comment '词汇类型表外键',
   primary key (WORD_ID, WORD_TYPE_ID)
)
;

/*==============================================================*/
/* Table: STS_HANDLER_PARAMETER                                 */
/*==============================================================*/
create table STS_HANDLER_PARAMETER
(
   ID                   int not null auto_increment comment '标识',
   HANDLER_ID           int not null comment '处理器表外键',
   NAME                 varchar(50) not null comment '参数名称',
   VALUE                varchar(255) comment '参数值',
   primary key (ID),
   unique key AK_STS_HP_HI_N (HANDLER_ID, NAME)
)
;

/*==============================================================*/
/* Table: STS_SCHEDULED_TASK                                    */
/*==============================================================*/
create table STS_SCHEDULED_TASK
(
   ID                   int not null auto_increment comment '标识',
   WEBSITE_ID           int not null comment '站点表外键',
   STATUS               tinyint not null comment '状态',
   NAME                 varchar(50) not null comment '名称',
   FIXED_DATE_TIME      datetime comment '特定时间日期',
   CRON_EXPRESSION      varchar(100),
   PERIOD               int comment '执行周期值',
   PERIOD_TYPE          tinyint comment '周期值类型',
   DESCRIPTION          varchar(255) comment '描述',
   LAST_DATETIME        datetime comment '最后一次执行时间',
   primary key (ID)
)
;

/*==============================================================*/
/* Table: STS_TASK_HANDLER                                      */
/*==============================================================*/
create table STS_TASK_HANDLER
(
   ID                   int not null auto_increment comment '标识',
   SCHEDULED_TASK_ID    int not null comment '计划任务表外键',
   HANDLER_CLASS        varchar(255) not null comment '处理器类',
   primary key (ID)
)
;

/*==============================================================*/
/* Table: SYS_CONFIG                                            */
/*==============================================================*/
create table SYS_CONFIG
(
   ID                   int not null auto_increment comment '标识',
   NAME                 varchar(100) not null comment '配置项名称',
   VALUE                varchar(255) comment '配置项值',
   DESCRIPTION          varchar(255) comment '描述',
   primary key (ID),
   unique key AK_SYS_C_NAME (NAME)
)
;

/*==============================================================*/
/* Table: SYS_DICT_ITEM                                         */
/*==============================================================*/
create table SYS_DICT_ITEM
(
   ID                   int not null auto_increment comment '标识',
   DICT_TYPE_ID         int not null comment '字典类型表外键',
   PARENT_ID            int comment '父级标识',
   STATUS               tinyint not null comment '状态',
   NAME                 varchar(50) not null comment '字典项名称',
   VALUE                varchar(255) not null comment '字典项值',
   DESCRIPTION          varchar(255) comment '描述',
   ORDER_NUM            tinyint not null default 0 comment '排序号',
   primary key (ID)
)
;

/*==============================================================*/
/* Table: SYS_DICT_TYPE                                         */
/*==============================================================*/
create table SYS_DICT_TYPE
(
   ID                   int not null auto_increment comment '标识',
   NAME                 varchar(50) not null comment '类型名称',
   CODE                 varchar(50) not null comment '类型代码',
   DESCRIPTION          varchar(255) comment '描述',
   primary key (ID),
   unique key AK_SYS_DT_CODE (CODE)
)
;

/*==============================================================*/
/* Table: SYS_MODULE                                            */
/*==============================================================*/
create table SYS_MODULE
(
   ID                   int not null auto_increment comment '标识',
   PARENT_ID            int comment '父级标识',
   STATUS               tinyint not null comment '状态',
   NAME                 varchar(50) not null comment '模块名称',
   CODE                 varchar(50) not null comment '模块代码',
   ICON                 varchar(100) comment '图标',
   URL                  varchar(100) comment '地址',
   TARGET               varchar(20) comment '目标',
   ORDER_NUM            tinyint not null default 0 comment '排序号',
   primary key (ID),
   unique key AK_SYS_M_CODE (CODE)
)
;

/*==============================================================*/
/* Table: SYS_OPERATION_LOG                                     */
/*==============================================================*/
create table SYS_OPERATION_LOG
(
   ID                   int not null auto_increment comment '标识',
   CATEGORY             varchar(100) not null comment '操作日志类型',
   IP                   varchar(50) not null comment 'IP地址',
   DESCRIPTION          varchar(1000) not null comment '描述',
   USERNAME             varchar(100) not null comment '操作者',
   CREATE_DATE          datetime not null comment '创建时间',
   primary key (ID)
)
;

/*==============================================================*/
/* Table: SYS_ZONE                                              */
/*==============================================================*/
create table SYS_ZONE
(
   ID                   bigint unsigned not null auto_increment comment '编号',
   PARENT_ID            bigint unsigned comment '父编号',
   STATUS               tinyint not null comment '状态(0:无效,1:有效)',
   NAME                 varchar(100) not null comment '名称',
   VALUE                varchar(100) not null comment '值',
   ORDER_NUM            tinyint not null comment '排序号',
   DESCRIPTION          varchar(255) comment '描述',
   primary key (ID)
);

/*==============================================================*/
/* Table: UMS_GROUP                                             */
/*==============================================================*/
create table UMS_GROUP
(
   ID                   int not null auto_increment comment '标识',
   PARENT_ID            int comment '父级标识',
   STATUS               tinyint not null comment '状态',
   NAME                 varchar(50) not null comment '名称',
   DESCRIPTION          varchar(255) comment '描述',
   CREATE_USER          varchar(100) not null comment '创建者',
   CREATE_DATE          datetime not null comment '创建日期',
   UPDATE_USER          varchar(100) not null comment '更新者',
   UPDATE_DATE          datetime not null comment '更新日期',
   primary key (ID)
)
;

/*==============================================================*/
/* Table: UMS_USER                                              */
/*==============================================================*/
create table UMS_USER
(
   ID                   int not null auto_increment comment '标识',
   STATUS               tinyint not null comment '状态',
   USERNAME             varchar(100) not null comment '用户名',
   PASSWORD             varchar(100) not null comment '密码',
   CREATE_DATE          datetime not null comment '创建日期',
   CREATE_USER          varchar(100) not null comment '创建者',
   UPDATE_DATE          datetime not null comment '更新日期',
   UPDATE_USER          varchar(100) not null comment '更新者',
   primary key (ID),
   unique key AK_UMS_U_USERNAME (USERNAME)
)
;

/*==============================================================*/
/* Table: UMS_USER_GROUP                                        */
/*==============================================================*/
create table UMS_USER_GROUP
(
   USER_ID              int not null comment '用户表外键',
   GROUP_ID             int not null comment '分组表外键',
   primary key (USER_ID, GROUP_ID)
)
;

/*==============================================================*/
/* Table: WCS_COLLECT                                           */
/*==============================================================*/
create table WCS_COLLECT
(
   ID                   int not null auto_increment,
   WEBSITE_ID           int not null comment '站点表外键',
   STATUS               tinyint not null comment '状态',
   NAME                 varchar(50) not null comment '名称',
   DESCRIPTION          varchar(255) comment '描述',
   primary key (ID)
)
;

/*==============================================================*/
/* Table: WCS_DATA_HANDLER                                      */
/*==============================================================*/
create table WCS_DATA_HANDLER
(
   ID                   int not null auto_increment comment '标识',
   COLLECT_ID           int not null comment '采集表外键',
   NAME                 varchar(50) not null comment '名称',
   DESCRIPTION          varchar(255) comment '描述',
   HANDLER_CLASS        varchar(255) not null comment '处理器类',
   primary key (ID)
)
;

/*==============================================================*/
/* Table: WCS_FINDER                                            */
/*==============================================================*/
create table WCS_FINDER
(
   ID                   int not null auto_increment comment '标识',
   TARGET_ID            int not null comment '目标表外键',
   VAR                  varchar(50) not null comment '变量名',
   NAME                 varchar(50) not null comment '名称',
   primary key (ID),
   unique key AK_WCS_F_TI_V (TARGET_ID, VAR)
)
;

/*==============================================================*/
/* Table: WCS_HANDLER_PARAMETER                                 */
/*==============================================================*/
create table WCS_HANDLER_PARAMETER
(
   ID                   int not null auto_increment comment '标识',
   HANDLER_ID           int not null comment '处理器表外键',
   NAME                 varchar(50) not null comment '参数名称',
   VALUE                varchar(255) comment '参数值',
   primary key (ID),
   unique key AK_WCS_HP_HI_N (HANDLER_ID, NAME)
)
;

/*==============================================================*/
/* Table: WCS_MATCHER                                           */
/*==============================================================*/
create table WCS_MATCHER
(
   ID                   int not null auto_increment comment '标识',
   FINDER_ID            int not null comment '查找器表外键',
   TYPE                 tinyint not null comment '匹配器类型',
   ORDER_NUM            tinyint not null comment '排序号',
   REGULAR              varchar(1000) comment '匹配块表达式',
   REGULAR_GROUP        varchar(1000) comment '提取表达式',
   BEGIN_KEYWORD        varchar(1000) comment '开始关键字',
   END_KEYWORD          varchar(1000) comment '结束关键字',
   primary key (ID)
)
;

/*==============================================================*/
/* Table: WCS_TARGET                                            */
/*==============================================================*/
create table WCS_TARGET
(
   ID                   int not null auto_increment comment '标识',
   COLLECT_ID           int not null comment '采集表外键',
   PARENT_ID            int comment '父级标识',
   NAME                 varchar(50) not null comment '名称',
   URL                  varchar(255) not null comment '地址',
   CHARSET              varchar(20) comment '字符集',
   ALLOW_COMPRESS       tinyint not null comment '是否允许压缩内容',
   primary key (ID)
)
 ;

/*==============================================================*/
/* Table: WCS_TARGET_DATA_HANDLER                               */
/*==============================================================*/
create table WCS_TARGET_DATA_HANDLER
(
   TARGET_ID            int not null comment '目标表外键',
   DATA_HANDLER_ID      int not null comment '数据处理器表外键',
   primary key (TARGET_ID, DATA_HANDLER_ID)
)
;

/*==============================================================*/
/* Table: WMS_WEBSITE                                           */
/*==============================================================*/
create table WMS_WEBSITE
(
   ID                   int not null auto_increment comment '标识',
   NAME                 varchar(50) not null comment '站点名称',
   CODE                 varchar(50) not null comment '站点代码',
   INDEX_TEMPLATE       varchar(100) comment '首页模板',
   STATIC_INDEX_NAME    varchar(100) comment '静态首页名称',
   URL                  varchar(100) not null comment '地址',
   KEYWORD              varchar(100) comment '关键字',
   DESCRIPTION          varchar(255) comment '描述',
   CREATE_USER          varchar(100) not null comment '创建者',
   CREATE_DATE          datetime not null comment '创建时间',
   UPDATE_USER          varchar(100) not null comment '更新者',
   UPDATE_DATE          datetime not null comment '更新时间',
   primary key (ID),
   unique key AK_WMS_W_CODE (CODE)
)
;

/*==============================================================*/
/* Table: HRR_APPLY                                             */
/*==============================================================*/
create table HRR_APPLY
(
   ID                   bigint unsigned not null auto_increment comment '编号',
   STATUS               tinyint not null comment '状态(0未阅、1已阅、2邀请面试、3面试中、4聘请、5不聘用)',
   RECRUIT_ID           bigint unsigned not null comment '招聘编号',
   RESUME_ID            bigint unsigned not null comment '简历编号',
   APPLY_CONTENT        text comment '求职内容',
   APPLY_DATE           datetime not null comment '应聘时间',
   primary key (ID)
)
;

/*==============================================================*/
/* Table: HRR_CANDIDATE                                         */
/*==============================================================*/
create table HRR_CANDIDATE
(
   ID                   bigint unsigned not null auto_increment comment '编码',
   WEBSITE_ID           int not null comment '站点编号',
   STATUS               tinyint not null comment '状态（0失效、1有效）',
   USERNAME             varchar(100) not null comment '用户名',
   PASSWORD             varchar(100) not null comment '密码',
   EMAIL                varchar(100) comment 'E-Mail',
   MOBILE               varchar(20) comment '移动电话',
   CREATE_DATE          datetime not null comment '创建日期',
   UPDATE_DATE          datetime not null comment '更新日期',
   primary key (ID),
   unique key AK_HRR_C_USERNAME (USERNAME)
)
;

/*==============================================================*/
/* Table: HRR_LIBRARY                                           */
/*==============================================================*/
create table HRR_LIBRARY
(
   ID                   bigint unsigned not null auto_increment comment '编号',
   WEBSITE_ID           int not null comment '站点编号',
   PARENT_ID            bigint unsigned comment '上级编号',
   COMPANY              varchar(255) comment '公司',
   DEPARTMENT           varchar(255) comment '部门',
   NAME                 varchar(100) comment '名称',
   primary key (ID)
)
;

/*==============================================================*/
/* Table: HRR_LIBRARY_RESUME                                    */
/*==============================================================*/
create table HRR_LIBRARY_RESUME
(
   ID                   bigint unsigned not null auto_increment comment '编号',
   LIBRARY_ID           bigint unsigned not null comment '库编号',
   RESUME_ID            bigint unsigned not null comment '简历编号',
   CREATE_DATE          datetime not null comment '创建日期',
   primary key (ID)
)
;

/*==============================================================*/
/* Table: HRR_RECRUIT                                           */
/*==============================================================*/
create table HRR_RECRUIT
(
   ID                   bigint unsigned not null auto_increment comment '编号',
   WEBSITE_ID           int not null comment '站点编号',
   STATUS               tinyint not null comment '状态（0失效、1有效、2发布）',
   COMPANY              varchar(255) comment '公司',
   DEPARTMENT           varchar(255) comment '部门',
   POSITION             varchar(100) not null comment '职位',
   CODE                 varchar(100) comment '职位编号',
   COUNT                smallint comment '招聘数',
   WORKPLACE            varchar(255) comment '工作地点',
   PAY                  varchar(50) comment '薪水',
   JOB_NATURE           tinyint comment '工作性质（0:实习、1:兼职、2:全职）',
   FUNCTION_CATEGORIES_1 varchar(255) comment '职能类别1',
   FUNCTION_CATEGORIES_2 varchar(255) comment '职能类别2',
   FUNCTION_CATEGORIES_3 varchar(255) comment '职能类别3',
   DESCRIPTION          text comment '职位描述',
   ORDER_NUM            tinyint not null comment '排序号',
   PUBDATE_BEGIN        date comment '发布开始日期',
   PUBDATE_END          date comment '发布结束日期',
   VIEW_COUNT           int not null comment '查看次数',
   CREATE_DATE          datetime not null comment '创建时间',
   CREATE_USER          varchar(100) not null comment '创建人',
   UPDATE_DATE          datetime not null comment '更新时间',
   UPDATE_USER          varchar(100) not null comment '修改人',
   primary key (ID)
)
;

/*==============================================================*/
/* Table: HRR_RECRUIT_REQUIREMENT                               */
/*==============================================================*/
create table HRR_RECRUIT_REQUIREMENT
(
   RECRUIT_ID           bigint unsigned not null comment '编号',
   AGE                  varchar(50) comment '年龄要求',
   EDUCATION            varchar(50) comment '学历要求',
   WORK_EXP             tinyint comment '工作年限(<0为在读学生、=0为应届毕业生)',
   LANGUAGE_1           varchar(50) comment '语言要求1',
   LANGUAGE_MASTERY_DEGREE_1 tinyint comment '语言掌握程度1(0不限、1一般、2良好、3熟练、4精通)',
   LANGUAGE_2           varchar(50) comment '语言要求2',
   LANGUAGE_MASTERY_DEGREE_2 tinyint comment '语言掌握程度2(0不限、1一般、2良好、3熟练、4精通)',
   LANGUAGE_3           varchar(50) comment '语言要求3',
   LANGUAGE_MASTERY_DEGREE_3 tinyint comment '语言掌握程度3(0不限、1一般、2良好、3熟练、4精通)',
   SPECIALTY_1          varchar(100) comment '专业1',
   SPECIALTY_2          varchar(100) comment '专业2',
   SPECIALTY_3          varchar(100) comment '专业3',
   primary key (RECRUIT_ID)
)
;

/*==============================================================*/
/* Table: HRR_RESUME                                            */
/*==============================================================*/
create table HRR_RESUME
(
   ID                   bigint unsigned not null auto_increment comment '编号',
   CANDIDATE_ID         bigint unsigned not null comment '应聘者编号',
   STATUS               tinyint comment '状态（-1已删除,0,不启用,1启用）',
   NAME                 varchar(100) comment '简历名称',
   LANGUAGE             varchar(20) comment '简历语言（标准国际化命名）',
   TYPE                 varchar(50) comment '简历类型（子定义业务区分）',
   VIEW_COUNT           int not null comment '被查看次数',
   REFRESH_DATE         datetime not null comment '刷新时间',
   CREATE_DATE          datetime not null comment '创建日期',
   UPDATE_DATE          datetime not null comment '更新日期',
   primary key (ID)
)
;

/*==============================================================*/
/* Table: HRR_RESUME_ATTACHMENT                                 */
/*==============================================================*/
create table HRR_RESUME_ATTACHMENT
(
   ID                   bigint unsigned not null auto_increment comment '编号',
   RESUME_ID            bigint unsigned not null comment '简历编号',
   NAME                 varchar(100) comment '文件名',
   PATH                 varchar(255) comment '文件路径',
   primary key (ID)
)
;

/*==============================================================*/
/* Table: HRR_RESUME_BASE                                       */
/*==============================================================*/
create table HRR_RESUME_BASE
(
   RESUME_ID            bigint unsigned not null comment '编号',
   HEAD_IMAGE           varchar(255) comment '头像',
   NAME                 varchar(50) comment '姓名',
   GENDER               tinyint comment '性别(0女，1男)',
   BORN_DATE            date comment '出生日期',
   ID_TYPE              varchar(50) comment '证件类型',
   ID_NUMBER            varchar(50) comment '证件号',
   NATIONALITY          varchar(50) comment '国籍',
   MARITAL              tinyint comment '婚姻状态(0未婚、1已婚、2丧偶)',
   POLITICS_STATUS      varchar(50) comment '政治面貌',
   NATIVE_PLACE         varchar(50) comment '籍贯',
   HEIGHT               tinyint unsigned comment '身高',
   WEIGHT               tinyint comment '体重',
   primary key (RESUME_ID)
)
;

/*==============================================================*/
/* Table: HRR_RESUME_CERTIFICATE                                */
/*==============================================================*/
create table HRR_RESUME_CERTIFICATE
(
   ID                   bigint unsigned not null auto_increment comment '编号',
   RESUME_ID            bigint unsigned not null comment '简历编号',
   GET_DATE             date comment '获得日期',
   NAME                 varchar(100) comment '证书名',
   GRADE                varchar(50) comment '成绩',
   primary key (ID)
)
;

/*==============================================================*/
/* Table: HRR_RESUME_CONTACT                                    */
/*==============================================================*/
create table HRR_RESUME_CONTACT
(
   RESUME_ID            bigint unsigned not null comment '编号',
   COUNTRY              varchar(50) comment '国家',
   PROVINCE             varchar(50) comment '省份',
   CITY                 varchar(50) comment '城市',
   AREA                 varchar(50) comment '地区',
   ADDRESS              varchar(100) comment '地址',
   POSTCODE             varchar(20) comment '邮政编号',
   EMAIL                varchar(100) comment '电子邮箱',
   QQ                   varchar(100) comment 'QQ',
   MSN                  varchar(100) comment 'MSN',
   ICQ                  varchar(100),
   MOBILE               varchar(20) comment '移动电话',
   TEL                  varchar(20) comment '固定电话',
   WORK_TEL             varchar(20) comment '工作电话',
   REGISTERED_RESIDENCE varchar(100) comment '户口',
   HOMEPAGE             varchar(100),
   primary key (RESUME_ID)
)
;

/*==============================================================*/
/* Table: HRR_RESUME_EDUCATION                                  */
/*==============================================================*/
create table HRR_RESUME_EDUCATION
(
   RESUME_ID            bigint unsigned not null comment '简历编号',
   STATUS               tinyint comment '状态(0:在读,1:毕业)',
   SCHOOL               varchar(100) comment '学校',
   SPECIALTY            varchar(100) comment '专业',
   DEGREE               varchar(100) comment '学历',
   DESCRIPTION          text comment '描述',
   STUDY_ABROAD         tinyint comment '海外留学(0否，1是)',
   BEGIN_DATE           date comment '开始时间',
   END_DATE             date comment '结束时间',
   primary key (RESUME_ID)
)
;

/*==============================================================*/
/* Table: HRR_RESUME_EDUCATION_EXP                              */
/*==============================================================*/
create table HRR_RESUME_EDUCATION_EXP
(
   ID                   bigint unsigned not null auto_increment comment '编号',
   RESUME_ID            bigint unsigned not null comment '简历编号',
   STATUS               tinyint comment '状态(0:在读,1:毕业)',
   SCHOOL               varchar(100) comment '学校',
   SPECIALTY            varchar(100) comment '专业',
   DEGREE               varchar(100) comment '学历',
   DESCRIPTION          text comment '描述',
   STUDY_ABROAD         tinyint comment '海外留学(0否，1是)',
   BEGIN_DATE           date comment '开始时间',
   END_DATE             date comment '结束时间',
   primary key (ID)
)
;

/*==============================================================*/
/* Table: HRR_RESUME_JOB_INTENSION                              */
/*==============================================================*/
create table HRR_RESUME_JOB_INTENSION
(
   RESUME_ID            bigint unsigned not null comment '编号',
   JOB_NATURE           tinyint comment '工作性质（0:实习、1:兼职、2:全职）',
   LOCATION_1           varchar(100) comment '工作地点',
   LOCATION_2           varchar(100) comment '工作地点2',
   LOCATION_3           varchar(100) comment '工作地点3',
   LOCATION_4           varchar(100) comment '工作地点4',
   LOCATION_5           varchar(100) comment '工作地点3',
   INDUSTRY_1           varchar(100) comment '行业1',
   INDUSTRY_2           varchar(100) comment '行业2',
   INDUSTRY_3           varchar(100) comment '行业3',
   INDUSTRY_4           varchar(100) comment '行业4',
   INDUSTRY_5           varchar(100) comment '行业5',
   FUNCTION_CATEGORIES_1 varchar(255) comment '职能类别1',
   FUNCTION_CATEGORIES_2 varchar(255) comment '职能类别2',
   FUNCTION_CATEGORIES_3 varchar(255) comment '职能类别3',
   FUNCTION_CATEGORIES_4 varchar(255) comment '职能类别4',
   FUNCTION_CATEGORIES_5 varchar(255) comment '职能类别5',
   SALARY               varchar(50) comment '薪水要求',
   DUTY_TIME            tinyint unsigned comment '到岗时间',
   SELF_EVALUATION      text comment '自我评价',
   primary key (RESUME_ID)
)
;

/*==============================================================*/
/* Table: HRR_RESUME_LANGUAGE                                   */
/*==============================================================*/
create table HRR_RESUME_LANGUAGE
(
   ID                   bigint unsigned not null auto_increment comment '编号',
   RESUME_ID            bigint unsigned not null comment '简历编号',
   LANGUAGE             varchar(50) comment '语言',
   MASTERY_DEGREE       tinyint comment '语言掌握程度(1一般、2良好、3熟练、4精通)',
   LEVEL                varchar(100) comment '等级',
   primary key (ID)
)
;

/*==============================================================*/
/* Table: HRR_RESUME_OTHER                                      */
/*==============================================================*/
create table HRR_RESUME_OTHER
(
   ID                   bigint unsigned not null auto_increment comment '编号',
   RESUME_ID            bigint unsigned not null comment '简历编号',
   SUBJECT              varchar(100) comment '主题',
   CONTENT              text comment '内容',
   primary key (ID)
)
;

/*==============================================================*/
/* Table: HRR_RESUME_PROJECT_EXP                                */
/*==============================================================*/
create table HRR_RESUME_PROJECT_EXP
(
   ID                   bigint unsigned not null auto_increment comment '编号',
   RESUME_ID            bigint unsigned not null comment '简历编号',
   NAME                 varchar(100) comment '项目名称',
   DESCRIPTION          text comment '描述',
   ROLE                 varchar(50) comment '角色',
   DUTY                 text comment '责任',
   BEGIN_DATE           date comment '开始时间',
   END_DATE             date comment '结束时间',
   primary key (ID)
)
;

/*==============================================================*/
/* Table: HRR_RESUME_SKILL                                      */
/*==============================================================*/
create table HRR_RESUME_SKILL
(
   ID                   bigint unsigned not null auto_increment comment '编号',
   RESUME_ID            bigint unsigned not null comment '简历编号',
   NAME                 varchar(100) comment '名称',
   DESCRIPTION          varchar(255) comment '描述',
   USE_TIME             int unsigned comment '使用时间',
   MASTERY_DEGREE       tinyint comment '掌握程度(1一般、2良好、3熟练、4精通)',
   primary key (ID)
)
;

/*==============================================================*/
/* Table: HRR_RESUME_TRAINING_EXP                               */
/*==============================================================*/
create table HRR_RESUME_TRAINING_EXP
(
   ID                   bigint unsigned not null auto_increment comment '编号',
   RESUME_ID            bigint unsigned not null comment '简历编号',
   ORGANIZATION         varchar(100) comment '机构',
   PLACE                varchar(100) comment '培训地点',
   COURSE               varchar(100) comment '课程',
   ACHIEVEMENT          varchar(100) comment '成果',
   DESCRIPTION          text comment '描述',
   BEGIN_DATE           date comment '开始时间',
   END_DATE             date comment '结束时间',
   primary key (ID)
)
;

/*==============================================================*/
/* Table: HRR_RESUME_WORK                                       */
/*==============================================================*/
create table HRR_RESUME_WORK
(
   RESUME_ID            bigint unsigned not null comment '编号',
   WORK_EXP             tinyint comment '工作年限(<0为在读学生、=0为应届毕业生)',
   CURRENCY             varchar(50) comment '币种',
   SALARY               varchar(50) comment '薪酬',
   SALARY_BASE          varchar(50) comment '基本工资',
   SALARY_SUBSIDIES     varchar(50) comment '补贴',
   SALARY_BONUS         varchar(50) comment '奖金',
   SALARY_STOCK         varchar(50) comment '股票',
   SALARY_PERFORMANCE   varchar(50) comment '绩效',
   APPLY_STATUS         varchar(50) comment '求职状态',
   primary key (RESUME_ID)
)
;

/*==============================================================*/
/* Table: HRR_RESUME_WORK_EXP                                   */
/*==============================================================*/
create table HRR_RESUME_WORK_EXP
(
   ID                   bigint unsigned not null auto_increment comment '编号',
   RESUME_ID            bigint unsigned not null comment '简历编号',
   COMPANY              varchar(100) comment '公司',
   DEPARTMENT           varchar(100) comment '部门',
   POSITION             varchar(100) comment '职位',
   INDUSTRY             varchar(100) comment '行业',
   SCALE                varchar(50) comment '规模',
   NATURE               varchar(50) comment '性质',
   DESCRIPTION          text comment '工作描述',
   REPORT_TO            varchar(50) comment '汇报对象',
   UNDER_COUNT          int unsigned comment '下属人数',
   CERTIFIRE            varchar(50) comment '证明人',
   LEAVE_REASON         varchar(255) comment '离职原因',
   MAIN_ACHIEVEMENT     text comment '主要业绩',
   WORK_ABROAD          tinyint comment '海外工作(0否，1是)',
   BEGIN_DATE           date comment '开始时间',
   END_DATE             date comment '结束时间',
   primary key (ID)
)
;

/*==============================================================*/
/* Table: PMS_ANSWER                                            */
/*==============================================================*/
create table PMS_ANSWER
(
   ID                   bigint unsigned not null auto_increment comment '编号',
   PAPER_ID             bigint unsigned not null comment '问卷编号',
   SECTION_ID           bigint unsigned not null comment '大题编号',
   QUESTION_ID          bigint unsigned not null comment '题目编号',
   ANSWER_SHEET_ID      bigint unsigned not null comment '答卷编号',
   ANSWER               varchar(1000) comment '答卷答案',
   ANSWER_DETAIL        text comment '详细答案（简答时用）',
   IS_TRUE              tinyint comment '是否正确（0:否/1:是）',
   SCORE                decimal(5,1) comment '分数',
   CONFIG_SCORE         decimal(5,1) comment '配置分',
   primary key (ID)
)
;

/*==============================================================*/
/* Table: PMS_ANSWER_HISTORY                                    */
/*==============================================================*/
create table PMS_ANSWER_HISTORY
(
   ID                   bigint unsigned not null auto_increment comment '编号',
   PAPER_ID             bigint unsigned not null comment '问卷编号',
   SECTION_ID           bigint unsigned not null comment '大题编号',
   QUESTION_ID          bigint unsigned not null comment '题目编号',
   ANSWER_SHEET_ID      bigint unsigned not null comment '答卷编号',
   ANSWER               varchar(1000) comment '答卷答案',
   ANSWER_DETAIL        text comment '详细答案（简答时用）',
   IS_TRUE              tinyint not null comment '是否正确（0:否/1:是）',
   SCORE                decimal(5,1) comment '分数',
   primary key (ID)
)
;

/*==============================================================*/
/* Table: PMS_ANSWER_SHEET                                      */
/*==============================================================*/
create table PMS_ANSWER_SHEET
(
   ID                   bigint unsigned not null auto_increment comment '编号',
   PAPER_ID             bigint unsigned not null comment '答卷编号',
   STATUS               tinyint not null comment '状态(0:废弃/1:未审核/2:以审核/3:已归档)',
   IS_PASS              tinyint comment '是否及格（0:否/1:是）',
   PAPER_SCORE          decimal(5,1) comment '问卷分数',
   SCORE                decimal(5,1) comment '答卷分数',
   ANSWER_USER          varchar(100) not null comment '作答人',
   ANSWER_IP            varchar(30) comment 'IP地址',
   ANSWER_DATE          datetime not null comment '作答时间',
   MARKING_USER         varchar(100) comment '批阅人',
   MARKING_DATE         datetime comment '批阅时间',
   primary key (ID)
)
;

/*==============================================================*/
/* Table: PMS_ANSWER_SHEET_HISTORY                              */
/*==============================================================*/
create table PMS_ANSWER_SHEET_HISTORY
(
   ID                   bigint unsigned not null auto_increment comment '编号',
   PAPER_ID             bigint unsigned not null comment '答卷编号',
   STATUS               tinyint not null comment '状态(0:废弃/1:未审核/2:以审核/3:已归档)',
   IS_PASS              tinyint comment '是否及格（0:否/1:是）',
   PAPER_SCORE          decimal(5,1) comment '问卷分数',
   SCORE                decimal(5,1) comment '答卷分数',
   ANSWER_USER          varchar(100) not null comment '作答人',
   ANSWER_IP            varchar(30) comment 'IP地址',
   ANSWER_DATE          datetime not null comment '作答时间',
   MARKING_USER         varchar(100) comment '批阅人',
   MARKING_DATE         datetime comment '批阅时间',
   primary key (ID)
)
;

/*==============================================================*/
/* Table: PMS_PAPER                                             */
/*==============================================================*/
create table PMS_PAPER
(
   ID                   bigint unsigned not null auto_increment comment '编号',
   CATEGORY_ID          bigint unsigned not null comment '问卷分类',
   CODE 				VARCHAR(100) COMMENT '问卷代码',
   STATUS               tinyint not null comment '问卷状态',
   TYPE 				TINYINT NOT NULL DEFAULT 0 COMMENT '问卷类型 0:考卷 1:调查 2:投票 ',
   NAME                 varchar(100) not null comment '问卷名称',
   PASSING_SCORE        decimal(5,1) comment '及格线',
   BEGIN_DATE           datetime comment '开始时间',
   END_DATE             datetime comment '结束时间',
   TIME_LIMIT           int not null comment '限制回答时间',
   END_JUMP_URL 		VARCHAR(255) COMMENT '结束跳转链接',
   BG_PICTRUE 			VARCHAR(255) COMMENT '背景图片',
   DESCRIPTION          text comment '描述',
   CREATE_DATE          datetime not null comment '创建时间',
   CREATE_USER          varchar(100) not null comment '创建人',
   UPDATE_DATE          datetime not null comment '更新时间',
   UPDATE_USER          varchar(100) not null comment '更新人',
   primary key (ID)
)
;

/*==============================================================*/
/* Table: PMS_PAPER_CATEGORY                                    */
/*==============================================================*/
create table PMS_PAPER_CATEGORY
(
   ID                   bigint unsigned not null auto_increment comment '编号',
   WEBSITE_ID           int not null comment '站点编号',
   PARENT_ID            bigint unsigned comment '父级ID',
   CODE                 varchar(100) not null comment '唯一代码',
   NAME                 varchar(100) not null comment '名称',
   DESCRIPTION          varchar(255) not null comment '描述',
   CREATE_DATE          datetime not null comment '创建时间',
   CREATE_USER          varchar(100) not null comment '创建用户',
   UPDATE_DATE          datetime not null comment '更新时间',
   UPDATE_USER          varchar(100) not null comment '更新用户',
   primary key (ID),
   key AK_CODE (WEBSITE_ID, CODE)
)
;

/*==============================================================*/
/* Table: PMS_QUESTION                                          */
/*==============================================================*/
create table PMS_QUESTION
(
   ID                   bigint unsigned not null auto_increment comment '编号',
   WEBSITE_ID           int not null comment '站点编号',
   CATEGORY_ID          bigint unsigned comment '题目分类编号（不入库的题目为null）',
   STATUS               tinyint not null comment '状态(0:无效/1:有效)',
   MODE                 tinyint not null comment '题型:（1:判断/2:单选/3:多选/4:填空/5:简答）',
   DIFFICULTY           tinyint comment '难度，数值约大越难',
   QUESTION             varchar(1000) not null comment '问题内容',
   QUESTION_DESCRIPTION text comment '问题描述',
   ANSWER               varchar(1000) comment '答案内容（多选时，答案用|分隔）',
   ANSWER_DESCRIPTION   text comment '答案描述',
   MIN_OPTION_NUM 		INT COMMENT '最小选项数',
   MAX_OPTION_NUM 		INT COMMENT '最大选项数',
   CREATE_DATE          datetime not null comment '创建时间',
   CREATE_USER          varchar(100) not null comment '创建用户',
   UPDATE_DATE          datetime not null comment '更新时间',
   UPDATE_USER          varchar(100) not null comment '更新用户',
   primary key (ID)
)
;

/*==============================================================*/
/* Table: PMS_QUESTION_CATEGORY                                 */
/*==============================================================*/
create table PMS_QUESTION_CATEGORY
(
   ID                   bigint unsigned not null auto_increment comment '编号',
   WEBSITE_ID           int not null comment '站点编号',
   PARENT_ID            bigint unsigned comment '父级编号',
   NAME                 varchar(100) not null comment '名称',
   DESCRIPTION          varchar(255) comment '描述',
   CREATE_DATE          datetime not null comment '创建时间',
   CREATE_USER          varchar(100) not null comment '创建用户',
   UPDATE_DATE          datetime not null comment '更新时间',
   UPDATE_USER          varchar(100) not null comment '更新用户',
   primary key (ID)
)
;

/*==============================================================*/
/* Table: PMS_QUESTION_OPTION                                   */
/*==============================================================*/
create table PMS_QUESTION_OPTION
(
   ID                   bigint unsigned not null auto_increment comment '编号',
   QUESTION_ID          bigint unsigned not null comment '题目编号',
   TYPE                 tinyint comment '选项分类(0:普通选项/1:可输入选项)',
   NAME                 varchar(1000) not null comment '名称',
   VALUE                varchar(255) not null comment '值',
   SCORE 				DECIMAL(5,1) COMMENT '分数',
   DESCRIPTION          varchar(1000) comment '值描述',
   primary key (ID)
)
;

/*==============================================================*/
/* Table: PMS_SECTION                                           */
/*==============================================================*/
create table PMS_SECTION
(
   ID                   bigint unsigned not null auto_increment comment '编号',
   PAPER_ID             bigint unsigned not null comment '问卷编号',
   MODE                 tinyint comment '题型（1:判断/2:单选/3:多选/4:填空/5:简答/null:混合）',
   NAME                 varchar(100) not null comment '名称',
   DESCRIPTION          varchar(255) comment '描述',
   LIMIT_COUNT          int comment '最大题目数',
   ORDER_NUM            tinyint not null comment '排序号',
   primary key (ID)
)
;

/*==============================================================*/
/* Table: PMS_SECTION_QUESTION                                  */
/*==============================================================*/
create table PMS_SECTION_QUESTION
(
   ID                   bigint unsigned not null auto_increment comment '编号',
   SECTION_ID           bigint unsigned not null comment '大题编号',
   QUESTION_ID          bigint unsigned not null comment '题目编号',
   ORDER_NUM            tinyint not null comment '排序号',
   SCORE                decimal(5,1) comment '题目分数',
   primary key (ID)
)
;

/*==============================================================*/
/* Table: PMS_SECTION_RANDOM                                    */
/*==============================================================*/
create table PMS_SECTION_RANDOM
(
   ID                   bigint unsigned not null auto_increment comment '编号',
   SECTION_ID           bigint unsigned not null comment '大题编号',
   COUNT                int not null comment '提取数',
   SCORE                decimal(5,1) comment '毎题分数',
   FILTER_CLASS         varchar(255) not null comment '过滤器类',
   FILTER_PROPERTY      varchar(1000) comment '过滤器参数',
   primary key (ID)
)
;

/*==============================================================*/
/* Table: IMS_INTEGRAL                                          */
/*==============================================================*/
create table IMS_INTEGRAL
(
   ID                   bigint unsigned not null auto_increment comment '编号',
   WEBSITE_ID           int not null comment '站点编号',
   NAME                 varchar(100) not null comment '积分项',
   TYPE                 varchar(100) comment '类型',
   CODE                 varchar(100) not null comment '代码',
   STATUS               tinyint not null comment '状态(0:失效,1:生效)',
   IS_HISTORY           tinyint not null comment '是否归档项(0：否，1：是)',
   DESCRIPTION          varchar(255) comment '描述',
   OPERATE_INTEGRAL     decimal(9,2) comment '操作积分',
   CREATE_DATE          datetime not null comment '创建时间',
   CREATE_USER          varchar(100) not null comment '创建人',
   UPDATE_DATE          datetime not null comment '更新时间',
   UPDATE_USER          varchar(100) not null comment '更新人',
   primary key (ID),
   unique key AK_IMS_I_WI_C (WEBSITE_ID, CODE)
);

/*==============================================================*/
/* Table: IMS_INTEGRAL_DETAIL                                   */
/*==============================================================*/
create table IMS_INTEGRAL_DETAIL
(
   ID                   bigint unsigned not null auto_increment comment '编号',
   USER_ID              bigint unsigned not null comment '用户积分编号',
   INTEGRAL_ID          bigint unsigned not null comment '积分项目编号',
   OPERATE_INTEGRAL     decimal(9,2) not null comment '操作积分',
   SCORE             decimal(9,2) not null comment '操作后积分',
   CREATE_DATE          datetime not null comment '创建日期',
   REMARK          		varchar(255)  comment '备注',
   primary key (ID)
);

/*==============================================================*/
/* Table: IMS_USER                                              */
/*==============================================================*/
create table IMS_USER
(
   ID                   bigint unsigned not null auto_increment comment '编号',
   WEBSITE_ID           int not null comment '站点编号',
   USERNAME             varchar(255) not null comment '用户名',
   INTERGRAL            decimal(9,2) not null comment '积分',
   POSITIVE_INTEGRAL    decimal(9,2) not null comment '正向积分',
   CREATE_DATE          datetime not null comment '创建日期',
   UPDATE_DATE          datetime not null comment '更新日期',
   primary key (ID),
   unique key AK_IMS_U_WI_U (WEBSITE_ID, USERNAME)
);

/*==============================================================*/
/* Table: WBS_GUESTBOOK                                         */
/*==============================================================*/
create table WBS_GUESTBOOK
(
   ID                   bigint unsigned not null auto_increment comment '编号',
   WEBSITE_ID           int not null comment '网站编号',
   TITLE                varchar(255) not null comment '标题',
   STATUS               tinyint not null comment '状态(0:未审核,1:审核)',
   NAME                 varchar(100) comment '姓名',
   TYPE                 varchar(255) comment '类型',
   CONTENT              text not null comment '留言内容',
   SEX                  tinyint comment '性别',
   AGE                  tinyint comment '年龄',
   TELEPHONE            varchar(20) comment '电话',
   EMAIL                varchar(100) comment '电子邮箱',
   QQ                   varchar(20) comment 'qq号码',
   MOBILE               varchar(20) comment '手机',
   ADDRESS              varchar(255) comment '地址',
   IP                   varchar(50) comment 'ip地址',
   COUNTRY              varchar(50) comment '国家',
   PROVINCE             varchar(50) comment '省份',
   CITY                 varchar(50) comment '城市',
   CREATE_DATE          datetime not null comment '创建时间',
   CREATE_USER          varchar(100) comment '创建人',
   UPDATE_DATE          datetime not null comment '更新日期',
   UPDATE_USER          varchar(100) comment '更新人',
   primary key (ID)
);


alter table CFS_CUSTOM_FORM add constraint FK_CFS_CF_WMS_W foreign key (WEBSITE_ID)
      references WMS_WEBSITE (ID) on delete restrict on update restrict;

alter table CFS_CUSTOM_FORM_COLUMN add constraint FK_CFS_CFC_CF foreign key (CUSTOM_FORM_ID)
      references CFS_CUSTOM_FORM (ID) on delete restrict on update restrict;

alter table CFS_FORM_COLUMN_DATA add constraint FK_CFS_FCD_CFC foreign key (COLUMN_ID)
      references CFS_CUSTOM_FORM_COLUMN (ID) on delete restrict on update restrict;

alter table CFS_FORM_COLUMN_DATA add constraint FK_CFS_FCD_FD foreign key (FORM_DATA_ID)
      references CFS_FORM_DATA (ID) on delete restrict on update restrict;

alter table CFS_FORM_DATA add constraint FK_CFS_FD_CF foreign key (CUSTOM_FORM_ID)
      references CFS_CUSTOM_FORM (ID) on delete restrict on update restrict;

alter table CMS3_ALBUM add constraint FK_CMS3_A_A foreign key (PARENT_ID)
      references CMS3_ALBUM (ID) on delete restrict on update restrict;

alter table CMS3_ALBUM add constraint FK_CMS3_A_WMS_W foreign key (WEBSITE_ID)
      references WMS_WEBSITE (ID) on delete restrict on update restrict;

alter table CMS3_ARCHIVE add constraint FK_CMS3_A_C foreign key (CATEGORY_ID)
      references CMS3_CATEGORY (ID) on delete restrict on update restrict;

alter table CMS3_ARCHIVE_ATTACHMENT add constraint FK_CMS3_AA_A foreign key (ARCHIVE_ID)
      references CMS3_ARCHIVE (ID) on delete restrict on update restrict;

alter table CMS3_ARCHIVE_COMMENT add constraint FK_CMS3_AC_A foreign key (ARCHIVE_ID)
      references CMS3_ARCHIVE (ID) on delete restrict on update restrict;

alter table CMS3_ARCHIVE_COMMENT add constraint FK_CMS3_AC_AC foreign key (PARENT_ID)
      references CMS3_ARCHIVE_COMMENT (ID) on delete restrict on update restrict;

alter table CMS3_ARCHIVE_CUSTOM_FIELD add constraint FK_CMS3_ACF_C foreign key (CATEGORY_ID)
      references CMS3_CATEGORY (ID) on delete restrict on update restrict;

alter table CMS3_CATEGORY add constraint FK_CMS3_C_C foreign key (PARENT_ID)
      references CMS3_CATEGORY (ID) on delete restrict on update restrict;

alter table CMS3_CATEGORY add constraint FK_CMS3_C_WMS_W foreign key (WEBSITE_ID)
      references WMS_WEBSITE (ID) on delete restrict on update restrict;

alter table CMS3_CATEGORY_PUBLISH_TEMPLATE add constraint FK_CMS3_CPT_C foreign key (CATEGORY_ID)
      references CMS3_CATEGORY (ID) on delete restrict on update restrict;

alter table CMS3_CATEGORY_REFERENCE add constraint FK_CMS3_CR_C1 foreign key (CATEGORY_ID)
      references CMS3_CATEGORY (ID) on delete restrict on update restrict;

alter table CMS3_CATEGORY_REFERENCE add constraint FK_CMS3_CR_C2 foreign key (REFERENCE_CATEGORY_ID)
      references CMS3_CATEGORY (ID) on delete restrict on update restrict;

alter table CMS3_CATEGORY_SYNC_PUBLISH add constraint FK_CMS3_CSP_C1 foreign key (CATEGORY_ID)
      references CMS3_CATEGORY (ID) on delete restrict on update restrict;

alter table CMS3_CATEGORY_SYNC_PUBLISH add constraint FK_CMS3_CSP_C2 foreign key (PUBLISH_CATEGORY_ID)
      references CMS3_CATEGORY (ID) on delete restrict on update restrict;

alter table CMS3_CUSTOM_FIELD_VALUE add constraint FK_CMS3_CFV_A foreign key (ARCHIVE_ID)
      references CMS3_ARCHIVE (ID) on delete restrict on update restrict;

alter table CMS3_CUSTOM_FIELD_VALUE add constraint FK_CMS3_CFV_ACF foreign key (CUSTOM_FIELD_ID)
      references CMS3_ARCHIVE_CUSTOM_FIELD (ID) on delete restrict on update restrict;

alter table CMS3_DATA_COLLECT add constraint FK_CMS3_DC_C foreign key (CATEGORY_ID)
      references CMS3_CATEGORY (ID) on delete restrict on update restrict;

alter table CMS3_DATA_COLLECT add constraint FK_CMS3_DC_WMS_W foreign key (WEBSITE_ID)
      references WMS_WEBSITE (ID) on delete restrict on update restrict;

alter table CMS3_DATA_COLLECT_ARCHIVE add constraint FK_CMS3_DCA_A1 foreign key (REFERENCE_ARCHIVE_ID)
      references CMS3_ARCHIVE (ID) on delete restrict on update restrict;

alter table CMS3_DATA_COLLECT_ARCHIVE add constraint FK_CMS3_DCA_A2 foreign key (ARCHIVE_ID)
      references CMS3_ARCHIVE (ID) on delete restrict on update restrict;

alter table CMS3_DATA_COLLECT_ARCHIVE add constraint FK_CMS3_DCA_DC foreign key (DATA_COLLECT_ID)
      references CMS3_DATA_COLLECT (ID) on delete restrict on update restrict;

alter table CMS3_DATA_COLLECT_CATEGORY add constraint FK_CMS3_DCC_C1 foreign key (CATEGORY_ID)
      references CMS3_CATEGORY (ID) on delete restrict on update restrict;

alter table CMS3_DATA_COLLECT_CATEGORY add constraint FK_CMS3_DCC_C2 foreign key (REFERENCE_CATEGORY_ID)
      references CMS3_CATEGORY (ID) on delete restrict on update restrict;

alter table CMS3_DATA_COLLECT_CATEGORY add constraint FK_CMS3_DCC_DC foreign key (DATA_COLLECT_ID)
      references CMS3_DATA_COLLECT (ID) on delete restrict on update restrict;

alter table CMS3_DATA_COLLECT_TARGET add constraint FK_CMS3_DCT_C foreign key (CATEGORY_ID)
      references CMS3_CATEGORY (ID) on delete restrict on update restrict;

alter table CMS3_DATA_COLLECT_TARGET add constraint FK_CMS3_DCT_DC foreign key (DATA_COLLECT_ID)
      references CMS3_DATA_COLLECT (ID) on delete restrict on update restrict;

alter table CMS3_DATA_COLLECT_TARGET add constraint FK_CMS3_DCT_WMS_W foreign key (WEBSITE_ID)
      references WMS_WEBSITE (ID) on delete restrict on update restrict;

alter table CMS3_PHOTO add constraint FK_CMS3_P_CMS3_A foreign key (ALBUM_ID)
      references CMS3_ALBUM (ID) on delete restrict on update restrict;
   
alter table CMS3_PRODUCT_STOCK add constraint FK_FK_CMS3_PS_P_PID foreign key (PRODUCT_ID)
      references CMS3_PRODUCT (ID) on delete restrict on update restrict;

alter table CMS3_PRODUCT_ATTRIBUTE add constraint FK_CMS3_PA_P foreign key (PRODUCT_ID)
      references CMS3_PRODUCT (ID) on delete restrict on update restrict;

alter table CMS3_PRODUCT add constraint FK_CMS3_P_C foreign key (CATEGORY_ID)
      references CMS3_CATEGORY (ID) on delete restrict on update restrict;

alter table CMS3_PRODUCT add constraint FK_CMS3_P_WMS_W foreign key (WEBSITE_ID)
      references WMS_WEBSITE (ID) on delete restrict on update restrict;

alter table CMS3_PRODUCT_PICTURE add constraint FK_CMS3_PP_P foreign key(PRODUCT_ID)
      references CMS3_PRODUCT (ID) on delete restrict on update restrict;
      
alter table FMS_FILE_ASSIGN add constraint FK_FMS_FA_WMS_W foreign key (WEBSITE_ID)
      references WMS_WEBSITE (ID) on delete restrict on update restrict;

alter table FTS_FULL_SEARCH add constraint FK_FTS_FS_WMS_W foreign key (WEBSITE_ID)
      references WMS_WEBSITE (ID) on delete restrict on update restrict;

alter table FTS_FULL_SEARCH_HANDLER add constraint FK_FTS_FSH_FS foreign key (FULL_SEARCH_ID)
      references FTS_FULL_SEARCH (ID) on delete restrict on update restrict;

alter table FTS_HANDLER_PARAMETER add constraint FK_FTS_HP_FSH foreign key (HANDLER_ID)
      references FTS_FULL_SEARCH_HANDLER (ID) on delete restrict on update restrict;

alter table RPS_PERMISSION add constraint FK_RPS_P_M foreign key (MODULE_ID)
      references RPS_MODULE (ID) on delete restrict on update restrict;

alter table RPS_PERMISSION add constraint FK_RPS_P_R foreign key (RESOURCE_ID)
      references RPS_RESOURCE (ID) on delete restrict on update restrict;

alter table RPS_RESOURCE add constraint FK_RPS_R_M1 foreign key (MODULE_ID)
      references RPS_MODULE (ID) on delete restrict on update restrict;

alter table RPS_ROLE add constraint FK_RPS_R_M2 foreign key (MODULE_ID)
      references RPS_MODULE (ID) on delete restrict on update restrict;

alter table RPS_ROLE add constraint FK_RPS_R_R foreign key (PARENT_ID)
      references RPS_ROLE (ID) on delete restrict on update restrict;

alter table RPS_ROLE_PERMISSION add constraint FK_RPS_RP_P foreign key (PERMISSION_ID)
      references RPS_PERMISSION (ID) on delete restrict on update restrict;

alter table RPS_ROLE_PERMISSION add constraint FK_RPS_RP_R foreign key (ROLE_ID)
      references RPS_ROLE (ID) on delete restrict on update restrict;

alter table RPS_SUBJECT_ROLE add constraint FK_RPS_SR_R1 foreign key (RESOURCE_ID)
      references RPS_RESOURCE (ID) on delete restrict on update restrict;

alter table RPS_SUBJECT_ROLE add constraint FK_RPS_SR_R2 foreign key (ROLE_ID)
      references RPS_ROLE (ID) on delete restrict on update restrict;

alter table RPS_SUBJECT_ROLE add constraint FK_RPS_SR_S foreign key (SUBJECT_ID)
      references RPS_SUBJECT (ID) on delete restrict on update restrict;

alter table RSS_BUILDER_PARAMETER add constraint FK_RSS_BP_CIB foreign key (BUILDER_ID)
      references RSS_CHANNEL_ITEM_BUILDER (ID) on delete restrict on update restrict;

alter table RSS_CHANNEL add constraint FK_RSS_C_R foreign key (RSS_ID)
      references RSS_RSS (ID) on delete restrict on update restrict;

alter table RSS_CHANNEL_ITEM_BUILDER add constraint FK_RSS_CIB_C foreign key (CHANNEL_ID)
      references RSS_CHANNEL (ID) on delete restrict on update restrict;

alter table RSS_RSS add constraint FK_RSS_R_WMS_W foreign key (WEBSITE_ID)
      references WMS_WEBSITE (ID) on delete restrict on update restrict;

alter table SEO_ROBOT add constraint FK_SEO_R_WMS_W foreign key (WEBSITE_ID)
      references WMS_WEBSITE (ID) on delete restrict on update restrict;

alter table SEO_ROBOT_PATH add constraint FK_SEO_RP_R foreign key (ROBOT_ID)
      references SEO_ROBOT (ID) on delete restrict on update restrict;

alter table SEO_SITEMAP add constraint FK_SEO_S_WMS_W foreign key (WEBSITE_ID)
      references WMS_WEBSITE (ID) on delete restrict on update restrict;

alter table SEO_SITEMAP_CONFIG add constraint FK_SEO_SC_S foreign key (SITEMAP_ID)
      references SEO_SITEMAP (ID) on delete restrict on update restrict;

alter table SEO_WORD add constraint FK_SEO_W_WMS_W foreign key (WEBSITE_ID)
      references WMS_WEBSITE (ID) on delete restrict on update restrict;

alter table SEO_WORD_TYPE add constraint FK_SEO_WT_WMS_W foreign key (WEBSITE_ID)
      references WMS_WEBSITE (ID) on delete restrict on update restrict;

alter table SEO_WORD_TYPE add constraint FK_SEO_WT_WT foreign key (PARENT_ID)
      references SEO_WORD_TYPE (ID) on delete restrict on update restrict;

alter table SEO_WORD_WORD_TYPE add constraint FK_SEO_WWT_W foreign key (WORD_ID)
      references SEO_WORD (ID) on delete restrict on update restrict;

alter table SEO_WORD_WORD_TYPE add constraint FK_SEO_WWT_WT foreign key (WORD_TYPE_ID)
      references SEO_WORD_TYPE (ID) on delete restrict on update restrict;

alter table STS_HANDLER_PARAMETER add constraint FK_STS_HP_TH foreign key (HANDLER_ID)
      references STS_TASK_HANDLER (ID) on delete restrict on update restrict;

alter table STS_SCHEDULED_TASK add constraint FK_STS_ST_WMS_W foreign key (WEBSITE_ID)
      references WMS_WEBSITE (ID) on delete restrict on update restrict;

alter table STS_TASK_HANDLER add constraint FK_STS_TH_ST foreign key (SCHEDULED_TASK_ID)
      references STS_SCHEDULED_TASK (ID) on delete restrict on update restrict;

alter table SYS_DICT_ITEM add constraint FK_SYS_DI_DI foreign key (PARENT_ID)
      references SYS_DICT_ITEM (ID) on delete restrict on update restrict;

alter table SYS_DICT_ITEM add constraint FK_SYS_DI_DT foreign key (DICT_TYPE_ID)
      references SYS_DICT_TYPE (ID) on delete restrict on update restrict;

alter table SYS_MODULE add constraint FK_SYS_M_M foreign key (PARENT_ID)
      references SYS_MODULE (ID) on delete restrict on update restrict;

alter table SYS_ZONE add constraint FK_SYS_Z_Z foreign key (PARENT_ID)
      references SYS_ZONE (ID) on delete restrict on update restrict;
      
alter table UMS_GROUP add constraint FK_UMS_G_G foreign key (PARENT_ID)
      references UMS_GROUP (ID) on delete restrict on update restrict;

alter table UMS_USER_GROUP add constraint FK_UMS_UG_G foreign key (GROUP_ID)
      references UMS_GROUP (ID) on delete restrict on update restrict;

alter table UMS_USER_GROUP add constraint FK_UMS_UG_U foreign key (USER_ID)
      references UMS_USER (ID) on delete restrict on update restrict;

alter table WCS_COLLECT add constraint FK_WCS_C_WMS_W foreign key (WEBSITE_ID)
      references WMS_WEBSITE (ID) on delete restrict on update restrict;

alter table WCS_DATA_HANDLER add constraint FK_WCS_DH_C foreign key (COLLECT_ID)
      references WCS_COLLECT (ID) on delete restrict on update restrict;

alter table WCS_FINDER add constraint FK_WCS_F_T foreign key (TARGET_ID)
      references WCS_TARGET (ID) on delete restrict on update restrict;

alter table WCS_HANDLER_PARAMETER add constraint FK_WCS_HP_DH foreign key (HANDLER_ID)
      references WCS_DATA_HANDLER (ID) on delete restrict on update restrict;

alter table WCS_MATCHER add constraint FK_WCS_M_F foreign key (FINDER_ID)
      references WCS_FINDER (ID) on delete restrict on update restrict;

alter table WCS_TARGET add constraint FK_WCS_T_C foreign key (COLLECT_ID)
      references WCS_COLLECT (ID) on delete restrict on update restrict;

alter table WCS_TARGET add constraint FK_WCS_T_T foreign key (PARENT_ID)
      references WCS_TARGET (ID) on delete restrict on update restrict;

alter table WCS_TARGET_DATA_HANDLER add constraint FK_WCS_TDH_DH foreign key (DATA_HANDLER_ID)
      references WCS_DATA_HANDLER (ID) on delete restrict on update restrict;

alter table WCS_TARGET_DATA_HANDLER add constraint FK_WCS_TDH_T foreign key (TARGET_ID)
      references WCS_TARGET (ID) on delete restrict on update restrict;

alter table HRR_APPLY add constraint FK_HRR_A_RECRUIT foreign key (RECRUIT_ID)
      references HRR_RECRUIT (ID) on delete restrict on update restrict;

alter table HRR_APPLY add constraint FK_HRR_A_RESUME foreign key (RESUME_ID)
      references HRR_RESUME (ID) on delete restrict on update restrict;

alter table HRR_CANDIDATE add constraint FK_HRR_C_WID foreign key (WEBSITE_ID)
      references WMS_WEBSITE (ID) on delete restrict on update restrict;

alter table HRR_LIBRARY add constraint FK_HRR_L_PID foreign key (PARENT_ID)
      references HRR_LIBRARY (ID) on delete restrict on update restrict;

alter table HRR_LIBRARY add constraint FK_HRR_L_WID foreign key (WEBSITE_ID)
      references WMS_WEBSITE (ID) on delete restrict on update restrict;

alter table HRR_LIBRARY_RESUME add constraint FK_HRR_LR_LID foreign key (LIBRARY_ID)
      references HRR_LIBRARY (ID) on delete restrict on update restrict;

alter table HRR_LIBRARY_RESUME add constraint FK_HRR_LR_RID foreign key (RESUME_ID)
      references HRR_RESUME (ID) on delete restrict on update restrict;

alter table HRR_RECRUIT add constraint FK_HRR_R_WID foreign key (WEBSITE_ID)
      references WMS_WEBSITE (ID) on delete restrict on update restrict;

alter table HRR_RECRUIT_REQUIREMENT add constraint FK_HRR_RR_RID foreign key (RECRUIT_ID)
      references HRR_RECRUIT (ID) on delete restrict on update restrict;

alter table HRR_RESUME add constraint FK_HRR_R_CID foreign key (CANDIDATE_ID)
      references HRR_CANDIDATE (ID) on delete restrict on update restrict;

alter table HRR_RESUME_ATTACHMENT add constraint FK_HRR_RA_RID foreign key (RESUME_ID)
      references HRR_RESUME (ID) on delete restrict on update restrict;

alter table HRR_RESUME_BASE add constraint FK_HRR_RB_RID foreign key (RESUME_ID)
      references HRR_RESUME (ID) on delete restrict on update restrict;

alter table HRR_RESUME_CERTIFICATE add constraint FK_HRR_RC_RESUME2 foreign key (RESUME_ID)
      references HRR_RESUME (ID) on delete restrict on update restrict;

alter table HRR_RESUME_CONTACT add constraint FK_HRR_RC_RESUME1 foreign key (RESUME_ID)
      references HRR_RESUME (ID) on delete restrict on update restrict;

alter table HRR_RESUME_EDUCATION add constraint FK_HRR_RE_RID foreign key (RESUME_ID)
      references HRR_RESUME (ID) on delete restrict on update restrict;

alter table HRR_RESUME_EDUCATION_EXP add constraint FK_HRR_REE_RID foreign key (RESUME_ID)
      references HRR_RESUME (ID) on delete restrict on update restrict;

alter table HRR_RESUME_JOB_INTENSION add constraint FK_HRR_RJI_RID foreign key (RESUME_ID)
      references HRR_RESUME (ID) on delete restrict on update restrict;

alter table HRR_RESUME_LANGUAGE add constraint FK_HRR_RL_RID foreign key (RESUME_ID)
      references HRR_RESUME (ID) on delete restrict on update restrict;

alter table HRR_RESUME_OTHER add constraint FK_HRR_RO_RID foreign key (RESUME_ID)
      references HRR_RESUME (ID) on delete restrict on update restrict;

alter table HRR_RESUME_PROJECT_EXP add constraint FK_HRR_RPE_RID foreign key (RESUME_ID)
      references HRR_RESUME (ID) on delete restrict on update restrict;

alter table HRR_RESUME_SKILL add constraint FK_HRR_RS_RID foreign key (RESUME_ID)
      references HRR_RESUME (ID) on delete restrict on update restrict;

alter table HRR_RESUME_TRAINING_EXP add constraint FK_HRR_RTE_RID foreign key (RESUME_ID)
      references HRR_RESUME (ID) on delete restrict on update restrict;

alter table HRR_RESUME_WORK add constraint FK_HRR_RW_RID foreign key (RESUME_ID)
      references HRR_RESUME (ID) on delete restrict on update restrict;

alter table HRR_RESUME_WORK_EXP add constraint FK_HRR_RWE_RID foreign key (RESUME_ID)
      references HRR_RESUME (ID) on delete restrict on update restrict;

alter table PMS_ANSWER add constraint FK_PMS_A_ASID foreign key (ANSWER_SHEET_ID)
      references PMS_ANSWER_SHEET (ID) on delete restrict on update restrict;

alter table PMS_ANSWER add constraint FK_PMS_A_PID foreign key (PAPER_ID)
      references PMS_PAPER (ID) on delete restrict on update restrict;

alter table PMS_ANSWER add constraint FK_PMS_A_QID foreign key (QUESTION_ID)
      references PMS_QUESTION (ID) on delete restrict on update restrict;

alter table PMS_ANSWER add constraint FK_PMS_A_SID foreign key (SECTION_ID)
      references PMS_SECTION (ID) on delete restrict on update restrict;

alter table PMS_ANSWER_HISTORY add constraint FK_PMS_AH_ASID foreign key (ANSWER_SHEET_ID)
      references PMS_ANSWER_SHEET_HISTORY (ID) on delete restrict on update restrict;

alter table PMS_ANSWER_HISTORY add constraint FK_PMS_AH_PID foreign key (PAPER_ID)
      references PMS_PAPER (ID) on delete restrict on update restrict;

alter table PMS_ANSWER_HISTORY add constraint FK_PMS_AH_QID foreign key (QUESTION_ID)
      references PMS_QUESTION (ID) on delete restrict on update restrict;

alter table PMS_ANSWER_HISTORY add constraint FK_PMS_AH_SID foreign key (SECTION_ID)
      references PMS_SECTION (ID) on delete restrict on update restrict;

alter table PMS_ANSWER_SHEET add constraint FK_PMS_AS_PID foreign key (PAPER_ID)
      references PMS_PAPER (ID) on delete restrict on update restrict;

alter table PMS_ANSWER_SHEET_HISTORY add constraint FK_PMS_ASH_PID foreign key (PAPER_ID)
      references PMS_PAPER (ID) on delete restrict on update restrict;

alter table PMS_PAPER add constraint FK_PMS_P_PCID foreign key (CATEGORY_ID)
      references PMS_PAPER_CATEGORY (ID) on delete restrict on update restrict;

alter table PMS_PAPER_CATEGORY add constraint FK_PMS_PC_PID foreign key (PARENT_ID)
      references PMS_PAPER_CATEGORY (ID) on delete restrict on update restrict;

alter table PMS_PAPER_CATEGORY add constraint FK_PMS_PC_WID foreign key (WEBSITE_ID)
      references WMS_WEBSITE (ID) on delete restrict on update restrict;

alter table PMS_QUESTION add constraint FK_PMS_Q_QCID foreign key (CATEGORY_ID)
      references PMS_QUESTION_CATEGORY (ID) on delete restrict on update restrict;

alter table PMS_QUESTION add constraint FK_PMS_Q_WID foreign key (WEBSITE_ID)
      references WMS_WEBSITE (ID) on delete restrict on update restrict;

alter table PMS_QUESTION_CATEGORY add constraint FK_PMS_QC_PID foreign key (PARENT_ID)
      references PMS_QUESTION_CATEGORY (ID) on delete restrict on update restrict;

alter table PMS_QUESTION_CATEGORY add constraint FK_PMS_QC_WID foreign key (WEBSITE_ID)
      references WMS_WEBSITE (ID) on delete restrict on update restrict;

alter table PMS_QUESTION_OPTION add constraint FK_PMS_QO_QID foreign key (QUESTION_ID)
      references PMS_QUESTION (ID) on delete restrict on update restrict;

alter table PMS_SECTION add constraint FK_PMS_S_PID foreign key (PAPER_ID)
      references PMS_PAPER (ID) on delete restrict on update restrict;

alter table PMS_SECTION_QUESTION add constraint FK_PMS_SQ_QID foreign key (QUESTION_ID)
      references PMS_QUESTION (ID) on delete restrict on update restrict;

alter table PMS_SECTION_QUESTION add constraint FK_PMS_SQ_SID foreign key (SECTION_ID)
      references PMS_SECTION (ID) on delete restrict on update restrict;

alter table PMS_SECTION_RANDOM add constraint FK_PMS_SR_SID foreign key (SECTION_ID)
      references PMS_SECTION (ID) on delete restrict on update restrict;

alter table WBS_GUESTBOOK add constraint FK_WBS_G_WMS_W foreign key (WEBSITE_ID)
      references WMS_WEBSITE (ID) on delete restrict on update restrict;

alter table IMS_INTEGRAL add constraint FK_IMS_I_WMS_W foreign key (WEBSITE_ID)
      references WMS_WEBSITE (ID) on delete restrict on update restrict;

alter table IMS_INTEGRAL_DETAIL add constraint FK_IMS_ID_I foreign key (INTEGRAL_ID)
      references IMS_INTEGRAL (ID) on delete restrict on update restrict;

alter table IMS_INTEGRAL_DETAIL add constraint FK_IMS_ID_U foreign key (USER_ID)
      references IMS_USER (ID) on delete restrict on update restrict;

alter table IMS_USER add constraint FK_IMS_U_WMS_W foreign key (WEBSITE_ID)
      references WMS_WEBSITE (ID) on delete restrict on update restrict;
      