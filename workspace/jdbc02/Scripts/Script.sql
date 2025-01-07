CREATE SEQUENCE seq_user2;
CREATE SEQUENCE seq_book;
CREATE SEQUENCE seq_rental;


CREATE TABLE TBL_USER2(
   user_number NUMBER,
   user_id varchar2(100) NOT NULL,
   user_pw varchar2(100) NOT NULL,
   user_name varchar2(100) NOT NULL,
   user_phone varchar2(100) UNIQUE,
   CONSTRAINT pk_user2 PRIMARY KEY(user_number)
);

CREATE TABLE TBL_BOOK(
   book_number NUMBER,
   book_title varchar2(100) NOT NULL,
   book_author varchar2(100) NOT NULL,
   CONSTRAINT pk_book PRIMARY KEY(book_number)
);

CREATE TABLE TBL_RENTAL(
   rental_number NUMBER,
   user_number NUMBER,
   book_number NUMBER,
   rental_date DATE,
   rental_day NUMBER,
   CONSTRAINT pk_rental PRIMARY KEY(rental_number),
   CONSTRAINT fk_user FOREIGN KEY(user_number) REFERENCES TBL_USER2(user_number),
   CONSTRAINT fk_book FOREIGN KEY(book_number) REFERENCES TBL_BOOK(book_number)
);

SELECT * FROM TBL_USER2;
SELECT * FROM TBL_BOOK;
SELECT * FROM TBL_RENTAL;

--DROP TABLE TBL_USER2;
--DROP TABLE tbl_book;
--DROP TABLE tbl_rental;


-- 도서 등록
INSERT INTO TBL_BOOK
--VALUES(SEQ_BOOK.NEXTVAL, '웹 표준의 정석', '고경희');


--DELETE FROM TBL_BOOK
--WHERE BOOK_NUMBER = 1;