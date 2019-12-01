DROP TABLE review;
DROP TABLE shipment;
DROP TABLE productinventory;
DROP TABLE warehouse;
DROP TABLE orderproduct;
DROP TABLE incart;
DROP TABLE product;
DROP TABLE category;
DROP TABLE ordersummary;
DROP TABLE paymentmethod;
DROP TABLE customer;
DROP TABLE taxes;

CREATE TABLE customer (
    customerId          INT IDENTITY,
    firstName           VARCHAR(40),
    lastName            VARCHAR(40),
    email               VARCHAR(50),
    phonenum            VARCHAR(20),
    address             VARCHAR(50),
    city                VARCHAR(40),
    state               CHAR(2),
    postalCode          VARCHAR(20),
    country             VARCHAR(40),
    userid              VARCHAR(20),
    password            VARCHAR(30),
    PRIMARY KEY (customerId)
);

CREATE TABLE paymentmethod (
    paymentMethodId     INT IDENTITY,
    paymentType         VARCHAR(20),
    paymentNumber       VARCHAR(30),
    paymentExpiryDate   VARCHAR(30),
    customerId          INT,
    PRIMARY KEY (paymentMethodId),
    FOREIGN KEY (customerId) REFERENCES customer(customerid)
        ON UPDATE CASCADE ON DELETE CASCADE 
);

CREATE TABLE ordersummary (
    orderId             INT IDENTITY,
    orderDate           DATETIME,
    totalAmount         DECIMAL(10,2),
    shiptoAddress       VARCHAR(50),
    shiptoCity          VARCHAR(40),
    shiptoState         VARCHAR(20),
    shiptoPostalCode    VARCHAR(20),
    shiptoCountry       VARCHAR(40),
    customerId          INT,
    PRIMARY KEY (orderId),
    FOREIGN KEY (customerId) REFERENCES customer(customerid)
        ON UPDATE CASCADE ON DELETE CASCADE 
);

CREATE TABLE category (
    categoryId          INT IDENTITY,
    categoryName        VARCHAR(50),    
    PRIMARY KEY (categoryId)
);

CREATE TABLE product (
    productId           INT IDENTITY,
    productName         VARCHAR(40),
    productPrice        DECIMAL(10,2),
    productImageURL     VARCHAR(100),
    productImage        VARBINARY(MAX),
    productDesc         VARCHAR(1000),
    categoryId          INT,
    PRIMARY KEY (productId),
    FOREIGN KEY (categoryId) REFERENCES category(categoryId)
);

CREATE TABLE orderproduct (
    orderId             INT,
    productId           INT,
    quantity            INT,
    price               DECIMAL(10,2),  
    PRIMARY KEY (orderId, productId),
    FOREIGN KEY (orderId) REFERENCES ordersummary(orderId)
        ON UPDATE CASCADE ON DELETE NO ACTION,
    FOREIGN KEY (productId) REFERENCES product(productId)
        ON UPDATE CASCADE ON DELETE NO ACTION
);

CREATE TABLE incart (
    orderId             INT,
    productId           INT,
    quantity            INT,
    price               DECIMAL(10,2),  
    PRIMARY KEY (orderId, productId),
    FOREIGN KEY (orderId) REFERENCES ordersummary(orderId)
        ON UPDATE CASCADE ON DELETE NO ACTION,
    FOREIGN KEY (productId) REFERENCES product(productId)
        ON UPDATE CASCADE ON DELETE NO ACTION
);

CREATE TABLE warehouse (
    warehouseId         INT IDENTITY,
    warehouseName       VARCHAR(30),    
    PRIMARY KEY (warehouseId)
);

CREATE TABLE shipment (
    shipmentId          INT IDENTITY,
    shipmentDate        DATETIME,   
    shipmentDesc        VARCHAR(100),   
    warehouseId         INT, 
    PRIMARY KEY (shipmentId),
    FOREIGN KEY (warehouseId) REFERENCES warehouse(warehouseId)
        ON UPDATE CASCADE ON DELETE NO ACTION
);

CREATE TABLE productinventory ( 
    productId           INT,
    warehouseId         INT,
    quantity            INT,
    price               DECIMAL(10,2),  
    PRIMARY KEY (productId, warehouseId),   
    FOREIGN KEY (productId) REFERENCES product(productId)
        ON UPDATE CASCADE ON DELETE NO ACTION,
    FOREIGN KEY (warehouseId) REFERENCES warehouse(warehouseId)
        ON UPDATE CASCADE ON DELETE NO ACTION
);

CREATE TABLE review (
    reviewId            INT IDENTITY,
    reviewRating        INT,
    reviewDate          DATETIME,   
    customerId          INT,
    productId           INT,
    reviewComment       VARCHAR(1000),          
    PRIMARY KEY (reviewId),
    FOREIGN KEY (customerId) REFERENCES customer(customerId)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (productId) REFERENCES product(productId)
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE taxes (
    stateId CHAR(2),
    stateTax DECIMAL(10,2),
    stateName VARCHAR(40),
    PRIMARY KEY (stateName)
)

INSERT INTO taxes(stateId, stateTax, stateName) VALUES ('WA',6.50,'Washington');
INSERT INTO taxes(stateId, stateTax, stateName) VALUES ('OR',0.00,'Oregon');
INSERT INTO taxes(stateId, stateTax, stateName) VALUES ('CA',8.25,'California');
INSERT INTO taxes(stateId, stateTax, stateName) VALUES ('ID',6.00,'Idaho');
INSERT INTO taxes(stateId, stateTax, stateName) VALUES ('NV',6.85,'Nevada');
INSERT INTO taxes(stateId, stateTax, stateName) VALUES ('MT',0.00,'Montana');
INSERT INTO taxes(stateId, stateTax, stateName) VALUES ('WY',4.00,'Wyoming');
INSERT INTO taxes(stateId, stateTax, stateName) VALUES ('UT',5.95,'Utah');
INSERT INTO taxes(stateId, stateTax, stateName) VALUES ('AZ',6.60,'Arizona');
INSERT INTO taxes(stateId, stateTax, stateName) VALUES ('CO',2.90,'Colorado');
INSERT INTO taxes(stateId, stateTax, stateName) VALUES ('NM',5.13,'New Mexico');
INSERT INTO taxes(stateId, stateTax, stateName) VALUES ('ND',5.00,'North Dakota');
INSERT INTO taxes(stateId, stateTax, stateName) VALUES ('SD',4.00,'South Dakota');
INSERT INTO taxes(stateId, stateTax, stateName) VALUES ('NE',5.50,'Nebraska');
INSERT INTO taxes(stateId, stateTax, stateName) VALUES ('KS',6.30,'Kansas');
INSERT INTO taxes(stateId, stateTax, stateName) VALUES ('OK',4.50,'Oklahoma');
INSERT INTO taxes(stateId, stateTax, stateName) VALUES ('TX',6.25,'Texas');
INSERT INTO taxes(stateId, stateTax, stateName) VALUES ('MN',6.88,'Minnesota');
INSERT INTO taxes(stateId, stateTax, stateName) VALUES ('IA',6.00,'Iowa');
INSERT INTO taxes(stateId, stateTax, stateName) VALUES ('MO',4.23,'Missouri');
INSERT INTO taxes(stateId, stateTax, stateName) VALUES ('AR',6.00,'Arkansas');
INSERT INTO taxes(stateId, stateTax, stateName) VALUES ('LA',4.00,'Louisiana');
INSERT INTO taxes(stateId, stateTax, stateName) VALUES ('WI',5.00,'Wisconsin');
INSERT INTO taxes(stateId, stateTax, stateName) VALUES ('IL',6.25,'Illinois');
INSERT INTO taxes(stateId, stateTax, stateName) VALUES ('MS',7.00,'Mississippi');
INSERT INTO taxes(stateId, stateTax, stateName) VALUES ('MI',6.00,'Michigan');
INSERT INTO taxes(stateId, stateTax, stateName) VALUES ('IN',7.00,'Indiana');
INSERT INTO taxes(stateId, stateTax, stateName) VALUES ('KY',6.00,'Kentucky');
INSERT INTO taxes(stateId, stateTax, stateName) VALUES ('TN',7.00,'Tennessee');
INSERT INTO taxes(stateId, stateTax, stateName) VALUES ('AL',4.00,'Alabama');
INSERT INTO taxes(stateId, stateTax, stateName) VALUES ('NY',4.00,'New York');
INSERT INTO taxes(stateId, stateTax, stateName) VALUES ('PA',6.00,'Pennsylvania');
INSERT INTO taxes(stateId, stateTax, stateName) VALUES ('WV',6.00,'West Virginia');
INSERT INTO taxes(stateId, stateTax, stateName) VALUES ('VA',5.00,'Virginia');
INSERT INTO taxes(stateId, stateTax, stateName) VALUES ('NC',5.75,'North Carolina');
INSERT INTO taxes(stateId, stateTax, stateName) VALUES ('SC',6.00,'South Carolina');
INSERT INTO taxes(stateId, stateTax, stateName) VALUES ('GA',4.00,'Georgia');
INSERT INTO taxes(stateId, stateTax, stateName) VALUES ('FL',6.00,'Florida');
INSERT INTO taxes(stateId, stateTax, stateName) VALUES ('ME',5.00,'Maine');
INSERT INTO taxes(stateId, stateTax, stateName) VALUES ('NH',0.00,'New Hampshire');
INSERT INTO taxes(stateId, stateTax, stateName) VALUES ('VT',6.00,'Vermont');
INSERT INTO taxes(stateId, stateTax, stateName) VALUES ('MA',0.25,'Massachusetts');
INSERT INTO taxes(stateId, stateTax, stateName) VALUES ('RI',7.00,'Rhode Island');
INSERT INTO taxes(stateId, stateTax, stateName) VALUES ('CT',6.00,'Connecticut');
INSERT INTO taxes(stateId, stateTax, stateName) VALUES ('NJ',7.00,'New Jersey');
INSERT INTO taxes(stateId, stateTax, stateName) VALUES ('DE',0.00,'Delaware');
INSERT INTO taxes(stateId, stateTax, stateName) VALUES ('MD',6.00,'Maryland');
INSERT INTO taxes(stateId, stateTax, stateName) VALUES ('DC',6.00,'District of Columbia');
INSERT INTO taxes(stateId, stateTax, stateName) VALUES ('HI',4.00,'Hawaii');
INSERT INTO taxes(stateId, stateTax, stateName) VALUES ('AK',0.00,'Alaska');
INSERT INTO taxes(stateId, stateTax, stateName) VALUES ('MB',5.00,'Manitoba');
INSERT INTO taxes(stateId, stateTax, stateName) VALUES ('ON',13.00,'Ontario');
INSERT INTO taxes(stateId, stateTax, stateName) VALUES ('BC',5.00,'British Columbia');
INSERT INTO taxes(stateId, stateTax, stateName) VALUES ('SK',5.00,'Saskatchewan');
INSERT INTO taxes(stateId, stateTax, stateName) VALUES ('AB',5.00,'Alberta');
INSERT INTO taxes(stateId, stateTax, stateName) VALUES ('NL',15.00,'Newfoundland and Labrador');
INSERT INTO taxes(stateId, stateTax, stateName) VALUES ('PE',15.00,'Prince Edward Island');
INSERT INTO taxes(stateId, stateTax, stateName) VALUES ('NS',15.00,'Nova Scotia');
INSERT INTO taxes(stateId, stateTax, stateName) VALUES ('NB',15.00,'New Brunswick');
INSERT INTO taxes(stateId, stateTax, stateName) VALUES ('QC',14.98,'Quebec');
INSERT INTO taxes(stateId, stateTax, stateName) VALUES ('YT',5.00,'Yukon');
INSERT INTO taxes(stateId, stateTax, stateName) VALUES ('NT',5.00,'Northwest Territories');
INSERT INTO taxes(stateId, stateTax, stateName) VALUES ('NU',5.00,'Nunavut');

INSERT INTO category(categoryName) VALUES ('Battle Royale');
INSERT INTO category(categoryName) VALUES ('Action-Adventure');
INSERT INTO category(categoryName) VALUES ('Adventure');
INSERT INTO category(categoryName) VALUES ('Role-Playing');
INSERT INTO category(categoryName) VALUES ('Simulation');
INSERT INTO category(categoryName) VALUES ('Strategy');
INSERT INTO category(categoryName) VALUES ('Sports');
INSERT INTO category(categoryName) VALUES ('MMO');

INSERT product(productName, categoryId, productDesc, productPrice) VALUES ('PlayerUnknown''s Battlegrounds',1,'A battle royale shooter that pits 100 players against each other in a struggle for survival. Gather supplies and outwit your opponents to become the last person standing.',36.99);
INSERT product(productName, categoryId, productDesc, productPrice) VALUES ('Grand Theft Auto V', 2, 'In Los Santos, three very different criminals plot their own chances of survival and success: Franklin, a street hustler looking for real opportunities and serious money, Michael, a professional ex-con whose retirement is a lot less rosy than he hoped it would be, and Trevor, a violent maniac driven by the chance of a cheap high and the next big score. Running out of options, the crew risks everything in a series of daring and dangerous heists that could set them up for life.',29.99);
INSERT product(productName, categoryId, productDesc, productPrice) VALUES ('Life is Strange',3,'Follow the story of Max Caulfield, a photography senior who discovers she can rewind time while saving her best friend Chloe Price. The pair soon find themselves investigating the mysterious disappearance of fellow student Rachel Amber, uncovering a dark side to life in Arcadia Bay. Meanwhile, Max must quickly learn that changing the past can sometimes lead to a devastating future.',21.99);
INSERT product(productName, categoryId, productDesc, productPrice) VALUES ('Skyrim',4,'The Empire of Tamriel is on the edge. The High King of Skyrim has been murdered. Alliances form as claims to the throne are made. In the midst of this conflict, a far more dangerous, ancient evil is awakened. Dragons, long lost to the passages of the Elder Scrolls, have returned to Tamriel. The future of Skyrim, even the Empire itself, hangs in the balance as they wait for the prophesized Dragonborn to come, a hero born with the power of The Voice, and the only one who can stand amongst the dragons..',49.99);
INSERT product(productName, categoryId, productDesc, productPrice) VALUES ('Euro Truck Simulator 2',5,'Travel across Europe as king of the road, a trucker who delivers important cargo across impressive distances! With dozens of cities to explore, your endurance, skill and speed will all be pushed to their limits.',21.99);
INSERT product(productName, categoryId, productDesc, productPrice) VALUES ('StarCraft',6,'The campaign storyline of StarCraft II takes place four years after StarCraft: Brood War, and features the return of Zeratul, Arcturus Mengsk, Artanis, Sarah Kerrigan, and Jim Raynor. It also features new characters such as Rory Swann and Tychus Findlay. In StarCraft II, players revisit familiar worlds, like Char, Mar Sara, and Tarsonis, as well as new locations, such as the jungle planet Bel''Shir and New Folsom. The Xel''Naga, an ancient space-faring race responsible for creating the Protoss and the Zerg, also play a major role in the story.',00.00);
INSERT product(productName, categoryId, productDesc, productPrice) VALUES ('FIFA 20',7,'Powered by Frostbite™, EA SPORTS™ FIFA 20 for PC brings two sides of The World’s Game to life: the prestige of the professional stage and an all-new street football experience in EA SPORTS VOLTA FOOTBALL. FIFA 20 innovates across the game, FOOTBALL INTELLIGENCE unlocks an unprecedented platform for gameplay realism, FIFA Ultimate Team™ offers more ways to build your dream squad and EA SPORTS VOLTA FOOTBALL returns the game to the streets with an authentic form of small-sided football.',29.99);
INSERT product(productName, categoryId, productDesc, productPrice) VALUES ('World of Warcraft: Complete Edition',8,'Decend into the World of Warcraft and join thousands of mighty heroes in an online world of myth, magic and limitless adventure. Jagged snow peaks, mountain fortresses, harsh winding canyons, zepplins flying over smoldering battlefields, epic sieges - an infinity of experiences await, so what are you waiting for?',131.22);
    
INSERT INTO customer (firstName, lastName, email, phonenum, address, city, state, postalCode, country, userid, password) VALUES ('Arnold', 'Anderson', 'a.anderson@gmail.com', '204-111-2222', '103 AnyWhere Street', 'Winnipeg', 'MB', 'R3X 45T', 'Canada', 'arnold' , 'test');
INSERT INTO customer (firstName, lastName, email, phonenum, address, city, state, postalCode, country, userid, password) VALUES ('Bobby', 'Brown', 'bobby.brown@hotmail.ca', '572-342-8911', '222 Bush Avenue', 'Boston', 'MA', '22222', 'United States', 'bobby' , 'bobby');
INSERT INTO customer (firstName, lastName, email, phonenum, address, city, state, postalCode, country, userid, password) VALUES ('Candace', 'Cole', 'cole@charity.org', '333-444-5555', '333 Central Crescent', 'Chicago', 'IL', '33333', 'United States', 'candace' , 'password');
INSERT INTO customer (firstName, lastName, email, phonenum, address, city, state, postalCode, country, userid, password) VALUES ('Darren', 'Doe', 'oe@doe.com', '250-807-2222', '444 Dover Lane', 'Kelowna', 'BC', 'V1V 2X9', 'Canada', 'darren' , 'pw');
INSERT INTO customer (firstName, lastName, email, phonenum, address, city, state, postalCode, country, userid, password) VALUES ('Elizabeth', 'Elliott', 'engel@uiowa.edu', '555-666-7777', '555 Everwood Street', 'Iowa City', 'IA', '52241', 'United States', 'beth' , 'test');


DECLARE @orderId int
INSERT INTO ordersummary (customerId, orderDate, totalAmount) VALUES (1, '2019-10-15 10:25:55', 91.70)
SELECT @orderId = @@IDENTITY
INSERT INTO orderproduct (orderId, productId, quantity, price) VALUES (@orderId, 1, 1, 18)
INSERT INTO orderproduct (orderId, productId, quantity, price) VALUES (@orderId, 5, 2, 21.35)
INSERT INTO orderproduct (orderId, productId, quantity, price) VALUES (@orderId, 10, 1, 31);

DECLARE @orderId int
INSERT INTO ordersummary (customerId, orderDate, totalAmount) VALUES (2, '2019-10-16 18:00:00', 106.75)
SELECT @orderId = @@IDENTITY
INSERT INTO orderproduct (orderId, productId, quantity, price) VALUES (@orderId, 5, 5, 21.35);

DECLARE @orderId int
INSERT INTO ordersummary (customerId, orderDate, totalAmount) VALUES (3, '2019-10-15 3:30:22', 140)
SELECT @orderId = @@IDENTITY
INSERT INTO orderproduct (orderId, productId, quantity, price) VALUES (@orderId, 6, 2, 25)
INSERT INTO orderproduct (orderId, productId, quantity, price) VALUES (@orderId, 7, 3, 30);

DECLARE @orderId int
INSERT INTO ordersummary (customerId, orderDate, totalAmount) VALUES (2, '2019-10-17 05:45:11', 327.85)
SELECT @orderId = @@IDENTITY
INSERT INTO orderproduct (orderId, productId, quantity, price) VALUES (@orderId, 3, 4, 10)
INSERT INTO orderproduct (orderId, productId, quantity, price) VALUES (@orderId, 8, 3, 40)
INSERT INTO orderproduct (orderId, productId, quantity, price) VALUES (@orderId, 13, 3, 23.25)
INSERT INTO orderproduct (orderId, productId, quantity, price) VALUES (@orderId, 28, 2, 21.05)
INSERT INTO orderproduct (orderId, productId, quantity, price) VALUES (@orderId, 29, 4, 14);

DECLARE @orderId int
INSERT INTO ordersummary (customerId, orderDate, totalAmount) VALUES (5, '2019-10-15 10:25:55', 277.40)
SELECT @orderId = @@IDENTITY
INSERT INTO orderproduct (orderId, productId, quantity, price) VALUES (@orderId, 5, 4, 21.35)
INSERT INTO orderproduct (orderId, productId, quantity, price) VALUES (@orderId, 19, 2, 81)
INSERT INTO orderproduct (orderId, productId, quantity, price) VALUES (@orderId, 20, 3, 10);

INSERT INTO paymentmethod (paymentType, paymentNumber, paymentExpiryDate, customerId) VALUES ('Visa', 4549773804496646, '05/2021', 1);
INSERT INTO paymentmethod (paymentType, paymentNumber, paymentExpiryDate, customerId) VALUES ('American Express', 371642190784801 , '06/2026', 2);
INSERT INTO paymentmethod (paymentType, paymentNumber, paymentExpiryDate, customerId) VALUES ('Mastercard',5168441223630339, '06/2026', 3);
INSERT INTO paymentmethod (paymentType, paymentNumber, paymentExpiryDate, customerId) VALUES ('China Unionpay',62600094752489245 ,'06/2026', 4);
INSERT INTO paymentmethod (paymentType, paymentNumber, paymentExpiryDate, customerId) VALUES ('Mastercard',5168441223630339 ,'06/2026', 5);

-- New SQL DDL for lab 8
UPDATE Product SET productImageURL = 'img/PUBG.png' WHERE ProductId = 1;
UPDATE Product SET productImageURL = 'img/GTA.png' WHERE ProductId = 2;
UPDATE Product SET productImageURL = 'img/life-is-strange.png' WHERE ProductId = 3;
UPDATE Product SET productImageURL = 'img/The_Elder_Scrolls_V_Skyrim.png' WHERE ProductId = 4;
UPDATE Product SET productImageURL = 'img/EuroTruck.png' WHERE ProductId = 5;
UPDATE Product SET productImageURL = 'img/fifa20.png' WHERE ProductId = 7;



--UPDATE Product SET productImage = 0xffd8ffe000104a46494600010100000100010000ffdb008400090607080706090807080a0a090b0d160f0d0c0c0d1b14151016201d2222201d1f1f2428342c242631271f1f2d3d2d3135373a3a3a232b3f443f384334393a37010a0a0a0d0c0d1a0f0f1a37251f253737373737373737373737373737373737373737373737373737373737373737373737373737373737373737373737373737ffc00011080082005b03012200021101031101ffc4001c0000020203010100000000000000000000040503060002070108ffc4003e1000020103020306030407070500000000010203000411052112133106224151617114819132a1b1d123335292c1e1f015162442536272074382a2e2ffc4001a010002030101000000000000000000000002030004050106ffc400281100020103050001020700000000000000000102031131041221224113d1f0425152617181a1ffda000c03010002110311003f00e422565240077dfceb78a79948ee7de686e6f0bf53d7c40a223799b1cbe23e7b0c53d4ade8b6827e364650ad006cff00bb02a74bcb80b816b081c408009dbefad6c34ad53519316b653cdbe18c69b2fb9e83e745dce8b7f038468db88f50278ce3e8dbd12aab2d83b1bc2268f56d4a32145b46ca7a296d80fad18baf6b8210120454193b49fce86b4d1f5dbb61f09a7cf2900f4e13b7ef510743ed2c3dd9348bc03c786307f0346b534bf5ff00a817466bf08be7bcd4ce1e4b7527af1733afdf4bee3539a51de84614fed530bc8752b7c25d5a5cc44f83c7c34ae58dd9c80ae0b1f1200fa93432ad17891d8d292cc4c6bb94ae562ebd7bf5049752118311cffc8e3e94c22d1b556b7e7416524d1fed42cb211efc2491f3c504d0dd7fa4d8f1e943bafe84911a5de14fe8db3e809a922ba22300c4ff005a1e4338201e207d854b189b8064367e543b9856445042b2cae59d51501625bc7dbd69c69934492aa59d9fc54ecc0235c8ee83e8809e23ee48f4a490f0991848ce137e2e1ea7cbefc55874eed65ce9703c3a6f0d98618e6403f4a7de43bfd2abc93781b1b2c97ab0ec4eb9a9451cbadcb2456dfe48ee2610c483c82780f4c5587b2dd99ecfc780d7968d329ef4508e365f7eb5c5a5d6efa49849c6cd363f5b33995c7fe4d5ea6a3ab4b2f2daf6724fecb7081f4aa957492a997f7fd1663aa695a365fc23ea6d22d74ab718b33193e60d1775a8da5bfeb6455c7fbd47e26be6ad026bc9a40efabc9132effa576cfdf4e6f7431751cb752eb51b14c172474cfceabc612a5d236413a7bfb3773a86b72766f569cb5c5cbf3718cc651beecd54358d27b2b733b88f5b8a093241496d1b854fa9df1f3f7ae6facd9ad931116aab27776e539049f01b52759af037339f28c8ebc64d369e9a2fb7d492a9521d532ef07659ef2799b46bbb496485f08d05c88da41e6b920ff4286d5c6b1625a1d7b4f9a75047f889a02b2a007a0931b83ea48aaa8d52e48e09b953ae7fef44ac47cf19a730f6a2e134bbbd3de5ba315c22e2333b3c590c0e7849dba7855fa7071f4a9527bb2859731dbca8cd6f330283256740a4f9e304e7eefe15a467282b492459f9920411b000e13ece3a1f6ea2b4473c237a6dc5d85eff006f3e7f9d490a866000ce0ef536a7672d85ebdbcea54862464636a92cd047704491348a92779037092003e38da856427824b7b62cd9c7d69bda583bba98b01d80c0f3c9a9e7b0f8698f2bbf1b77e2600e190f43fd788229bd8e9f2dc597315809a3e83d3d2b4e7a4bd3eb933e3ab8c2a76c0a6e343be91b96d692a11e1bef56cec9763e3b8d1f51f8c9f0e232420f0a225ed63db692b6cb64b2df1180c7a003c48a79d8fd474f1d9fd41a4d4ad4cd22f0b12719f3dbc3c6bcfd4534eccdfa6e0e2a5139db763b51b59798b6b24cbd43a6e0fe46a5bdecbbdae9af75791f264232885707dcd5fbb3bdab81667b6ba31496cc49b7ba8c6cfe99aa8ffd44ed33de39897015470803cbfa1429c9fa1b8a8deeb839a4f88ddbcb3815ea3657d8d432b166dcec09347cb6bf0d6d1ac8845cb8e632e7ec2e3ba08f320e7db1e757e37b19b27c8371027d2a75fb342a781f0a7f6da54af023157dc67ecd74e0c758b55d6a18e350ab76a70ae0ecf48f37105e37c5c2f14a0e24561821971d7ee39f7a7822556e668d72d70ca332584fb4a83cd0f88f6a83863d5c91197271825ce1e3c79fb7aff1a953a3bf8043b2b160b0b59869b0dc2225c5abe5d00605e1f0248f71d33be3a677308bbf849061c95243641eb9fe548b4fbabab08cda4f2bac123655b242138f1f5c63d7dc62b6b890050ad901f2ca7c3cf23dfefad5a5ab8b8679fcbe86654d24b7f6c7de42b56bf927d4257b756556017bbbe001425a69f0c8789e4983313dde4b1e3dba0c75ad2dddd6460db374391531bdbdb5917e16f9e3e139054e083e79acdd4c7736cd5d24946293f022fb557b7b45b685a431a1e8f095e1355cd5ef1ae64c93be298eab7eef0b44f317cee493924d2886dd5ad9ef25ef056e148c83df3f4c11d7e86aac29fa5aab57c46b67c16ac9753a872bde8a26190e7c33e9f8d4f373a48e4b9ba2c66b83c4b939273be7faf315a0b7e0757b93c721c1e58dcfa669ad969d7374f2caf183cb6446cf44c9c0183ec73e59dfa9a6b65705d2ad03ba4b22f723d947ed1cf5a7c677c9e16b9001e88720510a96c2316ba7223b01c73decc484887a7901e7d49a83e13483bb6a17cc7ce344553ec0b038f714e8c78e45c9f20da8e9f25bce16561cce2261b88ba1c7af811b64787b532b6d221d660b54863b9b7d778c97758c98aea20325b3d01d88f7233b6e2941f0092db16fdb1f9d7b1dc3b4844734983b639981f8e2a369ab1c4acee751d52d3b3df0f3411ad9addc18674333af3d784fd805bbadb1c6475c78139aa36917b68a1e38a07b5b8042457271cc3b7115df21b07c37fad556572b92cdc4d9d82be7f0e9591dc4cc02bbc8cb9fb24e47df4b8c12c86ddcbd8d267bb863fed4d32f21312048a5b331b3b2f8060705b1e0719f3268a4ec4d85cd91985cf6822c1e9268ccc4fa6cd8fbea94b71732285559029f05c01442c576b1e162751ff15cfcf6ab31a72921129a8b1dff0073a1e7616d35dbcc11c2ad6cb0063e472490289d5f4ad505b24d7d6961a7154091348e072f1d046b9001e833bb555196f63042895464ee31f8e283979fcce328e1cff9b033f5c52dd37118a7b8b668965126ad0d9eadc986da16324cf2b1551919c6460e492a0ee08dfa1da9cea3a369da9c515d68856df4d88e6f05b234cf1210082db9c9c124e3c36ebb5736321df8cbe4faf5f9d685e68cf12cac80feccbf91a56d49dd87bb81f6b37aeb32d8db5acd6f6698711caa43cade0cde9d303c3dea18e066405cf78f5a445e46ef195891e25f7a9e394f00dcfd6a3577722e1704132c232073b3ea001f8d4f6da7cd3c4258ed6fa543d1a280b03f3a1a75cc840f3abef64b59d47fb222d26f9f52b1b77c1b3d4a2570b160ed9c6ccb9ea0ed8f2c54b724bd914a68a289d926171148a77478f7f98f0a9616815fedcb8076fd1ff3ab63cb2b586ad05de99a74da85b4b142b2476ab29959ce0b348d9625ba86ce72474e945c569a67c19d1447633dd1b6281d2d38668ee170d9e670e581208c03e27e4d8458b9490376526d3a3bd8daf61692dc1efb3c40841e78cef4f3559935ab913687a59956350f982db66caecac056d66d09b4d2a11a6e9919b88d8cdccb58c71e1b002b119c9f1c9272696b81fdd7944568f68f1decacd10624c31f0f7467c81c6fef8abbb9ee8ede1dbf72a6c4d36f9187686e34b8b43b44b9d1d6db5678d7990adb18c44a7c7a82dd31d7cfdaa83773401bbad38f31cbc7f1ab7f66de0b9ecfd9bc8969f193486269ee2dd1f08a000c599492474ebe83152fc358c1a86a17fa85ad9da5b46bc8856eadcdc45cd3e4a14f16c09d86dc5d452e29fc580f150e7923dbb1dccdf251f9d0ce1074e303d715d1ed2d74d9bb4705f45a6c02c2fad0bbc62d15d2174187288c3870700f4f13b8a8b44d4f4bd47b4a9041a6584f67240c5b8b48823705549eea02e3e7d4fd2aaca327e169491cddb03a6714545c2631863fbb5b6ab7e751984c6d6d2db6194b58046a4e06f81ededed5ec119e52d2d20db219c9e63601ebe5465beb9ab70883fb52f56251808266000f2c0342caa388fbd46a064ed45e9cf06160f04b77c8bfb99e3b477e2731618e7070784f5ea47ce9b5bc7a73c6c3e2240cbfaa5e153c472db1c9db609e7f68f966ab6a007e2048dfc28946ef65816f51d6994e4d31738a68b92416a91dcadbcb23e5b08182f7d78467383d7391452d93697a714d325bb81dce0a4b1f2ce387232be7559d3efe6b7c14793cb2547e39ab4dc6bcfaa45126a2d93b8791701d81523ebeb5ab08fc9b5e6d733672f8efc64d5f4fb7b5b48ee659262977c4c93988069301787c87427a7a5576ed2c50c879d2f3392a5400a017209604f80c8007bd36ed5eb925edcc438cac112f2e18d1470c6a3c00aac4f2445b98dc72483a1931c23e5f9e69355b85350be0752ef272b64d6ea1b26172d6cf3cbfa6e188e0619307bcdeb9c6debe94bcbcd116e02e8594a370e4654f51ed5e4b3bc923e4ec4e48cd4073c5d6b31c8be91b7013e07e94ca190089460ec3ca9629cb0147c71f706c2a45db0492be41e661c6d83b66b4526a492265621860e6b710328391e1d722a58edc1c1c1353231c578b165b6c7ef0a9d61d896e1503fcc58605755ce33682425d431db8803ed9aba59d9694c434855620c78c9908e1186f5ebb0fa9f219a723592302b33b30df390a33f426a6f888c8da698b0f1e6fff0034e8d571564579d1dec37b4b1da43cb36455978880c1f2481f3aaf962739a66d25ac91fe9a59cedfea06fc5683f87494ff0087995fd090a7efa19c9c9dc6422a11b018c64d7845106d5c1e8bedc63f3af1ade5d860673d3887e74ab31a9a074d9a8e8c9282a0f85994f7907ef0a2a3b69780777ff61512646d1974073be75ac9fabacaca3790101afdaadee3f580795656529e03593d8c0e13b0a9078d6565748cdd3c47a54371dd752bb1c0dc56565491105c3bc609dcf0f5af4018ce066b2b29ab02e47847d9f9515181c036acacae2223ffd9 WHERE ProductId = 6