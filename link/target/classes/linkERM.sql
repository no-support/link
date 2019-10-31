
/* Drop Tables */

DROP TABLE EXPENSE_TAG CASCADE CONSTRAINTS;
DROP TABLE ACCOUNTBOOK_EXPENSE CASCADE CONSTRAINTS;
DROP TABLE INCOME_TAG CASCADE CONSTRAINTS;
DROP TABLE ACCOUNTBOOK_INCOME CASCADE CONSTRAINTS;
DROP TABLE ACOUNTBOOK_BUDGET CASCADE CONSTRAINTS;
DROP TABLE ACCOUNTBOOK_CATEGORY CASCADE CONSTRAINTS;
DROP TABLE ACCOUNTBOOK_COMMENTS CASCADE CONSTRAINTS;
DROP TABLE GOAL_TAG CASCADE CONSTRAINTS;
DROP TABLE ACCOUNTBOOK_GOAL CASCADE CONSTRAINTS;
DROP TABLE ACCOUNTBOOK_WRITING CASCADE CONSTRAINTS;
DROP TABLE ACCOUNT_TAG CASCADE CONSTRAINTS;
DROP TABLE VOTE_ITEMS CASCADE CONSTRAINTS;
DROP TABLE BAND_CALENDAR CASCADE CONSTRAINTS;
DROP TABLE BAND_CHULCHECK CASCADE CONSTRAINTS;
DROP TABLE JOIN_ITEMS CASCADE CONSTRAINTS;
DROP TABLE BAND_JOIN CASCADE CONSTRAINTS;
DROP TABLE NBBANG_ITEMS CASCADE CONSTRAINTS;
DROP TABLE BAND_NBBANG CASCADE CONSTRAINTS;
DROP TABLE BAND_TABLE_FILE CASCADE CONSTRAINTS;
DROP TABLE TODO_ITEMS CASCADE CONSTRAINTS;
DROP TABLE BAND_TODO CASCADE CONSTRAINTS;
DROP TABLE BAND_VOTE CASCADE CONSTRAINTS;
DROP TABLE WRITE_CONTENTS CASCADE CONSTRAINTS;
DROP TABLE BAND_WRITE CASCADE CONSTRAINTS;
DROP TABLE BAND CASCADE CONSTRAINTS;
DROP TABLE blog_board_likes CASCADE CONSTRAINTS;
DROP TABLE blog_eachneighbor CASCADE CONSTRAINTS;
DROP TABLE blog_boards_comments CASCADE CONSTRAINTS;
DROP TABLE blog_hashtags CASCADE CONSTRAINTS;
DROP TABLE blog_boards CASCADE CONSTRAINTS;
DROP TABLE blog_category CASCADE CONSTRAINTS;
DROP TABLE blog_subcategory CASCADE CONSTRAINTS;
DROP TABLE BLOG CASCADE CONSTRAINTS;
DROP TABLE blog_neighborhood CASCADE CONSTRAINTS;
DROP TABLE carts CASCADE CONSTRAINTS;
DROP TABLE orders CASCADE CONSTRAINTS;
DROP TABLE episodes CASCADE CONSTRAINTS;
DROP TABLE likes CASCADE CONSTRAINTS;
DROP TABLE review_reputations CASCADE CONSTRAINTS;
DROP TABLE reviews CASCADE CONSTRAINTS;
DROP TABLE vods CASCADE CONSTRAINTS;
DROP TABLE categories CASCADE CONSTRAINTS;
DROP TABLE JISIKIN_COMMENT CASCADE CONSTRAINTS;
DROP TABLE JISIKIN_ANSWER CASCADE CONSTRAINTS;
DROP TABLE JISIKIN_TAG CASCADE CONSTRAINTS;
DROP TABLE JISIKIN CASCADE CONSTRAINTS;
DROP TABLE tv_comment_likes CASCADE CONSTRAINTS;
DROP TABLE tv_comments CASCADE CONSTRAINTS;
DROP TABLE tv_history CASCADE CONSTRAINTS;
DROP TABLE tv_later CASCADE CONSTRAINTS;
DROP TABLE tv_likes CASCADE CONSTRAINTS;
DROP TABLE TV CASCADE CONSTRAINTS;
DROP TABLE tv_gudoc CASCADE CONSTRAINTS;
DROP TABLE tv_playlist CASCADE CONSTRAINTS;
DROP TABLE tv_channel CASCADE CONSTRAINTS;
DROP TABLE USERS CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE ACCOUNTBOOK_CATEGORY
(
	CATEGORY_NO number(5,0) NOT NULL,
	CATEGORY_NAME varchar2(30) NOT NULL,
	CATEGORY_SORT_NO number(5,0) NOT NULL,
	PRIMARY KEY (CATEGORY_NO)
);


CREATE TABLE ACCOUNTBOOK_COMMENTS
(
	COMMENTS_CREATE_DATE date DEFAULT SYSDATE,
	COMMENTS_CONTENTX varchar2(100000000) NOT NULL,
	COMMENTS_NO number(10,0) NOT NULL,
	USER_ID varchar2(50) NOT NULL,
	WRITING_NO number(10,0) NOT NULL,
	PRIMARY KEY (COMMENTS_NO)
);


CREATE TABLE ACCOUNTBOOK_EXPENSE
(
	-- 현금 지출(금액)
	-- 
	-- 
	EXPENSE_CASH number(10,0) NOT NULL,
	-- 카드지출(금액)
	EXPENSE_CARD number(10,0) NOT NULL,
	EXPENSE_NO number(7,0) NOT NULL,
	-- 지출내역
	-- 
	EXPENSE_DETAIL varchar2(20),
	EXPENSE_DATE date NOT NULL,
	EXPENSE_REMAIN_AMOUNT number(10,0) NOT NULL,
	CATEGORY_NO number(5,0) NOT NULL,
	-- 메모
	EXPENSE_MEMO varchar2(1000),
	USER_ID varchar2(50) NOT NULL,
	PRIMARY KEY (EXPENSE_NO)
);


CREATE TABLE ACCOUNTBOOK_GOAL
(
	GOAL_NO number(3,0) NOT NULL,
	GOAL_PURPOSE varchar2(30) NOT NULL,
	-- 목표하는금액
	-- 
	GOAL_AMOUNT number(10,0) NOT NULL,
	GOAL_START_PERIOD date NOT NULL,
	GOAL_END_PERIOD date NOT NULL,
	-- 다짐
	GOAL_PROMISE varchar2(100000) NOT NULL,
	GOAL_CREATE_DATE date DEFAULT SYSDATE,
	USER_ID varchar2(50) NOT NULL,
	PRIMARY KEY (GOAL_NO)
);


CREATE TABLE ACCOUNTBOOK_INCOME
(
	-- 수입 
	-- 
	INCOME_MEMO varchar2(1000),
	-- 금액
	-- 
	INCOME_AMOUNT number(10,0) NOT NULL,
	INCOME_NO number(10,0) NOT NULL,
	INCOME_DATE date NOT NULL,
	-- 수입내역
	-- 
	INCOME_DETAILS varchar2(20),
	INCOME_REMAIN_AMOUNT number(10,0) NOT NULL,
	CATEGORY_NO number(5,0) NOT NULL,
	USER_ID varchar2(50) NOT NULL,
	PRIMARY KEY (INCOME_NO)
);


CREATE TABLE ACCOUNTBOOK_WRITING
(
	WRITING_NO number(10,0) NOT NULL,
	WRITING_TITLE varchar2(100) NOT NULL,
	WRITING_WRITER varchar2(20) NOT NULL,
	WRITING_CONTENTS varchar2(10000) NOT NULL,
	WRITING_PUBLIC char(1) NOT NULL,
	WRITING_CREATE_DATE date DEFAULT SYSDATE,
	USER_ID varchar2(50) NOT NULL,
	PRIMARY KEY (WRITING_NO)
);


CREATE TABLE ACCOUNT_TAG
(
	TAG_NO number(19,0) NOT NULL,
	TAG_NAME varchar2(30) NOT NULL,
	PRIMARY KEY (TAG_NO)
);


CREATE TABLE ACOUNTBOOK_BUDGET
(
	BUDGET_AMOUNT number(10,0) NOT NULL,
	BUDGET_START_DATE date NOT NULL,
	BUDGET_END_DATE date NOT NULL,
	BUDGET_NO number(10,0) NOT NULL,
	CATEGORY_NO number(5,0) NOT NULL,
	USER_ID varchar2(50) NOT NULL,
	PRIMARY KEY (BUDGET_NO)
);


CREATE TABLE BAND
(
	band_no number(5,0) NOT NULL UNIQUE,
	band_name varchar2(100) NOT NULL,
	band_photo varchar2(100) NOT NULL,
	band_secret_yn char(1) DEFAULT 'N' NOT NULL,
	-- 밴드의 이름은 오픈되지만 게시물은 멤버만 공개
	band_name_open_yn char(1) DEFAULT 'N' NOT NULL,
	-- 밴드 이름만 공개시 사용할 컬럼
	band_join_apply_yn char(1) DEFAULT 'Y' NOT NULL,
	band_open_yn char(1) DEFAULT 'Y' NOT NULL,
	band_create_date date DEFAULT sysdate NOT NULL,
	USER_ID varchar2(50) NOT NULL,
	PRIMARY KEY (band_no)
);


CREATE TABLE BAND_CALENDAR
(
	cal_no number(5,0) NOT NULL,
	cal_title varchar2(100) NOT NULL,
	cal_contents varchar2(1000) NOT NULL,
	start_date date NOT NULL,
	end_date date,
	lunar_yn char(1) DEFAULT 'N',
	allday_yn char(1) DEFAULT 'N',
	contents_no number(5,0) NOT NULL,
	PRIMARY KEY (cal_no)
);


CREATE TABLE BAND_CHULCHECK
(
	chul_no number(5,0) NOT NULL,
	chul_title varchar2(100) NOT NULL,
	-- name 이름차순
	-- chul 출석멤버수
	chul_sort varchar2(100) DEFAULT 'name',
	contents_no number(5,0) NOT NULL,
	PRIMARY KEY (chul_no)
);


CREATE TABLE BAND_JOIN
(
	join_no number(5,0) NOT NULL,
	join_title varchar2(100) NOT NULL,
	out_member_yn char(1) DEFAULT 'N' NOT NULL,
	join_date date,
	end_date_yn char(1) DEFAULT 'N' NOT NULL,
	end_date date,
	contents_no number(5,0) NOT NULL,
	PRIMARY KEY (join_no)
);


CREATE TABLE BAND_NBBANG
(
	nbb_no number(5,0) NOT NULL,
	price number(7,0) NOT NULL,
	contents_no number(5,0) NOT NULL,
	PRIMARY KEY (nbb_no)
);


CREATE TABLE BAND_TABLE_FILE
(
	file_no number(5,0) NOT NULL,
	-- file : 파일
	-- photo : 사진
	-- video : 동영상
	-- 
	file_type varchar2(30) NOT NULL,
	file_name varchar2(100) NOT NULL,
	contents_no number(5,0) NOT NULL,
	PRIMARY KEY (file_no)
);


CREATE TABLE BAND_TODO
(
	todo_no number(5,0) NOT NULL,
	todo_title varchar2(50) NOT NULL,
	todo_end_date_yn char(1) DEFAULT 'N' NOT NULL,
	todo_end_date date,
	todo_create_date date DEFAULT sysdate NOT NULL,
	contents_no number(5,0) NOT NULL,
	PRIMARY KEY (todo_no)
);


CREATE TABLE BAND_VOTE
(
	vote_no number(5,0) NOT NULL,
	vote_title varchar2(100) NOT NULL,
	vote_everyone_add char(1) DEFAULT 'N' NOT NULL,
	vote_anonymous char(1) DEFAULT 'N' NOT NULL,
	vote_end_date_yn char(1) DEFAULT 'N' NOT NULL,
	vote_end_date date,
	vate_multiple_yn char(1) DEFAULT 'N' NOT NULL,
	vote_multiple_count number(2,0),
	vote_current_view varchar2(30) DEFAULT 'always' NOT NULL,
	vote_solt varchar2(30) DEFAULT 'voteNum' NOT NULL,
	contents_no number(5,0) NOT NULL,
	PRIMARY KEY (vote_no)
);


CREATE TABLE BAND_WRITE
(
	write_no number(5,0) NOT NULL,
	band_no number(5,0) NOT NULL UNIQUE,
	write_contents varchar2(1000) NOT NULL,
	write_create_date date DEFAULT sysdate NOT NULL,
	write_notice_yn char(1) DEFAULT 'N' NOT NULL,
	write_reservation_time_yn char(1) DEFAULT 'N',
	write_reservation_time date,
	write_del_yn char(1) DEFAULT 'N' NOT NULL,
	USER_ID varchar2(50) NOT NULL,
	PRIMARY KEY (write_no)
);


CREATE TABLE BLOG
(
	-- 블로그
	blog_no number(5,0) NOT NULL,
	-- 블로그
	blog_title varchar2(50) NOT NULL,
	blog_main_img varchar2(100),
	blog_theme varchar2(100),
	blog_description varchar2(500),
	blog_create_date date DEFAULT SYSDATE,
	USER_ID varchar2(50) NOT NULL,
	PRIMARY KEY (blog_no)
);


CREATE TABLE blog_boards
(
	board_no number(5,0) NOT NULL,
	board_title varchar2(30),
	board_contents varchar2(1000),
	board_create_date date DEFAULT SYSDATE,
	category_no number(5,0) NOT NULL,
	PRIMARY KEY (board_no)
);


CREATE TABLE blog_boards_comments
(
	comments_no number(7,0) NOT NULL,
	comments_contents varchar2(200),
	comments_likes number(7,0),
	board_no number(5,0) NOT NULL,
	comments_create_date date DEFAULT SYSDATE,
	PRIMARY KEY (comments_no)
);


CREATE TABLE blog_board_likes
(
	likes_no number(5,0) NOT NULL,
	board_no number(5,0) NOT NULL,
	-- 블로그
	blog_no number(5,0) NOT NULL,
	PRIMARY KEY (likes_no)
);


CREATE TABLE blog_category
(
	category_no number(5,0) NOT NULL,
	category_title varchar2(30),
	category_showtype varchar2(30),
	category_orders varchar2(300),
	category_visibility char DEFAULT 'A',
	subcategory_no number(5,0) NOT NULL,
	PRIMARY KEY (category_no)
);


CREATE TABLE blog_eachneighbor
(
	-- 
	-- 
	neighborhood_no number(5,0) NOT NULL,
	-- 블로그
	blog_no number(5,0) NOT NULL
);


CREATE TABLE blog_hashtags
(
	hashtags_no number(7,0) NOT NULL,
	hashtag_name varchar2(50),
	board_no number(5,0) NOT NULL,
	hashtag_create_date date,
	PRIMARY KEY (hashtags_no)
);


CREATE TABLE blog_neighborhood
(
	-- 
	-- 
	neighborhood_no number(5,0) NOT NULL,
	neighborhood_create_date date DEFAULT SYSDATE,
	PRIMARY KEY (neighborhood_no)
);


CREATE TABLE blog_subcategory
(
	subcategory_no number(5,0) NOT NULL,
	subcategory_title varchar2(30),
	subcategory_visibility varchar2(10),
	subcategory_create_date date DEFAULT SYSDATE,
	-- 블로그
	blog_no number(5,0) NOT NULL,
	PRIMARY KEY (subcategory_no)
);


CREATE TABLE carts
(
	cart_no number(3,0) NOT NULL,
	episode_no number(4,0) NOT NULL,
	USER_ID varchar2(50) NOT NULL,
	PRIMARY KEY (cart_no)
);


CREATE TABLE categories
(
	category_no number(2,0) NOT NULL,
	category_name varchar2(50),
	PRIMARY KEY (category_no)
);


CREATE TABLE episodes
(
	episode_no number(4,0) NOT NULL,
	vod_no number(7,0) NOT NULL,
	episode_title varchar2(10),
	episode_date date,
	episode_summary varchar2(1000),
	PRIMARY KEY (episode_no)
);


CREATE TABLE EXPENSE_TAG
(
	TAG_NO number(19,0) NOT NULL,
	EXPENSE_NO number(7,0) NOT NULL
);


CREATE TABLE GOAL_TAG
(
	TAG_NO number(19,0) NOT NULL,
	GOAL_NO number(3,0) NOT NULL
);


CREATE TABLE INCOME_TAG
(
	TAG_NO number(19,0) NOT NULL,
	INCOME_NO number(10,0) NOT NULL
);


CREATE TABLE JISIKIN
(
	JISIKIN_NO number(5,0) NOT NULL,
	JISIKIN_TITLE varchar2(200) NOT NULL,
	JISIKIN_CONTENT varchar2(4000) NOT NULL,
	JISIKIN_CATEGORY varchar2(20) NOT NULL,
	JISIKIN_WRITER varchar2(50) NOT NULL,
	JISIKIN_DEADLINE_YN char(1) DEFAULT 'N',
	JISIKIN_SECRET_YN char(1),
	JISIKIN_CREATE_DATE date DEFAULT SYSDATE NOT NULL,
	USER_ID varchar2(50) NOT NULL,
	JISIKIN_METAL_POINT number(4,0),
	PRIMARY KEY (JISIKIN_NO)
);


CREATE TABLE JISIKIN_ANSWER
(
	ANSWER_NO number(4,0) NOT NULL,
	ANSWER_WRITER varchar2(50) NOT NULL,
	ANSWER_CREATE_DATE date DEFAULT SYSDATE,
	ANSWER_SELECTED_YN char(1) DEFAULT 'N',
	ANSWER_SECRET_YN char(1),
	JISIKIN_NO number(5,0) NOT NULL,
	ANSWER_RECOMMEND number(4,0),
	USER_ID varchar2(50) NOT NULL,
	PRIMARY KEY (ANSWER_NO)
);


CREATE TABLE JISIKIN_COMMENT
(
	COMMENT_NO number(3,0) NOT NULL,
	COMMENT_WRITER varchar2(50) NOT NULL,
	COMMENT_CONTENTS varchar2(1000),
	COMMENT_CREATE_DATE date DEFAULT SYSDATE,
	ANSWER_NO number(4,0) NOT NULL,
	PRIMARY KEY (COMMENT_NO)
);


CREATE TABLE JISIKIN_TAG
(
	TAG_NO number(4,0) NOT NULL,
	TAG_NAME varchar2(20) NOT NULL,
	JISIKIN_NO number(5,0) NOT NULL,
	PRIMARY KEY (TAG_NO)
);


CREATE TABLE JOIN_ITEMS
(
	join_item_no number(5,0) NOT NULL,
	join_no number(5,0) NOT NULL,
	limit_person number(5,0),
	join_count number(5,0) NOT NULL,
	start_time date,
	end_time date,
	PRIMARY KEY (join_item_no)
);


CREATE TABLE likes
(
	like_no number(7,0) NOT NULL,
	vod_no number(7,0) NOT NULL,
	USER_ID varchar2(50) NOT NULL,
	PRIMARY KEY (like_no)
);


CREATE TABLE NBBANG_ITEMS
(
	item_no number(4,0) NOT NULL,
	item_person varchar2(100) NOT NULL,
	nbb_no number(5,0) NOT NULL,
	PRIMARY KEY (item_no)
);


CREATE TABLE orders
(
	order_no number(4,0) NOT NULL,
	episode_no number(4,0) NOT NULL,
	USER_ID varchar2(50) NOT NULL,
	PRIMARY KEY (order_no)
);


CREATE TABLE reviews
(
	review_no number(7,0) NOT NULL,
	review_contents varchar2(300) NOT NULL,
	review_create_date date DEFAULT SYSDATE,
	vod_no number(7,0) NOT NULL,
	USER_ID varchar2(50) NOT NULL,
	PRIMARY KEY (review_no)
);


CREATE TABLE review_reputations
(
	reputation_no number(5,0) NOT NULL,
	review_no number(7,0) NOT NULL,
	reputations_like number(4,0) DEFAULT 0 NOT NULL,
	reputations_dislike number(4,0) DEFAULT 0 NOT NULL,
	USER_ID varchar2(50) NOT NULL,
	PRIMARY KEY (reputation_no)
);


CREATE TABLE TODO_ITEMS
(
	todo_item_no number(4,0) NOT NULL,
	todo_no number(5,0) NOT NULL,
	todo_contents varchar2(500) NOT NULL,
	complet_yn char(1) DEFAULT 'N' NOT NULL,
	PRIMARY KEY (todo_item_no)
);


CREATE TABLE TV
(
	tv_no number(5,0) NOT NULL,
	tv_title varchar2(300) NOT NULL,
	tv_contents varchar2(2000),
	tv_views number(9),
	tv_videoname varchar2(300) NOT NULL,
	tv_playlist varchar2(100) NOT NULL,
	create_date date NOT NULL,
	playlist_no number(5,0) NOT NULL,
	PRIMARY KEY (tv_no)
);


CREATE TABLE tv_channel
(
	channel_no number(5,0) NOT NULL,
	channel_title varchar2(100) NOT NULL,
	channel_banner varchar2(300),
	USER_ID varchar2(50) NOT NULL,
	PRIMARY KEY (channel_no)
);


CREATE TABLE tv_comments
(
	comment_no number(5,0) NOT NULL,
	tv_no number(5,0) NOT NULL,
	comment_contents varchar2(600) NOT NULL,
	comment_create_date date NOT NULL,
	USER_ID varchar2(50) NOT NULL,
	PRIMARY KEY (comment_no)
);


CREATE TABLE tv_comment_likes
(
	comment_like_no number(5,0) NOT NULL,
	commnet_status char,
	comment_no number(5,0) NOT NULL,
	USER_ID varchar2(50) NOT NULL,
	PRIMARY KEY (comment_like_no)
);


CREATE TABLE tv_gudoc
(
	gudoc_no number(5,0) NOT NULL,
	channel_no number(5,0) NOT NULL,
	create_date date DEFAULT SYSDATE NOT NULL,
	PRIMARY KEY (gudoc_no)
);


CREATE TABLE tv_history
(
	history_no number(5,0) NOT NULL,
	tv_no number(5,0) NOT NULL,
	history_playtime number(5,0),
	USER_ID varchar2(50) NOT NULL,
	PRIMARY KEY (history_no)
);


CREATE TABLE tv_later
(
	later_no number(5,0) NOT NULL,
	tv_no number(5,0) NOT NULL,
	create_date date NOT NULL,
	USER_ID varchar2(50) NOT NULL,
	PRIMARY KEY (later_no)
);


CREATE TABLE tv_likes
(
	like_no number(5,0) NOT NULL,
	tv_no number(5,0) NOT NULL,
	create_date date NOT NULL,
	USER_ID varchar2(50) NOT NULL,
	PRIMARY KEY (like_no)
);


CREATE TABLE tv_playlist
(
	playlist_no number(5,0) NOT NULL,
	channel_no number(5,0) NOT NULL,
	playlist_title varchar2(300) NOT NULL,
	PRIMARY KEY (playlist_no)
);


CREATE TABLE USERS
(
	USER_ID varchar2(50) NOT NULL,
	USER_NAME varchar2(20) NOT NULL,
<<<<<<< HEAD
	USER_PASSWORD varchar2(40) NOT NULL,
=======
	USER_PASSWORD char(40) NOT NULL,
>>>>>>> refs/heads/BM
	USER_NICKNAME varchar2(100),
	USER_PHONE varchar2(20) NOT NULL,
	USER_POINT number(7,0) DEFAULT 0 NOT NULL,
	USER_MENTAL_POINT number(4,0),
	PRIMARY KEY (USER_ID)
);


CREATE TABLE vods
(
	vod_no number(7,0) NOT NULL,
	category_no number(2,0) NOT NULL,
	vod_img varchar2(50),
	vod_country varchar2(30),
	vod_running_time number(3,0),
	vod_air_start_date date,
	vod_air_finish_date date,
	vod_grade varchar2(18),
	vod_create_nation varchar2(30),
	vod_leading_actor varchar2(200),
	vod_director varchar2(60),
	vod_description varchar2(1000),
	vod_title varchar2(100),
	vod_price number(5,0),
	vod_create_date date DEFAULT SYSDATE,
	PRIMARY KEY (vod_no)
);


CREATE TABLE VOTE_ITEMS
(
	vote_item_no number(4,0) NOT NULL,
	vote_no number(5,0) NOT NULL,
	vote_contents varchar2(100) NOT NULL,
	vote_count number(5,0) DEFAULT 0 NOT NULL,
	cal_no number(5,0) NOT NULL,
	PRIMARY KEY (vote_item_no)
);


CREATE TABLE WRITE_CONTENTS
(
	contents_no number(5,0) NOT NULL,
	write_no number(5,0) NOT NULL,
	contents_contents varchar2(1000) NOT NULL,
	row_num number(4,0) NOT NULL,
	contents_typs varchar2(100) NOT NULL,
	PRIMARY KEY (contents_no)
);



/* Create Foreign Keys */

ALTER TABLE ACCOUNTBOOK_EXPENSE
	ADD FOREIGN KEY (CATEGORY_NO)
	REFERENCES ACCOUNTBOOK_CATEGORY (CATEGORY_NO)
;


ALTER TABLE ACCOUNTBOOK_INCOME
	ADD FOREIGN KEY (CATEGORY_NO)
	REFERENCES ACCOUNTBOOK_CATEGORY (CATEGORY_NO)
;


ALTER TABLE ACOUNTBOOK_BUDGET
	ADD FOREIGN KEY (CATEGORY_NO)
	REFERENCES ACCOUNTBOOK_CATEGORY (CATEGORY_NO)
;


ALTER TABLE EXPENSE_TAG
	ADD FOREIGN KEY (EXPENSE_NO)
	REFERENCES ACCOUNTBOOK_EXPENSE (EXPENSE_NO)
;


ALTER TABLE GOAL_TAG
	ADD FOREIGN KEY (GOAL_NO)
	REFERENCES ACCOUNTBOOK_GOAL (GOAL_NO)
;


ALTER TABLE INCOME_TAG
	ADD FOREIGN KEY (INCOME_NO)
	REFERENCES ACCOUNTBOOK_INCOME (INCOME_NO)
;


ALTER TABLE ACCOUNTBOOK_COMMENTS
	ADD FOREIGN KEY (WRITING_NO)
	REFERENCES ACCOUNTBOOK_WRITING (WRITING_NO)
;


ALTER TABLE EXPENSE_TAG
	ADD FOREIGN KEY (TAG_NO)
	REFERENCES ACCOUNT_TAG (TAG_NO)
;


ALTER TABLE GOAL_TAG
	ADD FOREIGN KEY (TAG_NO)
	REFERENCES ACCOUNT_TAG (TAG_NO)
;


ALTER TABLE INCOME_TAG
	ADD FOREIGN KEY (TAG_NO)
	REFERENCES ACCOUNT_TAG (TAG_NO)
;


ALTER TABLE BAND_WRITE
	ADD FOREIGN KEY (band_no)
	REFERENCES BAND (band_no)
;


ALTER TABLE VOTE_ITEMS
	ADD FOREIGN KEY (cal_no)
	REFERENCES BAND_CALENDAR (cal_no)
;


ALTER TABLE JOIN_ITEMS
	ADD FOREIGN KEY (join_no)
	REFERENCES BAND_JOIN (join_no)
;


ALTER TABLE NBBANG_ITEMS
	ADD FOREIGN KEY (nbb_no)
	REFERENCES BAND_NBBANG (nbb_no)
;


ALTER TABLE TODO_ITEMS
	ADD FOREIGN KEY (todo_no)
	REFERENCES BAND_TODO (todo_no)
;


ALTER TABLE VOTE_ITEMS
	ADD FOREIGN KEY (vote_no)
	REFERENCES BAND_VOTE (vote_no)
;


ALTER TABLE WRITE_CONTENTS
	ADD FOREIGN KEY (write_no)
	REFERENCES BAND_WRITE (write_no)
;


ALTER TABLE blog_board_likes
	ADD FOREIGN KEY (blog_no)
	REFERENCES BLOG (blog_no)
;


ALTER TABLE blog_eachneighbor
	ADD FOREIGN KEY (blog_no)
	REFERENCES BLOG (blog_no)
;


ALTER TABLE blog_subcategory
	ADD FOREIGN KEY (blog_no)
	REFERENCES BLOG (blog_no)
;


ALTER TABLE blog_boards_comments
	ADD FOREIGN KEY (board_no)
	REFERENCES blog_boards (board_no)
;


ALTER TABLE blog_board_likes
	ADD FOREIGN KEY (board_no)
	REFERENCES blog_boards (board_no)
;


ALTER TABLE blog_hashtags
	ADD FOREIGN KEY (board_no)
	REFERENCES blog_boards (board_no)
;


ALTER TABLE blog_boards
	ADD FOREIGN KEY (category_no)
	REFERENCES blog_category (category_no)
;


ALTER TABLE blog_eachneighbor
	ADD FOREIGN KEY (neighborhood_no)
	REFERENCES blog_neighborhood (neighborhood_no)
;


ALTER TABLE blog_category
	ADD FOREIGN KEY (subcategory_no)
	REFERENCES blog_subcategory (subcategory_no)
;


ALTER TABLE vods
	ADD FOREIGN KEY (category_no)
	REFERENCES categories (category_no)
;


ALTER TABLE carts
	ADD FOREIGN KEY (episode_no)
	REFERENCES episodes (episode_no)
;


ALTER TABLE orders
	ADD FOREIGN KEY (episode_no)
	REFERENCES episodes (episode_no)
;


ALTER TABLE JISIKIN_ANSWER
	ADD FOREIGN KEY (JISIKIN_NO)
	REFERENCES JISIKIN (JISIKIN_NO)
;


ALTER TABLE JISIKIN_TAG
	ADD FOREIGN KEY (JISIKIN_NO)
	REFERENCES JISIKIN (JISIKIN_NO)
;


ALTER TABLE JISIKIN_COMMENT
	ADD FOREIGN KEY (ANSWER_NO)
	REFERENCES JISIKIN_ANSWER (ANSWER_NO)
;


ALTER TABLE review_reputations
	ADD FOREIGN KEY (review_no)
	REFERENCES reviews (review_no)
;


ALTER TABLE tv_comments
	ADD FOREIGN KEY (tv_no)
	REFERENCES TV (tv_no)
;


ALTER TABLE tv_history
	ADD FOREIGN KEY (tv_no)
	REFERENCES TV (tv_no)
;


ALTER TABLE tv_later
	ADD FOREIGN KEY (tv_no)
	REFERENCES TV (tv_no)
;


ALTER TABLE tv_likes
	ADD FOREIGN KEY (tv_no)
	REFERENCES TV (tv_no)
;


ALTER TABLE tv_gudoc
	ADD FOREIGN KEY (channel_no)
	REFERENCES tv_channel (channel_no)
;


ALTER TABLE tv_playlist
	ADD FOREIGN KEY (channel_no)
	REFERENCES tv_channel (channel_no)
;


ALTER TABLE tv_comment_likes
	ADD FOREIGN KEY (comment_no)
	REFERENCES tv_comments (comment_no)
;


ALTER TABLE TV
	ADD FOREIGN KEY (playlist_no)
	REFERENCES tv_playlist (playlist_no)
;


ALTER TABLE ACCOUNTBOOK_COMMENTS
	ADD FOREIGN KEY (USER_ID)
	REFERENCES USERS (USER_ID)
;


ALTER TABLE ACCOUNTBOOK_EXPENSE
	ADD FOREIGN KEY (USER_ID)
	REFERENCES USERS (USER_ID)
;


ALTER TABLE ACCOUNTBOOK_GOAL
	ADD FOREIGN KEY (USER_ID)
	REFERENCES USERS (USER_ID)
;


ALTER TABLE ACCOUNTBOOK_INCOME
	ADD FOREIGN KEY (USER_ID)
	REFERENCES USERS (USER_ID)
;


ALTER TABLE ACCOUNTBOOK_WRITING
	ADD FOREIGN KEY (USER_ID)
	REFERENCES USERS (USER_ID)
;


ALTER TABLE ACOUNTBOOK_BUDGET
	ADD FOREIGN KEY (USER_ID)
	REFERENCES USERS (USER_ID)
;


ALTER TABLE BAND
	ADD FOREIGN KEY (USER_ID)
	REFERENCES USERS (USER_ID)
;


ALTER TABLE BAND_WRITE
	ADD FOREIGN KEY (USER_ID)
	REFERENCES USERS (USER_ID)
;


ALTER TABLE BLOG
	ADD FOREIGN KEY (USER_ID)
	REFERENCES USERS (USER_ID)
;


ALTER TABLE carts
	ADD FOREIGN KEY (USER_ID)
	REFERENCES USERS (USER_ID)
;


ALTER TABLE JISIKIN
	ADD FOREIGN KEY (USER_ID)
	REFERENCES USERS (USER_ID)
;


ALTER TABLE JISIKIN_ANSWER
	ADD FOREIGN KEY (USER_ID)
	REFERENCES USERS (USER_ID)
;


ALTER TABLE likes
	ADD FOREIGN KEY (USER_ID)
	REFERENCES USERS (USER_ID)
;


ALTER TABLE orders
	ADD FOREIGN KEY (USER_ID)
	REFERENCES USERS (USER_ID)
;


ALTER TABLE reviews
	ADD FOREIGN KEY (USER_ID)
	REFERENCES USERS (USER_ID)
;


ALTER TABLE review_reputations
	ADD FOREIGN KEY (USER_ID)
	REFERENCES USERS (USER_ID)
;


ALTER TABLE tv_channel
	ADD FOREIGN KEY (USER_ID)
	REFERENCES USERS (USER_ID)
;


ALTER TABLE tv_comments
	ADD FOREIGN KEY (USER_ID)
	REFERENCES USERS (USER_ID)
;


ALTER TABLE tv_comment_likes
	ADD FOREIGN KEY (USER_ID)
	REFERENCES USERS (USER_ID)
;


ALTER TABLE tv_history
	ADD FOREIGN KEY (USER_ID)
	REFERENCES USERS (USER_ID)
;


ALTER TABLE tv_later
	ADD FOREIGN KEY (USER_ID)
	REFERENCES USERS (USER_ID)
;


ALTER TABLE tv_likes
	ADD FOREIGN KEY (USER_ID)
	REFERENCES USERS (USER_ID)
;


ALTER TABLE episodes
	ADD FOREIGN KEY (vod_no)
	REFERENCES vods (vod_no)
;


ALTER TABLE likes
	ADD FOREIGN KEY (vod_no)
	REFERENCES vods (vod_no)
;


ALTER TABLE reviews
	ADD FOREIGN KEY (vod_no)
	REFERENCES vods (vod_no)
;


ALTER TABLE BAND_CALENDAR
	ADD FOREIGN KEY (contents_no)
	REFERENCES WRITE_CONTENTS (contents_no)
;


ALTER TABLE BAND_CHULCHECK
	ADD FOREIGN KEY (contents_no)
	REFERENCES WRITE_CONTENTS (contents_no)
;


ALTER TABLE BAND_JOIN
	ADD FOREIGN KEY (contents_no)
	REFERENCES WRITE_CONTENTS (contents_no)
;


ALTER TABLE BAND_NBBANG
	ADD FOREIGN KEY (contents_no)
	REFERENCES WRITE_CONTENTS (contents_no)
;


ALTER TABLE BAND_TABLE_FILE
	ADD FOREIGN KEY (contents_no)
	REFERENCES WRITE_CONTENTS (contents_no)
;


ALTER TABLE BAND_TODO
	ADD FOREIGN KEY (contents_no)
	REFERENCES WRITE_CONTENTS (contents_no)
;


ALTER TABLE BAND_VOTE
	ADD FOREIGN KEY (contents_no)
	REFERENCES WRITE_CONTENTS (contents_no)
;



/* Comments */

COMMENT ON COLUMN ACCOUNTBOOK_EXPENSE.EXPENSE_CASH IS '현금 지출(금액)

';
COMMENT ON COLUMN ACCOUNTBOOK_EXPENSE.EXPENSE_CARD IS '카드지출(금액)';
COMMENT ON COLUMN ACCOUNTBOOK_EXPENSE.EXPENSE_DETAIL IS '지출내역
';
COMMENT ON COLUMN ACCOUNTBOOK_EXPENSE.EXPENSE_MEMO IS '메모';
COMMENT ON COLUMN ACCOUNTBOOK_GOAL.GOAL_AMOUNT IS '목표하는금액
';
COMMENT ON COLUMN ACCOUNTBOOK_GOAL.GOAL_PROMISE IS '다짐';
COMMENT ON COLUMN ACCOUNTBOOK_INCOME.INCOME_MEMO IS '수입 
';
COMMENT ON COLUMN ACCOUNTBOOK_INCOME.INCOME_AMOUNT IS '금액
';
COMMENT ON COLUMN ACCOUNTBOOK_INCOME.INCOME_DETAILS IS '수입내역
';
COMMENT ON COLUMN BAND.band_name_open_yn IS '밴드의 이름은 오픈되지만 게시물은 멤버만 공개';
COMMENT ON COLUMN BAND.band_join_apply_yn IS '밴드 이름만 공개시 사용할 컬럼';
COMMENT ON COLUMN BAND_CHULCHECK.chul_sort IS 'name 이름차순
chul 출석멤버수';
COMMENT ON COLUMN BAND_TABLE_FILE.file_type IS 'file : 파일
photo : 사진
video : 동영상
';
COMMENT ON COLUMN BLOG.blog_no IS '블로그';
COMMENT ON COLUMN BLOG.blog_title IS '블로그';
COMMENT ON COLUMN blog_board_likes.blog_no IS '블로그';
COMMENT ON COLUMN blog_eachneighbor.neighborhood_no IS '
';
COMMENT ON COLUMN blog_eachneighbor.blog_no IS '블로그';
COMMENT ON COLUMN blog_neighborhood.neighborhood_no IS '
';
COMMENT ON COLUMN blog_subcategory.blog_no IS '블로그';



