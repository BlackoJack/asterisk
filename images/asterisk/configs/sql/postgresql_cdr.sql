BEGIN;

CREATE TABLE cdr (
    accountcode VARCHAR(20),
    src VARCHAR(80),
    dst VARCHAR(80),
    dcontext VARCHAR(80),
    clid VARCHAR(80),
    channel VARCHAR(80),
    dstchannel VARCHAR(80),
    lastapp VARCHAR(80),
    lastdata VARCHAR(80),
    start TIMESTAMP WITHOUT TIME ZONE,
    answer TIMESTAMP WITHOUT TIME ZONE,
    "end" TIMESTAMP WITHOUT TIME ZONE,
    duration INTEGER,
    billsec INTEGER,
    disposition VARCHAR(45),
    amaflags VARCHAR(45),
    userfield VARCHAR(256),
    uniqueid VARCHAR(150),
    linkedid VARCHAR(150),
    peeraccount VARCHAR(20),
    sequence INTEGER
);

ALTER TABLE cdr ALTER COLUMN accountcode TYPE VARCHAR(80);

ALTER TABLE cdr ALTER COLUMN peeraccount TYPE VARCHAR(80);

COMMIT;
