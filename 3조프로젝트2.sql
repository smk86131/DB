--트리거
CREATE TABLE deleted업주 (
    업주번호 VARCHAR2(40) PRIMARY KEY,
    업주이름 VARCHAR2(40),
    사업자번호 NUMBER(30),
    업주주민등록번호 VARCHAR2(40),
    핸드폰번호 VARCHAR2(40),
    업주이메일 VARCHAR2(40),
    deletedDate date
);

CREATE TRIGGER trg_deleted업주  -- 트리거 이름
    AFTER DELETE -- 삭제 후에 작동하게 지정
    ON 업주 -- 트리거를 부착할 테이블
    FOR EACH ROW -- 각 행마다 적용됨
BEGIN 
	-- :old 테이블의 내용을 백업테이블에 삽입
	INSERT INTO deleted업주
		VALUES (:old.업주번호, :old.업주이름, :old.사업자번호, :old.업주주민등록번호, :old.핸드폰번호, :old.업주이메일, SYSDATE() ); 
END ;

--SELECT * FROM 업주;
--
--DELETE FROM 업주 WHERE 업주이름 = '';
--
--SELECT * FROM 업주;
--
--SELECT * FROM deleted업주;

create index idx_업주 ON 업주(업주번호, 업주이름, 사업자번호, 업주주민등록번호, 핸드폰번호, 업주이메일); --인덱스 생성

SELECT 'ALTER INDEX '||INDEX_NAME||' REBUILD; 'FROM USER_INDEXES; --인덱스 리빌드


INSERT INTO 업주 VALUES ('M1', '진예인', '15823684', '874235-8435424', '010-4682-4464', 'whek54@naver.com');
INSERT INTO 업주 VALUES ('M2', '나유진', '84265123', '241598-2165423', '010-8678-7789', 'cngks123@naver.com');
INSERT INTO 업주 VALUES ('M3', '김유진', '12364152', '778641-3312355', '010-3352-7351', 'wlektj33@naver.com');
INSERT INTO 업주 VALUES ('M4', '정찬영', '48234461', '984257-2134853', '010-8874-5663', 'kosh5099@naver.com');
INSERT INTO 업주 VALUES ('M5', '김예원', '42565332', '895643-3429766', '010-7632-9952', 'wldkrjt1@naver.com');
INSERT INTO 업주 VALUES ('M6', '정준경', '42562635', '132468-8724651', '010-2245-8824', 'wlektj77@naver.com');
INSERT INTO 업주 VALUES ('M7', '이시연', '78945665', '621764-1217531', '010-6645-3321', 'nnmwl186@naver.com');
INSERT INTO 업주 VALUES ('M8', '이지은', '42865946', '175354-4576589', '010-7332-6654', 'wlsdf99@naver.com');
INSERT INTO 업주 VALUES ('M9', '정재헌', '72446724', '321975-6523545', '010-9921-2254', 'zdyywe1@naver.com');
INSERT INTO 업주 VALUES ('M10', '김혜민', '54466464', '249875-8851344', '010-5882-4553', 'lwkss354@naver.com');
