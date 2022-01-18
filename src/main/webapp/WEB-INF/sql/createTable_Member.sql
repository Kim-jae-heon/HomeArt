USE homeart;

-- member테이블 만들기
CREATE TABLE Member(
	member_id VARCHAR(255) PRIMARY KEY,
	member_name VARCHAR(10) NOT NULL,
    password VARCHAR(20) NOT NULL,
    nickName VARCHAR(30) UNIQUE NOT NULL,
    email VARCHAR(255),
    address VARCHAR(255) NOT NULL,
    country VARCHAR(50) NOT NULL,
    inserted DATETIME NOT NULL DEFAULT NOW(),
    isAdmin INT(1) NOT NULL
);

SELECT * FROM Member ORDER BY inserted DESC;

		SELECT
            COUNT(CASE WHEN m.isAdmin=0 THEN 1 END) boardCount
		FROM
			freeBoard b 
				JOIN 
			Member m ON b.writer = m.member_id;
            
INSERT INTO Member(member_id, member_name, password, nickName, address, country, isAdmin) VALUES('zzz', 'sss', '1234', 'zz', 'seoul', 'korea', 0);
SELECT
			b.board_id,
			b.title,
			b.writer,
			b.inserted,
			b.updated,
            b.viewCount,
			m.nickName,
			m.isAdmin
		FROM
			freeBoard b 
				JOIN 
			Member m ON b.writer = m.member_id
		ORDER BY
			board_id DESC;
		
        SELECT
			b.board_id,
			b.title,
			b.content,
			b.writer,
			b.inserted,
			b.updated,
			m.nickName
		FROM
			freeBoard b 
				JOIN 
			Member m ON b.writer = m.member_id
		WHERE b.board_id = 1;
ALTER TABLE Member MODIFY COLUMN isAdmin INT(1) DEFAULT 0 NOT NULL;

SELECT
			b.board_id,
			b.title,
			b.writer,
			b.inserted,
			b.updated,
            b.viewCount,
            b.isPublic,
			m.nickName,
			m.isAdmin
		FROM
			freeBoard b 
				JOIN 
			Member m ON b.writer = m.member_id
		WHERE
			m.isAdmin = 1
		ORDER BY
			board_id DESC;
            
DELETE FROM freeBoard WHERE board_id = 63;

