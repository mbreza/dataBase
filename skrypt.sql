DROP TABLE Message;

DROP TABLE Friend;

DROP TABLE Invite;

DROP TABLE Verification;

DROP TABLE Users;

CREATE TABLE Users(
	user_id SERIAL PRIMARY KEY UNIQUE,
	login VARCHAR(30) NOT NULL UNIQUE,
	password VARCHAR(100) NOT NULL,
	role VARCHAR(30) DEFAULT 'User',
	verification_points INTEGER DEFAULT 0
);

CREATE TABLE Verification(
	verification_id SERIAL PRIMARY KEY UNIQUE,
	--ten ktory weryfikuje
	verifier_id INTEGER NOT NULL REFERENCES Users(user_id),
	-- ten zweryfikowany
	verified_id INTEGER NOT NULL REFERENCES Users(user_id),
	date TIMESTAMP DEFAULT NOW() 
);

CREATE TABLE Invite(
	invite_id SERIAL PRIMARY KEY UNIQUE,
	--zapraszajacy
	inviting_id INTEGER NOT NULL REFERENCES Users(user_id),
	--zaproszony
	invited_id INTEGER NOT NULL REFERENCES Users(user_id),
	date TIMESTAMP DEFAULT NOW() 
);

CREATE TABLE Friend(
	friend_id SERIAL PRIMARY KEY UNIQUE,
	friend_1_id INTEGER NOT NULL REFERENCES Users(user_id),
	friend_2_id INTEGER NOT NULL REFERENCES Users(user_id)
);

CREATE TABLE Message(
	message_id SERIAL PRIMARY KEY UNIQUE,
	sender_id INTEGER NOT NULL REFERENCES Users(user_id),
	reciever_id INTEGER NOT NULL REFERENCES Users(user_id),
	date TIMESTAMP DEFAULT NOW(),
	message VARCHAR(280) NOT NULL
);

INSERT INTO Users(login, password, role) VALUES ('Admin','verySecurePassword','Admin');
INSERT INTO Users(login, password) VALUES ('One','verySecurePasswordOne');
INSERT INTO Users(login, password) VALUES ('Two','verySecurePasswordTwo');
INSERT INTO Users(login, password) VALUES ('Three','verySecurePasswordThree');
INSERT INTO Users(login, password) VALUES ('Four','verySecurePasswordFour');
INSERT INTO Users(login, password) VALUES ('Five','verySecurePasswordFive');
