BEGIN;

CREATE TABLE voicemail_messages (
    dir VARCHAR(255) NOT NULL,
    msgnum INTEGER NOT NULL,
    context VARCHAR(80),
    macrocontext VARCHAR(80),
    callerid VARCHAR(80),
    origtime INTEGER,
    duration INTEGER,
    recording BYTEA,
    flag VARCHAR(30),
    category VARCHAR(30),
    mailboxuser VARCHAR(30),
    mailboxcontext VARCHAR(30),
    msg_id VARCHAR(40)
);

ALTER TABLE voicemail_messages ADD CONSTRAINT voicemail_messages_dir_msgnum PRIMARY KEY (dir, msgnum);

CREATE INDEX voicemail_messages_dir ON voicemail_messages (dir);

ALTER TABLE voicemail_messages ALTER COLUMN recording TYPE BYTEA;

COMMIT;
