CREATE TABLE `Member` (
	`id`	varchar(30)	primary key,
	`name`	varchar(30)	NOT NULL,
	`profile`	varchar(50)	NOT NULL,
	`pass`	varchar(30)	NOT NULL,
	`hp`	varchar(50)	NOT NULL,
	`email`	varchar(100)	NOT NULL,
	`age`	varchar(50)	NOT NULL,
	`gender`	varchar(20)	NOT NULL,
	`area`	varchar(50)	NOT NULL,
	`mbti`	varchar(20)	NOT NULL,
	`register_day`	date	NOT NULL
);

drop table Member;
CREATE TABLE `TourReview` (
	`com_seq`	int	auto_increment primary key,
	`tour_seq`	int	NOT NULL,
	`id`	varchar(30)	NOT NULL,
	`photo`	varchar(100)	NULL,
	`title`	varchar(50)	NOT NULL,
	`writeday`	date	NOT NULL,
	`viewcount`	int	NOT NULL,
	`likes`	int	NOT NULL,
	`content`	varchar(1000)	NOT NULL,
	`stars`	smallint	NOT NULL,
    FULLTEXT(id, photo, title, content)
);

CREATE TABLE `MyCourse` (
	`seq`	int	auto_increment primary key,
	`id`	varchar(30)	NOT NULL,
	`tour_seq`	int	NOT NULL,
	`name`	varchar(30)	NOT NULL,
	`day`	int	NOT NULL,
	`turn`	int	NOT NULL,
	`intro`	varchar(10000)	NULL,
	`mainphoto`	varchar(50)	NULL,
    FULLTEXT(id, name, intro, mainphoto),
    FOREIGN KEY (id) REFERENCES Member(id) ON DELETE CASCADE,
	FOREIGN KEY (tour_seq) REFERENCES TourSpot(seq) ON UPDATE CASCADE
);

CREATE TABLE `TourSpot` (
	`seq`	int	primary key,
	`name`	varchar(30)	NOT NULL,
	`hp`	varchar(50)	NOT NULL,
	`addr`	varchar(200)	NOT NULL,
	`photo`	varchar(100)	NOT NULL,
	`intro`	varchar(10000)	NOT NULL,
	`area`	varchar(100)	NOT NULL,
	`theme`	varchar(100)	NOT NULL,
	`main_cat`	varchar(100)	NOT NULL,
	`sub_cat`	varchar(100)	NOT NULL,
	`note`	varchar(1000)	NULL,
	`price`	int	NULL,
	`writeday`	date	NOT NULL,
    FULLTEXT(name, hp, addr, photo, intro, area, theme, main_cat, sub_cat, note)
);
drop table TourSpot;
CREATE TABLE `RecomCourse` (
	`seq`	int auto_increment primary key, 
	`tour_seq`	int	NOT NULL,
	`name`	varchar(30)	NOT NULL,
	`day`	int	NOT NULL,
	`turn`	int	NOT NULL,
	`intro`	varchar(10000)	NULL,
	`mainphoto`	varchar(50)	NULL,
    FULLTEXT(name, intro, mainphoto),
    FOREIGN KEY (tour_seq) REFERENCES TourSpot(seq) ON UPDATE CASCADE
);

CREATE TABLE `Statistics` (
	`tour_seq`	int	NOT NULL,
	`id`	varchar(30)	NOT NULL,
	`selected_cnt`	int	NOT NULL	DEFAULT 0,
	`selected_date`	date	NOT NULL,
    FULLTEXT(id)
);

CREATE TABLE `GuestReview` (
	`com_seq`	int	auto_increment primary key,
	`tour_seq`	int	NOT NULL,
	`nickname`	varchar(50)	NULL,
	`pass`	varchar(50)	NULL,
	`photo`	varchar(100)	NULL,
	`title`	varchar(50)	NOT NULL,
	`writeday`	date	NOT NULL,
	`viewcount`	int	NOT NULL,
	`likes`	int	NOT NULL,
	`content`	varchar(1000)	NOT NULL,
	`comment`	varchar(1000)	NULL,
	`stars`	int	NOT NULL,
    FULLTEXT(nickname, photo, title, content, comment)
);

CREATE TABLE `GuestComment` (
	`com_seq`	int	NOT NULL,
	`writer`	varchar(30)	NULL,
	`pass`	varchar(50)	NULL,
	`guestcomment`	varchar(1000)	NULL,
	`writeday`	date	NULL,
    FULLTEXT(writer, guestcomment)
);

CREATE TABLE `MemberComment` (
	`com_seq`	int	NOT NULL,
	`id`	varchar(30)	NOT NULL,
	`membercomment`	varchar(500)	NULL,
	`writeday`	date	NULL,
    FULLTEXT(id, membercomment)
);

CREATE TABLE `addlist` (
	`id`	varchar(30)	NOT NULL,
	`content`	varchar(1000)	NULL,
	`writeday`	date	NULL,
    FULLTEXT(id, content)
);

CREATE TABLE `Temp` (
	`seq`	int	auto_increment primary key,
	`tour_seq`	int	NULL,
	`name`	varchar(50)	NULL,
	`intro`	varchar(10000)	NULL,
	`photo`	varchar(50)	NULL,
    FULLTEXT(name, intro, photo)
);

ALTER TABLE `Member` ADD CONSTRAINT `PK_MEMBER` PRIMARY KEY (
	`id`
);

ALTER TABLE `TourReview` ADD CONSTRAINT `PK_TOURREVIEW` PRIMARY KEY (
	`com_seq`,
	`tour_seq`,
	`id`
);

ALTER TABLE `MyCourse` ADD CONSTRAINT `PK_MYCOURSE` PRIMARY KEY (
	`seq`,
	`id`,
	`tour_seq`
);

ALTER TABLE `TourSpot` ADD CONSTRAINT `PK_TOURSPOT` PRIMARY KEY (
	`seq`
);

ALTER TABLE `RecomCourse` ADD CONSTRAINT `PK_RECOMCOURSE` PRIMARY KEY (
	`seq`,
	`tour_seq`
);

ALTER TABLE `Statistics` ADD CONSTRAINT `PK_STATISTICS` PRIMARY KEY (
	`tour_seq`,
	`id`
);

ALTER TABLE `GuestReview` ADD CONSTRAINT `PK_GUESTREVIEW` PRIMARY KEY (
	`com_seq`,
	`tour_seq`
);

ALTER TABLE `GuestComment` ADD CONSTRAINT `PK_GUESTCOMMENT` PRIMARY KEY (
	`com_seq`
);

ALTER TABLE `MemberComment` ADD CONSTRAINT `PK_MEMBERCOMMENT` PRIMARY KEY (
	`com_seq`,
	`id`
);

ALTER TABLE `addlist` ADD CONSTRAINT `PK_ADDLIST` PRIMARY KEY (
	`id`
);

ALTER TABLE `Temp` ADD CONSTRAINT `PK_TEMP` PRIMARY KEY (
	`seq`
);

ALTER TABLE `TourReview` ADD CONSTRAINT `FK_TourSpot_TO_TourReview_1` FOREIGN KEY (
	`tour_seq`
)
REFERENCES `TourSpot` (
	`seq`
);

ALTER TABLE `TourReview` ADD CONSTRAINT `FK_Member_TO_TourReview_1` FOREIGN KEY (
	`id`
)
REFERENCES `Member` (
	`id`
);

ALTER TABLE `MyCourse` ADD CONSTRAINT `FK_Member_TO_MyCourse_1` FOREIGN KEY (
	`id`
)
REFERENCES `Member` (
	`id`
);

ALTER TABLE `MyCourse` ADD CONSTRAINT `FK_TourSpot_TO_MyCourse_1` FOREIGN KEY (
	`tour_seq`
)
REFERENCES `TourSpot` (
	`seq`
);

ALTER TABLE `RecomCourse` ADD CONSTRAINT `FK_TourSpot_TO_RecomCourse_1` FOREIGN KEY (
	`tour_seq`
)
REFERENCES `TourSpot` (
	`seq`
);

ALTER TABLE `Statistics` ADD CONSTRAINT `FK_TourSpot_TO_Statistics_1` FOREIGN KEY (
	`tour_seq`
)
REFERENCES `TourSpot` (
	`seq`
);

ALTER TABLE `Statistics` ADD CONSTRAINT `FK_Member_TO_Statistics_1` FOREIGN KEY (
	`id`
)
REFERENCES `Member` (
	`id`
);

ALTER TABLE `GuestReview` ADD CONSTRAINT `FK_TourSpot_TO_GuestReview_1` FOREIGN KEY (
	`tour_seq`
)
REFERENCES `TourSpot` (
	`seq`
);

ALTER TABLE `GuestComment` ADD CONSTRAINT `FK_GuestReview_TO_GuestComment_1` FOREIGN KEY (
	`com_seq`
)
REFERENCES `GuestReview` (
	`com_seq`
);

ALTER TABLE `MemberComment` ADD CONSTRAINT `FK_TourReview_TO_MemberComment_1` FOREIGN KEY (
	`com_seq`
)
REFERENCES `TourReview` (
	`com_seq`
);

ALTER TABLE `MemberComment` ADD CONSTRAINT `FK_Member_TO_MemberComment_1` FOREIGN KEY (
	`id`
)
REFERENCES `Member` (
	`id`
);

ALTER TABLE `addlist` ADD CONSTRAINT `FK_Member_TO_addlist_1` FOREIGN KEY (
	`id`
)
REFERENCES `Member` (
	`id`
);

