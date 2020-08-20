create table smbms_bill
(
    id           bigint auto_increment comment '主键ID'
        primary key,
    billCode     varchar(20)    null comment '账单编码',
    productName  varchar(20)    null comment '商品名称',
    productDesc  varchar(50)    null comment '商品描述',
    productUnit  varchar(10)    null comment '商品单位',
    productCount decimal(20, 2) null comment '商品数量',
    totalPrice   decimal(20, 2) null comment '商品总额',
    isPayment    int(10)        null comment '是否支付（0：未支付 1：已支付）',
    createdBy    bigint         null comment '创建者（userId）',
    creationDate datetime       null comment '创建时间',
    modifyBy     bigint         null comment '更新者（userId）',
    modifyDate   datetime       null comment '更新时间',
    proCode      varchar(20)    not null
);

create table smbms_provider
(
    proCode      varchar(20) not null comment '供应商编码'
        primary key,
    proName      varchar(20) null comment '供应商名称',
    proDesc      varchar(50) null comment '供应商详细描述',
    proContact   varchar(20) null comment '供应商联系人',
    proPhone     varchar(20) null comment '联系电话',
    proAddress   varchar(50) null comment '地址',
    proFax       varchar(20) null comment '传真',
    createdBy    bigint      null comment '创建者（userId）',
    creationDate datetime    null comment '创建时间',
    modifyDate   datetime    null comment '更新时间',
    modifyBy     bigint      null comment '更新者（userId）'
);

create table smbms_user
(
    id           bigint auto_increment comment '主键ID'
        primary key,
    userCode     varchar(15) not null comment '用户编码',
    userName     varchar(15) not null comment '用户名称',
    userPassword varchar(15) null comment '用户密码',
    gender       int(10)     null comment '性别（1:女、 2:男）',
    birthday     date        null comment '出生日期',
    phone        varchar(15) null comment '手机',
    address      varchar(30) null comment '地址',
    userType     int(10)     null comment '用户类型（1：系统管理员、2：经理、3：普通员工）',
    createdBy    bigint      null comment '创建者（userId）',
    creationDate datetime    null comment '创建时间',
    modifyBy     bigint      null comment '更新者（userId）',
    modifyDate   datetime    null comment '更新时间',
    constraint smbms_user_userCode_uindex
        unique (userCode),
    constraint smbms_user_userName_uindex
        unique (userName)
);


