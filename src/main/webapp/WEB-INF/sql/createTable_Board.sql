USE homeart;

-- board테이블 만들기
CREATE TABLE freeBoard(
	board_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
	content VARCHAR(2000) NOT NULL,
	writer VARCHAR(50) NOT NULL,
    viewCount INT DEFAULT 0 NOT NULL,
    isPublic INT(1) DEFAULT 1 NOT NULL,
	inserted DATETIME DEFAULT NOW(),
	updated DATETIME DEFAULT NOW()
);

SELECT * FROM freeBoard ORDER BY inserted DESC;
SELECT * FROM Member ORDER BY inserted DESC;

INSERT INTO freeBoard(title, content, writer, isPublic) VALUES('test30','test30','rrr',1);

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
		WHERE b.board_id = 3;

