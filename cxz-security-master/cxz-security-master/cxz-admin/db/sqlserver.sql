CREATE TABLE sys_user (
  id bigint NOT NULL,
  username varchar(50) NOT NULL,
  password varchar(100),
  real_name varchar(50),
  head_url varchar(200),
  gender  int,
  email varchar(100),
  mobile varchar(100),
  dept_id bigint,
  super_admin  int,
  status  int,
  creator bigint,
  create_date datetime,
  updater bigint,
  update_date datetime,
  primary key (id)
);

CREATE UNIQUE INDEX uk_sys_user_username on sys_user(username);
CREATE INDEX idx_sys_user_create_date on sys_user(create_date);


CREATE TABLE sys_dept (
  id bigint NOT NULL,
  pid bigint,
  pids varchar(500),
  name varchar(50),
  sort  int,
  creator bigint,
  create_date datetime,
  updater bigint,
  update_date datetime,
  primary key (id)
);
CREATE INDEX idx_sys_dept_pid on sys_dept(pid);
CREATE INDEX idx_sys_dept_idx_sort on sys_dept(sort);


create table sys_role
(
  id                   bigint NOT NULL,
  name                 varchar(50),
  remark               varchar(100),
  dept_id              bigint,
  creator              bigint,
  create_date          datetime,
  updater              bigint,
  update_date          datetime,
  primary key (id)
);

CREATE INDEX idx_sys_role_dept_id on sys_role(dept_id);


create table sys_menu
(
  id                   bigint NOT NULL,
  pid                  bigint,
  name                 varchar(200),
  url                  varchar(200),
  permissions          varchar(500),
  type                  int,
  icon                 varchar(50),
  sort                  int,
  creator              bigint,
  create_date          datetime,
  updater              bigint,
  update_date          datetime,
  primary key (id)
);

CREATE INDEX idx_sys_menu_pid on sys_menu(pid);
CREATE INDEX idx_sys_menu_sort on sys_menu(sort);


create table sys_role_user
(
  id                   bigint NOT NULL,
  role_id              bigint,
  user_id              bigint,
  creator              bigint,
  create_date          datetime,
  primary key (id)
);

CREATE INDEX idx_sys_role_user_role_id on sys_role_user(role_id);
CREATE INDEX idx_sys_role_user_user_id on sys_role_user(user_id);


create table sys_role_menu
(
  id                   bigint NOT NULL,
  role_id              bigint,
  menu_id              bigint,
  creator              bigint,
  create_date          datetime,
  primary key (id)
);

CREATE INDEX idx_sys_role_menu_role_id on sys_role_menu(role_id);
CREATE INDEX idx_sys_role_menu_menu_id on sys_role_menu(menu_id);


create table sys_role_data_scope
(
  id                   bigint NOT NULL,
  role_id              bigint,
  dept_id              bigint,
  creator              bigint,
  create_date          datetime,
  primary key (id)
);
CREATE INDEX idx_data_scope_role_id on sys_role_data_scope(role_id);


create table sys_params
(
  id                   bigint NOT NULL,
  param_code           varchar(32),
  param_value          varchar(2000),
  param_type            int DEFAULT 1 NOT NULL,
  remark               varchar(200),
  creator              bigint,
  create_date          datetime,
  updater              bigint,
  update_date          datetime,
  primary key (id)
);
CREATE UNIQUE INDEX uk_sys_params_param_code on sys_params(param_code);
CREATE INDEX idx_sys_params_create_date on sys_params(create_date);


create table sys_dict_type
(
    id                   bigint NOT NULL,
    dict_type            varchar(100),
    dict_name            varchar(255),
    remark               varchar(255),
    sort                 int,
    creator              bigint,
    create_date          datetime,
    updater              bigint,
    update_date          datetime,
    primary key (id)
);
CREATE UNIQUE INDEX uk_sys_dict_type_dict_type on sys_dict_type(dict_type);


create table sys_dict_data
(
    id                   bigint NOT NULL,
    dict_type_id         bigint NOT NULL,
    dict_label           varchar(255),
    dict_value           varchar(255),
    remark               varchar(255),
    sort                 int,
    creator              bigint,
    create_date          datetime,
    updater              bigint,
    update_date          datetime,
    primary key (id)
);
CREATE INDEX idx_sys_dict_data_sort on sys_dict_data(sort);
CREATE UNIQUE INDEX uk_dict_type_value on sys_dict_data(dict_type_id, dict_value);


create table sys_log_login
(
  id                   bigint NOT NULL,
  operation            int,
  status               int,
  user_agent           varchar(500),
  ip                   varchar(32),
  creator_name         varchar(50),
  creator              bigint,
  create_date          datetime,
  primary key (id)
);
CREATE INDEX idx_login_status on sys_log_login(status);
CREATE INDEX idx_login_create_date on sys_log_login(create_date);


create table sys_log_operation
(
  id                   bigint NOT NULL,
  operation            varchar(50),
  request_uri          varchar(200),
  request_method       varchar(20),
  request_params       text,
  request_time          int,
  user_agent           varchar(500),
  ip                   varchar(32),
  status                int,
  creator_name         varchar(50),
  creator              bigint,
  create_date          datetime,
  primary key (id)
);
CREATE INDEX idx_operation_create_date on sys_log_operation(create_date);


create table sys_log_error
(
  id                   bigint NOT NULL,
  request_uri          varchar(200),
  request_method       varchar(20),
  request_params       text,
  user_agent           varchar(500),
  ip                   varchar(32),
  error_info           text,
  creator              bigint,
  create_date          datetime,
  primary key (id)
);
CREATE INDEX idx_error_create_date on sys_log_error(create_date);


CREATE TABLE sys_oss (
  id bigint NOT NULL,
  url varchar(200),
  creator bigint,
  create_date datetime,
  PRIMARY KEY (id)
);
CREATE INDEX idx_sys_oss_create_date on sys_oss(create_date);


CREATE TABLE schedule_job (
  id bigint NOT NULL,
  bean_name varchar(200),
  params varchar(2000),
  cron_expression varchar(100),
  status  int,
  remark varchar(255),
  creator bigint,
  create_date datetime,
  updater bigint,
  update_date datetime,
  PRIMARY KEY (id)
);

CREATE INDEX idx_schedule_job_create_date on schedule_job(create_date);


CREATE TABLE schedule_job_log (
  id bigint NOT NULL,
  job_id bigint NOT NULL,
  bean_name varchar(200),
  params varchar(2000),
  status  int,
  error varchar(2000),
  times  int,
  create_date datetime,
  PRIMARY KEY (id)
);

CREATE INDEX idx_job_log_job_id on schedule_job_log(job_id);
CREATE INDEX idx_job_log_create_date on schedule_job_log(create_date);


CREATE TABLE sys_user_token (
  id bigint NOT NULL,
  user_id bigint,
  token varchar(100),
  expire_date datetime,
  update_date datetime,
  create_date datetime,
  PRIMARY KEY (id)
);

CREATE UNIQUE INDEX uk_sys_user_token_user_id on sys_user_token(user_id);
CREATE UNIQUE INDEX uk_sys_user_token on sys_user_token(token);



-- ????????????
INSERT INTO sys_user(id, username, password, real_name, gender, email, mobile, status, dept_id, super_admin, creator, create_date, updater, update_date) VALUES (1067246875800000001, 'admin', '$2a$10$012Kx2ba5jzqr9gLlG4MX.bnQJTD9UWqF57XDo2N3.fPtLne02u/m', '?????????', 0, 'root@cxz.io', '13612345678', 1, null, 1, 1067246875800000001, getdate(), 1067246875800000001, getdate());

INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000002, 0, '????????????', NULL, NULL, 0, 'icon-safetycertificate', 0, 1067246875800000001, getdate(), 1067246875800000001, getdate());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000003, 1067246875800000055, '??????', NULL, 'sys:user:save,sys:dept:list,sys:role:list', 1, NULL, 1, 1067246875800000001, getdate(), 1067246875800000001, getdate());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000004, 1067246875800000055, '??????', NULL, 'sys:user:update,sys:dept:list,sys:role:list', 1, NULL, 2, 1067246875800000001, getdate(), 1067246875800000001, getdate());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000005, 1067246875800000055, '??????', NULL, 'sys:user:delete', 1, NULL, 3, 1067246875800000001, getdate(), 1067246875800000001, getdate());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000006, 1067246875800000055, '??????', NULL, 'sys:user:export', 1, NULL, 4, 1067246875800000001, getdate(), 1067246875800000001, getdate());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000007, 1067246875800000002, '????????????', 'sys/role', NULL, 0, 'icon-team', 2, 1067246875800000001, getdate(), 1067246875800000001, getdate());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000008, 1067246875800000007, '??????', NULL, 'sys:role:page,sys:role:info', 1, NULL, 0, 1067246875800000001, getdate(), 1067246875800000001, getdate());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000009, 1067246875800000007, '??????', NULL, 'sys:role:save,sys:menu:select,sys:dept:list', 1, NULL, 1, 1067246875800000001, getdate(), 1067246875800000001, getdate());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000010, 1067246875800000007, '??????', NULL, 'sys:role:update,sys:menu:select,sys:dept:list', 1, NULL, 2, 1067246875800000001, getdate(), 1067246875800000001, getdate());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000011, 1067246875800000007, '??????', NULL, 'sys:role:delete', 1, NULL, 3, 1067246875800000001, getdate(), 1067246875800000001, getdate());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000012, 1067246875800000002, '????????????', 'sys/dept', NULL, 0, 'icon-apartment', 1, 1067246875800000001, getdate(), 1067246875800000001, getdate());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000014, 1067246875800000012, '??????', NULL, 'sys:dept:list,sys:dept:info', 1, NULL, 0, 1067246875800000001, getdate(), 1067246875800000001, getdate());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000015, 1067246875800000012, '??????', NULL, 'sys:dept:save', 1, NULL, 1, 1067246875800000001, getdate(), 1067246875800000001, getdate());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000016, 1067246875800000012, '??????', NULL, 'sys:dept:update', 1, NULL, 2, 1067246875800000001, getdate(), 1067246875800000001, getdate());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000017, 1067246875800000012, '??????', NULL, 'sys:dept:delete', 1, NULL, 3, 1067246875800000001, getdate(), 1067246875800000001, getdate());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000025, 1067246875800000035, '????????????', 'sys/menu', NULL, 0, 'icon-unorderedlist', 0, 1067246875800000001, getdate(), 1067246875800000001, getdate());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000026, 1067246875800000025, '??????', NULL, 'sys:menu:list,sys:menu:info', 1, NULL, 0, 1067246875800000001, getdate(), 1067246875800000001, getdate());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000027, 1067246875800000025, '??????', NULL, 'sys:menu:save', 1, NULL, 1, 1067246875800000001, getdate(), 1067246875800000001, getdate());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000028, 1067246875800000025, '??????', NULL, 'sys:menu:update', 1, NULL, 2, 1067246875800000001, getdate(), 1067246875800000001, getdate());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000029, 1067246875800000025, '??????', NULL, 'sys:menu:delete', 1, NULL, 3, 1067246875800000001, getdate(), 1067246875800000001, getdate());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000030, 1067246875800000035, '????????????', 'job/schedule', NULL, 0, 'icon-dashboard', 3, 1067246875800000001, getdate(), 1067246875800000001, getdate());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000031, 1067246875800000030, '??????', NULL, 'sys:schedule:page,sys:schedule:info', 1, NULL, 0, 1067246875800000001, getdate(), 1067246875800000001, getdate());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000032, 1067246875800000030, '??????', NULL, 'sys:schedule:save', 1, NULL, 1, 1067246875800000001, getdate(), 1067246875800000001, getdate());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000033, 1067246875800000030, '??????', NULL, 'sys:schedule:update', 1, NULL, 2, 1067246875800000001, getdate(), 1067246875800000001, getdate());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000034, 1067246875800000030, '??????', NULL, 'sys:schedule:delete', 1, NULL, 3, 1067246875800000001, getdate(), 1067246875800000001, getdate());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000035, 0, '????????????', NULL, NULL, 0, 'icon-setting', 1, 1067246875800000001, getdate(), 1067246875800000001, getdate());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000036, 1067246875800000030, '??????', NULL, 'sys:schedule:pause', 1, NULL, 4, 1067246875800000001, getdate(), 1067246875800000001, getdate());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000037, 1067246875800000030, '??????', NULL, 'sys:schedule:resume', 1, NULL, 5, 1067246875800000001, getdate(), 1067246875800000001, getdate());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000038, 1067246875800000030, '????????????', NULL, 'sys:schedule:run', 1, NULL, 6, 1067246875800000001, getdate(), 1067246875800000001, getdate());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000039, 1067246875800000030, '????????????', NULL, 'sys:schedule:log', 1, NULL, 7, 1067246875800000001, getdate(), 1067246875800000001, getdate());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000040, 1067246875800000035, '????????????', 'sys/params', '', 0, 'icon-fileprotect', 1, 1067246875800000001, getdate(), 1067246875800000001, getdate());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000041, 1067246875800000035, '????????????', 'sys/dict-type', NULL, 0, 'icon-golden-fill', 2, 1067246875800000001, getdate(), 1067246875800000001, getdate());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000042, 1067246875800000041, '??????', NULL, 'sys:dict:page,sys:dict:info', 1, NULL, 0, 1067246875800000001, getdate(), 1067246875800000001, getdate());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000043, 1067246875800000041, '??????', NULL, 'sys:dict:save', 1, NULL, 1, 1067246875800000001, getdate(), 1067246875800000001, getdate());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000044, 1067246875800000041, '??????', NULL, 'sys:dict:update', 1, NULL, 2, 1067246875800000001, getdate(), 1067246875800000001, getdate());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000045, 1067246875800000041, '??????', NULL, 'sys:dict:delete', 1, NULL, 3, 1067246875800000001, getdate(), 1067246875800000001, getdate());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000046, 0, '????????????', NULL, NULL, 0, 'icon-container', 2, 1067246875800000001, getdate(), 1067246875800000001, getdate());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000047, 1067246875800000035, '????????????', 'oss/oss', 'sys:oss:all', 0, 'icon-upload', 4, 1067246875800000001, getdate(), 1067246875800000001, getdate());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000048, 1067246875800000046, '????????????', 'sys/log-login', 'sys:log:login', 0, 'icon-filedone', 0, 1067246875800000001, getdate(), 1067246875800000001, getdate());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000049, 1067246875800000046, '????????????', 'sys/log-operation', 'sys:log:operation', 0, 'icon-solution', 1, 1067246875800000001, getdate(), 1067246875800000001, getdate());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000050, 1067246875800000046, '????????????', 'sys/log-error', 'sys:log:error', 0, 'icon-file-exception', 2, 1067246875800000001, getdate(), 1067246875800000001, getdate());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000051, 1067246875800000053, 'SQL??????', '{{ window.SITE_CONFIG["apiURL"] }}/druid/sql.html', NULL, 0, 'icon-database', 0, 1067246875800000001, getdate(), 1067246875800000001, getdate());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000053, 0, '????????????', NULL, NULL, 0, 'icon-desktop', 3, 1067246875800000001, getdate(), 1067246875800000001, getdate());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000055, 1067246875800000002, '????????????', 'sys/user', NULL, 0, 'icon-user', 0, 1067246875800000001, getdate(), 1067246875800000001, getdate());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000056, 1067246875800000055, '??????', NULL, 'sys:user:page,sys:user:info', 1, NULL, 0, 1067246875800000001, getdate(), 1067246875800000001, getdate());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000057, 1067246875800000040, '??????', NULL, 'sys:params:save', 1, NULL, 1, 1067246875800000001, getdate(), 1067246875800000001, getdate());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000058, 1067246875800000040, '??????', NULL, 'sys:params:export', 1, NULL, 4, 1067246875800000001, getdate(), 1067246875800000001, getdate());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000059, 1067246875800000040, '??????', '', 'sys:params:page,sys:params:info', 1, NULL, 0, 1067246875800000001, getdate(), 1067246875800000001, getdate());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000060, 1067246875800000040, '??????', NULL, 'sys:params:update', 1, NULL, 2, 1067246875800000001, getdate(), 1067246875800000001, getdate());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1067246875800000061, 1067246875800000040, '??????', '', 'sys:params:delete', 1, '', 3, 1067246875800000001, getdate(), 1067246875800000001, getdate());
INSERT INTO sys_menu (id, pid, name, url, permissions, type, icon, sort, creator, create_date, updater, update_date) VALUES (1156748733921165314, 1067246875800000053, '????????????', '{{ window.SITE_CONFIG["apiURL"] }}/doc.html', '', 0, 'icon-file-word', 1, 1067246875800000001, getdate(), 1067246875800000001, getdate());


INSERT INTO sys_dept(id, pid, pids, name, sort, creator, create_date, updater, update_date) VALUES (1067246875800000062, 1067246875800000063, '1067246875800000066,1067246875800000063', '?????????', 2, 1067246875800000001, getdate(), 1067246875800000001, getdate());
INSERT INTO sys_dept(id, pid, pids, name, sort, creator, create_date, updater, update_date) VALUES (1067246875800000063, 1067246875800000066, '1067246875800000066', '???????????????', 1, 1067246875800000001, getdate(), 1067246875800000001, getdate());
INSERT INTO sys_dept(id, pid, pids, name, sort, creator, create_date, updater, update_date) VALUES (1067246875800000064, 1067246875800000066, '1067246875800000066', '???????????????', 0, 1067246875800000001, getdate(), 1067246875800000001, getdate());
INSERT INTO sys_dept(id, pid, pids, name, sort, creator, create_date, updater, update_date) VALUES (1067246875800000065, 1067246875800000064, '1067246875800000066,1067246875800000064', '?????????', 0, 1067246875800000001, getdate(), 1067246875800000001, getdate());
INSERT INTO sys_dept(id, pid, pids, name, sort, creator, create_date, updater, update_date) VALUES (1067246875800000066, 0, '0', 'cxz????????????', 0, 1067246875800000001, getdate(), 1067246875800000001, getdate());
INSERT INTO sys_dept(id, pid, pids, name, sort, creator, create_date, updater, update_date) VALUES (1067246875800000067, 1067246875800000064, '1067246875800000066,1067246875800000064', '?????????', 0, 1067246875800000001, getdate(), 1067246875800000001, getdate());
INSERT INTO sys_dept(id, pid, pids, name, sort, creator, create_date, updater, update_date) VALUES (1067246875800000068, 1067246875800000063, '1067246875800000066,1067246875800000063', '?????????', 1, 1067246875800000001, getdate(), 1067246875800000001, getdate());

INSERT INTO sys_dict_type(id, dict_type, dict_name, remark, sort, creator, create_date, updater, update_date) VALUES (1160061077912858625, 'gender', '??????', '', 0, 1067246875800000001, getdate(), 1067246875800000001, getdate());
INSERT INTO sys_dict_data(id, dict_type_id, dict_label, dict_value, remark, sort, creator, create_date, updater, update_date) VALUES (1160061112075464705, 1160061077912858625, '???', '0', '', 0, 1067246875800000001, getdate(), 1067246875800000001, getdate());
INSERT INTO sys_dict_data(id, dict_type_id, dict_label, dict_value, remark, sort, creator, create_date, updater, update_date) VALUES (1160061146967879681, 1160061077912858625, '???', '1', '', 1, 1067246875800000001, getdate(), 1067246875800000001, getdate());
INSERT INTO sys_dict_data(id, dict_type_id, dict_label, dict_value, remark, sort, creator, create_date, updater, update_date) VALUES (1160061190127267841, 1160061077912858625, '??????', '2', '', 2, 1067246875800000001, getdate(), 1067246875800000001, getdate());
INSERT INTO sys_dict_type(id, dict_type, dict_name, remark, sort, creator, create_date, updater, update_date) VALUES (1225813644059140097, 'notice_type', '????????????-??????', '', 1, 1067246875800000001, getdate(), 1067246875800000001, getdate());
INSERT INTO sys_dict_data(id, dict_type_id, dict_label, dict_value, remark, sort, creator, create_date, updater, update_date) VALUES (1225814069634195457, 1225813644059140097, '??????', '0', '', 0, 1067246875800000001, getdate(), 1067246875800000001, getdate());
INSERT INTO sys_dict_data(id, dict_type_id, dict_label, dict_value, remark, sort, creator, create_date, updater, update_date) VALUES (1225814107559092225, 1225813644059140097, '??????', '1', '', 1, 1067246875800000001, getdate(), 1067246875800000001, getdate());
INSERT INTO sys_dict_data(id, dict_type_id, dict_label, dict_value, remark, sort, creator, create_date, updater, update_date) VALUES (1225814271879340034, 1225813644059140097, '??????', '2', '', 2, 1067246875800000001, getdate(), 1067246875800000001, getdate());

INSERT INTO sys_params(id, param_code, param_value, param_type, remark, creator, create_date, updater, update_date) VALUES (1067246875800000073, 'CLOUD_STORAGE_CONFIG_KEY', '{"type":1,"qiniuDomain":"http://test.oss.cxz.io","qiniuPrefix":"upload","qiniuAccessKey":"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ","qiniuSecretKey":"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV","qiniuBucketName":"cxz-oss","aliyunDomain":"","aliyunPrefix":"","aliyunEndPoint":"","aliyunAccessKeyId":"","aliyunAccessKeySecret":"","aliyunBucketName":"","qcloudDomain":"","qcloudPrefix":"","qcloudSecretId":"","qcloudSecretKey":"","qcloudBucketName":""}', '0', '?????????????????????', 1067246875800000001, getdate(), 1067246875800000001, getdate());

INSERT INTO schedule_job (id, bean_name, params, cron_expression, status, remark, creator, create_date, updater, update_date) VALUES (1067246875800000076, 'testTask', 'cxz', '0 0/30 * * * ?', 0, '?????????????????????????????????json', 1067246875800000001, getdate(), 1067246875800000001, getdate());


--  quartz???????????????
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_QRTZ_TRIGGERS_QRTZ_JOB_DETAILS]') AND OBJECTPROPERTY(id, N'ISFOREIGNKEY') = 1)
  ALTER TABLE [dbo].[QRTZ_TRIGGERS] DROP CONSTRAINT FK_QRTZ_TRIGGERS_QRTZ_JOB_DETAILS
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_QRTZ_CRON_TRIGGERS_QRTZ_TRIGGERS]') AND OBJECTPROPERTY(id, N'ISFOREIGNKEY') = 1)
  ALTER TABLE [dbo].[QRTZ_CRON_TRIGGERS] DROP CONSTRAINT FK_QRTZ_CRON_TRIGGERS_QRTZ_TRIGGERS
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_QRTZ_SIMPLE_TRIGGERS_QRTZ_TRIGGERS]') AND OBJECTPROPERTY(id, N'ISFOREIGNKEY') = 1)
  ALTER TABLE [dbo].[QRTZ_SIMPLE_TRIGGERS] DROP CONSTRAINT FK_QRTZ_SIMPLE_TRIGGERS_QRTZ_TRIGGERS
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_QRTZ_SIMPROP_TRIGGERS_QRTZ_TRIGGERS]') AND OBJECTPROPERTY(id, N'ISFOREIGNKEY') = 1)
  ALTER TABLE [dbo].[QRTZ_SIMPROP_TRIGGERS] DROP CONSTRAINT FK_QRTZ_SIMPROP_TRIGGERS_QRTZ_TRIGGERS
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[QRTZ_CALENDARS]') AND OBJECTPROPERTY(id, N'ISUSERTABLE') = 1)
  DROP TABLE [dbo].[QRTZ_CALENDARS]
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[QRTZ_CRON_TRIGGERS]') AND OBJECTPROPERTY(id, N'ISUSERTABLE') = 1)
  DROP TABLE [dbo].[QRTZ_CRON_TRIGGERS]
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[QRTZ_BLOB_TRIGGERS]') AND OBJECTPROPERTY(id, N'ISUSERTABLE') = 1)
  DROP TABLE [dbo].[QRTZ_BLOB_TRIGGERS]
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[QRTZ_FIRED_TRIGGERS]') AND OBJECTPROPERTY(id, N'ISUSERTABLE') = 1)
  DROP TABLE [dbo].[QRTZ_FIRED_TRIGGERS]
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[QRTZ_PAUSED_TRIGGER_GRPS]') AND OBJECTPROPERTY(id, N'ISUSERTABLE') = 1)
  DROP TABLE [dbo].[QRTZ_PAUSED_TRIGGER_GRPS]
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[QRTZ_SCHEDULER_STATE]') AND OBJECTPROPERTY(id, N'ISUSERTABLE') = 1)
  DROP TABLE [dbo].[QRTZ_SCHEDULER_STATE]
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[QRTZ_LOCKS]') AND OBJECTPROPERTY(id, N'ISUSERTABLE') = 1)
  DROP TABLE [dbo].[QRTZ_LOCKS]
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[QRTZ_JOB_DETAILS]') AND OBJECTPROPERTY(id, N'ISUSERTABLE') = 1)
  DROP TABLE [dbo].[QRTZ_JOB_DETAILS]
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[QRTZ_SIMPLE_TRIGGERS]') AND OBJECTPROPERTY(id, N'ISUSERTABLE') = 1)
  DROP TABLE [dbo].[QRTZ_SIMPLE_TRIGGERS]
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[QRTZ_SIMPROP_TRIGGERS]') AND OBJECTPROPERTY(id, N'ISUSERTABLE') = 1)
  DROP TABLE [dbo].[QRTZ_SIMPROP_TRIGGERS]
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[QRTZ_TRIGGERS]') AND OBJECTPROPERTY(id, N'ISUSERTABLE') = 1)
  DROP TABLE [dbo].[QRTZ_TRIGGERS]
GO

CREATE TABLE [dbo].[QRTZ_CALENDARS] (
  [SCHED_NAME] [VARCHAR] (120)  NOT NULL ,
  [CALENDAR_NAME] [VARCHAR] (200)  NOT NULL ,
  [CALENDAR] [IMAGE] NOT NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[QRTZ_CRON_TRIGGERS] (
  [SCHED_NAME] [VARCHAR] (120)  NOT NULL ,
  [TRIGGER_NAME] [VARCHAR] (200)  NOT NULL ,
  [TRIGGER_GROUP] [VARCHAR] (200)  NOT NULL ,
  [CRON_EXPRESSION] [VARCHAR] (120)  NOT NULL ,
  [TIME_ZONE_ID] [VARCHAR] (80)
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[QRTZ_FIRED_TRIGGERS] (
  [SCHED_NAME] [VARCHAR] (120)  NOT NULL ,
  [ENTRY_ID] [VARCHAR] (95)  NOT NULL ,
  [TRIGGER_NAME] [VARCHAR] (200)  NOT NULL ,
  [TRIGGER_GROUP] [VARCHAR] (200)  NOT NULL ,
  [INSTANCE_NAME] [VARCHAR] (200)  NOT NULL ,
  [FIRED_TIME] [BIGINT] NOT NULL ,
  [SCHED_TIME] [BIGINT] NOT NULL ,
  [PRIORITY] [INTEGER] NOT NULL ,
  [STATE] [VARCHAR] (16)  NOT NULL,
  [JOB_NAME] [VARCHAR] (200)  NULL ,
  [JOB_GROUP] [VARCHAR] (200)  NULL ,
  [IS_NONCONCURRENT] [VARCHAR] (1)  NULL ,
  [REQUESTS_RECOVERY] [VARCHAR] (1)  NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[QRTZ_PAUSED_TRIGGER_GRPS] (
  [SCHED_NAME] [VARCHAR] (120)  NOT NULL ,
  [TRIGGER_GROUP] [VARCHAR] (200)  NOT NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[QRTZ_SCHEDULER_STATE] (
  [SCHED_NAME] [VARCHAR] (120)  NOT NULL ,
  [INSTANCE_NAME] [VARCHAR] (200)  NOT NULL ,
  [LAST_CHECKIN_TIME] [BIGINT] NOT NULL ,
  [CHECKIN_INTERVAL] [BIGINT] NOT NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[QRTZ_LOCKS] (
  [SCHED_NAME] [VARCHAR] (120)  NOT NULL ,
  [LOCK_NAME] [VARCHAR] (40)  NOT NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[QRTZ_JOB_DETAILS] (
  [SCHED_NAME] [VARCHAR] (120)  NOT NULL ,
  [JOB_NAME] [VARCHAR] (200)  NOT NULL ,
  [JOB_GROUP] [VARCHAR] (200)  NOT NULL ,
  [DESCRIPTION] [VARCHAR] (250) NULL ,
  [JOB_CLASS_NAME] [VARCHAR] (250)  NOT NULL ,
  [IS_DURABLE] [VARCHAR] (1)  NOT NULL ,
  [IS_NONCONCURRENT] [VARCHAR] (1)  NOT NULL ,
  [IS_UPDATE_DATA] [VARCHAR] (1)  NOT NULL ,
  [REQUESTS_RECOVERY] [VARCHAR] (1)  NOT NULL ,
  [JOB_DATA] [IMAGE] NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[QRTZ_SIMPLE_TRIGGERS] (
  [SCHED_NAME] [VARCHAR] (120)  NOT NULL ,
  [TRIGGER_NAME] [VARCHAR] (200)  NOT NULL ,
  [TRIGGER_GROUP] [VARCHAR] (200)  NOT NULL ,
  [REPEAT_COUNT] [BIGINT] NOT NULL ,
  [REPEAT_INTERVAL] [BIGINT] NOT NULL ,
  [TIMES_TRIGGERED] [BIGINT] NOT NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[QRTZ_SIMPROP_TRIGGERS] (
  [SCHED_NAME] [VARCHAR] (120)  NOT NULL ,
  [TRIGGER_NAME] [VARCHAR] (200)  NOT NULL ,
  [TRIGGER_GROUP] [VARCHAR] (200)  NOT NULL ,
  [STR_PROP_1] [VARCHAR] (512) NULL,
  [STR_PROP_2] [VARCHAR] (512) NULL,
  [STR_PROP_3] [VARCHAR] (512) NULL,
  [INT_PROP_1] [INT] NULL,
  [INT_PROP_2] [INT] NULL,
  [LONG_PROP_1] [BIGINT] NULL,
  [LONG_PROP_2] [BIGINT] NULL,
  [DEC_PROP_1] [NUMERIC] (13,4) NULL,
  [DEC_PROP_2] [NUMERIC] (13,4) NULL,
  [BOOL_PROP_1] [VARCHAR] (1) NULL,
  [BOOL_PROP_2] [VARCHAR] (1) NULL,
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[QRTZ_BLOB_TRIGGERS] (
  [SCHED_NAME] [VARCHAR] (120)  NOT NULL ,
  [TRIGGER_NAME] [VARCHAR] (200)  NOT NULL ,
  [TRIGGER_GROUP] [VARCHAR] (200)  NOT NULL ,
  [BLOB_DATA] [IMAGE] NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[QRTZ_TRIGGERS] (
  [SCHED_NAME] [VARCHAR] (120)  NOT NULL ,
  [TRIGGER_NAME] [VARCHAR] (200)  NOT NULL ,
  [TRIGGER_GROUP] [VARCHAR] (200)  NOT NULL ,
  [JOB_NAME] [VARCHAR] (200)  NOT NULL ,
  [JOB_GROUP] [VARCHAR] (200)  NOT NULL ,
  [DESCRIPTION] [VARCHAR] (250) NULL ,
  [NEXT_FIRE_TIME] [BIGINT] NULL ,
  [PREV_FIRE_TIME] [BIGINT] NULL ,
  [PRIORITY] [INTEGER] NULL ,
  [TRIGGER_STATE] [VARCHAR] (16)  NOT NULL ,
  [TRIGGER_TYPE] [VARCHAR] (8)  NOT NULL ,
  [START_TIME] [BIGINT] NOT NULL ,
  [END_TIME] [BIGINT] NULL ,
  [CALENDAR_NAME] [VARCHAR] (200)  NULL ,
  [MISFIRE_INSTR] [SMALLINT] NULL ,
  [JOB_DATA] [IMAGE] NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[QRTZ_CALENDARS] WITH NOCHECK ADD
  CONSTRAINT [PK_QRTZ_CALENDARS] PRIMARY KEY  CLUSTERED
    (
      [SCHED_NAME],
      [CALENDAR_NAME]
    )  ON [PRIMARY]
GO

ALTER TABLE [dbo].[QRTZ_CRON_TRIGGERS] WITH NOCHECK ADD
  CONSTRAINT [PK_QRTZ_CRON_TRIGGERS] PRIMARY KEY  CLUSTERED
    (
      [SCHED_NAME],
      [TRIGGER_NAME],
      [TRIGGER_GROUP]
    )  ON [PRIMARY]
GO

ALTER TABLE [dbo].[QRTZ_FIRED_TRIGGERS] WITH NOCHECK ADD
  CONSTRAINT [PK_QRTZ_FIRED_TRIGGERS] PRIMARY KEY  CLUSTERED
    (
      [SCHED_NAME],
      [ENTRY_ID]
    )  ON [PRIMARY]
GO

ALTER TABLE [dbo].[QRTZ_PAUSED_TRIGGER_GRPS] WITH NOCHECK ADD
  CONSTRAINT [PK_QRTZ_PAUSED_TRIGGER_GRPS] PRIMARY KEY  CLUSTERED
    (
      [SCHED_NAME],
      [TRIGGER_GROUP]
    )  ON [PRIMARY]
GO

ALTER TABLE [dbo].[QRTZ_SCHEDULER_STATE] WITH NOCHECK ADD
  CONSTRAINT [PK_QRTZ_SCHEDULER_STATE] PRIMARY KEY  CLUSTERED
    (
      [SCHED_NAME],
      [INSTANCE_NAME]
    )  ON [PRIMARY]
GO

ALTER TABLE [dbo].[QRTZ_LOCKS] WITH NOCHECK ADD
  CONSTRAINT [PK_QRTZ_LOCKS] PRIMARY KEY  CLUSTERED
    (
      [SCHED_NAME],
      [LOCK_NAME]
    )  ON [PRIMARY]
GO

ALTER TABLE [dbo].[QRTZ_JOB_DETAILS] WITH NOCHECK ADD
  CONSTRAINT [PK_QRTZ_JOB_DETAILS] PRIMARY KEY  CLUSTERED
    (
      [SCHED_NAME],
      [JOB_NAME],
      [JOB_GROUP]
    )  ON [PRIMARY]
GO

ALTER TABLE [dbo].[QRTZ_SIMPLE_TRIGGERS] WITH NOCHECK ADD
  CONSTRAINT [PK_QRTZ_SIMPLE_TRIGGERS] PRIMARY KEY  CLUSTERED
    (
      [SCHED_NAME],
      [TRIGGER_NAME],
      [TRIGGER_GROUP]
    )  ON [PRIMARY]
GO

ALTER TABLE [dbo].[QRTZ_SIMPROP_TRIGGERS] WITH NOCHECK ADD
  CONSTRAINT [PK_QRTZ_SIMPROP_TRIGGERS] PRIMARY KEY  CLUSTERED
    (
      [SCHED_NAME],
      [TRIGGER_NAME],
      [TRIGGER_GROUP]
    )  ON [PRIMARY]
GO

ALTER TABLE [dbo].[QRTZ_TRIGGERS] WITH NOCHECK ADD
  CONSTRAINT [PK_QRTZ_TRIGGERS] PRIMARY KEY  CLUSTERED
    (
      [SCHED_NAME],
      [TRIGGER_NAME],
      [TRIGGER_GROUP]
    )  ON [PRIMARY]
GO

ALTER TABLE [dbo].[QRTZ_CRON_TRIGGERS] ADD
  CONSTRAINT [FK_QRTZ_CRON_TRIGGERS_QRTZ_TRIGGERS] FOREIGN KEY
    (
      [SCHED_NAME],
      [TRIGGER_NAME],
      [TRIGGER_GROUP]
    ) REFERENCES [dbo].[QRTZ_TRIGGERS] (
    [SCHED_NAME],
    [TRIGGER_NAME],
    [TRIGGER_GROUP]
  ) ON DELETE CASCADE
GO

ALTER TABLE [dbo].[QRTZ_SIMPLE_TRIGGERS] ADD
  CONSTRAINT [FK_QRTZ_SIMPLE_TRIGGERS_QRTZ_TRIGGERS] FOREIGN KEY
    (
      [SCHED_NAME],
      [TRIGGER_NAME],
      [TRIGGER_GROUP]
    ) REFERENCES [dbo].[QRTZ_TRIGGERS] (
    [SCHED_NAME],
    [TRIGGER_NAME],
    [TRIGGER_GROUP]
  ) ON DELETE CASCADE
GO

ALTER TABLE [dbo].[QRTZ_SIMPROP_TRIGGERS] ADD
  CONSTRAINT [FK_QRTZ_SIMPROP_TRIGGERS_QRTZ_TRIGGERS] FOREIGN KEY
    (
      [SCHED_NAME],
      [TRIGGER_NAME],
      [TRIGGER_GROUP]
    ) REFERENCES [dbo].[QRTZ_TRIGGERS] (
    [SCHED_NAME],
    [TRIGGER_NAME],
    [TRIGGER_GROUP]
  ) ON DELETE CASCADE
GO

ALTER TABLE [dbo].[QRTZ_TRIGGERS] ADD
  CONSTRAINT [FK_QRTZ_TRIGGERS_QRTZ_JOB_DETAILS] FOREIGN KEY
    (
      [SCHED_NAME],
      [JOB_NAME],
      [JOB_GROUP]
    ) REFERENCES [dbo].[QRTZ_JOB_DETAILS] (
    [SCHED_NAME],
    [JOB_NAME],
    [JOB_GROUP]
  )
GO