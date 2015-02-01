/*
 Navicat Premium Data Transfer

 Source Server         : ONMINE
 Source Server Type    : SQL Server
 Source Server Version : 12000013
 Source Host           : r2vaoq967q.database.windows.net
 Source Database       : onmine
 Source Schema         : dbo

 Target Server Type    : SQL Server
 Target Server Version : 12000013
 File Encoding         : utf-8

 Date: 02/01/2015 01:57:26 AM
*/

-- ----------------------------
--  Table structure for gamer
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo].[gamer]') AND type IN ('U'))
	DROP TABLE [dbo].[gamer]
GO
CREATE TABLE [dbo].[gamer] (
	[id] int IDENTITY(1,1) NOT NULL,
	[email] varchar(max) COLLATE Cyrillic_General_CI_AS NOT NULL,
	[surname] varchar(max) COLLATE Cyrillic_General_CI_AS NULL,
	[name] varchar(max) COLLATE Cyrillic_General_CI_AS NULL,
	[password] varchar(max) COLLATE Cyrillic_General_CI_AS NOT NULL,
	[birthdate] datetime2(0) NULL,
	[preferedsize] int NULL,
	[isconfirmed] int NOT NULL DEFAULT ((0)),
	CONSTRAINT [PK__gamer__3213E83F20A8D0B9] PRIMARY KEY CLUSTERED ([id]) 
	WITH (IGNORE_DUP_KEY = OFF)
)
GO

-- ----------------------------
--  Table structure for game
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo].[game]') AND type IN ('U'))
	DROP TABLE [dbo].[game]
GO
CREATE TABLE [dbo].[game] (
	[id] int IDENTITY(1,1) NOT NULL,
	[guid] varchar(max) COLLATE Cyrillic_General_CI_AS NOT NULL,
	[gametypeid] int NOT NULL,
	[fieldid] int NOT NULL,
	[begintime] datetime2(0) NULL,
	[endtime] datetime2(0) NULL,
	[pin] int NULL,
	[maxplayers] int NOT NULL DEFAULT ((1)),
	CONSTRAINT [PK__game__3213E83F65AB933E] PRIMARY KEY CLUSTERED ([id]) 
	WITH (IGNORE_DUP_KEY = OFF)
)
GO

-- ----------------------------
--  Table structure for friendlist
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo].[friendlist]') AND type IN ('U'))
	DROP TABLE [dbo].[friendlist]
GO
CREATE TABLE [dbo].[friendlist] (
	[gamerid] int NOT NULL,
	[friendid] int NOT NULL,
	[status] int NULL,
	CONSTRAINT [PK__friendli__CA72D24BECB274A0] PRIMARY KEY CLUSTERED ([gamerid],[friendid]) 
	WITH (IGNORE_DUP_KEY = OFF)
)
GO

-- ----------------------------
--  Table structure for gametype
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo].[gametype]') AND type IN ('U'))
	DROP TABLE [dbo].[gametype]
GO
CREATE TABLE [dbo].[gametype] (
	[id] int NOT NULL,
	[name] varchar(max) COLLATE Cyrillic_General_CI_AS NULL,
	[sizex] int NULL,
	[sizey] int NULL,
	[count] int NULL,
	CONSTRAINT [PK__gametype__3213E83F80DF3259] PRIMARY KEY CLUSTERED ([id]) 
	WITH (IGNORE_DUP_KEY = OFF)
)
GO

-- ----------------------------
--  Table structure for field
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo].[field]') AND type IN ('U'))
	DROP TABLE [dbo].[field]
GO
CREATE TABLE [dbo].[field] (
	[id] int NOT NULL,
	[guid] varchar(max) COLLATE Cyrillic_General_CI_AS NOT NULL,
	[sizex] int NOT NULL,
	[sizey] int NOT NULL,
	[minesarray] text COLLATE Cyrillic_General_CI_AS NOT NULL,
	CONSTRAINT [PK__field__3213E83FDB68580B] PRIMARY KEY CLUSTERED ([id]) 
	WITH (IGNORE_DUP_KEY = OFF)
)
GO

-- ----------------------------
--  Table structure for move
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo].[move]') AND type IN ('U'))
	DROP TABLE [dbo].[move]
GO
CREATE TABLE [dbo].[move] (
	[id] int NOT NULL,
	[gameid] int NOT NULL,
	[gamerid] int NOT NULL,
	[time] datetime2(0) NOT NULL,
	[coordx] int NOT NULL,
	[coordy] int NOT NULL,
	CONSTRAINT [PK__move__3213E83FF11A3382] PRIMARY KEY CLUSTERED ([id]) 
	WITH (IGNORE_DUP_KEY = OFF)
)
GO

-- ----------------------------
--  Table structure for hint
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo].[hint]') AND type IN ('U'))
	DROP TABLE [dbo].[hint]
GO
CREATE TABLE [dbo].[hint] (
	[gameid] int NOT NULL,
	[gamerid] int NOT NULL,
	[hintsleft] int NOT NULL DEFAULT ((0)),
	CONSTRAINT [PK__hint__267A7C91CEFFACF3] PRIMARY KEY CLUSTERED ([gameid],[gamerid]) 
	WITH (IGNORE_DUP_KEY = OFF)
)
GO

-- ----------------------------
--  Table structure for links
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo].[links]') AND type IN ('U'))
	DROP TABLE [dbo].[links]
GO
CREATE TABLE [dbo].[links] (
	[gamerid] int NOT NULL,
	[hash] varchar(max) COLLATE Cyrillic_General_CI_AS NULL,
	CONSTRAINT [PK__links__CE9C4EBE1ADBEC39] PRIMARY KEY CLUSTERED ([gamerid]) 
	WITH (IGNORE_DUP_KEY = OFF)
)
GO

-- ----------------------------
--  Table structure for message
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo].[message]') AND type IN ('U'))
	DROP TABLE [dbo].[message]
GO
CREATE TABLE [dbo].[message] (
	[id] int NOT NULL,
	[text] text COLLATE Cyrillic_General_CI_AS NOT NULL,
	[gamerid] int NOT NULL,
	[isprivate] int NOT NULL DEFAULT ((0)),
	[recipientid] int NULL,
	[gameid] int NULL,
	CONSTRAINT [PK__message__3213E83F0BD56D22] PRIMARY KEY CLUSTERED ([id]) 
	WITH (IGNORE_DUP_KEY = OFF)
)
GO


-- ----------------------------
--  Foreign keys structure for table game
-- ----------------------------
ALTER TABLE [dbo].[game] ADD
	CONSTRAINT [gametype_game_key] FOREIGN KEY ([gametypeid]) REFERENCES [dbo].[gametype] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT [field_game_key] FOREIGN KEY ([fieldid]) REFERENCES [dbo].[field] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
--  Foreign keys structure for table friendlist
-- ----------------------------
ALTER TABLE [dbo].[friendlist] ADD
	CONSTRAINT [gamer_friendlist_key] FOREIGN KEY ([gamerid]) REFERENCES [dbo].[gamer] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT [friend_key] FOREIGN KEY ([friendid]) REFERENCES [dbo].[gamer] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
--  Foreign keys structure for table move
-- ----------------------------
ALTER TABLE [dbo].[move] ADD
	CONSTRAINT [game_key] FOREIGN KEY ([gameid]) REFERENCES [dbo].[game] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT [gamer_key] FOREIGN KEY ([gamerid]) REFERENCES [dbo].[gamer] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
--  Foreign keys structure for table hint
-- ----------------------------
ALTER TABLE [dbo].[hint] ADD
	CONSTRAINT [game_hint_key] FOREIGN KEY ([gameid]) REFERENCES [dbo].[game] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT [gamer_hint_key] FOREIGN KEY ([gamerid]) REFERENCES [dbo].[gamer] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
--  Foreign keys structure for table links
-- ----------------------------
ALTER TABLE [dbo].[links] ADD
	CONSTRAINT [gamer_confirmation] FOREIGN KEY ([gamerid]) REFERENCES [dbo].[gamer] ([id]) ON DELETE CASCADE ON UPDATE CASCADE
GO

-- ----------------------------
--  Foreign keys structure for table message
-- ----------------------------
ALTER TABLE [dbo].[message] ADD
	CONSTRAINT [gamer_message] FOREIGN KEY ([gamerid]) REFERENCES [dbo].[gamer] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT [recipient_message] FOREIGN KEY ([recipientid]) REFERENCES [dbo].[gamer] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT [game_message] FOREIGN KEY ([gameid]) REFERENCES [dbo].[game] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

