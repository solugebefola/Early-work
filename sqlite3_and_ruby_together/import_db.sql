DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname VARCHAR(255) NOT NULL,
  lname VARCHAR(255) NOT NULL
);

DROP TABLE IF EXISTS questions;

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  body VARCHAR(255) NOT NULL,
  author_id INTEGER NOT NULL,

  FOREIGN KEY (author_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS question_follows;

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

DROP TABLE IF EXISTS replies;

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  parent_reply_id INTEGER,
  body VARCHAR(255) NOT NULL,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (parent_reply_id) REFERENCES replies(id)
);

DROP TABLE IF EXISTS question_likes;

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO
  users (fname, lname)
VALUES
  ('Justin', 'Schulz'), ('Solar', 'Olugebefola');

INSERT INTO
  questions(title, body, author_id)
VALUES
  ('sql', 'How does SQL work?', (SELECT id FROM users WHERE fname = 'Solar'));

INSERT INTO
  question_follows(user_id, question_id)
VALUES
  ((SELECT id FROM users WHERE fname = 'Solar'),
   (SELECT id FROM questions WHERE title = 'sql'));

INSERT INTO
  replies(question_id, user_id, body)
VALUES
  ((SELECT id FROM questions WHERE title = 'sql'),
   (SELECT id FROM users WHERE fname = 'Justin'),
    'Please be more specific.');

INSERT INTO
  replies(question_id, user_id, parent_reply_id, body)
VALUES
  ((SELECT id FROM questions WHERE title = 'sql'),
   (SELECT id FROM users WHERE fname = 'Solar'),
   (SELECT id FROM replies WHERE user_id = 'Justin'),
    'I do not understand COALESCE!!');

INSERT INTO
  question_likes(user_id, question_id)
VALUES
  ((SELECT id FROM users WHERE fname = 'Justin'),
   (SELECT id FROM questions WHERE title = 'sql'));
