IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190720180912_CreateDB')
BEGIN
    CREATE TABLE [Menu] (
        [Id] uniqueidentifier NOT NULL,
        [LastAccessed] datetime2 NULL,
        [IsDeleted] bit NOT NULL,
        [ScreenNameAr] nvarchar(256) NULL,
        [ScreenNameEn] nvarchar(256) NULL,
        [Href] nvarchar(256) NULL,
        [Controller] nvarchar(100) NULL,
        [Action] nvarchar(100) NULL,
        [Parameters] nvarchar(50) NULL,
        [Icon] nvarchar(100) NULL,
        [IsStop] bit NOT NULL,
        [ItsOrder] int NOT NULL,
        [ParentId] uniqueidentifier NULL,
        CONSTRAINT [PK_Menu] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Menu_Menu_ParentId] FOREIGN KEY ([ParentId]) REFERENCES [Menu] ([Id]) ON DELETE NO ACTION
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190720180912_CreateDB')
BEGIN
    CREATE TABLE [Roles] (
        [Id] uniqueidentifier NOT NULL,
        [LastAccessed] datetime2 NULL,
        [IsDeleted] bit NOT NULL,
        [Name] nvarchar(256) NOT NULL,
        CONSTRAINT [PK_Roles] PRIMARY KEY ([Id])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190720180912_CreateDB')
BEGIN
    CREATE TABLE [Users] (
        [Id] uniqueidentifier NOT NULL,
        [LastAccessed] datetime2 NULL,
        [IsDeleted] bit NOT NULL,
        [Email] nvarchar(256) NULL,
        [EmailConfirmed] bit NOT NULL,
        [PasswordHash] nvarchar(max) NULL,
        [SecurityStamp] nvarchar(max) NULL,
        [PhoneNumber] nvarchar(max) NULL,
        [PhoneNumberConfirmed] bit NOT NULL,
        [TwoFactorEnabled] bit NOT NULL,
        [LockoutEndDateUtc] datetime2 NULL,
        [LockoutEnabled] bit NOT NULL,
        [AccessFailedCount] int NOT NULL,
        [UserName] nvarchar(256) NOT NULL,
        [ImgPath] nvarchar(128) NULL,
        CONSTRAINT [PK_Users] PRIMARY KEY ([Id])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190720180912_CreateDB')
BEGIN
    CREATE TABLE [MenuRoles] (
        [Id] uniqueidentifier NOT NULL,
        [LastAccessed] datetime2 NULL,
        [IsDeleted] bit NOT NULL,
        [RoleId] uniqueidentifier NOT NULL,
        [MenuId] uniqueidentifier NOT NULL,
        CONSTRAINT [PK_MenuRoles] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_MenuRoles_Menu_MenuId] FOREIGN KEY ([MenuId]) REFERENCES [Menu] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_MenuRoles_Roles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [Roles] ([Id]) ON DELETE CASCADE
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190720180912_CreateDB')
BEGIN
    CREATE TABLE [AspNetRefreshTokens] (
        [Id] uniqueidentifier NOT NULL,
        [LastAccessed] datetime2 NULL,
        [IsDeleted] bit NOT NULL,
        [IssuedUtc] datetime2 NOT NULL,
        [ExpiresUtc] datetime2 NOT NULL,
        [Token] nvarchar(450) NOT NULL,
        [UserId] uniqueidentifier NOT NULL,
        CONSTRAINT [PK_AspNetRefreshTokens] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_AspNetRefreshTokens_Users_UserId] FOREIGN KEY ([UserId]) REFERENCES [Users] ([Id]) ON DELETE CASCADE
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190720180912_CreateDB')
BEGIN
    CREATE TABLE [UserClaims] (
        [Id] uniqueidentifier NOT NULL,
        [LastAccessed] datetime2 NULL,
        [IsDeleted] bit NOT NULL,
        [UserId] uniqueidentifier NOT NULL,
        [ClaimType] nvarchar(256) NULL,
        [ClaimValue] nvarchar(256) NULL,
        CONSTRAINT [PK_UserClaims] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_UserClaims_Users_UserId] FOREIGN KEY ([UserId]) REFERENCES [Users] ([Id]) ON DELETE CASCADE
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190720180912_CreateDB')
BEGIN
    CREATE TABLE [UserLogins] (
        [Id] uniqueidentifier NOT NULL,
        [LastAccessed] datetime2 NULL,
        [IsDeleted] bit NOT NULL,
        [LoginProvider] nvarchar(256) NULL,
        [ProviderKey] nvarchar(256) NULL,
        [UserId] uniqueidentifier NOT NULL,
        CONSTRAINT [PK_UserLogins] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_UserLogins_Users_UserId] FOREIGN KEY ([UserId]) REFERENCES [Users] ([Id]) ON DELETE CASCADE
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190720180912_CreateDB')
BEGIN
    CREATE TABLE [UsersRoles] (
        [Id] uniqueidentifier NOT NULL,
        [LastAccessed] datetime2 NULL,
        [IsDeleted] bit NOT NULL,
        [RoleId] uniqueidentifier NOT NULL,
        [UserId] uniqueidentifier NOT NULL,
        CONSTRAINT [PK_UsersRoles] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_UsersRoles_Roles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [Roles] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_UsersRoles_Users_UserId] FOREIGN KEY ([UserId]) REFERENCES [Users] ([Id]) ON DELETE CASCADE
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190720180912_CreateDB')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Action', N'Controller', N'Href', N'Icon', N'IsDeleted', N'IsStop', N'ItsOrder', N'Parameters', N'ParentId', N'ScreenNameAr', N'ScreenNameEn') AND [object_id] = OBJECT_ID(N'[Menu]'))
        SET IDENTITY_INSERT [Menu] ON;
    INSERT INTO [Menu] ([Id], [Action], [Controller], [Href], [Icon], [IsDeleted], [IsStop], [ItsOrder], [Parameters], [ParentId], [ScreenNameAr], [ScreenNameEn])
    VALUES ('c11c91c0-5c2f-45cc-ab6d-1d256538a5ee', N'index', N'Home', NULL, N'icon-home', 0, 0, 1, NULL, NULL, N'الشاشة الرئيسية', N'Main Screen');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Action', N'Controller', N'Href', N'Icon', N'IsDeleted', N'IsStop', N'ItsOrder', N'Parameters', N'ParentId', N'ScreenNameAr', N'ScreenNameEn') AND [object_id] = OBJECT_ID(N'[Menu]'))
        SET IDENTITY_INSERT [Menu] OFF;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190720180912_CreateDB')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Action', N'Controller', N'Href', N'Icon', N'IsDeleted', N'IsStop', N'ItsOrder', N'Parameters', N'ParentId', N'ScreenNameAr', N'ScreenNameEn') AND [object_id] = OBJECT_ID(N'[Menu]'))
        SET IDENTITY_INSERT [Menu] ON;
    INSERT INTO [Menu] ([Id], [Action], [Controller], [Href], [Icon], [IsDeleted], [IsStop], [ItsOrder], [Parameters], [ParentId], [ScreenNameAr], [ScreenNameEn])
    VALUES ('c12c91c0-5c2f-45cc-ab6d-1d256538a5ee', NULL, NULL, NULL, N'fas fa-address-card', 0, 0, 2, NULL, NULL, N'الصلاحيات', N'Authentication');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Action', N'Controller', N'Href', N'Icon', N'IsDeleted', N'IsStop', N'ItsOrder', N'Parameters', N'ParentId', N'ScreenNameAr', N'ScreenNameEn') AND [object_id] = OBJECT_ID(N'[Menu]'))
        SET IDENTITY_INSERT [Menu] OFF;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190720180912_CreateDB')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'IsDeleted', N'Name') AND [object_id] = OBJECT_ID(N'[Roles]'))
        SET IDENTITY_INSERT [Roles] ON;
    INSERT INTO [Roles] ([Id], [IsDeleted], [Name])
    VALUES ('c21c91c0-5c2f-45cc-ab6d-1d256538a5ee', 0, N'Administrator');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'IsDeleted', N'Name') AND [object_id] = OBJECT_ID(N'[Roles]'))
        SET IDENTITY_INSERT [Roles] OFF;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190720180912_CreateDB')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'AccessFailedCount', N'Email', N'EmailConfirmed', N'ImgPath', N'IsDeleted', N'LockoutEnabled', N'LockoutEndDateUtc', N'PasswordHash', N'PhoneNumber', N'PhoneNumberConfirmed', N'SecurityStamp', N'TwoFactorEnabled', N'UserName') AND [object_id] = OBJECT_ID(N'[Users]'))
        SET IDENTITY_INSERT [Users] ON;
    INSERT INTO [Users] ([Id], [AccessFailedCount], [Email], [EmailConfirmed], [ImgPath], [IsDeleted], [LockoutEnabled], [LockoutEndDateUtc], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [TwoFactorEnabled], [UserName])
    VALUES ('c21c91c0-5c2f-45cc-ab6d-1d256538a4ee', 0, N'admin@A3n.com', 0, NULL, 0, 0, NULL, N'ALQ9yNzGkKdXRP8gdol1whMNSIZAlmjXpF6SNHELSKf0N6+aZs24+5h8B4OzpBWrIw==', N'+9', 0, N'045a1c70-35b0-4d51-b5e7-5a88beb747a7', 0, N'admin');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'AccessFailedCount', N'Email', N'EmailConfirmed', N'ImgPath', N'IsDeleted', N'LockoutEnabled', N'LockoutEndDateUtc', N'PasswordHash', N'PhoneNumber', N'PhoneNumberConfirmed', N'SecurityStamp', N'TwoFactorEnabled', N'UserName') AND [object_id] = OBJECT_ID(N'[Users]'))
        SET IDENTITY_INSERT [Users] OFF;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190720180912_CreateDB')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Action', N'Controller', N'Href', N'Icon', N'IsDeleted', N'IsStop', N'ItsOrder', N'Parameters', N'ParentId', N'ScreenNameAr', N'ScreenNameEn') AND [object_id] = OBJECT_ID(N'[Menu]'))
        SET IDENTITY_INSERT [Menu] ON;
    INSERT INTO [Menu] ([Id], [Action], [Controller], [Href], [Icon], [IsDeleted], [IsStop], [ItsOrder], [Parameters], [ParentId], [ScreenNameAr], [ScreenNameEn])
    VALUES ('c13c91c0-5c2f-45cc-ab6d-1d256538a5ee', N'ManageRoles', N'Security', NULL, N'icon-user', 0, 0, 7, NULL, 'c12c91c0-5c2f-45cc-ab6d-1d256538a5ee', N'الدور الوظيفي', N'Roles');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Action', N'Controller', N'Href', N'Icon', N'IsDeleted', N'IsStop', N'ItsOrder', N'Parameters', N'ParentId', N'ScreenNameAr', N'ScreenNameEn') AND [object_id] = OBJECT_ID(N'[Menu]'))
        SET IDENTITY_INSERT [Menu] OFF;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190720180912_CreateDB')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Action', N'Controller', N'Href', N'Icon', N'IsDeleted', N'IsStop', N'ItsOrder', N'Parameters', N'ParentId', N'ScreenNameAr', N'ScreenNameEn') AND [object_id] = OBJECT_ID(N'[Menu]'))
        SET IDENTITY_INSERT [Menu] ON;
    INSERT INTO [Menu] ([Id], [Action], [Controller], [Href], [Icon], [IsDeleted], [IsStop], [ItsOrder], [Parameters], [ParentId], [ScreenNameAr], [ScreenNameEn])
    VALUES ('c14c91c0-5c2f-45cc-ab6d-1d256538a5ee', N'Users', N'Security', NULL, N'icon-user', 0, 0, 8, NULL, 'c12c91c0-5c2f-45cc-ab6d-1d256538a5ee', N'المستخدمين', N'Users');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Action', N'Controller', N'Href', N'Icon', N'IsDeleted', N'IsStop', N'ItsOrder', N'Parameters', N'ParentId', N'ScreenNameAr', N'ScreenNameEn') AND [object_id] = OBJECT_ID(N'[Menu]'))
        SET IDENTITY_INSERT [Menu] OFF;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190720180912_CreateDB')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'IsDeleted', N'RoleId', N'UserId') AND [object_id] = OBJECT_ID(N'[UsersRoles]'))
        SET IDENTITY_INSERT [UsersRoles] ON;
    INSERT INTO [UsersRoles] ([Id], [IsDeleted], [RoleId], [UserId])
    VALUES ('c21c91c0-5c2f-45cc-ab6d-1d256538a6ee', 0, 'c21c91c0-5c2f-45cc-ab6d-1d256538a5ee', 'c21c91c0-5c2f-45cc-ab6d-1d256538a4ee');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'IsDeleted', N'RoleId', N'UserId') AND [object_id] = OBJECT_ID(N'[UsersRoles]'))
        SET IDENTITY_INSERT [UsersRoles] OFF;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190720180912_CreateDB')
BEGIN
    CREATE INDEX [IX_AspNetRefreshTokens_UserId] ON [AspNetRefreshTokens] ([UserId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190720180912_CreateDB')
BEGIN
    CREATE INDEX [IX_Menu_ParentId] ON [Menu] ([ParentId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190720180912_CreateDB')
BEGIN
    CREATE INDEX [IX_MenuRoles_MenuId] ON [MenuRoles] ([MenuId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190720180912_CreateDB')
BEGIN
    CREATE INDEX [IX_MenuRoles_RoleId] ON [MenuRoles] ([RoleId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190720180912_CreateDB')
BEGIN
    CREATE INDEX [IX_UserClaims_UserId] ON [UserClaims] ([UserId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190720180912_CreateDB')
BEGIN
    CREATE INDEX [IX_UserLogins_UserId] ON [UserLogins] ([UserId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190720180912_CreateDB')
BEGIN
    CREATE INDEX [IX_UsersRoles_RoleId] ON [UsersRoles] ([RoleId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190720180912_CreateDB')
BEGIN
    CREATE INDEX [IX_UsersRoles_UserId] ON [UsersRoles] ([UserId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190720180912_CreateDB')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20190720180912_CreateDB', N'2.2.6-servicing-10079');
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190801164500_ChangePassword')
BEGIN
    DELETE FROM [Menu]
    WHERE [Id] = 'c11c91c0-5c2f-45cc-ab6d-1d256538a5ee';
    SELECT @@ROWCOUNT;

END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190801164500_ChangePassword')
BEGIN
    DELETE FROM [Menu]
    WHERE [Id] = 'c13c91c0-5c2f-45cc-ab6d-1d256538a5ee';
    SELECT @@ROWCOUNT;

END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190801164500_ChangePassword')
BEGIN
    DELETE FROM [Menu]
    WHERE [Id] = 'c14c91c0-5c2f-45cc-ab6d-1d256538a5ee';
    SELECT @@ROWCOUNT;

END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190801164500_ChangePassword')
BEGIN
    DELETE FROM [UsersRoles]
    WHERE [Id] = 'c21c91c0-5c2f-45cc-ab6d-1d256538a6ee';
    SELECT @@ROWCOUNT;

END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190801164500_ChangePassword')
BEGIN
    DELETE FROM [Menu]
    WHERE [Id] = 'c12c91c0-5c2f-45cc-ab6d-1d256538a5ee';
    SELECT @@ROWCOUNT;

END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190801164500_ChangePassword')
BEGIN
    DELETE FROM [Roles]
    WHERE [Id] = 'c21c91c0-5c2f-45cc-ab6d-1d256538a5ee';
    SELECT @@ROWCOUNT;

END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190801164500_ChangePassword')
BEGIN
    DELETE FROM [Users]
    WHERE [Id] = 'c21c91c0-5c2f-45cc-ab6d-1d256538a4ee';
    SELECT @@ROWCOUNT;

END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190801164500_ChangePassword')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Action', N'Controller', N'Href', N'Icon', N'IsDeleted', N'IsStop', N'ItsOrder', N'Parameters', N'ParentId', N'ScreenNameAr', N'ScreenNameEn') AND [object_id] = OBJECT_ID(N'[Menu]'))
        SET IDENTITY_INSERT [Menu] ON;
    INSERT INTO [Menu] ([Id], [Action], [Controller], [Href], [Icon], [IsDeleted], [IsStop], [ItsOrder], [Parameters], [ParentId], [ScreenNameAr], [ScreenNameEn])
    VALUES ('c11c91c0-5c2f-45cc-ab6d-1d256538a5ee', N'index', N'Home', NULL, N'icon-home', 0, 0, 1, NULL, NULL, N'الشاشة الرئيسية', N'Main Screen');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Action', N'Controller', N'Href', N'Icon', N'IsDeleted', N'IsStop', N'ItsOrder', N'Parameters', N'ParentId', N'ScreenNameAr', N'ScreenNameEn') AND [object_id] = OBJECT_ID(N'[Menu]'))
        SET IDENTITY_INSERT [Menu] OFF;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190801164500_ChangePassword')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Action', N'Controller', N'Href', N'Icon', N'IsDeleted', N'IsStop', N'ItsOrder', N'Parameters', N'ParentId', N'ScreenNameAr', N'ScreenNameEn') AND [object_id] = OBJECT_ID(N'[Menu]'))
        SET IDENTITY_INSERT [Menu] ON;
    INSERT INTO [Menu] ([Id], [Action], [Controller], [Href], [Icon], [IsDeleted], [IsStop], [ItsOrder], [Parameters], [ParentId], [ScreenNameAr], [ScreenNameEn])
    VALUES ('c12c91c0-5c2f-45cc-ab6d-1d256538a5ee', NULL, NULL, NULL, N'fas fa-address-card', 0, 0, 2, NULL, NULL, N'الصلاحيات', N'Authentication');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Action', N'Controller', N'Href', N'Icon', N'IsDeleted', N'IsStop', N'ItsOrder', N'Parameters', N'ParentId', N'ScreenNameAr', N'ScreenNameEn') AND [object_id] = OBJECT_ID(N'[Menu]'))
        SET IDENTITY_INSERT [Menu] OFF;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190801164500_ChangePassword')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'IsDeleted', N'Name') AND [object_id] = OBJECT_ID(N'[Roles]'))
        SET IDENTITY_INSERT [Roles] ON;
    INSERT INTO [Roles] ([Id], [IsDeleted], [Name])
    VALUES ('c21c91c0-5c2f-45cc-ab6d-1d256538a5ee', 0, N'Administrator');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'IsDeleted', N'Name') AND [object_id] = OBJECT_ID(N'[Roles]'))
        SET IDENTITY_INSERT [Roles] OFF;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190801164500_ChangePassword')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'AccessFailedCount', N'Email', N'EmailConfirmed', N'ImgPath', N'IsDeleted', N'LockoutEnabled', N'LockoutEndDateUtc', N'PasswordHash', N'PhoneNumber', N'PhoneNumberConfirmed', N'SecurityStamp', N'TwoFactorEnabled', N'UserName') AND [object_id] = OBJECT_ID(N'[Users]'))
        SET IDENTITY_INSERT [Users] ON;
    INSERT INTO [Users] ([Id], [AccessFailedCount], [Email], [EmailConfirmed], [ImgPath], [IsDeleted], [LockoutEnabled], [LockoutEndDateUtc], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [TwoFactorEnabled], [UserName])
    VALUES ('c21c91c0-5c2f-45cc-ab6d-1d256538a4ee', 0, N'admin@A3n.com', 0, NULL, 0, 0, NULL, N'ABYHOpE2Do3jXzpcPPzpHWmkdVBorF8/zmfIoCVqxd4N6RICbrfTrmClh/Tf3MDvtw==', N'+9', 0, N'98ef26b6-19c6-4d76-9fd6-dacff86bcb89', 0, N'admin');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'AccessFailedCount', N'Email', N'EmailConfirmed', N'ImgPath', N'IsDeleted', N'LockoutEnabled', N'LockoutEndDateUtc', N'PasswordHash', N'PhoneNumber', N'PhoneNumberConfirmed', N'SecurityStamp', N'TwoFactorEnabled', N'UserName') AND [object_id] = OBJECT_ID(N'[Users]'))
        SET IDENTITY_INSERT [Users] OFF;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190801164500_ChangePassword')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Action', N'Controller', N'Href', N'Icon', N'IsDeleted', N'IsStop', N'ItsOrder', N'Parameters', N'ParentId', N'ScreenNameAr', N'ScreenNameEn') AND [object_id] = OBJECT_ID(N'[Menu]'))
        SET IDENTITY_INSERT [Menu] ON;
    INSERT INTO [Menu] ([Id], [Action], [Controller], [Href], [Icon], [IsDeleted], [IsStop], [ItsOrder], [Parameters], [ParentId], [ScreenNameAr], [ScreenNameEn])
    VALUES ('c13c91c0-5c2f-45cc-ab6d-1d256538a5ee', N'ManageRoles', N'Security', NULL, N'icon-user', 0, 0, 7, NULL, 'c12c91c0-5c2f-45cc-ab6d-1d256538a5ee', N'الدور الوظيفي', N'Roles');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Action', N'Controller', N'Href', N'Icon', N'IsDeleted', N'IsStop', N'ItsOrder', N'Parameters', N'ParentId', N'ScreenNameAr', N'ScreenNameEn') AND [object_id] = OBJECT_ID(N'[Menu]'))
        SET IDENTITY_INSERT [Menu] OFF;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190801164500_ChangePassword')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Action', N'Controller', N'Href', N'Icon', N'IsDeleted', N'IsStop', N'ItsOrder', N'Parameters', N'ParentId', N'ScreenNameAr', N'ScreenNameEn') AND [object_id] = OBJECT_ID(N'[Menu]'))
        SET IDENTITY_INSERT [Menu] ON;
    INSERT INTO [Menu] ([Id], [Action], [Controller], [Href], [Icon], [IsDeleted], [IsStop], [ItsOrder], [Parameters], [ParentId], [ScreenNameAr], [ScreenNameEn])
    VALUES ('c14c91c0-5c2f-45cc-ab6d-1d256538a5ee', N'Users', N'Security', NULL, N'icon-user', 0, 0, 8, NULL, 'c12c91c0-5c2f-45cc-ab6d-1d256538a5ee', N'المستخدمين', N'Users');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Action', N'Controller', N'Href', N'Icon', N'IsDeleted', N'IsStop', N'ItsOrder', N'Parameters', N'ParentId', N'ScreenNameAr', N'ScreenNameEn') AND [object_id] = OBJECT_ID(N'[Menu]'))
        SET IDENTITY_INSERT [Menu] OFF;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190801164500_ChangePassword')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'IsDeleted', N'RoleId', N'UserId') AND [object_id] = OBJECT_ID(N'[UsersRoles]'))
        SET IDENTITY_INSERT [UsersRoles] ON;
    INSERT INTO [UsersRoles] ([Id], [IsDeleted], [RoleId], [UserId])
    VALUES ('c21c91c0-5c2f-45cc-ab6d-1d256538a6ee', 0, 'c21c91c0-5c2f-45cc-ab6d-1d256538a5ee', 'c21c91c0-5c2f-45cc-ab6d-1d256538a4ee');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'IsDeleted', N'RoleId', N'UserId') AND [object_id] = OBJECT_ID(N'[UsersRoles]'))
        SET IDENTITY_INSERT [UsersRoles] OFF;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190801164500_ChangePassword')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20190801164500_ChangePassword', N'2.2.6-servicing-10079');
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190928082327_modiyidentity')
BEGIN
    DROP TABLE [AspNetRefreshTokens];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190928082327_modiyidentity')
BEGIN
    DROP TABLE [MenuRoles];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190928082327_modiyidentity')
BEGIN
    DROP TABLE [UserClaims];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190928082327_modiyidentity')
BEGIN
    DROP TABLE [UserLogins];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190928082327_modiyidentity')
BEGIN
    DROP TABLE [UsersRoles];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190928082327_modiyidentity')
BEGIN
    DROP TABLE [Menu];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190928082327_modiyidentity')
BEGIN
    DELETE FROM [Roles]
    WHERE [Id] = 'c21c91c0-5c2f-45cc-ab6d-1d256538a5ee';
    SELECT @@ROWCOUNT;

END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190928082327_modiyidentity')
BEGIN
    DELETE FROM [Users]
    WHERE [Id] = 'c21c91c0-5c2f-45cc-ab6d-1d256538a4ee';
    SELECT @@ROWCOUNT;

END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190928082327_modiyidentity')
BEGIN
    DECLARE @var0 sysname;
    SELECT @var0 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Users]') AND [c].[name] = N'AccessFailedCount');
    IF @var0 IS NOT NULL EXEC(N'ALTER TABLE [Users] DROP CONSTRAINT [' + @var0 + '];');
    ALTER TABLE [Users] DROP COLUMN [AccessFailedCount];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190928082327_modiyidentity')
BEGIN
    DECLARE @var1 sysname;
    SELECT @var1 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Users]') AND [c].[name] = N'EmailConfirmed');
    IF @var1 IS NOT NULL EXEC(N'ALTER TABLE [Users] DROP CONSTRAINT [' + @var1 + '];');
    ALTER TABLE [Users] DROP COLUMN [EmailConfirmed];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190928082327_modiyidentity')
BEGIN
    DECLARE @var2 sysname;
    SELECT @var2 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Users]') AND [c].[name] = N'ImgPath');
    IF @var2 IS NOT NULL EXEC(N'ALTER TABLE [Users] DROP CONSTRAINT [' + @var2 + '];');
    ALTER TABLE [Users] DROP COLUMN [ImgPath];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190928082327_modiyidentity')
BEGIN
    DECLARE @var3 sysname;
    SELECT @var3 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Users]') AND [c].[name] = N'LockoutEnabled');
    IF @var3 IS NOT NULL EXEC(N'ALTER TABLE [Users] DROP CONSTRAINT [' + @var3 + '];');
    ALTER TABLE [Users] DROP COLUMN [LockoutEnabled];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190928082327_modiyidentity')
BEGIN
    DECLARE @var4 sysname;
    SELECT @var4 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Users]') AND [c].[name] = N'LockoutEndDateUtc');
    IF @var4 IS NOT NULL EXEC(N'ALTER TABLE [Users] DROP CONSTRAINT [' + @var4 + '];');
    ALTER TABLE [Users] DROP COLUMN [LockoutEndDateUtc];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190928082327_modiyidentity')
BEGIN
    DECLARE @var5 sysname;
    SELECT @var5 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Users]') AND [c].[name] = N'PasswordHash');
    IF @var5 IS NOT NULL EXEC(N'ALTER TABLE [Users] DROP CONSTRAINT [' + @var5 + '];');
    ALTER TABLE [Users] DROP COLUMN [PasswordHash];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190928082327_modiyidentity')
BEGIN
    DECLARE @var6 sysname;
    SELECT @var6 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Users]') AND [c].[name] = N'PhoneNumberConfirmed');
    IF @var6 IS NOT NULL EXEC(N'ALTER TABLE [Users] DROP CONSTRAINT [' + @var6 + '];');
    ALTER TABLE [Users] DROP COLUMN [PhoneNumberConfirmed];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190928082327_modiyidentity')
BEGIN
    DECLARE @var7 sysname;
    SELECT @var7 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Users]') AND [c].[name] = N'TwoFactorEnabled');
    IF @var7 IS NOT NULL EXEC(N'ALTER TABLE [Users] DROP CONSTRAINT [' + @var7 + '];');
    ALTER TABLE [Users] DROP COLUMN [TwoFactorEnabled];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190928082327_modiyidentity')
BEGIN
    EXEC sp_rename N'[Users].[SecurityStamp]', N'Password', N'COLUMN';
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190928082327_modiyidentity')
BEGIN
    ALTER TABLE [Users] ADD [RoleId] uniqueidentifier NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000';
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190928082327_modiyidentity')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'IsDeleted', N'Name') AND [object_id] = OBJECT_ID(N'[Roles]'))
        SET IDENTITY_INSERT [Roles] ON;
    INSERT INTO [Roles] ([Id], [IsDeleted], [Name])
    VALUES ('c21c91c0-5c2f-45cc-ab6d-1d256538a5ee', 0, N'SuperAdmin');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'IsDeleted', N'Name') AND [object_id] = OBJECT_ID(N'[Roles]'))
        SET IDENTITY_INSERT [Roles] OFF;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190928082327_modiyidentity')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'IsDeleted', N'Name') AND [object_id] = OBJECT_ID(N'[Roles]'))
        SET IDENTITY_INSERT [Roles] ON;
    INSERT INTO [Roles] ([Id], [IsDeleted], [Name])
    VALUES ('c31c91c0-5c2f-45cc-ab6d-1d256538a6ee', 0, N'Admin');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'IsDeleted', N'Name') AND [object_id] = OBJECT_ID(N'[Roles]'))
        SET IDENTITY_INSERT [Roles] OFF;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190928082327_modiyidentity')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'IsDeleted', N'Name') AND [object_id] = OBJECT_ID(N'[Roles]'))
        SET IDENTITY_INSERT [Roles] ON;
    INSERT INTO [Roles] ([Id], [IsDeleted], [Name])
    VALUES ('c41c91c0-5c2f-45cc-ab6d-1d256538a7ee', 0, N'User');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'IsDeleted', N'Name') AND [object_id] = OBJECT_ID(N'[Roles]'))
        SET IDENTITY_INSERT [Roles] OFF;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190928082327_modiyidentity')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Email', N'IsDeleted', N'Password', N'PhoneNumber', N'RoleId', N'UserName') AND [object_id] = OBJECT_ID(N'[Users]'))
        SET IDENTITY_INSERT [Users] ON;
    INSERT INTO [Users] ([Id], [Email], [IsDeleted], [Password], [PhoneNumber], [RoleId], [UserName])
    VALUES ('c21c91c0-5c2f-45cc-ab6d-1d256538a4ee', N'admin@A3n.com', 0, N'ADODTSgerU6FrBy/sNxk/imohjGADqV/AMjYYLw/jssO2gQIY6sC9prIFhby6sgdPQ==', N'+9', 'c21c91c0-5c2f-45cc-ab6d-1d256538a5ee', N'admin');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Email', N'IsDeleted', N'Password', N'PhoneNumber', N'RoleId', N'UserName') AND [object_id] = OBJECT_ID(N'[Users]'))
        SET IDENTITY_INSERT [Users] OFF;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190928082327_modiyidentity')
BEGIN
    CREATE INDEX [IX_Users_RoleId] ON [Users] ([RoleId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190928082327_modiyidentity')
BEGIN
    ALTER TABLE [Users] ADD CONSTRAINT [FK_Users_Roles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [Roles] ([Id]) ON DELETE CASCADE;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190928082327_modiyidentity')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20190928082327_modiyidentity', N'2.2.6-servicing-10079');
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191013191602_AddNew')
BEGIN
    DELETE FROM [Roles]
    WHERE [Id] = 'c31c91c0-5c2f-45cc-ab6d-1d256538a6ee';
    SELECT @@ROWCOUNT;

END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191013191602_AddNew')
BEGIN
    DELETE FROM [Roles]
    WHERE [Id] = 'c41c91c0-5c2f-45cc-ab6d-1d256538a7ee';
    SELECT @@ROWCOUNT;

END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191013191602_AddNew')
BEGIN
    DELETE FROM [Users]
    WHERE [Id] = 'c21c91c0-5c2f-45cc-ab6d-1d256538a4ee';
    SELECT @@ROWCOUNT;

END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191013191602_AddNew')
BEGIN
    DELETE FROM [Roles]
    WHERE [Id] = 'c21c91c0-5c2f-45cc-ab6d-1d256538a5ee';
    SELECT @@ROWCOUNT;

END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191013191602_AddNew')
BEGIN
    ALTER TABLE [Users] ADD [BranchId] uniqueidentifier NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000';
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191013191602_AddNew')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'IsDeleted', N'Name') AND [object_id] = OBJECT_ID(N'[Roles]'))
        SET IDENTITY_INSERT [Roles] ON;
    INSERT INTO [Roles] ([Id], [IsDeleted], [Name])
    VALUES ('c21c91c0-5c2f-45cc-ab6d-1d256538a5ee', 0, N'SuperAdmin');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'IsDeleted', N'Name') AND [object_id] = OBJECT_ID(N'[Roles]'))
        SET IDENTITY_INSERT [Roles] OFF;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191013191602_AddNew')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'IsDeleted', N'Name') AND [object_id] = OBJECT_ID(N'[Roles]'))
        SET IDENTITY_INSERT [Roles] ON;
    INSERT INTO [Roles] ([Id], [IsDeleted], [Name])
    VALUES ('c31c91c0-5c2f-45cc-ab6d-1d256538a6ee', 0, N'Admin');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'IsDeleted', N'Name') AND [object_id] = OBJECT_ID(N'[Roles]'))
        SET IDENTITY_INSERT [Roles] OFF;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191013191602_AddNew')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'IsDeleted', N'Name') AND [object_id] = OBJECT_ID(N'[Roles]'))
        SET IDENTITY_INSERT [Roles] ON;
    INSERT INTO [Roles] ([Id], [IsDeleted], [Name])
    VALUES ('c41c91c0-5c2f-45cc-ab6d-1d256538a7ee', 0, N'User');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'IsDeleted', N'Name') AND [object_id] = OBJECT_ID(N'[Roles]'))
        SET IDENTITY_INSERT [Roles] OFF;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191013191602_AddNew')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'BranchId', N'Email', N'IsDeleted', N'Password', N'PhoneNumber', N'RoleId', N'UserName') AND [object_id] = OBJECT_ID(N'[Users]'))
        SET IDENTITY_INSERT [Users] ON;
    INSERT INTO [Users] ([Id], [BranchId], [Email], [IsDeleted], [Password], [PhoneNumber], [RoleId], [UserName])
    VALUES ('c21c91c0-5c2f-45cc-ab6d-1d256538a4ee', '00000000-0000-0000-0000-000000000000', N'admin@A3n.com', 0, N'AEI8Ml0NjJs46HCP9CY1mdsIdA1iP801Fa6W+qQ92MwFGglE70UxZKxkv7QrWyboMA==', N'+9', 'c21c91c0-5c2f-45cc-ab6d-1d256538a5ee', N'admin');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'BranchId', N'Email', N'IsDeleted', N'Password', N'PhoneNumber', N'RoleId', N'UserName') AND [object_id] = OBJECT_ID(N'[Users]'))
        SET IDENTITY_INSERT [Users] OFF;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191013191602_AddNew')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20191013191602_AddNew', N'2.2.6-servicing-10079');
END;

GO

