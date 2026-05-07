CREATE TABLE customer (
    cust_no INTEGER PRIMARY KEY,
    cust_name TEXT,
    cust_city TEXT
);

CREATE TABLE mechanic (
    mech_id INTEGER PRIMARY KEY,
    mech_name TEXT,
    hourly_rate REAL CHECK (hourly_rate > 0)
);

CREATE TABLE vehicle (
    plate TEXT PRIMARY KEY,
    cust_no INTEGER,
    make TEXT,
    model TEXT,
    year INTEGER,
    FOREIGN KEY (cust_no) REFERENCES customer(cust_no)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

CREATE TABLE "order" (
    order_no INTEGER PRIMARY KEY,
    plate TEXT,
    cust_no INTEGER,
    date DATE,
    FOREIGN KEY (plate) REFERENCES vehicle(plate)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (cust_no) REFERENCES customer(cust_no)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

CREATE TABLE work_item (
    order_no INTEGER,
    item_no INTEGER,
    mech_id INTEGER,
    description TEXT,
    hours REAL CHECK (hours > 0),
    PRIMARY KEY (order_no, item_no),
    FOREIGN KEY (order_no) REFERENCES "order"(order_no)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (mech_id) REFERENCES mechanic(mech_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);
