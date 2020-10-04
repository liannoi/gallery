USE mysql;
DROP DATABASE IF EXISTS gallery;
CREATE DATABASE gallery;
USE gallery;

-- Creating tables

-- Identity

DROP TABLE IF EXISTS Users;
CREATE TABLE Users
(
    UserId         INT           NOT NULL AUTO_INCREMENT,
    Username       NVARCHAR(64)  NOT NULL,
    Email          NVARCHAR(64)  NOT NULL,
    EmailConfirmed BIT           NOT NULL DEFAULT (0),
    PasswordHash   NVARCHAR(128) NOT NULL,
    IsRemoved      BIT           NOT NULL DEFAULT (0),
    CONSTRAINT PK_Users PRIMARY KEY (UserId),
    CONSTRAINT CHK_Users_Username CHECK (LENGTH(Username) >= 2),
    CONSTRAINT CHK_Users_Email CHECK (LENGTH(Email) >= 2),
    CONSTRAINT CHK_Users_PasswordHash CHECK (LENGTH(PasswordHash) >= 2),
    CONSTRAINT UNQ_Users_Username UNIQUE (Username),
    CONSTRAINT UNQ_Users_Email UNIQUE (Email)
);

DROP TABLE IF EXISTS Roles;
CREATE TABLE Roles
(
    RoleId    INT          NOT NULL AUTO_INCREMENT,
    Name      NVARCHAR(64) NOT NULL,
    IsRemoved BIT          NOT NULL DEFAULT (0),
    CONSTRAINT PK_Roles PRIMARY KEY (RoleId),
    CONSTRAINT CHK_Roles_Name CHECK (LENGTH(Name) >= 2),
    CONSTRAINT UNQ_Roles_Name UNIQUE (Name)
);

DROP TABLE IF EXISTS UserRoles;
CREATE TABLE UserRoles
(
    UserId INT NOT NULL,
    RoleId INT NOT NULL,
    CONSTRAINT PK_UserRoles PRIMARY KEY (UserId, RoleId),
    CONSTRAINT FK_UserRoles_UserId FOREIGN KEY (UserId) REFERENCES Users (UserId),
    CONSTRAINT FK_UserRoles_RoleId FOREIGN KEY (RoleId) REFERENCES Roles (RoleId)
);

DROP TABLE IF EXISTS Privileges;
CREATE TABLE Privileges
(
    PrivilegeId   INT          NOT NULL AUTO_INCREMENT,
    PrivilegeType NVARCHAR(32) NOT NULL,
    IsRemoved     BIT          NOT NULL DEFAULT (0),
    CONSTRAINT PK_Privileges PRIMARY KEY (PrivilegeId),
    CONSTRAINT CHK_Privileges_PrivilegeType CHECK (LENGTH(PrivilegeType) >= 2),
    CONSTRAINT UNQ_Privileges_PrivilegeType UNIQUE (PrivilegeType)
);

DROP TABLE IF EXISTS UserPrivileges;
CREATE TABLE UserPrivileges
(
    UserId      INT NOT NULL,
    PrivilegeId INT NOT NULL,
    CONSTRAINT PK_UserPrivileges PRIMARY KEY (UserId, PrivilegeId),
    CONSTRAINT FK_UserPrivileges_UserId FOREIGN KEY (UserId) REFERENCES Users (UserId),
    CONSTRAINT FK_UserPrivileges_PrivilegeId FOREIGN KEY (PrivilegeId) REFERENCES Privileges (PrivilegeId)
);

-- Gallery

DROP TABLE IF EXISTS Images;
CREATE TABLE Images
(
    ImageId      INT           NOT NULL AUTO_INCREMENT,
    UserId       INT           NOT NULL,
    Path         NVARCHAR(128) NOT NULL,
    Title        NVARCHAR(64)  NOT NULL,
    TakenDate    DATE          NULL,
    UploadedDate DATE          NOT NULL DEFAULT NOW(),
    IsRemoved    BIT           NOT NULL DEFAULT (0),
    CONSTRAINT PK_Images PRIMARY KEY (ImageId),
    CONSTRAINT FK_Images_UserId FOREIGN KEY (UserId) REFERENCES Users (UserId),
    CONSTRAINT CHK_Images_Path CHECK (LENGTH(Path) >= 2),
    CONSTRAINT UNQ_Images_Path UNIQUE (Path),
    CONSTRAINT CHK_Images_Title CHECK (LENGTH(Title) >= 2)
);

DROP TABLE IF EXISTS Comments;
CREATE TABLE Comments
(
    CommentId    INT           NOT NULL AUTO_INCREMENT,
    ImageId      INT           NOT NULL,
    CommentValue NVARCHAR(512) NOT NULL,
    IsRemoved    BIT           NOT NULL DEFAULT (0),
    CONSTRAINT PK_Comments PRIMARY KEY (CommentId),
    CONSTRAINT FK_Comments_ImageId FOREIGN KEY (ImageId) REFERENCES Images (ImageId),
    CONSTRAINT CHK_Comments_CommentValue CHECK (LENGTH(CommentValue) >= 2)
);

-- Seeding

-- Identity

-- Users

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('liannoi', 'liannoi444@gmail.com', 1, '81f0d7c22167609382b79569c249acd45bc02f123180aa68fde964ae07201b93');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('tclaibourn0', 'dapril0@flavors.me', 1, 'df55bd9eb8fa46e207dabd0d2fac7183a2009c89f2c5bda2559439077a1cb05f');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('dolland1', 'qlaslett1@admin.ch', 1, '980abdbca8cee7ef8d431877e529fcf5d6cae9d9d40efee60361e84e69550494');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('idyott2', 'ucreelman2@sourceforge.net', 1, '1a1175e323d1f401357369e52d43765d821b83dcb2f02c4261fa163535c209aa');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('hbeakes3', 'bmargram3@craigslist.org', 0, '7a0c61ef805130fffcdda7c764505c8ec0faa32b97109b1080bf7d78c0df8071');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('gdewinton4', 'lgiacobilio4@pcworld.com', 0,
        '8f81a5d17c6c96a094f3561167cfb8ecbcab90c22f1cde03df4acea6cc9c81f6');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('nlamprecht5', 'ckabos5@bigcartel.com', 1, 'e1cc5526b8541a6f7a23f967137e447c49e02baf420ef4285064313cbc0684e3');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('cmatisse6', 'ewakelin6@clickbank.net', 0, 'f463dd4ebfc93647822776c7d26128163fc906afead76bdf1b40cc7a8109785b');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('gbastiman7', 'bimison7@hostgator.com', 0, '6e560b6224307810285f562219cdfffeaeaea54eadf8d242e0f5dd8e8f1f6c15');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('resom8', 'mharnor8@twitter.com', 1, '41ca9f60708062c5fba190e73d9aeeee06aa86351433050408061d81b894afea');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('ataffee9', 'bweatherburn9@1688.com', 0, '0223003e51dbfb2e6b58390ba79693fe9d5349a555101c1c4a77cffd07662c3d');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('sdomnina', 'gburrusa@wp.com', 1, '3ddb51bed3a9d57c012718c6cffbcd9b294488e8790c5008cb649527cd248073');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('afellgettb', 'bbengallb@godaddy.com', 0, '3c984a326205e52c758058c4852a4abceaec4aca2ffb0c103feb7230f9a748dc');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('dbrigginshawc', 'nhallihanec@va.gov', 0, '95b91f3e7ad87ce51f3cf1a7f39f014c3de9f010fa7fc2a4ccb9422898b4a684');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('gcostaind', 'cnisardd@github.io', 1, 'f5345ca0f9b21f2511cc2d8dcf7b95750646359eb083463155a43fc7324b42c6');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('dduffette', 'ebelverstonee@lulu.com', 0, '4a269379a3b5ba3934d8510af8966fd1479aa6721ce9e8039b13ca0ea9e260c9');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('ldobellf', 'rfallsf@webeden.co.uk', 0, '74fe1c02d76d4b8afc20e88d676ea7f441b0dcfd1fd29145e7d18f05184f011d');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('jhuzzeyg', 'mcowherdg@flickr.com', 1, '0359714e8a3c8129b137a2534a609124735618e54c955ced229667c6387e0327');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('cmcdugalh', 'dshellshearh@businessinsider.com', 1,
        '316c47549bbae9b45ea677b25d2fe2f3424130fdba7e59b99018e35be100ffdb');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('hwiltshieri', 'hhaimesi@nsw.gov.au', 0, 'bca161ff0110e94a76992d9da940a70c31d8db08a5fd5050a8c47e83bc96aada');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('ablesdillj', 'lgotterj@123-reg.co.uk', 0, 'd64801be1b9048d3a21dec0213da460cc983ef138176d845a816db784211590a');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('credihoughk', 'scassellsk@mac.com', 0, '4fa90fafe107391427c9c9e844bba1b9618f4a746180be0b7f9ea3b78d715caa');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('crackaml', 'bgiraudatl@mac.com', 0, '9f45ef72a9c1959b615b077d5c1ccb694dd78d97cc366400fdcb72403e45797c');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('lheinigm', 'ematokhninm@reverbnation.com', 0,
        'a7de1d5e24e2d06c2d0ac1a2e26cdc9fccac2dfa19e7d54be5fe8b9bc01fa228');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('bchadwinn', 'mlitstern@pcworld.com', 0, '839e1853e0d1e90481ff32235ce5b9d25a23b27360ed32cc5d4f56bac1d5686f');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('aabelevitzo', 'sjeakinso@xing.com', 0, '2c3cf1ac8f1a23c4fb58c3544126db0ba6bfb19c7cdef5e1c4dcc3c4c2253491');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('abedbroughp', 'mlatep@ehow.com', 1, 'd3c5f4e4f53112111432929aed1e74afaa14a5f423a27eff2340bfdcaec3dff6');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('umalleyq', 'abansalq@alibaba.com', 1, '29e2ee2da9f6370b9e64665b3dd2dc9743d873c0a9938fdbbd74585f070056a3');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('bmckelvier', 'ceverixr@gmpg.org', 0, '9b0fdbf28ae88f7ddbf04abab51908077fcf28d49d1670e1a874d24c221e37c8');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('vcloneys', 'zrosenthalers@un.org', 1, '739e677eeff90dee22fc0a4fea49b59b591d849bad98b46fefb4d09e0d076441');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('boconnelt', 'rkinnacht@storify.com', 0, '4e83642fd180b9d039b4146a1563625b0730435686e834bd3adc0f8ce919a7eb');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('mmuspratu', 'lgepheartu@feedburner.com', 1,
        'b0bae69bcdb734edb614b30b54e2791959873daca4cdbf21d3752a5cd5f0ce4c');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('istitwellv', 'aslanev@cisco.com', 1, '2d7f72450347c8ccb38b1214359df6e84b72241e912dde7708613e3a1b38c648');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('meytelw', 'cgrunnellw@scientificamerican.com', 1,
        'cd78878ccbf314ec8f8cabe979eb06c0a3999a6e0af8145af1dcfed698d50897');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('lpulequex', 'ckeenleysidex@whitehouse.gov', 0,
        '6acf3b25a0b42b952191c1f858511e7966c598c7daee13bb64728e743df8744a');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('bciottoy', 'khutfieldy@amazonaws.com', 0, 'd4774f30f819b9ad11fd73bd336488af533fb848148c48362bfea7d3be940ab2');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('ubriddenz', 'rtrasez@canalblog.com', 0, '13d90a79333f3625fabbefeb369fd9b45c527e3d3fbb5a79a5bfba6e723246e0');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('mblague10', 'ajewes10@wp.com', 1, '8cce9fb389eb5f76bae4e8a70ba3ac0f4e7d1e4dd72fb6d480794e85e245ce9f');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('pmapplebeck11', 'mwehner11@behance.net', 1,
        '8670059dc068778ccff1b3136b1d7210c50a310dd2a33f5db9dc1e647dbcbbff');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('gmauchline12', 'rolivera12@va.gov', 1, '5a7cc16cec4d3158dee4b62ce5d71f5f8168ea375748b9c23caff7e070723ff5');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('amcnamee13', 'cwatkiss13@mysql.com', 1, '79fac401e6ed39c0128061064925f4e2eb056f2beff2edd24609126fc7ba5b3e');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('rtoffetto14', 'jtimblett14@shareasale.com', 1,
        '4bb0799dd6513946cf5e1691d875443d90dfe086751b08bc2b2102b2ccb3d624');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('gstaden15', 'trenon15@nbcnews.com', 0, '9455213eff26897e7a180154c3e53921353b40ea6fd55fcd3c8c981201d4f7de');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('vkilgannon16', 'bmegainey16@paypal.com', 1,
        'a940cd97ac9826f2fe769a748c4239b66a2539764817f1914d01c7832983d76e');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('ddonizeau17', 'hrentalll17@jugem.jp', 0, '2533c54395999d791a0982a1b1747a25e0121f919b328065993b437ca8d8e653');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('amcsaul18', 'ggreenfield18@tiny.cc', 1, 'f8e81977587269ebb435a5defc290bdd4073fc52a42c2b5938ad48efe5e7e666');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('cdomingues19', 'grabidge19@wordpress.com', 0,
        'b201d2dcc3b1eb11a282d232563ff42c808f78fe1c19e9d795a4f30ccd328f0a');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('uwarlaw1a', 'bmcgillicuddy1a@cbc.ca', 0, '79d6969790c6355098e8d772ce1a0447a2c384dba99abff1a1de921459f6a350');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('nsteffans1b', 'eslee1b@craigslist.org', 1, 'a7c179850c117e86c54edaadf4ba7ed20b123b924fc58abb07c7822693b89992');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('fzorzi1c', 'clong1c@devhub.com', 1, 'ded7b93a853a26b2a7d99f53cf0394b05b00f88cd03c820bfa0dabe5470da6a0');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('smauditt1d', 'rgasnell1d@cnet.com', 1, '7bdfa4a81387e7af2547f8f3197eeb53c84bdb9de20e428c174779ec35c85374');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('mrosso1e', 'bgetsham1e@delicious.com', 1, '7fdbae4571fff9a19e2ea9cf1344a84e856758a10490280385ff6995e7d73bd8');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('rwarsap1f', 'jgerlts1f@topsy.com', 0, 'ab38bc15e1dea29cc620231062b07bbd309427992132bf31125a95ab81662d2c');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('goaker1g', 'rmcgettigan1g@bigcartel.com', 1,
        '81eb85f7bb8a2521cfafb598c7de12bf2b2c4063a0057486359d6c41d7516ddf');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('cchick1h', 'mthoresbie1h@zdnet.com', 1, 'cf15e1b54795206c98e6103a4a7393662a7df2820354faa75a9ba51eb728c16e');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('ralu1i', 'gsiviour1i@about.com', 1, '33f94741809db53fd630f433fb64846f17273a8fdc9160009732aaccf5a51c18');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('sgallimore1j', 'bforestall1j@msu.edu', 0, '5e06cf05a961a87569e62c4733ee37304cc549694a49f5cb2aa85feeed9395a9');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('septon1k', 'egloy1k@china.com.cn', 0, '1a99de51ad8a8756755919915c2a176c3120b468dc058fcbde003d7af845e1da');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('fcranstoun1l', 'bjaqueme1l@comcast.net', 0,
        '947fefe226476bcf7971840c8162f4173c7be680e9e4233984f2ea46ab7d0d8d');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('tfogg1m', 'tbock1m@clickbank.net', 0, '96c35a7f51c740a675e493c0d2565503e52007c77d2d55bc11fdfd03c0a181dd');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('dphilipard1n', 'vdurtnel1n@networksolutions.com', 1,
        'e55cb0314d8c65c56ae6fef3ceabaabb7d1a959c9aef3ee1e1ede7e8b00b0211');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('aotoole1o', 'owalkinshaw1o@china.com.cn', 0,
        '2a914e66f182afd8ea39949d162af8a3e2df71e49bdb32eec83291e4796437b4');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('asheeran1p', 'jfenners1p@discovery.com', 1,
        '8218b54beb14d77d244bdde09c6df0173bd086a68ba021ae2a1f2a1be87fe9b6');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('jcruft1q', 'dgrigolli1q@blogs.com', 0, '3def5f3e91b9aec45c17e8edcea2b47eabe4b27c77a3d9ca063d3168cb7d10cc');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('omcdougald1r', 'cyitzhak1r@etsy.com', 0, '84cff6bd6dffb2224c91369db93e2dc92b0283e6eab6ee4e9725f219042367fe');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('iroder1s', 'mwindley1s@ucla.edu', 0, '1a8f0b90af475d235e3c304afde2f54b9bbda1d5063b634604c3c5ddc672bf53');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('cstephens1t', 'dkildahl1t@dot.gov', 1, '9f9ac669204e7abd0b7ca859a085d659dbafe3c1b037516f9170290bb93688d7');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('dfalcus1u', 'kmcginlay1u@adobe.com', 1, '4bd90c5dad572125a1a03f3f4ed7b6cc1ef5d9fa342986a53e55fc1a9003282a');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('bduffy1v', 'mberndtssen1v@baidu.com', 0, 'afd685497275d61aa3353802b989dc60cf24f2eeb556f75d21dcd4a7163ed702');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('hmassei1w', 'rgaylor1w@upenn.edu', 0, '3d62092125f6e62ef088473fe67e496bb1302216fd8632fa61011f56857c6f58');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('mbriztman1x', 'mwillcock1x@squidoo.com', 1,
        'f7b2d4c8ec276dfd9392f6d51db8af215dc1e313ab280a2506c4c782cf2b6041');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('acatenot1y', 'jjunkin1y@1und1.de', 0, 'e0b2795892ad6f342fe7992d23eec8d8b29f249c5d4ef1375a5d07cbb4580a0a');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('gbartrop1z', 'fgregolotti1z@exblog.jp', 1, '750e69cdb308a8b5876641d9c5e5cb0e78f7011136fac4af3094d938d9bf69ed');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('cmimmack20', 'staylo20@oakley.com', 1, '6587e96e1f150d908e3d83061ee1b7a0e3d7dda3d77e4c018e5422539992099b');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('wlippatt21', 'abellhanger21@csmonitor.com', 0,
        'ce22c7e5d3d64c0dcaae2b1e720c884e5dda8bde9b7b2256e676ce9969c99d2e');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('psimm22', 'ebarff22@photobucket.com', 1, '3116f0b3d45d65eba8d076ec2c817341da9d9e7753be8604933f8eab7598134c');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('tmaraga23', 'csandlin23@fema.gov', 0, 'f32539a92a21d9dddb83e81f559c6885b879022cc0a74b34a9fd722cd302425e');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('blardnar24', 'dpetch24@ftc.gov', 1, 'fee93759e0c76d8a13dd87403c744c5db3941d821da1c5b7b8272fe829776989');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('dbangle25', 'dstyle25@hp.com', 1, 'e1b38f3644e2e67c14a364107054aed65e32704587182b3309bc88d02bd5e916');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('vstory26', 'bwolfarth26@jalbum.net', 0, '980666b5daef8f224d264f5777c48523d4a9ebda03e3f3167476160171a02a9a');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('fcaddy27', 'mslyme27@admin.ch', 1, '326afdae3aa98682c95339fede1f9df9c5c18e3834c8b01b81179b589df56a40');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('hsloan28', 'tmushawe28@guardian.co.uk', 0, 'd107bc564f337ae84fcd7f897748f2183a3e515ef326d524e0630617e23858f1');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('kkaine29', 'lparnell29@zimbio.com', 0, '0ce486e986b13924854a0253c4cbb0063a54728479cb4eda91adb5390068c982');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('trenfree2a', 'tjachimiak2a@icq.com', 1, '17f641313fbf9d8ca3b6638094719d0792fde4dc11b3f11938f06347c89b69c3');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('aeasum2b', 'nperchard2b@wordpress.com', 1, 'd711527cfd10fe7b7f6fe55f3e79d78d14ed711d088a3af36a8de8b3a532c35b');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('eeble2c', 'ltattersfield2c@lycos.com', 1, '1d9d3cbf21dff2bf92eb57737cf77b74471aebc5acf06197e775f7b410537c39');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('tbuxsey2d', 'hsapsed2d@stanford.edu', 1, '55970d946b946ff93c14e8432d48020776f80dd358b32d5e9c7a36401c472d85');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('lbaert2e', 'cdear2e@photobucket.com', 1, 'c74d418def668ae19c61b06327d9ada66266a3b5cce25b234e6a92e45e3a5419');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('khagwood2f', 'dvockins2f@csmonitor.com', 1,
        '39c46f2e454c6173780230a7db9755492fac6fac598aed75d8482b9d14f5faa0');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('rhoyles2g', 'aranner2g@nifty.com', 0, '7bf644184e6e7183ffd459ca0b1fe90dd5adca9378c1a748c5f203023530c23a');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('kroscamps2h', 'bchumley2h@guardian.co.uk', 1,
        '4aca46480a515bd55586d68ed7d1040580356dc66bd73ca6bbd0226d4a8929b2');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('rmieville2i', 'klopes2i@tumblr.com', 1, 'ba5493ade452ed1060aec0bf4989a39a1e98021a671d072f62f175d56cae2cec');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('aprine2j', 'creidie2j@google.com.au', 0, '97e1a0aa859236b54bce8f9ac5ee5dae9a75f527783e3a9aac285fd5ac6dff71');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('wdormon2k', 'nburren2k@tripadvisor.com', 1,
        '274f458270371acc86b6a90db9c692cb7e3367b3832a7be6ef17acf67b869f93');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('bgairdner2l', 'bklauer2l@merriam-webster.com', 0,
        '22d45d5c2339287c62893d163680bf6e72ddfd11e5cf1859a201bc92da22b3f6');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('sthreadgold2m', 'gtesto2m@businessinsider.com', 0,
        '98427547cfd9ec1119634c62470302c70697f49241082d6b85e47e7e20ca7e81');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('npointon2n', 'esiddle2n@cloudflare.com', 0,
        'f686c8a7b4b7276590addbb7ef2990ae0962abc8fea26ec9fa13e8c7871e4dd4');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('mchaytor2o', 'smatzke2o@qq.com', 0, '7cce68b9f9fa0220dfd0bebed9ed5e9a6510363cb96bd69e2721c01124cf258c');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('lbizzey2p', 'gdelafield2p@naver.com', 0, '33f94eabcf6ba575b62897cea68c60dd2ae7d4cda7e74c96075b1e2d989b918e');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('jraden2q', 'wblampey2q@boston.com', 0, 'f74f7f83d64de3f5e3c4bb843f5c2d69443191c835ab61ef9d5e2e09d13dd2cc');

INSERT INTO Users (Username, Email, EmailConfirmed, PasswordHash)
VALUES ('jpiggen2r', 'msommerscales2r@desdev.cn', 0,
        '9627b58fd850fd24630a8da2149e5441f9168236ab3ae313327502d4f432ea28');

-- Roles

INSERT INTO Roles (Name)
VALUES ('User');

INSERT INTO Roles (Name)
VALUES ('Administrator');

-- UserRoles

INSERT INTO UserRoles (UserId, RoleId)
VALUES (1, 2);

-- Privileges

INSERT INTO Privileges (PrivilegeType)
VALUES ('Read');

INSERT INTO Privileges (PrivilegeType)
VALUES ('Write');

-- UserPrivileges

INSERT INTO UserPrivileges(UserId, PrivilegeId)
VALUES (1, 1);

INSERT INTO UserPrivileges(UserId, PrivilegeId)
VALUES (1, 2);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (2, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (3, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (4, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (5, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (6, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (7, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (8, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (9, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (10, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (11, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (12, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (13, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (14, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (15, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (16, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (17, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (18, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (19, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (20, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (21, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (22, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (23, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (24, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (25, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (26, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (27, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (28, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (29, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (30, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (31, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (32, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (33, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (34, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (35, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (36, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (37, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (38, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (39, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (40, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (41, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (42, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (43, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (44, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (45, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (46, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (47, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (48, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (49, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (50, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (51, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (52, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (53, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (54, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (55, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (56, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (57, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (58, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (59, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (60, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (61, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (62, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (63, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (64, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (65, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (66, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (67, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (68, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (69, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (70, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (71, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (72, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (73, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (74, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (75, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (76, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (77, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (78, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (79, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (80, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (81, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (82, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (83, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (84, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (85, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (86, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (87, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (88, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (89, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (90, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (91, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (92, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (93, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (94, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (95, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (96, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (97, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (98, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (99, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (100, 1);

INSERT INTO UserPrivileges (UserId, PrivilegeId)
VALUES (101, 1);
