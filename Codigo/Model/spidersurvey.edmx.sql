
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 01/30/2015 10:42:09
-- Generated from EDMX file: C:\Users\Douglas\Documents\survey-tcc\Codigo\Model\spidersurvey.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [mysurvey];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK__aspnet_Me__Appli__3A81B327]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[aspnet_Membership] DROP CONSTRAINT [FK__aspnet_Me__Appli__3A81B327];
GO
IF OBJECT_ID(N'[dbo].[FK__aspnet_Me__UserI__3B75D760]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[aspnet_Membership] DROP CONSTRAINT [FK__aspnet_Me__UserI__3B75D760];
GO
IF OBJECT_ID(N'[dbo].[FK__aspnet_Pa__Appli__6C190EBB]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[aspnet_Paths] DROP CONSTRAINT [FK__aspnet_Pa__Appli__6C190EBB];
GO
IF OBJECT_ID(N'[dbo].[FK__aspnet_Pe__PathI__71D1E811]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[aspnet_PersonalizationAllUsers] DROP CONSTRAINT [FK__aspnet_Pe__PathI__71D1E811];
GO
IF OBJECT_ID(N'[dbo].[FK__aspnet_Pe__PathI__75A278F5]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[aspnet_PersonalizationPerUser] DROP CONSTRAINT [FK__aspnet_Pe__PathI__75A278F5];
GO
IF OBJECT_ID(N'[dbo].[FK__aspnet_Pe__UserI__76969D2E]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[aspnet_PersonalizationPerUser] DROP CONSTRAINT [FK__aspnet_Pe__UserI__76969D2E];
GO
IF OBJECT_ID(N'[dbo].[FK__aspnet_Pr__UserI__4F7CD00D]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[aspnet_Profile] DROP CONSTRAINT [FK__aspnet_Pr__UserI__4F7CD00D];
GO
IF OBJECT_ID(N'[dbo].[FK__aspnet_Ro__Appli__59063A47]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[aspnet_Roles] DROP CONSTRAINT [FK__aspnet_Ro__Appli__59063A47];
GO
IF OBJECT_ID(N'[dbo].[FK__aspnet_Us__Appli__2A4B4B5E]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[aspnet_Users] DROP CONSTRAINT [FK__aspnet_Us__Appli__2A4B4B5E];
GO
IF OBJECT_ID(N'[dbo].[FK__aspnet_Us__RoleI__5DCAEF64]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[aspnet_UsersInRoles] DROP CONSTRAINT [FK__aspnet_Us__RoleI__5DCAEF64];
GO
IF OBJECT_ID(N'[dbo].[FK__aspnet_Us__UserI__5CD6CB2B]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[aspnet_UsersInRoles] DROP CONSTRAINT [FK__aspnet_Us__UserI__5CD6CB2B];
GO
IF OBJECT_ID(N'[dbo].[FK_TB_QUESTAO_FKIndex1]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TB_QUESTAO] DROP CONSTRAINT [FK_TB_QUESTAO_FKIndex1];
GO
IF OBJECT_ID(N'[dbo].[FK_TB_QUESTAO_FKIndex2]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TB_QUESTAO] DROP CONSTRAINT [FK_TB_QUESTAO_FKIndex2];
GO
IF OBJECT_ID(N'[dbo].[FK_TB_RESPOSTA_FKIndex1]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TB_RESPOSTA] DROP CONSTRAINT [FK_TB_RESPOSTA_FKIndex1];
GO
IF OBJECT_ID(N'[dbo].[FK_TB_RESPOSTA_FKIndex2]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TB_RESPOSTA] DROP CONSTRAINT [FK_TB_RESPOSTA_FKIndex2];
GO
IF OBJECT_ID(N'[dbo].[FK_TB_SURVEY_FKIndex1]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TB_SURVEY] DROP CONSTRAINT [FK_TB_SURVEY_FKIndex1];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[aspnet_Applications]', 'U') IS NOT NULL
    DROP TABLE [dbo].[aspnet_Applications];
GO
IF OBJECT_ID(N'[dbo].[aspnet_Membership]', 'U') IS NOT NULL
    DROP TABLE [dbo].[aspnet_Membership];
GO
IF OBJECT_ID(N'[dbo].[aspnet_Paths]', 'U') IS NOT NULL
    DROP TABLE [dbo].[aspnet_Paths];
GO
IF OBJECT_ID(N'[dbo].[aspnet_PersonalizationAllUsers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[aspnet_PersonalizationAllUsers];
GO
IF OBJECT_ID(N'[dbo].[aspnet_PersonalizationPerUser]', 'U') IS NOT NULL
    DROP TABLE [dbo].[aspnet_PersonalizationPerUser];
GO
IF OBJECT_ID(N'[dbo].[aspnet_Profile]', 'U') IS NOT NULL
    DROP TABLE [dbo].[aspnet_Profile];
GO
IF OBJECT_ID(N'[dbo].[aspnet_Roles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[aspnet_Roles];
GO
IF OBJECT_ID(N'[dbo].[aspnet_SchemaVersions]', 'U') IS NOT NULL
    DROP TABLE [dbo].[aspnet_SchemaVersions];
GO
IF OBJECT_ID(N'[dbo].[aspnet_Users]', 'U') IS NOT NULL
    DROP TABLE [dbo].[aspnet_Users];
GO
IF OBJECT_ID(N'[dbo].[aspnet_UsersInRoles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[aspnet_UsersInRoles];
GO
IF OBJECT_ID(N'[dbo].[aspnet_WebEvent_Events]', 'U') IS NOT NULL
    DROP TABLE [dbo].[aspnet_WebEvent_Events];
GO
IF OBJECT_ID(N'[dbo].[TB_ENTREVISTADO]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TB_ENTREVISTADO];
GO
IF OBJECT_ID(N'[dbo].[TB_ITENS_DA_QUESTAO]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TB_ITENS_DA_QUESTAO];
GO
IF OBJECT_ID(N'[dbo].[TB_QUESTAO]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TB_QUESTAO];
GO
IF OBJECT_ID(N'[dbo].[TB_RESPONSAVEL]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TB_RESPONSAVEL];
GO
IF OBJECT_ID(N'[dbo].[TB_RESPOSTA]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TB_RESPOSTA];
GO
IF OBJECT_ID(N'[dbo].[TB_SURVEY]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TB_SURVEY];
GO
IF OBJECT_ID(N'[mysurveyModelStoreContainer].[vw_aspnet_Applications]', 'U') IS NOT NULL
    DROP TABLE [mysurveyModelStoreContainer].[vw_aspnet_Applications];
GO
IF OBJECT_ID(N'[mysurveyModelStoreContainer].[vw_aspnet_MembershipUsers]', 'U') IS NOT NULL
    DROP TABLE [mysurveyModelStoreContainer].[vw_aspnet_MembershipUsers];
GO
IF OBJECT_ID(N'[mysurveyModelStoreContainer].[vw_aspnet_Profiles]', 'U') IS NOT NULL
    DROP TABLE [mysurveyModelStoreContainer].[vw_aspnet_Profiles];
GO
IF OBJECT_ID(N'[mysurveyModelStoreContainer].[vw_aspnet_Roles]', 'U') IS NOT NULL
    DROP TABLE [mysurveyModelStoreContainer].[vw_aspnet_Roles];
GO
IF OBJECT_ID(N'[mysurveyModelStoreContainer].[vw_aspnet_Users]', 'U') IS NOT NULL
    DROP TABLE [mysurveyModelStoreContainer].[vw_aspnet_Users];
GO
IF OBJECT_ID(N'[mysurveyModelStoreContainer].[vw_aspnet_UsersInRoles]', 'U') IS NOT NULL
    DROP TABLE [mysurveyModelStoreContainer].[vw_aspnet_UsersInRoles];
GO
IF OBJECT_ID(N'[mysurveyModelStoreContainer].[vw_aspnet_WebPartState_Paths]', 'U') IS NOT NULL
    DROP TABLE [mysurveyModelStoreContainer].[vw_aspnet_WebPartState_Paths];
GO
IF OBJECT_ID(N'[mysurveyModelStoreContainer].[vw_aspnet_WebPartState_Shared]', 'U') IS NOT NULL
    DROP TABLE [mysurveyModelStoreContainer].[vw_aspnet_WebPartState_Shared];
GO
IF OBJECT_ID(N'[mysurveyModelStoreContainer].[vw_aspnet_WebPartState_User]', 'U') IS NOT NULL
    DROP TABLE [mysurveyModelStoreContainer].[vw_aspnet_WebPartState_User];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'TB_ENTREVISTADO'
CREATE TABLE [dbo].[TB_ENTREVISTADO] (
    [idTB_ENTREVISTADO] int  NOT NULL identity(0,1),
    [NOME] varchar(45)  NULL,
    [EMAIL] varchar(45)  NULL,
    [SOBRENOME] varchar(45)  NULL
);
GO

-- Creating table 'TB_ITENS_DA_QUESTAO'
CREATE TABLE [dbo].[TB_ITENS_DA_QUESTAO] (
    [idTB_ITENS_DA_QUESTAO] int  NOT NULL identity(0,1),
    [ItemA] varchar(max)  NULL,
    [ItemB] varchar(max)  NULL,
    [ItemC] varchar(max)  NULL,
    [ItemD] varchar(max)  NULL,
    [ItemE] varchar(max)  NULL
);
GO

-- Creating table 'TB_QUESTAO'
CREATE TABLE [dbo].[TB_QUESTAO] (
    [id_Questao] int  NOT NULL identity(0,1),
    [TB_ITENS_DA_QUESTAO_idTB_ITENS_DA_QUESTAO] int  NULL,
    [TB_SURVEY_id_Survey] int  NOT NULL,
    [Tipo] varchar(10)  NULL,
    [Pergunta] varchar(max)  NOT NULL,
    [Img] varbinary(max)  NULL,
    [Randomica] bit  NULL,
    [Obrigatoria] bit  NULL,
    [Codigo] bit  NULL,
    [Linguagem] varchar(10)  NULL
);
GO

-- Creating table 'TB_RESPONSAVEL'
CREATE TABLE [dbo].[TB_RESPONSAVEL] (
    [id_Responsavel] int  NOT NULL identity(0,1),
    [nome] varchar(45)  NOT NULL,
    [email] varchar(45)  NOT NULL,
    [sobrenome] varchar(45)  NOT NULL
);
GO

-- Creating table 'TB_RESPOSTA'
CREATE TABLE [dbo].[TB_RESPOSTA] (
    [id_Resposta] int  NOT NULL identity(0,1),
    [TB_ENTREVISTADO_idTB_ENTREVISTADO] int  NOT NULL,
    [TB_QUESTAO_id_Questao] int  NOT NULL,
    [Resposta] varchar(max)  NULL,
    [Item] varchar(max)  NULL
);
GO

-- Creating table 'TB_SURVEY'
CREATE TABLE [dbo].[TB_SURVEY] (
    [id_Survey] int  NOT NULL identity(0,1),
    [TB_RESPONSAVEL_id_Responsavel] int  NOT NULL,
    [Titulo] varchar(45)  NOT NULL,
    [Subtitulo] varchar(45)  NOT NULL,
    [Data_Criacao] datetime  NOT NULL,
    [Data_fim] datetime  NULL,
    [flag_ativo] bit  NOT NULL
);
GO

-- Creating table 'aspnet_Applications'
CREATE TABLE [dbo].[aspnet_Applications] (
    [ApplicationName] nvarchar(256)  NOT NULL,
    [LoweredApplicationName] nvarchar(256)  NOT NULL,
    [ApplicationId] uniqueidentifier  NOT NULL,
    [Description] nvarchar(256)  NULL
);
GO

-- Creating table 'aspnet_Membership'
CREATE TABLE [dbo].[aspnet_Membership] (
    [ApplicationId] uniqueidentifier  NOT NULL,
    [UserId] uniqueidentifier  NOT NULL,
    [Password] nvarchar(128)  NOT NULL,
    [PasswordFormat] int  NOT NULL,
    [PasswordSalt] nvarchar(128)  NOT NULL,
    [MobilePIN] nvarchar(16)  NULL,
    [Email] nvarchar(256)  NULL,
    [LoweredEmail] nvarchar(256)  NULL,
    [PasswordQuestion] nvarchar(256)  NULL,
    [PasswordAnswer] nvarchar(128)  NULL,
    [IsApproved] bit  NOT NULL,
    [IsLockedOut] bit  NOT NULL,
    [CreateDate] datetime  NOT NULL,
    [LastLoginDate] datetime  NOT NULL,
    [LastPasswordChangedDate] datetime  NOT NULL,
    [LastLockoutDate] datetime  NOT NULL,
    [FailedPasswordAttemptCount] int  NOT NULL,
    [FailedPasswordAttemptWindowStart] datetime  NOT NULL,
    [FailedPasswordAnswerAttemptCount] int  NOT NULL,
    [FailedPasswordAnswerAttemptWindowStart] datetime  NOT NULL,
    [Comment] nvarchar(max)  NULL
);
GO

-- Creating table 'aspnet_Paths'
CREATE TABLE [dbo].[aspnet_Paths] (
    [ApplicationId] uniqueidentifier  NOT NULL,
    [PathId] uniqueidentifier  NOT NULL,
    [Path] nvarchar(256)  NOT NULL,
    [LoweredPath] nvarchar(256)  NOT NULL
);
GO

-- Creating table 'aspnet_PersonalizationAllUsers'
CREATE TABLE [dbo].[aspnet_PersonalizationAllUsers] (
    [PathId] uniqueidentifier  NOT NULL,
    [PageSettings] varbinary(max)  NOT NULL,
    [LastUpdatedDate] datetime  NOT NULL
);
GO

-- Creating table 'aspnet_PersonalizationPerUser'
CREATE TABLE [dbo].[aspnet_PersonalizationPerUser] (
    [Id] uniqueidentifier  NOT NULL,
    [PathId] uniqueidentifier  NULL,
    [UserId] uniqueidentifier  NULL,
    [PageSettings] varbinary(max)  NOT NULL,
    [LastUpdatedDate] datetime  NOT NULL
);
GO

-- Creating table 'aspnet_Profile'
CREATE TABLE [dbo].[aspnet_Profile] (
    [UserId] uniqueidentifier  NOT NULL,
    [PropertyNames] nvarchar(max)  NOT NULL,
    [PropertyValuesString] nvarchar(max)  NOT NULL,
    [PropertyValuesBinary] varbinary(max)  NOT NULL,
    [LastUpdatedDate] datetime  NOT NULL
);
GO

-- Creating table 'aspnet_Roles'
CREATE TABLE [dbo].[aspnet_Roles] (
    [ApplicationId] uniqueidentifier  NOT NULL,
    [RoleId] uniqueidentifier  NOT NULL,
    [RoleName] nvarchar(256)  NOT NULL,
    [LoweredRoleName] nvarchar(256)  NOT NULL,
    [Description] nvarchar(256)  NULL
);
GO

-- Creating table 'aspnet_SchemaVersions'
CREATE TABLE [dbo].[aspnet_SchemaVersions] (
    [Feature] nvarchar(128)  NOT NULL,
    [CompatibleSchemaVersion] nvarchar(128)  NOT NULL,
    [IsCurrentVersion] bit  NOT NULL
);
GO

-- Creating table 'aspnet_Users'
CREATE TABLE [dbo].[aspnet_Users] (
    [ApplicationId] uniqueidentifier  NOT NULL,
    [UserId] uniqueidentifier  NOT NULL,
    [UserName] nvarchar(256)  NOT NULL,
    [LoweredUserName] nvarchar(256)  NOT NULL,
    [MobileAlias] nvarchar(16)  NULL,
    [IsAnonymous] bit  NOT NULL,
    [LastActivityDate] datetime  NOT NULL
);
GO

-- Creating table 'aspnet_WebEvent_Events'
CREATE TABLE [dbo].[aspnet_WebEvent_Events] (
    [EventId] char(32)  NOT NULL,
    [EventTimeUtc] datetime  NOT NULL,
    [EventTime] datetime  NOT NULL,
    [EventType] nvarchar(256)  NOT NULL,
    [EventSequence] decimal(19,0)  NOT NULL,
    [EventOccurrence] decimal(19,0)  NOT NULL,
    [EventCode] int  NOT NULL,
    [EventDetailCode] int  NOT NULL,
    [Message] nvarchar(1024)  NULL,
    [ApplicationPath] nvarchar(256)  NULL,
    [ApplicationVirtualPath] nvarchar(256)  NULL,
    [MachineName] nvarchar(256)  NOT NULL,
    [RequestUrl] nvarchar(1024)  NULL,
    [ExceptionType] nvarchar(256)  NULL,
    [Details] nvarchar(max)  NULL
);
GO

-- Creating table 'vw_aspnet_Applications'
CREATE TABLE [dbo].[vw_aspnet_Applications] (
    [ApplicationName] nvarchar(256)  NOT NULL,
    [LoweredApplicationName] nvarchar(256)  NOT NULL,
    [ApplicationId] uniqueidentifier  NOT NULL,
    [Description] nvarchar(256)  NULL
);
GO

-- Creating table 'vw_aspnet_MembershipUsers'
CREATE TABLE [dbo].[vw_aspnet_MembershipUsers] (
    [UserId] uniqueidentifier  NOT NULL,
    [PasswordFormat] int  NOT NULL,
    [MobilePIN] nvarchar(16)  NULL,
    [Email] nvarchar(256)  NULL,
    [LoweredEmail] nvarchar(256)  NULL,
    [PasswordQuestion] nvarchar(256)  NULL,
    [PasswordAnswer] nvarchar(128)  NULL,
    [IsApproved] bit  NOT NULL,
    [IsLockedOut] bit  NOT NULL,
    [CreateDate] datetime  NOT NULL,
    [LastLoginDate] datetime  NOT NULL,
    [LastPasswordChangedDate] datetime  NOT NULL,
    [LastLockoutDate] datetime  NOT NULL,
    [FailedPasswordAttemptCount] int  NOT NULL,
    [FailedPasswordAttemptWindowStart] datetime  NOT NULL,
    [FailedPasswordAnswerAttemptCount] int  NOT NULL,
    [FailedPasswordAnswerAttemptWindowStart] datetime  NOT NULL,
    [Comment] nvarchar(max)  NULL,
    [ApplicationId] uniqueidentifier  NOT NULL,
    [UserName] nvarchar(256)  NOT NULL,
    [MobileAlias] nvarchar(16)  NULL,
    [IsAnonymous] bit  NOT NULL,
    [LastActivityDate] datetime  NOT NULL
);
GO

-- Creating table 'vw_aspnet_Profiles'
CREATE TABLE [dbo].[vw_aspnet_Profiles] (
    [UserId] uniqueidentifier  NOT NULL,
    [LastUpdatedDate] datetime  NOT NULL,
    [DataSize] int  NULL
);
GO

-- Creating table 'vw_aspnet_Roles'
CREATE TABLE [dbo].[vw_aspnet_Roles] (
    [ApplicationId] uniqueidentifier  NOT NULL,
    [RoleId] uniqueidentifier  NOT NULL,
    [RoleName] nvarchar(256)  NOT NULL,
    [LoweredRoleName] nvarchar(256)  NOT NULL,
    [Description] nvarchar(256)  NULL
);
GO

-- Creating table 'vw_aspnet_Users'
CREATE TABLE [dbo].[vw_aspnet_Users] (
    [ApplicationId] uniqueidentifier  NOT NULL,
    [UserId] uniqueidentifier  NOT NULL,
    [UserName] nvarchar(256)  NOT NULL,
    [LoweredUserName] nvarchar(256)  NOT NULL,
    [MobileAlias] nvarchar(16)  NULL,
    [IsAnonymous] bit  NOT NULL,
    [LastActivityDate] datetime  NOT NULL
);
GO

-- Creating table 'vw_aspnet_UsersInRoles'
CREATE TABLE [dbo].[vw_aspnet_UsersInRoles] (
    [UserId] uniqueidentifier  NOT NULL,
    [RoleId] uniqueidentifier  NOT NULL
);
GO

-- Creating table 'vw_aspnet_WebPartState_Paths'
CREATE TABLE [dbo].[vw_aspnet_WebPartState_Paths] (
    [ApplicationId] uniqueidentifier  NOT NULL,
    [PathId] uniqueidentifier  NOT NULL,
    [Path] nvarchar(256)  NOT NULL,
    [LoweredPath] nvarchar(256)  NOT NULL
);
GO

-- Creating table 'vw_aspnet_WebPartState_Shared'
CREATE TABLE [dbo].[vw_aspnet_WebPartState_Shared] (
    [PathId] uniqueidentifier  NOT NULL,
    [DataSize] int  NULL,
    [LastUpdatedDate] datetime  NOT NULL
);
GO

-- Creating table 'vw_aspnet_WebPartState_User'
CREATE TABLE [dbo].[vw_aspnet_WebPartState_User] (
    [PathId] uniqueidentifier  NULL,
    [UserId] uniqueidentifier  NULL,
    [DataSize] int  NULL,
    [LastUpdatedDate] datetime  NOT NULL
);
GO

-- Creating table 'aspnet_UsersInRoles'
CREATE TABLE [dbo].[aspnet_UsersInRoles] (
    [aspnet_Roles_RoleId] uniqueidentifier  NOT NULL,
    [aspnet_Users_UserId] uniqueidentifier  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [idTB_ENTREVISTADO] in table 'TB_ENTREVISTADO'
ALTER TABLE [dbo].[TB_ENTREVISTADO]
ADD CONSTRAINT [PK_TB_ENTREVISTADO]
    PRIMARY KEY CLUSTERED ([idTB_ENTREVISTADO] ASC);
GO

-- Creating primary key on [idTB_ITENS_DA_QUESTAO] in table 'TB_ITENS_DA_QUESTAO'
ALTER TABLE [dbo].[TB_ITENS_DA_QUESTAO]
ADD CONSTRAINT [PK_TB_ITENS_DA_QUESTAO]
    PRIMARY KEY CLUSTERED ([idTB_ITENS_DA_QUESTAO] ASC);
GO

-- Creating primary key on [id_Questao] in table 'TB_QUESTAO'
ALTER TABLE [dbo].[TB_QUESTAO]
ADD CONSTRAINT [PK_TB_QUESTAO]
    PRIMARY KEY CLUSTERED ([id_Questao] ASC);
GO

-- Creating primary key on [id_Responsavel] in table 'TB_RESPONSAVEL'
ALTER TABLE [dbo].[TB_RESPONSAVEL]
ADD CONSTRAINT [PK_TB_RESPONSAVEL]
    PRIMARY KEY CLUSTERED ([id_Responsavel] ASC);
GO

-- Creating primary key on [id_Resposta] in table 'TB_RESPOSTA'
ALTER TABLE [dbo].[TB_RESPOSTA]
ADD CONSTRAINT [PK_TB_RESPOSTA]
    PRIMARY KEY CLUSTERED ([id_Resposta] ASC);
GO

-- Creating primary key on [id_Survey] in table 'TB_SURVEY'
ALTER TABLE [dbo].[TB_SURVEY]
ADD CONSTRAINT [PK_TB_SURVEY]
    PRIMARY KEY CLUSTERED ([id_Survey] ASC);
GO

-- Creating primary key on [ApplicationId] in table 'aspnet_Applications'
ALTER TABLE [dbo].[aspnet_Applications]
ADD CONSTRAINT [PK_aspnet_Applications]
    PRIMARY KEY CLUSTERED ([ApplicationId] ASC);
GO

-- Creating primary key on [UserId] in table 'aspnet_Membership'
ALTER TABLE [dbo].[aspnet_Membership]
ADD CONSTRAINT [PK_aspnet_Membership]
    PRIMARY KEY CLUSTERED ([UserId] ASC);
GO

-- Creating primary key on [PathId] in table 'aspnet_Paths'
ALTER TABLE [dbo].[aspnet_Paths]
ADD CONSTRAINT [PK_aspnet_Paths]
    PRIMARY KEY CLUSTERED ([PathId] ASC);
GO

-- Creating primary key on [PathId] in table 'aspnet_PersonalizationAllUsers'
ALTER TABLE [dbo].[aspnet_PersonalizationAllUsers]
ADD CONSTRAINT [PK_aspnet_PersonalizationAllUsers]
    PRIMARY KEY CLUSTERED ([PathId] ASC);
GO

-- Creating primary key on [Id] in table 'aspnet_PersonalizationPerUser'
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]
ADD CONSTRAINT [PK_aspnet_PersonalizationPerUser]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [UserId] in table 'aspnet_Profile'
ALTER TABLE [dbo].[aspnet_Profile]
ADD CONSTRAINT [PK_aspnet_Profile]
    PRIMARY KEY CLUSTERED ([UserId] ASC);
GO

-- Creating primary key on [RoleId] in table 'aspnet_Roles'
ALTER TABLE [dbo].[aspnet_Roles]
ADD CONSTRAINT [PK_aspnet_Roles]
    PRIMARY KEY CLUSTERED ([RoleId] ASC);
GO

-- Creating primary key on [Feature], [CompatibleSchemaVersion] in table 'aspnet_SchemaVersions'
ALTER TABLE [dbo].[aspnet_SchemaVersions]
ADD CONSTRAINT [PK_aspnet_SchemaVersions]
    PRIMARY KEY CLUSTERED ([Feature], [CompatibleSchemaVersion] ASC);
GO

-- Creating primary key on [UserId] in table 'aspnet_Users'
ALTER TABLE [dbo].[aspnet_Users]
ADD CONSTRAINT [PK_aspnet_Users]
    PRIMARY KEY CLUSTERED ([UserId] ASC);
GO

-- Creating primary key on [EventId] in table 'aspnet_WebEvent_Events'
ALTER TABLE [dbo].[aspnet_WebEvent_Events]
ADD CONSTRAINT [PK_aspnet_WebEvent_Events]
    PRIMARY KEY CLUSTERED ([EventId] ASC);
GO

-- Creating primary key on [ApplicationName], [LoweredApplicationName], [ApplicationId] in table 'vw_aspnet_Applications'
ALTER TABLE [dbo].[vw_aspnet_Applications]
ADD CONSTRAINT [PK_vw_aspnet_Applications]
    PRIMARY KEY CLUSTERED ([ApplicationName], [LoweredApplicationName], [ApplicationId] ASC);
GO

-- Creating primary key on [UserId], [PasswordFormat], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [ApplicationId], [UserName], [IsAnonymous], [LastActivityDate] in table 'vw_aspnet_MembershipUsers'
ALTER TABLE [dbo].[vw_aspnet_MembershipUsers]
ADD CONSTRAINT [PK_vw_aspnet_MembershipUsers]
    PRIMARY KEY CLUSTERED ([UserId], [PasswordFormat], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [ApplicationId], [UserName], [IsAnonymous], [LastActivityDate] ASC);
GO

-- Creating primary key on [UserId], [LastUpdatedDate] in table 'vw_aspnet_Profiles'
ALTER TABLE [dbo].[vw_aspnet_Profiles]
ADD CONSTRAINT [PK_vw_aspnet_Profiles]
    PRIMARY KEY CLUSTERED ([UserId], [LastUpdatedDate] ASC);
GO

-- Creating primary key on [ApplicationId], [RoleId], [RoleName], [LoweredRoleName] in table 'vw_aspnet_Roles'
ALTER TABLE [dbo].[vw_aspnet_Roles]
ADD CONSTRAINT [PK_vw_aspnet_Roles]
    PRIMARY KEY CLUSTERED ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName] ASC);
GO

-- Creating primary key on [ApplicationId], [UserId], [UserName], [LoweredUserName], [IsAnonymous], [LastActivityDate] in table 'vw_aspnet_Users'
ALTER TABLE [dbo].[vw_aspnet_Users]
ADD CONSTRAINT [PK_vw_aspnet_Users]
    PRIMARY KEY CLUSTERED ([ApplicationId], [UserId], [UserName], [LoweredUserName], [IsAnonymous], [LastActivityDate] ASC);
GO

-- Creating primary key on [UserId], [RoleId] in table 'vw_aspnet_UsersInRoles'
ALTER TABLE [dbo].[vw_aspnet_UsersInRoles]
ADD CONSTRAINT [PK_vw_aspnet_UsersInRoles]
    PRIMARY KEY CLUSTERED ([UserId], [RoleId] ASC);
GO

-- Creating primary key on [ApplicationId], [PathId], [Path], [LoweredPath] in table 'vw_aspnet_WebPartState_Paths'
ALTER TABLE [dbo].[vw_aspnet_WebPartState_Paths]
ADD CONSTRAINT [PK_vw_aspnet_WebPartState_Paths]
    PRIMARY KEY CLUSTERED ([ApplicationId], [PathId], [Path], [LoweredPath] ASC);
GO

-- Creating primary key on [PathId], [LastUpdatedDate] in table 'vw_aspnet_WebPartState_Shared'
ALTER TABLE [dbo].[vw_aspnet_WebPartState_Shared]
ADD CONSTRAINT [PK_vw_aspnet_WebPartState_Shared]
    PRIMARY KEY CLUSTERED ([PathId], [LastUpdatedDate] ASC);
GO

-- Creating primary key on [LastUpdatedDate] in table 'vw_aspnet_WebPartState_User'
ALTER TABLE [dbo].[vw_aspnet_WebPartState_User]
ADD CONSTRAINT [PK_vw_aspnet_WebPartState_User]
    PRIMARY KEY CLUSTERED ([LastUpdatedDate] ASC);
GO

-- Creating primary key on [aspnet_Roles_RoleId], [aspnet_Users_UserId] in table 'aspnet_UsersInRoles'
ALTER TABLE [dbo].[aspnet_UsersInRoles]
ADD CONSTRAINT [PK_aspnet_UsersInRoles]
    PRIMARY KEY NONCLUSTERED ([aspnet_Roles_RoleId], [aspnet_Users_UserId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [TB_ENTREVISTADO_idTB_ENTREVISTADO] in table 'TB_RESPOSTA'
ALTER TABLE [dbo].[TB_RESPOSTA]
ADD CONSTRAINT [FK_TB_RESPOSTA_FKIndex2]
    FOREIGN KEY ([TB_ENTREVISTADO_idTB_ENTREVISTADO])
    REFERENCES [dbo].[TB_ENTREVISTADO]
        ([idTB_ENTREVISTADO])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_TB_RESPOSTA_FKIndex2'
CREATE INDEX [IX_FK_TB_RESPOSTA_FKIndex2]
ON [dbo].[TB_RESPOSTA]
    ([TB_ENTREVISTADO_idTB_ENTREVISTADO]);
GO

-- Creating foreign key on [TB_ITENS_DA_QUESTAO_idTB_ITENS_DA_QUESTAO] in table 'TB_QUESTAO'
ALTER TABLE [dbo].[TB_QUESTAO]
ADD CONSTRAINT [FK_TB_QUESTAO_FKIndex2]
    FOREIGN KEY ([TB_ITENS_DA_QUESTAO_idTB_ITENS_DA_QUESTAO])
    REFERENCES [dbo].[TB_ITENS_DA_QUESTAO]
        ([idTB_ITENS_DA_QUESTAO])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_TB_QUESTAO_FKIndex2'
CREATE INDEX [IX_FK_TB_QUESTAO_FKIndex2]
ON [dbo].[TB_QUESTAO]
    ([TB_ITENS_DA_QUESTAO_idTB_ITENS_DA_QUESTAO]);
GO

-- Creating foreign key on [TB_SURVEY_id_Survey] in table 'TB_QUESTAO'
ALTER TABLE [dbo].[TB_QUESTAO]
ADD CONSTRAINT [FK_TB_QUESTAO_FKIndex1]
    FOREIGN KEY ([TB_SURVEY_id_Survey])
    REFERENCES [dbo].[TB_SURVEY]
        ([id_Survey])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_TB_QUESTAO_FKIndex1'
CREATE INDEX [IX_FK_TB_QUESTAO_FKIndex1]
ON [dbo].[TB_QUESTAO]
    ([TB_SURVEY_id_Survey]);
GO

-- Creating foreign key on [TB_QUESTAO_id_Questao] in table 'TB_RESPOSTA'
ALTER TABLE [dbo].[TB_RESPOSTA]
ADD CONSTRAINT [FK_TB_RESPOSTA_FKIndex1]
    FOREIGN KEY ([TB_QUESTAO_id_Questao])
    REFERENCES [dbo].[TB_QUESTAO]
        ([id_Questao])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_TB_RESPOSTA_FKIndex1'
CREATE INDEX [IX_FK_TB_RESPOSTA_FKIndex1]
ON [dbo].[TB_RESPOSTA]
    ([TB_QUESTAO_id_Questao]);
GO

-- Creating foreign key on [TB_RESPONSAVEL_id_Responsavel] in table 'TB_SURVEY'
ALTER TABLE [dbo].[TB_SURVEY]
ADD CONSTRAINT [FK_TB_SURVEY_FKIndex1]
    FOREIGN KEY ([TB_RESPONSAVEL_id_Responsavel])
    REFERENCES [dbo].[TB_RESPONSAVEL]
        ([id_Responsavel])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_TB_SURVEY_FKIndex1'
CREATE INDEX [IX_FK_TB_SURVEY_FKIndex1]
ON [dbo].[TB_SURVEY]
    ([TB_RESPONSAVEL_id_Responsavel]);
GO

-- Creating foreign key on [ApplicationId] in table 'aspnet_Membership'
ALTER TABLE [dbo].[aspnet_Membership]
ADD CONSTRAINT [FK__aspnet_Me__Appli__3A81B327]
    FOREIGN KEY ([ApplicationId])
    REFERENCES [dbo].[aspnet_Applications]
        ([ApplicationId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK__aspnet_Me__Appli__3A81B327'
CREATE INDEX [IX_FK__aspnet_Me__Appli__3A81B327]
ON [dbo].[aspnet_Membership]
    ([ApplicationId]);
GO

-- Creating foreign key on [ApplicationId] in table 'aspnet_Paths'
ALTER TABLE [dbo].[aspnet_Paths]
ADD CONSTRAINT [FK__aspnet_Pa__Appli__6C190EBB]
    FOREIGN KEY ([ApplicationId])
    REFERENCES [dbo].[aspnet_Applications]
        ([ApplicationId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK__aspnet_Pa__Appli__6C190EBB'
CREATE INDEX [IX_FK__aspnet_Pa__Appli__6C190EBB]
ON [dbo].[aspnet_Paths]
    ([ApplicationId]);
GO

-- Creating foreign key on [ApplicationId] in table 'aspnet_Roles'
ALTER TABLE [dbo].[aspnet_Roles]
ADD CONSTRAINT [FK__aspnet_Ro__Appli__59063A47]
    FOREIGN KEY ([ApplicationId])
    REFERENCES [dbo].[aspnet_Applications]
        ([ApplicationId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK__aspnet_Ro__Appli__59063A47'
CREATE INDEX [IX_FK__aspnet_Ro__Appli__59063A47]
ON [dbo].[aspnet_Roles]
    ([ApplicationId]);
GO

-- Creating foreign key on [ApplicationId] in table 'aspnet_Users'
ALTER TABLE [dbo].[aspnet_Users]
ADD CONSTRAINT [FK__aspnet_Us__Appli__2A4B4B5E]
    FOREIGN KEY ([ApplicationId])
    REFERENCES [dbo].[aspnet_Applications]
        ([ApplicationId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK__aspnet_Us__Appli__2A4B4B5E'
CREATE INDEX [IX_FK__aspnet_Us__Appli__2A4B4B5E]
ON [dbo].[aspnet_Users]
    ([ApplicationId]);
GO

-- Creating foreign key on [UserId] in table 'aspnet_Membership'
ALTER TABLE [dbo].[aspnet_Membership]
ADD CONSTRAINT [FK__aspnet_Me__UserI__3B75D760]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[aspnet_Users]
        ([UserId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [PathId] in table 'aspnet_PersonalizationAllUsers'
ALTER TABLE [dbo].[aspnet_PersonalizationAllUsers]
ADD CONSTRAINT [FK__aspnet_Pe__PathI__71D1E811]
    FOREIGN KEY ([PathId])
    REFERENCES [dbo].[aspnet_Paths]
        ([PathId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [PathId] in table 'aspnet_PersonalizationPerUser'
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]
ADD CONSTRAINT [FK__aspnet_Pe__PathI__75A278F5]
    FOREIGN KEY ([PathId])
    REFERENCES [dbo].[aspnet_Paths]
        ([PathId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK__aspnet_Pe__PathI__75A278F5'
CREATE INDEX [IX_FK__aspnet_Pe__PathI__75A278F5]
ON [dbo].[aspnet_PersonalizationPerUser]
    ([PathId]);
GO

-- Creating foreign key on [UserId] in table 'aspnet_PersonalizationPerUser'
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]
ADD CONSTRAINT [FK__aspnet_Pe__UserI__76969D2E]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[aspnet_Users]
        ([UserId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK__aspnet_Pe__UserI__76969D2E'
CREATE INDEX [IX_FK__aspnet_Pe__UserI__76969D2E]
ON [dbo].[aspnet_PersonalizationPerUser]
    ([UserId]);
GO

-- Creating foreign key on [UserId] in table 'aspnet_Profile'
ALTER TABLE [dbo].[aspnet_Profile]
ADD CONSTRAINT [FK__aspnet_Pr__UserI__4F7CD00D]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[aspnet_Users]
        ([UserId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [aspnet_Roles_RoleId] in table 'aspnet_UsersInRoles'
ALTER TABLE [dbo].[aspnet_UsersInRoles]
ADD CONSTRAINT [FK_aspnet_UsersInRoles_aspnet_Roles]
    FOREIGN KEY ([aspnet_Roles_RoleId])
    REFERENCES [dbo].[aspnet_Roles]
        ([RoleId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [aspnet_Users_UserId] in table 'aspnet_UsersInRoles'
ALTER TABLE [dbo].[aspnet_UsersInRoles]
ADD CONSTRAINT [FK_aspnet_UsersInRoles_aspnet_Users]
    FOREIGN KEY ([aspnet_Users_UserId])
    REFERENCES [dbo].[aspnet_Users]
        ([UserId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_aspnet_UsersInRoles_aspnet_Users'
CREATE INDEX [IX_FK_aspnet_UsersInRoles_aspnet_Users]
ON [dbo].[aspnet_UsersInRoles]
    ([aspnet_Users_UserId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------