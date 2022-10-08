DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS message;
DROP TABLE IF EXISTS forgotlink;
DROP TABLE IF EXISTS activationlink;
DROP TABLE IF EXISTS credentials;

CREATE TABLE user (
  id INTEGER PRIMARY KEY auto_increment,
  username TEXT UNIQUE NOT NULL,
  password TEXT NOT NULL,
  salt TEXT NOT NULL,
  email Text not Null
);

CREATE TABLE forgotlink (
  id INTEGER PRIMARY KEY auto_increment,
  userid INTEGER NOT NULL,
  challenge TEXT not Null,
  created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  validuntil TIMESTAMP NOT NULL DEFAULT (DATETIME(CURRENT_TIMESTAMP , '+1 days')),
  state TEXT NOT NULL,
  FOREIGN KEY (userid) REFERENCES user (id)
);

CREATE TABLE activationlink (
  id INTEGER PRIMARY KEY auto_increment,
  challenge TEXT not Null,
  created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  validuntil TIMESTAMP NOT NULL DEFAULT (DATETIME(CURRENT_TIMESTAMP , '+1 days')),
  state TEXT NOT NULL,
  username TEXT UNIQUE NOT NULL,
  password TEXT NOT NULL,
  salt TEXT NOT NULL,
  email Text not Null
);

CREATE TABLE message (
  id INTEGER PRIMARY KEY auto_increment,
  from_id INTEGER NOT NULL,
  to_id INTEGER NOT NULL,
  created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  subject TEXT NOT NULL,
  body TEXT NOT NULL,
  FOREIGN KEY (from_id) REFERENCES user (id),
  FOREIGN KEY (to_id) REFERENCES user (id)  
);

CREATE TABLE credentials(
  id INTEGER PRIMARY KEY auto_increment,
  name   TEXT NOT NULL,
  user TEXT NOT NULL,
  password TEXT NOT NULL
);

INSERT INTO credentials (name,user,password) VALUES ('EMAIL_APP','hesarmiento@uninorte.edu.co', 'Sarmiento1109'); 