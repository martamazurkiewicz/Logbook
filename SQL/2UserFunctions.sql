CREATE OR REPLACE FUNCTION CreateCountry(country IN VARCHAR2) 
   RETURN NUMBER 
   IS id NUMBER(3,0);
   BEGIN 
      INSERT INTO COUNTRIES(COUNTRY_NAME) VALUES (country);
      SELECT country_id INTO id 
      FROM (SELECT country_id FROM COUNTRIES ORDER BY COUNTRY_ID DESC) 
      WHERE ROWNUM=1;
      RETURN(id); 
    END;
    
CREATE OR REPLACE FUNCTION CreateCity(city IN VARCHAR2) 
   RETURN NUMBER 
   IS id NUMBER(4,0);
   BEGIN 
      INSERT INTO CITIES(CITY_NAME) VALUES (city);
      SELECT city_id INTO id 
      FROM (SELECT city_id FROM CITIES ORDER BY CITY_ID DESC) 
      WHERE ROWNUM=1;
      RETURN(id); 
    END;

CREATE OR REPLACE FUNCTION CheckIfUsernameNotExists(username IN VARCHAR2)
RETURN BOOLEAN IS
    existingUsername varchar2(40);
BEGIN
    SELECT u.username INTO existingUsername FROM USERS u WHERE u.username = username;
  IF existingUsername IS NULL THEN
      RETURN TRUE;
  ELSE
      RETURN FALSE;
  END IF;
END;

CREATE OR REPLACE FUNCTION CreateToken(tokenString IN VARCHAR2)
    RETURN NUMBER 
    IS id NUMBER(4,0);
    currentTime date;
BEGIN
    SELECT CURRENT_DATE INTO currentTime FROM DUAL;
    INSERT INTO TOKENS(TOKEN,CREATION_DATE,EXPIRATION_DATE) 
        VALUES (tokenString, currentTime, currentTime+30);
    SELECT token_id INTO id 
    FROM (SELECT token_id FROM TOKENS ORDER BY TOKEN_ID DESC) 
    WHERE ROWNUM=1;
    RETURN(id); 
END;