IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;

GO

CREATE TABLE [Companies] (
    [Id] bigint NOT NULL,
    [CreatedById] bigint NULL,
    [CreatedDate] datetime2 NULL,
    [ModifiedDate] datetime2 NULL,
    [ModifiedById] bigint NULL,
    [IsDeleted] bit NOT NULL,
    [NameEn] nvarchar(max) NULL,
    [NameAr] nvarchar(max) NULL,
    [LogoUrl] nvarchar(max) NULL,
    CONSTRAINT [PK_Companies] PRIMARY KEY ([Id])
);

GO

CREATE TABLE [DocumentCategories] (
    [Id] bigint NOT NULL,
    [CreatedById] bigint NULL,
    [CreatedDate] datetime2 NULL,
    [ModifiedDate] datetime2 NULL,
    [ModifiedById] bigint NULL,
    [IsDeleted] bit NOT NULL,
    [NameEn] nvarchar(max) NULL,
    [NameAr] nvarchar(max) NULL,
    CONSTRAINT [PK_DocumentCategories] PRIMARY KEY ([Id])
);

GO

CREATE TABLE [Permissions] (
    [Id] bigint NOT NULL,
    [CreatedById] bigint NULL,
    [CreatedDate] datetime2 NULL,
    [ModifiedDate] datetime2 NULL,
    [ModifiedById] bigint NULL,
    [IsDeleted] bit NOT NULL,
    [NameEn] nvarchar(max) NULL,
    [NameAr] nvarchar(max) NULL,
    [Code] nvarchar(255) NOT NULL,
    CONSTRAINT [PK_Permissions] PRIMARY KEY ([Id])
);

GO

CREATE TABLE [Banners] (
    [Id] bigint NOT NULL IDENTITY,
    [CreatedById] bigint NULL,
    [CreatedDate] datetime2 NULL,
    [ModifiedDate] datetime2 NULL,
    [ModifiedById] bigint NULL,
    [IsDeleted] bit NOT NULL,
    [TitleEn] nvarchar(max) NULL,
    [TitleAr] nvarchar(max) NULL,
    [DescriptionEn] nvarchar(max) NULL,
    [DescriptionAr] nvarchar(max) NULL,
    [ImageUrl] nvarchar(max) NULL,
    [CompanyId] bigint NOT NULL,
    CONSTRAINT [PK_Banners] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Banners_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE CASCADE
);

GO

CREATE TABLE [News] (
    [Id] bigint NOT NULL IDENTITY,
    [CreatedById] bigint NULL,
    [CreatedDate] datetime2 NULL,
    [ModifiedDate] datetime2 NULL,
    [ModifiedById] bigint NULL,
    [IsDeleted] bit NOT NULL,
    [TitleEn] nvarchar(max) NULL,
    [TitleAr] nvarchar(max) NULL,
    [DescriptionEn] nvarchar(max) NULL,
    [DescriptionAr] nvarchar(max) NULL,
    [CompanyId] bigint NOT NULL,
    CONSTRAINT [PK_News] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_News_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE CASCADE
);

GO

CREATE TABLE [Roles] (
    [Id] bigint NOT NULL IDENTITY,
    [CreatedById] bigint NULL,
    [CreatedDate] datetime2 NULL,
    [ModifiedDate] datetime2 NULL,
    [ModifiedById] bigint NULL,
    [IsDeleted] bit NOT NULL,
    [NameAr] nvarchar(max) NULL,
    [NameEn] nvarchar(max) NULL,
    [CompanyId] bigint NOT NULL,
    CONSTRAINT [PK_Roles] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Roles_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE CASCADE
);

GO

CREATE TABLE [Stores] (
    [Id] bigint NOT NULL,
    [CreatedById] bigint NULL,
    [CreatedDate] datetime2 NULL,
    [ModifiedDate] datetime2 NULL,
    [ModifiedById] bigint NULL,
    [IsDeleted] bit NOT NULL,
    [NameEn] nvarchar(max) NULL,
    [NameAr] nvarchar(max) NULL,
    [CompanyId] bigint NOT NULL,
    CONSTRAINT [PK_Stores] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Stores_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE CASCADE
);

GO

CREATE TABLE [Documents] (
    [Id] bigint NOT NULL IDENTITY,
    [CreatedById] bigint NULL,
    [CreatedDate] datetime2 NULL,
    [ModifiedDate] datetime2 NULL,
    [ModifiedById] bigint NULL,
    [IsDeleted] bit NOT NULL,
    [FileName] nvarchar(max) NULL,
    [DocumentUrl] nvarchar(max) NULL,
    [TitleEn] nvarchar(max) NULL,
    [TitleAr] nvarchar(max) NULL,
    [CategoryId] bigint NOT NULL,
    [CompanyId] bigint NOT NULL,
    CONSTRAINT [PK_Documents] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Documents_DocumentCategories_CategoryId] FOREIGN KEY ([CategoryId]) REFERENCES [DocumentCategories] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_Documents_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE CASCADE
);

GO

CREATE TABLE [Users] (
    [Id] bigint NOT NULL IDENTITY,
    [CreatedById] bigint NULL,
    [CreatedDate] datetime2 NULL,
    [ModifiedDate] datetime2 NULL,
    [ModifiedById] bigint NULL,
    [IsDeleted] bit NOT NULL,
    [NameEn] nvarchar(max) NULL,
    [NameAr] nvarchar(max) NULL,
    [UserName] nvarchar(max) NULL,
    [Password] nvarchar(max) NULL,
    [Email] nvarchar(max) NULL,
    [Phone] nvarchar(max) NULL,
    [NationalId] nvarchar(max) NULL,
    [RoleId] bigint NOT NULL,
    [CompanyId] bigint NULL,
    CONSTRAINT [PK_Users] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Users_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_Users_Roles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [Roles] ([Id]) ON DELETE CASCADE
);

GO

IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'CreatedById', N'CreatedDate', N'IsDeleted', N'LogoUrl', N'ModifiedById', N'ModifiedDate', N'NameAr', N'NameEn') AND [object_id] = OBJECT_ID(N'[Companies]'))
    SET IDENTITY_INSERT [Companies] ON;
INSERT INTO [Companies] ([Id], [CreatedById], [CreatedDate], [IsDeleted], [LogoUrl], [ModifiedById], [ModifiedDate], [NameAr], [NameEn])
VALUES (CAST(1 AS bigint), NULL, '2020-07-01T23:13:36.6611799+02:00', CAST(0 AS bit), NULL, NULL, '2020-07-01T23:13:36.6614692+02:00', N'السدحان', N'Alsadhan');
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'CreatedById', N'CreatedDate', N'IsDeleted', N'LogoUrl', N'ModifiedById', N'ModifiedDate', N'NameAr', N'NameEn') AND [object_id] = OBJECT_ID(N'[Companies]'))
    SET IDENTITY_INSERT [Companies] OFF;

GO

IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Code', N'CreatedById', N'CreatedDate', N'IsDeleted', N'ModifiedById', N'ModifiedDate', N'NameAr', N'NameEn') AND [object_id] = OBJECT_ID(N'[Permissions]'))
    SET IDENTITY_INSERT [Permissions] ON;
INSERT INTO [Permissions] ([Id], [Code], [CreatedById], [CreatedDate], [IsDeleted], [ModifiedById], [ModifiedDate], [NameAr], [NameEn])
VALUES (CAST(1 AS bigint), N'Add', NULL, '2020-07-01T23:13:36.6695342+02:00', CAST(0 AS bit), NULL, '2020-07-01T23:13:36.6695370+02:00', N'اضافة', N'Add'),
(CAST(2 AS bigint), N'Edit', NULL, '2020-07-01T23:13:36.6697581+02:00', CAST(0 AS bit), NULL, '2020-07-01T23:13:36.6697586+02:00', N'تعديل', N'Edit'),
(CAST(3 AS bigint), N'View', NULL, '2020-07-01T23:13:36.6697612+02:00', CAST(0 AS bit), NULL, '2020-07-01T23:13:36.6697613+02:00', N'عرض', N'View'),
(CAST(4 AS bigint), N'Delete', NULL, '2020-07-01T23:13:36.6697615+02:00', CAST(0 AS bit), NULL, '2020-07-01T23:13:36.6697616+02:00', N'حذف', N'Delete');
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Code', N'CreatedById', N'CreatedDate', N'IsDeleted', N'ModifiedById', N'ModifiedDate', N'NameAr', N'NameEn') AND [object_id] = OBJECT_ID(N'[Permissions]'))
    SET IDENTITY_INSERT [Permissions] OFF;

GO

IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'CompanyId', N'CreatedById', N'CreatedDate', N'IsDeleted', N'ModifiedById', N'ModifiedDate', N'NameAr', N'NameEn') AND [object_id] = OBJECT_ID(N'[Roles]'))
    SET IDENTITY_INSERT [Roles] ON;
INSERT INTO [Roles] ([Id], [CompanyId], [CreatedById], [CreatedDate], [IsDeleted], [ModifiedById], [ModifiedDate], [NameAr], [NameEn])
VALUES (CAST(1 AS bigint), CAST(1 AS bigint), NULL, '2020-07-01T23:13:36.6630192+02:00', CAST(0 AS bit), NULL, '2020-07-01T23:13:36.6630202+02:00', N'مدير', N'Admin');
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'CompanyId', N'CreatedById', N'CreatedDate', N'IsDeleted', N'ModifiedById', N'ModifiedDate', N'NameAr', N'NameEn') AND [object_id] = OBJECT_ID(N'[Roles]'))
    SET IDENTITY_INSERT [Roles] OFF;

GO

IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'CompanyId', N'CreatedById', N'CreatedDate', N'Email', N'IsDeleted', N'ModifiedById', N'ModifiedDate', N'NameAr', N'NameEn', N'NationalId', N'Password', N'Phone', N'RoleId', N'UserName') AND [object_id] = OBJECT_ID(N'[Users]'))
    SET IDENTITY_INSERT [Users] ON;
INSERT INTO [Users] ([Id], [CompanyId], [CreatedById], [CreatedDate], [Email], [IsDeleted], [ModifiedById], [ModifiedDate], [NameAr], [NameEn], [NationalId], [Password], [Phone], [RoleId], [UserName])
VALUES (CAST(1 AS bigint), CAST(1 AS bigint), NULL, '2020-07-01T23:13:36.6634670+02:00', N'Admin@admin.com', CAST(0 AS bit), NULL, '2020-07-01T23:13:36.6634678+02:00', N'مدير', N'Admin', NULL, N'ABJtWp6ttYd1xdHIg1ArtIOFhqrF8A/gKgDU4/L+UAlXd16jRQg/U7d6/F3aovBdfw==', N'01016670280', CAST(1 AS bigint), N'admin');
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'CompanyId', N'CreatedById', N'CreatedDate', N'Email', N'IsDeleted', N'ModifiedById', N'ModifiedDate', N'NameAr', N'NameEn', N'NationalId', N'Password', N'Phone', N'RoleId', N'UserName') AND [object_id] = OBJECT_ID(N'[Users]'))
    SET IDENTITY_INSERT [Users] OFF;

GO

CREATE INDEX [IX_Banners_CompanyId] ON [Banners] ([CompanyId]);

GO

CREATE INDEX [IX_Documents_CategoryId] ON [Documents] ([CategoryId]);

GO

CREATE INDEX [IX_Documents_CompanyId] ON [Documents] ([CompanyId]);

GO

CREATE INDEX [IX_News_CompanyId] ON [News] ([CompanyId]);

GO

CREATE UNIQUE INDEX [IX_Permissions_Code] ON [Permissions] ([Code]);

GO

CREATE INDEX [IX_Roles_CompanyId] ON [Roles] ([CompanyId]);

GO

CREATE INDEX [IX_Stores_CompanyId] ON [Stores] ([CompanyId]);

GO

CREATE INDEX [IX_Users_CompanyId] ON [Users] ([CompanyId]);

GO

CREATE INDEX [IX_Users_RoleId] ON [Users] ([RoleId]);

GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20200701191337_AddInitialModels', N'3.1.5');

GO

ALTER TABLE [Banners] DROP CONSTRAINT [FK_Banners_Companies_CompanyId];

GO

ALTER TABLE [Documents] DROP CONSTRAINT [FK_Documents_Companies_CompanyId];

GO

ALTER TABLE [News] DROP CONSTRAINT [FK_News_Companies_CompanyId];

GO

DECLARE @var0 sysname;
SELECT @var0 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[News]') AND [c].[name] = N'CompanyId');
IF @var0 IS NOT NULL EXEC(N'ALTER TABLE [News] DROP CONSTRAINT [' + @var0 + '];');
ALTER TABLE [News] ALTER COLUMN [CompanyId] bigint NULL;

GO

DECLARE @var1 sysname;
SELECT @var1 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Documents]') AND [c].[name] = N'CompanyId');
IF @var1 IS NOT NULL EXEC(N'ALTER TABLE [Documents] DROP CONSTRAINT [' + @var1 + '];');
ALTER TABLE [Documents] ALTER COLUMN [CompanyId] bigint NULL;

GO

DECLARE @var2 sysname;
SELECT @var2 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Banners]') AND [c].[name] = N'CompanyId');
IF @var2 IS NOT NULL EXEC(N'ALTER TABLE [Banners] DROP CONSTRAINT [' + @var2 + '];');
ALTER TABLE [Banners] ALTER COLUMN [CompanyId] bigint NULL;

GO

UPDATE [Companies] SET [CreatedDate] = '2020-07-01T23:25:02.6881380+02:00', [ModifiedDate] = '2020-07-01T23:25:02.6887242+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-01T23:25:02.6972924+02:00', [ModifiedDate] = '2020-07-01T23:25:02.6972957+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-01T23:25:02.6974743+02:00', [ModifiedDate] = '2020-07-01T23:25:02.6974749+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-01T23:25:02.6974777+02:00', [ModifiedDate] = '2020-07-01T23:25:02.6974778+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-01T23:25:02.6974780+02:00', [ModifiedDate] = '2020-07-01T23:25:02.6974781+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-07-01T23:25:02.6907002+02:00', [ModifiedDate] = '2020-07-01T23:25:02.6907026+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Users] SET [CreatedDate] = '2020-07-01T23:25:02.6911842+02:00', [ModifiedDate] = '2020-07-01T23:25:02.6911870+02:00', [Password] = N'AChvFhkAGE/eC4SJ8XeYUw44R/6Wv82nQdIdfZAA53EaQAyOhuG1uCefrm+oMKV5QA=='
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

ALTER TABLE [Banners] ADD CONSTRAINT [FK_Banners_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION;

GO

ALTER TABLE [Documents] ADD CONSTRAINT [FK_Documents_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION;

GO

ALTER TABLE [News] ADD CONSTRAINT [FK_News_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION;

GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20200701192503_MakeCompanyIdNullable', N'3.1.5');

GO

ALTER TABLE [Documents] DROP CONSTRAINT [FK_Documents_DocumentCategories_CategoryId];

GO

DECLARE @var3 sysname;
SELECT @var3 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Documents]') AND [c].[name] = N'CategoryId');
IF @var3 IS NOT NULL EXEC(N'ALTER TABLE [Documents] DROP CONSTRAINT [' + @var3 + '];');
ALTER TABLE [Documents] ALTER COLUMN [CategoryId] bigint NULL;

GO

UPDATE [Companies] SET [CreatedDate] = '2020-07-01T23:27:50.7370689+02:00', [ModifiedDate] = '2020-07-01T23:27:50.7373704+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-01T23:27:50.7455539+02:00', [ModifiedDate] = '2020-07-01T23:27:50.7455566+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-01T23:27:50.7459612+02:00', [ModifiedDate] = '2020-07-01T23:27:50.7459623+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-01T23:27:50.7459661+02:00', [ModifiedDate] = '2020-07-01T23:27:50.7459663+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-01T23:27:50.7459665+02:00', [ModifiedDate] = '2020-07-01T23:27:50.7459667+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-07-01T23:27:50.7390848+02:00', [ModifiedDate] = '2020-07-01T23:27:50.7390864+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Users] SET [CreatedDate] = '2020-07-01T23:27:50.7395864+02:00', [ModifiedDate] = '2020-07-01T23:27:50.7395872+02:00', [Password] = N'ABXYtTMsywEGR+OgwopoU9VRhid6G9J3rn5uAoD2ly4lyAnA6/zFYYGUO91ZaitIaA=='
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

ALTER TABLE [Documents] ADD CONSTRAINT [FK_Documents_DocumentCategories_CategoryId] FOREIGN KEY ([CategoryId]) REFERENCES [DocumentCategories] ([Id]) ON DELETE NO ACTION;

GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20200701192751_MakeDocumentCategoryIdNullable', N'3.1.5');

GO

DECLARE @var4 sysname;
SELECT @var4 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Users]') AND [c].[name] = N'UserName');
IF @var4 IS NOT NULL EXEC(N'ALTER TABLE [Users] DROP CONSTRAINT [' + @var4 + '];');
ALTER TABLE [Users] ALTER COLUMN [UserName] nvarchar(450) NULL;

GO

DECLARE @var5 sysname;
SELECT @var5 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Users]') AND [c].[name] = N'Email');
IF @var5 IS NOT NULL EXEC(N'ALTER TABLE [Users] DROP CONSTRAINT [' + @var5 + '];');
ALTER TABLE [Users] ALTER COLUMN [Email] nvarchar(450) NULL;

GO

UPDATE [Companies] SET [CreatedDate] = '2020-07-04T23:01:21.2314099+02:00', [ModifiedDate] = '2020-07-04T23:01:21.2317599+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-04T23:01:21.2487484+02:00', [ModifiedDate] = '2020-07-04T23:01:21.2487512+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-04T23:01:21.2489080+02:00', [ModifiedDate] = '2020-07-04T23:01:21.2489086+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-04T23:01:21.2489112+02:00', [ModifiedDate] = '2020-07-04T23:01:21.2489113+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-04T23:01:21.2489115+02:00', [ModifiedDate] = '2020-07-04T23:01:21.2489116+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-07-04T23:01:21.2334903+02:00', [ModifiedDate] = '2020-07-04T23:01:21.2334923+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Users] SET [CreatedDate] = '2020-07-04T23:01:21.2339502+02:00', [ModifiedDate] = '2020-07-04T23:01:21.2339510+02:00', [Password] = N'ALGW84oUUHjsDVMx/SsdP+p5prfmp5dbARagMDxAwcXVyOpiF3AQbhXLy7TWK3tn7A=='
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

CREATE UNIQUE INDEX [IX_Users_Email] ON [Users] ([Email]) WHERE [Email] IS NOT NULL;

GO

CREATE UNIQUE INDEX [IX_Users_UserName] ON [Users] ([UserName]) WHERE [UserName] IS NOT NULL;

GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20200704190121_MakeUsernameAndEmailUnique', N'3.1.5');

GO

DROP INDEX [IX_Users_UserName] ON [Users];

GO

UPDATE [Companies] SET [CreatedDate] = '2020-07-04T23:10:08.3521172+02:00', [ModifiedDate] = '2020-07-04T23:10:08.3524206+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-04T23:10:08.3604129+02:00', [ModifiedDate] = '2020-07-04T23:10:08.3604159+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-04T23:10:08.3605882+02:00', [ModifiedDate] = '2020-07-04T23:10:08.3605888+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-04T23:10:08.3605928+02:00', [ModifiedDate] = '2020-07-04T23:10:08.3605930+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-04T23:10:08.3605931+02:00', [ModifiedDate] = '2020-07-04T23:10:08.3605932+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-07-04T23:10:08.3539251+02:00', [ModifiedDate] = '2020-07-04T23:10:08.3539463+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Users] SET [CreatedDate] = '2020-07-04T23:10:08.3544870+02:00', [ModifiedDate] = '2020-07-04T23:10:08.3544879+02:00', [Password] = N'AEIHhNmFqWkA5Lwfj1mQ2R4wujJhL8zfGTRZ4iBOZ8pN51ssuJQ7AWD9+UuR5taf6A=='
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

CREATE UNIQUE INDEX [IX_Users_UserName_IsDeleted] ON [Users] ([UserName], [IsDeleted]) WHERE [UserName] IS NOT NULL;

GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20200704191008_ChangeUsernameIndex', N'3.1.5');

GO

UPDATE [Companies] SET [CreatedDate] = '2020-07-04T23:25:52.1299716+02:00', [ModifiedDate] = '2020-07-04T23:25:52.1302830+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-04T23:25:52.1379266+02:00', [ModifiedDate] = '2020-07-04T23:25:52.1379297+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-04T23:25:52.1380837+02:00', [ModifiedDate] = '2020-07-04T23:25:52.1380842+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-04T23:25:52.1380881+02:00', [ModifiedDate] = '2020-07-04T23:25:52.1380882+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-04T23:25:52.1380884+02:00', [ModifiedDate] = '2020-07-04T23:25:52.1380885+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-07-04T23:25:52.1318713+02:00', [ModifiedDate] = '2020-07-04T23:25:52.1318726+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'CompanyId', N'CreatedById', N'CreatedDate', N'IsDeleted', N'ModifiedById', N'ModifiedDate', N'NameAr', N'NameEn') AND [object_id] = OBJECT_ID(N'[Roles]'))
    SET IDENTITY_INSERT [Roles] ON;
INSERT INTO [Roles] ([Id], [CompanyId], [CreatedById], [CreatedDate], [IsDeleted], [ModifiedById], [ModifiedDate], [NameAr], [NameEn])
VALUES (CAST(2 AS bigint), CAST(1 AS bigint), NULL, '2020-07-04T23:25:52.1320684+02:00', CAST(0 AS bit), NULL, '2020-07-04T23:25:52.1320691+02:00', N'مستخدم', N'User');
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'CompanyId', N'CreatedById', N'CreatedDate', N'IsDeleted', N'ModifiedById', N'ModifiedDate', N'NameAr', N'NameEn') AND [object_id] = OBJECT_ID(N'[Roles]'))
    SET IDENTITY_INSERT [Roles] OFF;

GO

UPDATE [Users] SET [CreatedDate] = '2020-07-04T23:25:52.1323664+02:00', [ModifiedDate] = '2020-07-04T23:25:52.1323671+02:00', [Password] = N'AELdBp98DsytVWKh9x1J4+oomx0p4B6oExDw5Cs6vLEVi0XaR0VqVsXF2IOVVNx2gQ=='
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20200704192552_SeedUserRole', N'3.1.5');

GO

DECLARE @var6 sysname;
SELECT @var6 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Roles]') AND [c].[name] = N'NameEn');
IF @var6 IS NOT NULL EXEC(N'ALTER TABLE [Roles] DROP CONSTRAINT [' + @var6 + '];');
ALTER TABLE [Roles] ALTER COLUMN [NameEn] nvarchar(450) NULL;

GO

UPDATE [Companies] SET [CreatedDate] = '2020-07-04T23:30:38.7932619+02:00', [ModifiedDate] = '2020-07-04T23:30:38.7936827+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-04T23:30:38.8011195+02:00', [ModifiedDate] = '2020-07-04T23:30:38.8011221+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-04T23:30:38.8012786+02:00', [ModifiedDate] = '2020-07-04T23:30:38.8012791+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-04T23:30:38.8012830+02:00', [ModifiedDate] = '2020-07-04T23:30:38.8012831+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-04T23:30:38.8012833+02:00', [ModifiedDate] = '2020-07-04T23:30:38.8012834+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-07-04T23:30:38.7952442+02:00', [ModifiedDate] = '2020-07-04T23:30:38.7952459+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-07-04T23:30:38.7954044+02:00', [ModifiedDate] = '2020-07-04T23:30:38.7954049+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Users] SET [CreatedDate] = '2020-07-04T23:30:38.7956838+02:00', [ModifiedDate] = '2020-07-04T23:30:38.7956845+02:00', [Password] = N'AOwNVZ9enEr6+DeKMISXgeTBjaS7sG/AzVNd7Mge00hruFKY6PwL8jIii3Xp9M7Hqg=='
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

CREATE UNIQUE INDEX [IX_Roles_NameEn_CompanyId_IsDeleted] ON [Roles] ([NameEn], [CompanyId], [IsDeleted]) WHERE [NameEn] IS NOT NULL;

GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20200704193039_AddIndexToRoleTable', N'3.1.5');

GO

ALTER TABLE [Users] ADD [FullName] nvarchar(max) NULL;

GO

UPDATE [Companies] SET [CreatedDate] = '2020-07-04T23:36:38.3538983+02:00', [ModifiedDate] = '2020-07-04T23:36:38.3541939+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-04T23:36:38.3629471+02:00', [ModifiedDate] = '2020-07-04T23:36:38.3629500+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-04T23:36:38.3631018+02:00', [ModifiedDate] = '2020-07-04T23:36:38.3631023+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-04T23:36:38.3631073+02:00', [ModifiedDate] = '2020-07-04T23:36:38.3631075+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-04T23:36:38.3631076+02:00', [ModifiedDate] = '2020-07-04T23:36:38.3631077+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-07-04T23:36:38.3557556+02:00', [ModifiedDate] = '2020-07-04T23:36:38.3557569+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-07-04T23:36:38.3560513+02:00', [ModifiedDate] = '2020-07-04T23:36:38.3560519+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Users] SET [CreatedDate] = '2020-07-04T23:36:38.3565154+02:00', [ModifiedDate] = '2020-07-04T23:36:38.3565166+02:00', [Password] = N'ANoEy16UEqlgI3UnzUZhOOICxHxfECALJwzMHkN7LjoPYWLdcxiq0ewdc1Rjw1ECQQ=='
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20200704193638_AddFullNameToUser', N'3.1.5');

GO

DECLARE @var7 sysname;
SELECT @var7 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Banners]') AND [c].[name] = N'ImageUrl');
IF @var7 IS NOT NULL EXEC(N'ALTER TABLE [Banners] DROP CONSTRAINT [' + @var7 + '];');
ALTER TABLE [Banners] DROP COLUMN [ImageUrl];

GO

ALTER TABLE [Users] ADD [IsActive] bit NOT NULL DEFAULT CAST(0 AS bit);

GO

ALTER TABLE [Stores] ADD [IsActive] bit NOT NULL DEFAULT CAST(0 AS bit);

GO

ALTER TABLE [Roles] ADD [IsActive] bit NOT NULL DEFAULT CAST(0 AS bit);

GO

ALTER TABLE [Permissions] ADD [IsActive] bit NOT NULL DEFAULT CAST(0 AS bit);

GO

ALTER TABLE [News] ADD [ImageUrl] nvarchar(max) NULL;

GO

ALTER TABLE [News] ADD [IsActive] bit NOT NULL DEFAULT CAST(0 AS bit);

GO

ALTER TABLE [Documents] ADD [IsActive] bit NOT NULL DEFAULT CAST(0 AS bit);

GO

ALTER TABLE [DocumentCategories] ADD [IsActive] bit NOT NULL DEFAULT CAST(0 AS bit);

GO

ALTER TABLE [Companies] ADD [IsActive] bit NOT NULL DEFAULT CAST(0 AS bit);

GO

ALTER TABLE [Banners] ADD [ImageUrlAr] nvarchar(max) NULL;

GO

ALTER TABLE [Banners] ADD [ImageUrlEn] nvarchar(max) NULL;

GO

ALTER TABLE [Banners] ADD [IsActive] bit NOT NULL DEFAULT CAST(0 AS bit);

GO

UPDATE [Companies] SET [CreatedDate] = '2020-07-07T00:55:26.8893732+02:00', [ModifiedDate] = '2020-07-07T00:55:26.8903192+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-07T00:55:26.8975136+02:00', [ModifiedDate] = '2020-07-07T00:55:26.8975147+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-07T00:55:26.8976764+02:00', [ModifiedDate] = '2020-07-07T00:55:26.8976769+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-07T00:55:26.8976804+02:00', [ModifiedDate] = '2020-07-07T00:55:26.8976805+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-07T00:55:26.8976807+02:00', [ModifiedDate] = '2020-07-07T00:55:26.8976808+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-07-07T00:55:26.8917547+02:00', [ModifiedDate] = '2020-07-07T00:55:26.8917555+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-07-07T00:55:26.8919280+02:00', [ModifiedDate] = '2020-07-07T00:55:26.8919286+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Users] SET [CreatedDate] = '2020-07-07T00:55:26.8922256+02:00', [ModifiedDate] = '2020-07-07T00:55:26.8922263+02:00', [Password] = N'AD6dqIW4Ykp6TISdUrZ2S9vLvMUCv1c24KmHk/WGo7m76Mi9OG07seJ6VZev4nXEdA=='
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20200706225527_ModifyBanner-News', N'3.1.5');

GO

ALTER TABLE [Banners] ADD [Url] nvarchar(max) NULL;

GO

UPDATE [Companies] SET [CreatedDate] = '2020-07-07T21:05:58.7824294+02:00', [ModifiedDate] = '2020-07-07T21:05:58.7836522+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-07T21:05:58.7947404+02:00', [ModifiedDate] = '2020-07-07T21:05:58.7947413+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-07T21:05:58.7948975+02:00', [ModifiedDate] = '2020-07-07T21:05:58.7948982+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-07T21:05:58.7949020+02:00', [ModifiedDate] = '2020-07-07T21:05:58.7949021+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-07T21:05:58.7949022+02:00', [ModifiedDate] = '2020-07-07T21:05:58.7949023+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-07-07T21:05:58.7851826+02:00', [ModifiedDate] = '2020-07-07T21:05:58.7851835+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-07-07T21:05:58.7853634+02:00', [ModifiedDate] = '2020-07-07T21:05:58.7853640+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Users] SET [CreatedDate] = '2020-07-07T21:05:58.7856469+02:00', [ModifiedDate] = '2020-07-07T21:05:58.7856477+02:00', [Password] = N'ABDC22yztnb+GL93baPWcVY2TXARAPDCJoNVMqnhdzXOMoiZTdzixGriWeF3DBeReQ=='
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20200707190559_AddBannerUrl', N'3.1.5');

GO

ALTER TABLE [Roles] ADD [Code] nvarchar(255) NOT NULL DEFAULT N'';

GO

CREATE TABLE [Pages] (
    [Id] bigint NOT NULL IDENTITY,
    [CreatedById] bigint NULL,
    [CreatedDate] datetime2 NULL,
    [ModifiedDate] datetime2 NULL,
    [ModifiedById] bigint NULL,
    [IsDeleted] bit NOT NULL,
    [NameEn] nvarchar(max) NULL,
    [NameAr] nvarchar(max) NULL,
    [Url] nvarchar(max) NULL,
    [Icon] nvarchar(max) NULL,
    [ParentId] bigint NULL,
    [Code] nvarchar(255) NOT NULL,
    CONSTRAINT [PK_Pages] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Pages_Pages_ParentId] FOREIGN KEY ([ParentId]) REFERENCES [Pages] ([Id]) ON DELETE NO ACTION
);

GO

CREATE TABLE [RoleClaims] (
    [Id] bigint NOT NULL IDENTITY,
    [CreatedById] bigint NULL,
    [CreatedDate] datetime2 NULL,
    [ModifiedDate] datetime2 NULL,
    [ModifiedById] bigint NULL,
    [IsDeleted] bit NOT NULL,
    [ClaimType] nvarchar(max) NULL,
    [ClaimValue] nvarchar(max) NULL,
    [RoleId] bigint NOT NULL,
    CONSTRAINT [PK_RoleClaims] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_RoleClaims_Roles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [Roles] ([Id]) ON DELETE CASCADE
);

GO

CREATE TABLE [PagePermissions] (
    [Id] bigint NOT NULL IDENTITY,
    [CreatedById] bigint NULL,
    [CreatedDate] datetime2 NULL,
    [ModifiedDate] datetime2 NULL,
    [ModifiedById] bigint NULL,
    [IsDeleted] bit NOT NULL,
    [PageId] bigint NOT NULL,
    [PermissionId] bigint NOT NULL,
    CONSTRAINT [PK_PagePermissions] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_PagePermissions_Pages_PageId] FOREIGN KEY ([PageId]) REFERENCES [Pages] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_PagePermissions_Permissions_PermissionId] FOREIGN KEY ([PermissionId]) REFERENCES [Permissions] ([Id]) ON DELETE CASCADE
);

GO

CREATE TABLE [RolePermissions] (
    [RoleId] bigint NOT NULL,
    [PageId] bigint NOT NULL,
    [PermissionId] bigint NOT NULL,
    [CreatedById] bigint NULL,
    [CreatedDate] datetime2 NULL,
    [ModifiedDate] datetime2 NULL,
    [ModifiedById] bigint NULL,
    [IsDeleted] bit NOT NULL,
    CONSTRAINT [PK_RolePermissions] PRIMARY KEY ([RoleId], [PermissionId], [PageId]),
    CONSTRAINT [FK_RolePermissions_Pages_PageId] FOREIGN KEY ([PageId]) REFERENCES [Pages] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_RolePermissions_Permissions_PermissionId] FOREIGN KEY ([PermissionId]) REFERENCES [Permissions] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_RolePermissions_Roles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [Roles] ([Id]) ON DELETE CASCADE
);

GO

UPDATE [Companies] SET [CreatedDate] = '2020-07-07T23:22:39.3762453+02:00', [ModifiedDate] = '2020-07-07T23:22:39.3767447+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-07T23:22:39.3847928+02:00', [ModifiedDate] = '2020-07-07T23:22:39.3847958+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-07T23:22:39.3850267+02:00', [ModifiedDate] = '2020-07-07T23:22:39.3850273+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-07T23:22:39.3850316+02:00', [ModifiedDate] = '2020-07-07T23:22:39.3850318+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-07T23:22:39.3850319+02:00', [ModifiedDate] = '2020-07-07T23:22:39.3850320+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [Code] = N'Comp1-Admin', [CreatedDate] = '2020-07-07T23:22:39.3786198+02:00', [ModifiedDate] = '2020-07-07T23:22:39.3786220+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [Code] = N'Comp1-User', [CreatedDate] = '2020-07-07T23:22:39.3788352+02:00', [ModifiedDate] = '2020-07-07T23:22:39.3788359+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Users] SET [CreatedDate] = '2020-07-07T23:22:39.3791655+02:00', [ModifiedDate] = '2020-07-07T23:22:39.3791678+02:00', [Password] = N'AKGv3k9sbFswTkTmbOr10ZYwtRTzHtPpCi+u/B/bji5c5+Z+iDtPsgPRAp4WYfHMxA=='
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

CREATE UNIQUE INDEX [IX_Roles_Code] ON [Roles] ([Code]);

GO

CREATE INDEX [IX_PagePermissions_PageId] ON [PagePermissions] ([PageId]);

GO

CREATE INDEX [IX_PagePermissions_PermissionId] ON [PagePermissions] ([PermissionId]);

GO

CREATE UNIQUE INDEX [IX_Pages_Code] ON [Pages] ([Code]);

GO

CREATE INDEX [IX_Pages_ParentId] ON [Pages] ([ParentId]);

GO

CREATE INDEX [IX_RoleClaims_RoleId] ON [RoleClaims] ([RoleId]);

GO

CREATE INDEX [IX_RolePermissions_PageId] ON [RolePermissions] ([PageId]);

GO

CREATE INDEX [IX_RolePermissions_PermissionId] ON [RolePermissions] ([PermissionId]);

GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20200707192239_AddUserRoleEntities', N'3.1.5');

GO

ALTER TABLE [RolePermissions] ADD [IsActive] bit NOT NULL DEFAULT CAST(0 AS bit);

GO

ALTER TABLE [RoleClaims] ADD [IsActive] bit NOT NULL DEFAULT CAST(0 AS bit);

GO

ALTER TABLE [Pages] ADD [IsActive] bit NOT NULL DEFAULT CAST(0 AS bit);

GO

ALTER TABLE [PagePermissions] ADD [IsActive] bit NOT NULL DEFAULT CAST(0 AS bit);

GO

ALTER TABLE [Documents] ADD [ContentType] nvarchar(max) NULL;

GO

ALTER TABLE [Documents] ADD [DocumentSize] decimal(18,2) NOT NULL DEFAULT 0.0;

GO

ALTER TABLE [Documents] ADD [DocumentSizeAr] decimal(18,2) NOT NULL DEFAULT 0.0;

GO

ALTER TABLE [Documents] ADD [DocumentTypeAr] nvarchar(max) NULL;

GO

ALTER TABLE [Documents] ADD [DocumentTypeEn] nvarchar(max) NULL;

GO

ALTER TABLE [Documents] ADD [UploadedByAr] nvarchar(max) NULL;

GO

ALTER TABLE [Documents] ADD [UploadedByEn] nvarchar(max) NULL;

GO

ALTER TABLE [Documents] ADD [UploadedByImage] nvarchar(max) NULL;

GO

UPDATE [Companies] SET [CreatedDate] = '2020-07-08T01:02:54.8520884+02:00', [ModifiedDate] = '2020-07-08T01:02:54.8524642+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-08T01:02:54.8606690+02:00', [ModifiedDate] = '2020-07-08T01:02:54.8606717+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-08T01:02:54.8607728+02:00', [ModifiedDate] = '2020-07-08T01:02:54.8607732+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-08T01:02:54.8607773+02:00', [ModifiedDate] = '2020-07-08T01:02:54.8607774+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-08T01:02:54.8607776+02:00', [ModifiedDate] = '2020-07-08T01:02:54.8607777+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-07-08T01:02:54.8540525+02:00', [ModifiedDate] = '2020-07-08T01:02:54.8540536+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-07-08T01:02:54.8542557+02:00', [ModifiedDate] = '2020-07-08T01:02:54.8542564+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Users] SET [CreatedDate] = '2020-07-08T01:02:54.8545256+02:00', [ModifiedDate] = '2020-07-08T01:02:54.8545263+02:00', [Password] = N'AOVaF97+IELZRIjq6BiJ4xl+aKTYBnFrEn8qt48keVKwQhIrmDQ8KiForL8T52fUjQ=='
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20200707210255_AddAdditionalPropertiesToDocumentEntity', N'3.1.5');

GO

DECLARE @var8 sysname;
SELECT @var8 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Documents]') AND [c].[name] = N'ContentType');
IF @var8 IS NOT NULL EXEC(N'ALTER TABLE [Documents] DROP CONSTRAINT [' + @var8 + '];');
ALTER TABLE [Documents] DROP COLUMN [ContentType];

GO

DECLARE @var9 sysname;
SELECT @var9 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Documents]') AND [c].[name] = N'DocumentSizeAr');
IF @var9 IS NOT NULL EXEC(N'ALTER TABLE [Documents] DROP CONSTRAINT [' + @var9 + '];');
ALTER TABLE [Documents] DROP COLUMN [DocumentSizeAr];

GO

DECLARE @var10 sysname;
SELECT @var10 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Documents]') AND [c].[name] = N'DocumentTypeAr');
IF @var10 IS NOT NULL EXEC(N'ALTER TABLE [Documents] DROP CONSTRAINT [' + @var10 + '];');
ALTER TABLE [Documents] DROP COLUMN [DocumentTypeAr];

GO

DECLARE @var11 sysname;
SELECT @var11 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Documents]') AND [c].[name] = N'DocumentTypeEn');
IF @var11 IS NOT NULL EXEC(N'ALTER TABLE [Documents] DROP CONSTRAINT [' + @var11 + '];');
ALTER TABLE [Documents] DROP COLUMN [DocumentTypeEn];

GO

DECLARE @var12 sysname;
SELECT @var12 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Documents]') AND [c].[name] = N'UploadedByAr');
IF @var12 IS NOT NULL EXEC(N'ALTER TABLE [Documents] DROP CONSTRAINT [' + @var12 + '];');
ALTER TABLE [Documents] DROP COLUMN [UploadedByAr];

GO

DECLARE @var13 sysname;
SELECT @var13 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Documents]') AND [c].[name] = N'UploadedByEn');
IF @var13 IS NOT NULL EXEC(N'ALTER TABLE [Documents] DROP CONSTRAINT [' + @var13 + '];');
ALTER TABLE [Documents] DROP COLUMN [UploadedByEn];

GO

DECLARE @var14 sysname;
SELECT @var14 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Documents]') AND [c].[name] = N'UploadedByImage');
IF @var14 IS NOT NULL EXEC(N'ALTER TABLE [Documents] DROP CONSTRAINT [' + @var14 + '];');
ALTER TABLE [Documents] DROP COLUMN [UploadedByImage];

GO

ALTER TABLE [Documents] ADD [DocumentExtension] nvarchar(max) NULL;

GO

ALTER TABLE [Documents] ADD [MimeType] nvarchar(max) NULL;

GO

CREATE TABLE [Applications] (
    [Id] bigint NOT NULL IDENTITY,
    [CreatedById] bigint NULL,
    [CreatedDate] datetime2 NULL,
    [ModifiedDate] datetime2 NULL,
    [ModifiedById] bigint NULL,
    [IsDeleted] bit NOT NULL,
    [IsActive] bit NOT NULL,
    [Name] nvarchar(max) NULL,
    [NameAr] nvarchar(max) NULL,
    [Description] nvarchar(max) NULL,
    [DescriptionAr] nvarchar(max) NULL,
    [LinkUrl] nvarchar(max) NULL,
    [IconName] nvarchar(max) NULL,
    CONSTRAINT [PK_Applications] PRIMARY KEY ([Id])
);

GO

UPDATE [Companies] SET [CreatedDate] = '2020-07-10T17:34:32.9831268+02:00', [ModifiedDate] = '2020-07-10T17:34:32.9839906+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-10T17:34:32.9912286+02:00', [ModifiedDate] = '2020-07-10T17:34:32.9912295+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-10T17:34:32.9914673+02:00', [ModifiedDate] = '2020-07-10T17:34:32.9914680+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-10T17:34:32.9914738+02:00', [ModifiedDate] = '2020-07-10T17:34:32.9914739+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-10T17:34:32.9914741+02:00', [ModifiedDate] = '2020-07-10T17:34:32.9914742+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-07-10T17:34:32.9854508+02:00', [ModifiedDate] = '2020-07-10T17:34:32.9854516+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-07-10T17:34:32.9856511+02:00', [ModifiedDate] = '2020-07-10T17:34:32.9856517+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Users] SET [CreatedDate] = '2020-07-10T17:34:32.9859306+02:00', [ModifiedDate] = '2020-07-10T17:34:32.9859314+02:00', [Password] = N'AGTkEL219Y7174DSKIGd3ZVKs+pjjfknabzH4oIwsxN7pQA7xsPZ+FKhZLJzmaFzOQ=='
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20200710153433_Add-Application-Modify-Document', N'3.1.5');

GO

ALTER TABLE [Roles] DROP CONSTRAINT [FK_Roles_Companies_CompanyId];

GO

DROP INDEX [IX_Roles_NameEn_CompanyId_IsDeleted] ON [Roles];

GO

DECLARE @var15 sysname;
SELECT @var15 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Roles]') AND [c].[name] = N'CompanyId');
IF @var15 IS NOT NULL EXEC(N'ALTER TABLE [Roles] DROP CONSTRAINT [' + @var15 + '];');
ALTER TABLE [Roles] ALTER COLUMN [CompanyId] bigint NULL;

GO

UPDATE [Companies] SET [CreatedDate] = '2020-07-11T07:29:38.5615222+02:00', [ModifiedDate] = '2020-07-11T07:29:38.5618481+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-11T07:29:38.5694696+02:00', [ModifiedDate] = '2020-07-11T07:29:38.5694721+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-11T07:29:38.5696307+02:00', [ModifiedDate] = '2020-07-11T07:29:38.5696312+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-11T07:29:38.5696353+02:00', [ModifiedDate] = '2020-07-11T07:29:38.5696354+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-11T07:29:38.5696356+02:00', [ModifiedDate] = '2020-07-11T07:29:38.5696357+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-07-11T07:29:38.5635370+02:00', [ModifiedDate] = '2020-07-11T07:29:38.5635414+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-07-11T07:29:38.5637591+02:00', [ModifiedDate] = '2020-07-11T07:29:38.5637596+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Users] SET [CreatedDate] = '2020-07-11T07:29:38.5640521+02:00', [ModifiedDate] = '2020-07-11T07:29:38.5640529+02:00', [Password] = N'ABsVXtlToxGTFTPXhiJB0nds8ObOr+bmfhc6Ny0zHmBlMSFNQgdHGHDf8Etr2DDBCw=='
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

CREATE UNIQUE INDEX [IX_Roles_NameEn_CompanyId_IsDeleted] ON [Roles] ([NameEn], [CompanyId], [IsDeleted]) WHERE [NameEn] IS NOT NULL AND [CompanyId] IS NOT NULL;

GO

ALTER TABLE [Roles] ADD CONSTRAINT [FK_Roles_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION;

GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20200711032939_MakeCompanyIdNullableInRoleTable', N'3.1.5');

GO

ALTER TABLE [Users] ADD [TeamId] bigint NULL;

GO

CREATE TABLE [Teams] (
    [Id] bigint NOT NULL IDENTITY,
    [CreatedById] bigint NULL,
    [CreatedDate] datetime2 NULL,
    [ModifiedDate] datetime2 NULL,
    [ModifiedById] bigint NULL,
    [IsDeleted] bit NOT NULL,
    [IsActive] bit NOT NULL,
    [NameEn] nvarchar(max) NULL,
    [NameAr] nvarchar(max) NULL,
    CONSTRAINT [PK_Teams] PRIMARY KEY ([Id])
);

GO

UPDATE [Companies] SET [CreatedDate] = '2020-07-13T00:14:54.1703549+02:00', [ModifiedDate] = '2020-07-13T00:14:54.1706580+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-13T00:14:54.1780894+02:00', [ModifiedDate] = '2020-07-13T00:14:54.1780915+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-13T00:14:54.1782784+02:00', [ModifiedDate] = '2020-07-13T00:14:54.1782791+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-13T00:14:54.1782839+02:00', [ModifiedDate] = '2020-07-13T00:14:54.1782840+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-13T00:14:54.1782842+02:00', [ModifiedDate] = '2020-07-13T00:14:54.1782843+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-07-13T00:14:54.1723112+02:00', [ModifiedDate] = '2020-07-13T00:14:54.1723122+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-07-13T00:14:54.1725717+02:00', [ModifiedDate] = '2020-07-13T00:14:54.1725723+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Users] SET [CreatedDate] = '2020-07-13T00:14:54.1728538+02:00', [ModifiedDate] = '2020-07-13T00:14:54.1728545+02:00', [Password] = N'AEO5NOmh52LaGiBEMmimIHkD3U8eh/P5vFFcIBOxaGvvNrJ5UvB5ifli7FThh/B2jA=='
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

CREATE INDEX [IX_Users_TeamId] ON [Users] ([TeamId]);

GO

ALTER TABLE [Users] ADD CONSTRAINT [FK_Users_Teams_TeamId] FOREIGN KEY ([TeamId]) REFERENCES [Teams] ([Id]) ON DELETE NO ACTION;

GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20200712201454_AddTeamEntity', N'3.1.5');

GO

UPDATE [Companies] SET [CreatedDate] = '2020-07-13T00:28:18.3865598+02:00', [ModifiedDate] = '2020-07-13T00:28:18.3869147+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-13T00:28:18.3962757+02:00', [ModifiedDate] = '2020-07-13T00:28:18.3962789+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-13T00:28:18.3964532+02:00', [ModifiedDate] = '2020-07-13T00:28:18.3964537+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-13T00:28:18.3964576+02:00', [ModifiedDate] = '2020-07-13T00:28:18.3964577+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-13T00:28:18.3964579+02:00', [ModifiedDate] = '2020-07-13T00:28:18.3964580+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-07-13T00:28:18.3887075+02:00', [ModifiedDate] = '2020-07-13T00:28:18.3887092+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-07-13T00:28:18.3890258+02:00', [ModifiedDate] = '2020-07-13T00:28:18.3890271+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'CreatedById', N'CreatedDate', N'IsActive', N'IsDeleted', N'ModifiedById', N'ModifiedDate', N'NameAr', N'NameEn') AND [object_id] = OBJECT_ID(N'[Teams]'))
    SET IDENTITY_INSERT [Teams] ON;
INSERT INTO [Teams] ([Id], [CreatedById], [CreatedDate], [IsActive], [IsDeleted], [ModifiedById], [ModifiedDate], [NameAr], [NameEn])
VALUES (CAST(1 AS bigint), NULL, '2020-07-13T00:28:18.3968030+02:00', CAST(0 AS bit), CAST(0 AS bit), NULL, '2020-07-13T00:28:18.3968037+02:00', N'فريق الادارة', N'Management Team'),
(CAST(2 AS bigint), NULL, '2020-07-13T00:28:18.3969366+02:00', CAST(0 AS bit), CAST(0 AS bit), NULL, '2020-07-13T00:28:18.3969371+02:00', N'فريق العمل', N'Board Team');
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'CreatedById', N'CreatedDate', N'IsActive', N'IsDeleted', N'ModifiedById', N'ModifiedDate', N'NameAr', N'NameEn') AND [object_id] = OBJECT_ID(N'[Teams]'))
    SET IDENTITY_INSERT [Teams] OFF;

GO

UPDATE [Users] SET [CreatedDate] = '2020-07-13T00:28:18.3893744+02:00', [ModifiedDate] = '2020-07-13T00:28:18.3893753+02:00', [Password] = N'AOaV6ZiPxEVAgnmZlfGbPAnCZTnf52P6y+16oeoS41faWAM1w7NLQB4SUKiGK7m+aQ=='
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20200712202819_SeedTeamTable', N'3.1.5');

GO

CREATE TABLE [Visions] (
    [Id] bigint NOT NULL IDENTITY,
    [CreatedById] bigint NULL,
    [CreatedDate] datetime2 NULL,
    [ModifiedDate] datetime2 NULL,
    [ModifiedById] bigint NULL,
    [IsDeleted] bit NOT NULL,
    [IsActive] bit NOT NULL,
    [TitleEn] nvarchar(max) NULL,
    [TitleAr] nvarchar(max) NULL,
    [DescriptionEn] nvarchar(max) NULL,
    [DescriptionAr] nvarchar(max) NULL,
    CONSTRAINT [PK_Visions] PRIMARY KEY ([Id])
);

GO

UPDATE [Companies] SET [CreatedDate] = '2020-07-13T00:28:52.7362708+02:00', [ModifiedDate] = '2020-07-13T00:28:52.7365786+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-13T00:28:52.7445799+02:00', [ModifiedDate] = '2020-07-13T00:28:52.7445824+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-13T00:28:52.7447576+02:00', [ModifiedDate] = '2020-07-13T00:28:52.7447581+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-13T00:28:52.7447620+02:00', [ModifiedDate] = '2020-07-13T00:28:52.7447621+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-13T00:28:52.7447623+02:00', [ModifiedDate] = '2020-07-13T00:28:52.7447624+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-07-13T00:28:52.7383581+02:00', [ModifiedDate] = '2020-07-13T00:28:52.7383598+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-07-13T00:28:52.7386015+02:00', [ModifiedDate] = '2020-07-13T00:28:52.7386022+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-07-13T00:28:52.7450654+02:00', [ModifiedDate] = '2020-07-13T00:28:52.7450663+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-07-13T00:28:52.7452017+02:00', [ModifiedDate] = '2020-07-13T00:28:52.7452023+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Users] SET [CreatedDate] = '2020-07-13T00:28:52.7389494+02:00', [ModifiedDate] = '2020-07-13T00:28:52.7389503+02:00', [Password] = N'ADSCQcXcHNxm8g1Orq4vyQRiVP31QWTrWj2NQBxhJP9roegoR8Y2X3IZ1UGJ25/bIQ=='
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20200712202853_AddVisionEntity', N'3.1.5');

GO

CREATE TABLE [Missions] (
    [Id] bigint NOT NULL IDENTITY,
    [CreatedById] bigint NULL,
    [CreatedDate] datetime2 NULL,
    [ModifiedDate] datetime2 NULL,
    [ModifiedById] bigint NULL,
    [IsDeleted] bit NOT NULL,
    [IsActive] bit NOT NULL,
    [TitleEn] nvarchar(max) NULL,
    [TitleAr] nvarchar(max) NULL,
    [DescriptionEn] nvarchar(max) NULL,
    [DescriptionAr] nvarchar(max) NULL,
    CONSTRAINT [PK_Missions] PRIMARY KEY ([Id])
);

GO

UPDATE [Companies] SET [CreatedDate] = '2020-07-15T18:44:29.4326672+02:00', [ModifiedDate] = '2020-07-15T18:44:29.4331089+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-15T18:44:29.4450348+02:00', [ModifiedDate] = '2020-07-15T18:44:29.4450379+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-15T18:44:29.4452024+02:00', [ModifiedDate] = '2020-07-15T18:44:29.4452030+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-15T18:44:29.4452081+02:00', [ModifiedDate] = '2020-07-15T18:44:29.4452082+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-15T18:44:29.4452084+02:00', [ModifiedDate] = '2020-07-15T18:44:29.4452085+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-07-15T18:44:29.4354043+02:00', [ModifiedDate] = '2020-07-15T18:44:29.4354061+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-07-15T18:44:29.4356405+02:00', [ModifiedDate] = '2020-07-15T18:44:29.4356413+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-07-15T18:44:29.4457031+02:00', [ModifiedDate] = '2020-07-15T18:44:29.4457045+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-07-15T18:44:29.4458814+02:00', [ModifiedDate] = '2020-07-15T18:44:29.4458825+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Users] SET [CreatedDate] = '2020-07-15T18:44:29.4362905+02:00', [ModifiedDate] = '2020-07-15T18:44:29.4362915+02:00', [Password] = N'ACDRnakvFyUWjaXx3YEMRQFEyLyPjU4LNdekeoMsAE2B/rWJIR39kLl8F8x+zIFFOg=='
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20200715144430_AddMissionEntity', N'3.1.5');

GO

CREATE TABLE [Actions] (
    [Id] bigint NOT NULL IDENTITY,
    [CreatedById] bigint NULL,
    [CreatedDate] datetime2 NULL,
    [ModifiedDate] datetime2 NULL,
    [ModifiedById] bigint NULL,
    [IsDeleted] bit NOT NULL,
    [IsActive] bit NOT NULL,
    [NameEn] nvarchar(50) NULL,
    [NameAr] nvarchar(50) NULL,
    [Code] nvarchar(50) NULL,
    [Color] nvarchar(50) NULL,
    CONSTRAINT [PK_Actions] PRIMARY KEY ([Id])
);

GO

CREATE TABLE [Groups] (
    [Id] bigint NOT NULL IDENTITY,
    [CreatedById] bigint NULL,
    [CreatedDate] datetime2 NULL,
    [ModifiedDate] datetime2 NULL,
    [ModifiedById] bigint NULL,
    [IsDeleted] bit NOT NULL,
    [IsActive] bit NOT NULL,
    [NameEn] nvarchar(50) NULL,
    [NameAr] nvarchar(50) NULL,
    CONSTRAINT [PK_Groups] PRIMARY KEY ([Id])
);

GO

CREATE TABLE [ServiceTypes] (
    [Id] bigint NOT NULL IDENTITY,
    [CreatedById] bigint NULL,
    [CreatedDate] datetime2 NULL,
    [ModifiedDate] datetime2 NULL,
    [ModifiedById] bigint NULL,
    [IsDeleted] bit NOT NULL,
    [IsActive] bit NOT NULL,
    [NameEn] nvarchar(50) NULL,
    [NameAr] nvarchar(100) NULL,
    [Code] nvarchar(max) NULL,
    [Color] nvarchar(max) NULL,
    CONSTRAINT [PK_ServiceTypes] PRIMARY KEY ([Id])
);

GO

CREATE TABLE [Status] (
    [Id] bigint NOT NULL IDENTITY,
    [CreatedById] bigint NULL,
    [CreatedDate] datetime2 NULL,
    [ModifiedDate] datetime2 NULL,
    [ModifiedById] bigint NULL,
    [IsDeleted] bit NOT NULL,
    [IsActive] bit NOT NULL,
    [NameEn] nvarchar(50) NULL,
    [NameAr] nvarchar(50) NULL,
    [Code] nvarchar(100) NULL,
    [Color] nvarchar(100) NULL,
    CONSTRAINT [PK_Status] PRIMARY KEY ([Id])
);

GO

CREATE TABLE [Templates] (
    [Id] bigint NOT NULL IDENTITY,
    [CreatedById] bigint NULL,
    [CreatedDate] datetime2 NULL,
    [ModifiedDate] datetime2 NULL,
    [ModifiedById] bigint NULL,
    [IsDeleted] bit NOT NULL,
    [IsActive] bit NOT NULL,
    [MangersLevels] int NOT NULL,
    [RemoveRedundant] bit NOT NULL,
    [IncludeEmployeeFirst] bit NOT NULL,
    CONSTRAINT [PK_Templates] PRIMARY KEY ([Id])
);

GO

CREATE TABLE [GroupMembers] (
    [Id] bigint NOT NULL IDENTITY,
    [CreatedById] bigint NULL,
    [CreatedDate] datetime2 NULL,
    [ModifiedDate] datetime2 NULL,
    [ModifiedById] bigint NULL,
    [IsDeleted] bit NOT NULL,
    [IsActive] bit NOT NULL,
    [EmployeeId] nvarchar(100) NULL,
    [EmployeeEmail] nvarchar(max) NULL,
    [GroupId] bigint NOT NULL,
    CONSTRAINT [PK_GroupMembers] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_GroupMembers_Groups_GroupId] FOREIGN KEY ([GroupId]) REFERENCES [Groups] ([Id]) ON DELETE CASCADE
);

GO

CREATE TABLE [ServiceTypeActions] (
    [ServiceTypeId] bigint NOT NULL,
    [ActionId] bigint NOT NULL,
    [CreatedById] bigint NULL,
    [CreatedDate] datetime2 NULL,
    [ModifiedDate] datetime2 NULL,
    [ModifiedById] bigint NULL,
    [IsDeleted] bit NOT NULL,
    [IsActive] bit NOT NULL,
    CONSTRAINT [PK_ServiceTypeActions] PRIMARY KEY ([ActionId], [ServiceTypeId]),
    CONSTRAINT [FK_ServiceTypeActions_Actions_ActionId] FOREIGN KEY ([ActionId]) REFERENCES [Actions] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_ServiceTypeActions_ServiceTypes_ServiceTypeId] FOREIGN KEY ([ServiceTypeId]) REFERENCES [ServiceTypes] ([Id]) ON DELETE CASCADE
);

GO

CREATE TABLE [Services] (
    [Id] bigint NOT NULL IDENTITY,
    [CreatedById] bigint NULL,
    [CreatedDate] datetime2 NULL,
    [ModifiedDate] datetime2 NULL,
    [ModifiedById] bigint NULL,
    [IsDeleted] bit NOT NULL,
    [IsActive] bit NOT NULL,
    [NameEn] nvarchar(100) NULL,
    [NameAr] nvarchar(100) NULL,
    [Prefix] nvarchar(100) NULL,
    [LastNumber] bigint NOT NULL,
    [IsMultipleRequest] bit NOT NULL,
    [TemplateId] bigint NOT NULL,
    [ServiceTypeId] bigint NOT NULL,
    [Notes] nvarchar(max) NULL,
    CONSTRAINT [PK_Services] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Services_ServiceTypes_ServiceTypeId] FOREIGN KEY ([ServiceTypeId]) REFERENCES [ServiceTypes] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_Services_Templates_TemplateId] FOREIGN KEY ([TemplateId]) REFERENCES [Templates] ([Id]) ON DELETE CASCADE
);

GO

CREATE TABLE [TemplateGroups] (
    [TemplateId] bigint NOT NULL,
    [GroupId] bigint NOT NULL,
    [CreatedById] bigint NULL,
    [CreatedDate] datetime2 NULL,
    [ModifiedDate] datetime2 NULL,
    [ModifiedById] bigint NULL,
    [IsDeleted] bit NOT NULL,
    [IsActive] bit NOT NULL,
    CONSTRAINT [PK_TemplateGroups] PRIMARY KEY ([TemplateId], [GroupId]),
    CONSTRAINT [FK_TemplateGroups_Groups_GroupId] FOREIGN KEY ([GroupId]) REFERENCES [Groups] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_TemplateGroups_Templates_TemplateId] FOREIGN KEY ([TemplateId]) REFERENCES [Templates] ([Id]) ON DELETE CASCADE
);

GO

CREATE TABLE [TemplateOrders] (
    [Id] bigint NOT NULL IDENTITY,
    [CreatedById] bigint NULL,
    [CreatedDate] datetime2 NULL,
    [ModifiedDate] datetime2 NULL,
    [ModifiedById] bigint NULL,
    [IsDeleted] bit NOT NULL,
    [IsActive] bit NOT NULL,
    [Order] int NOT NULL,
    [Code] int NOT NULL,
    [TemplateId] bigint NOT NULL,
    CONSTRAINT [PK_TemplateOrders] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_TemplateOrders_Templates_TemplateId] FOREIGN KEY ([TemplateId]) REFERENCES [Templates] ([Id]) ON DELETE CASCADE
);

GO

CREATE TABLE [Requests] (
    [Id] bigint NOT NULL IDENTITY,
    [CreatedById] bigint NULL,
    [CreatedDate] datetime2 NULL,
    [ModifiedDate] datetime2 NULL,
    [ModifiedById] bigint NULL,
    [IsDeleted] bit NOT NULL,
    [IsActive] bit NOT NULL,
    [ServiceId] bigint NOT NULL,
    [TemplateId] bigint NOT NULL,
    [EmployeeId] nvarchar(max) NULL,
    [EmployeeEmail] nvarchar(max) NULL,
    [RequestBody] text NULL,
    [StatusId] bigint NOT NULL,
    CONSTRAINT [PK_Requests] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Requests_Services_ServiceId] FOREIGN KEY ([ServiceId]) REFERENCES [Services] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_Requests_Status_StatusId] FOREIGN KEY ([StatusId]) REFERENCES [Status] ([Id]) ON DELETE CASCADE
);

GO

CREATE TABLE [TemplateOrderSettings] (
    [Id] bigint NOT NULL IDENTITY,
    [CreatedById] bigint NULL,
    [CreatedDate] datetime2 NULL,
    [ModifiedDate] datetime2 NULL,
    [ModifiedById] bigint NULL,
    [IsDeleted] bit NOT NULL,
    [IsActive] bit NOT NULL,
    [HasReminder] bit NOT NULL,
    [ReminderHour] int NOT NULL,
    [Type] int NOT NULL,
    [EscalationHour] int NOT NULL,
    [TemplateOrderId] bigint NOT NULL,
    CONSTRAINT [PK_TemplateOrderSettings] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_TemplateOrderSettings_TemplateOrders_TemplateOrderId] FOREIGN KEY ([TemplateOrderId]) REFERENCES [TemplateOrders] ([Id]) ON DELETE CASCADE
);

GO

CREATE TABLE [RequestAttachments] (
    [Id] bigint NOT NULL IDENTITY,
    [CreatedById] bigint NULL,
    [CreatedDate] datetime2 NULL,
    [ModifiedDate] datetime2 NULL,
    [ModifiedById] bigint NULL,
    [IsDeleted] bit NOT NULL,
    [IsActive] bit NOT NULL,
    [AttachmentTitle] nvarchar(max) NULL,
    [AttachmentFileName] nvarchar(max) NULL,
    [RequesterId] nvarchar(max) NULL,
    [RequesterEmail] nvarchar(max) NULL,
    [RequestId] bigint NOT NULL,
    CONSTRAINT [PK_RequestAttachments] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_RequestAttachments_Requests_RequestId] FOREIGN KEY ([RequestId]) REFERENCES [Requests] ([Id]) ON DELETE CASCADE
);

GO

CREATE TABLE [Tasks] (
    [Id] bigint NOT NULL IDENTITY,
    [CreatedById] bigint NULL,
    [CreatedDate] datetime2 NULL,
    [ModifiedDate] datetime2 NULL,
    [ModifiedById] bigint NULL,
    [IsDeleted] bit NOT NULL,
    [IsActive] bit NOT NULL,
    [RequestId] bigint NOT NULL,
    [ApproverId] nvarchar(max) NULL,
    [ApproverEmail] nvarchar(max) NULL,
    [ApproverNameEn] nvarchar(max) NULL,
    [ApproverNameAr] nvarchar(max) NULL,
    [ApproverPositionEn] nvarchar(max) NULL,
    [ApproverPositionAr] nvarchar(max) NULL,
    [ApproverMobile] nvarchar(max) NULL,
    [ApproverDate] datetime2 NULL,
    [IsReAssign] bit NOT NULL,
    [ReAssignedFromId] nvarchar(max) NULL,
    [ReAssignedFromEmail] nvarchar(max) NULL,
    [HasRemender] bit NOT NULL,
    [RemenderHour] int NOT NULL,
    [Type] int NOT NULL,
    [EscaltionHour] int NOT NULL,
    [ApprovalComment] nvarchar(max) NULL,
    [RejectionComment] nvarchar(max) NULL,
    CONSTRAINT [PK_Tasks] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Tasks_Requests_RequestId] FOREIGN KEY ([RequestId]) REFERENCES [Requests] ([Id]) ON DELETE CASCADE
);

GO

CREATE TABLE [TaskActions] (
    [TaskId] bigint NOT NULL,
    [ActionId] bigint NOT NULL,
    [CreatedById] bigint NULL,
    [CreatedDate] datetime2 NULL,
    [ModifiedDate] datetime2 NULL,
    [ModifiedById] bigint NULL,
    [IsDeleted] bit NOT NULL,
    [IsActive] bit NOT NULL,
    [IsChosen] bit NOT NULL,
    CONSTRAINT [PK_TaskActions] PRIMARY KEY ([ActionId], [TaskId]),
    CONSTRAINT [FK_TaskActions_Actions_ActionId] FOREIGN KEY ([ActionId]) REFERENCES [Actions] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_TaskActions_Tasks_TaskId] FOREIGN KEY ([TaskId]) REFERENCES [Tasks] ([Id]) ON DELETE CASCADE
);

GO

CREATE TABLE [TaskAttachments] (
    [Id] bigint NOT NULL IDENTITY,
    [CreatedById] bigint NULL,
    [CreatedDate] datetime2 NULL,
    [ModifiedDate] datetime2 NULL,
    [ModifiedById] bigint NULL,
    [IsDeleted] bit NOT NULL,
    [IsActive] bit NOT NULL,
    [AttachmentTitle] nvarchar(max) NULL,
    [AttachmentFileName] nvarchar(max) NULL,
    [ApproverId] nvarchar(max) NULL,
    [ApproverEmail] nvarchar(max) NULL,
    [TaskId] bigint NOT NULL,
    CONSTRAINT [PK_TaskAttachments] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_TaskAttachments_Tasks_TaskId] FOREIGN KEY ([TaskId]) REFERENCES [Tasks] ([Id]) ON DELETE CASCADE
);

GO

UPDATE [Companies] SET [CreatedDate] = '2020-07-23T15:18:18.0796466+02:00', [ModifiedDate] = '2020-07-23T15:18:18.0806500+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-23T15:18:18.0895761+02:00', [ModifiedDate] = '2020-07-23T15:18:18.0895787+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-23T15:18:18.0897487+02:00', [ModifiedDate] = '2020-07-23T15:18:18.0897494+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-23T15:18:18.0897539+02:00', [ModifiedDate] = '2020-07-23T15:18:18.0897541+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-23T15:18:18.0897542+02:00', [ModifiedDate] = '2020-07-23T15:18:18.0897543+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-07-23T15:18:18.0823820+02:00', [ModifiedDate] = '2020-07-23T15:18:18.0823832+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-07-23T15:18:18.0826127+02:00', [ModifiedDate] = '2020-07-23T15:18:18.0826134+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-07-23T15:18:18.0900977+02:00', [ModifiedDate] = '2020-07-23T15:18:18.0900986+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-07-23T15:18:18.0902305+02:00', [ModifiedDate] = '2020-07-23T15:18:18.0902311+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Users] SET [CreatedDate] = '2020-07-23T15:18:18.0829304+02:00', [ModifiedDate] = '2020-07-23T15:18:18.0829312+02:00', [Password] = N'AExZAyQVE0f26QlKCS34LIqPQMq3g0eEcIn/osUI+qgqZ/zjyqjf53oaUhV2P8qIQw=='
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

CREATE INDEX [IX_GroupMembers_GroupId] ON [GroupMembers] ([GroupId]);

GO

CREATE INDEX [IX_RequestAttachments_RequestId] ON [RequestAttachments] ([RequestId]);

GO

CREATE INDEX [IX_Requests_ServiceId] ON [Requests] ([ServiceId]);

GO

CREATE INDEX [IX_Requests_StatusId] ON [Requests] ([StatusId]);

GO

CREATE INDEX [IX_Services_ServiceTypeId] ON [Services] ([ServiceTypeId]);

GO

CREATE INDEX [IX_Services_TemplateId] ON [Services] ([TemplateId]);

GO

CREATE INDEX [IX_ServiceTypeActions_ServiceTypeId] ON [ServiceTypeActions] ([ServiceTypeId]);

GO

CREATE INDEX [IX_TaskActions_TaskId] ON [TaskActions] ([TaskId]);

GO

CREATE INDEX [IX_TaskAttachments_TaskId] ON [TaskAttachments] ([TaskId]);

GO

CREATE INDEX [IX_Tasks_RequestId] ON [Tasks] ([RequestId]);

GO

CREATE INDEX [IX_TemplateGroups_GroupId] ON [TemplateGroups] ([GroupId]);

GO

CREATE INDEX [IX_TemplateOrders_TemplateId] ON [TemplateOrders] ([TemplateId]);

GO

CREATE INDEX [IX_TemplateOrderSettings_TemplateOrderId] ON [TemplateOrderSettings] ([TemplateOrderId]);

GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20200723131818_AddEServiceEntities', N'3.1.5');

GO

DROP TABLE [TemplateOrderSettings];

GO

ALTER TABLE [TemplateOrders] ADD [EscalationHour] int NOT NULL DEFAULT 0;

GO

ALTER TABLE [TemplateOrders] ADD [EscalationType] int NOT NULL DEFAULT 0;

GO

ALTER TABLE [TemplateOrders] ADD [HasReminder] bit NOT NULL DEFAULT CAST(0 AS bit);

GO

ALTER TABLE [TemplateOrders] ADD [ReminderHour] int NOT NULL DEFAULT 0;

GO

UPDATE [Companies] SET [CreatedDate] = '2020-07-25T13:30:53.5054194+02:00', [ModifiedDate] = '2020-07-25T13:30:53.5066371+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-25T13:30:53.5185986+02:00', [ModifiedDate] = '2020-07-25T13:30:53.5186010+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-25T13:30:53.5187671+02:00', [ModifiedDate] = '2020-07-25T13:30:53.5187677+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-25T13:30:53.5187789+02:00', [ModifiedDate] = '2020-07-25T13:30:53.5187791+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-25T13:30:53.5187793+02:00', [ModifiedDate] = '2020-07-25T13:30:53.5187794+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-07-25T13:30:53.5084688+02:00', [ModifiedDate] = '2020-07-25T13:30:53.5084696+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-07-25T13:30:53.5087003+02:00', [ModifiedDate] = '2020-07-25T13:30:53.5087009+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-07-25T13:30:53.5190840+02:00', [ModifiedDate] = '2020-07-25T13:30:53.5190848+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-07-25T13:30:53.5192160+02:00', [ModifiedDate] = '2020-07-25T13:30:53.5192165+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Users] SET [CreatedDate] = '2020-07-25T13:30:53.5089794+02:00', [ModifiedDate] = '2020-07-25T13:30:53.5089801+02:00', [Password] = N'AO8Pl4UIzKSd+opjmfDEnFAL4cSyKZJggcOpGxPkSnAi71lYAmLGJa9XUzdRne01qw=='
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20200725113054_Modify-TemplateOrderSetting', N'3.1.5');

GO

DROP TABLE [TaskActions];

GO

ALTER TABLE [Tasks] ADD [ActionId] bigint NULL;

GO

UPDATE [Companies] SET [CreatedDate] = '2020-07-25T14:43:07.5838627+02:00', [ModifiedDate] = '2020-07-25T14:43:07.5847086+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-25T14:43:07.5922798+02:00', [ModifiedDate] = '2020-07-25T14:43:07.5922811+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-25T14:43:07.5924415+02:00', [ModifiedDate] = '2020-07-25T14:43:07.5924421+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-25T14:43:07.5924461+02:00', [ModifiedDate] = '2020-07-25T14:43:07.5924462+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-25T14:43:07.5924464+02:00', [ModifiedDate] = '2020-07-25T14:43:07.5924465+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-07-25T14:43:07.5862837+02:00', [ModifiedDate] = '2020-07-25T14:43:07.5862847+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-07-25T14:43:07.5865008+02:00', [ModifiedDate] = '2020-07-25T14:43:07.5865013+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-07-25T14:43:07.5927532+02:00', [ModifiedDate] = '2020-07-25T14:43:07.5927540+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-07-25T14:43:07.5928873+02:00', [ModifiedDate] = '2020-07-25T14:43:07.5928878+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Users] SET [CreatedDate] = '2020-07-25T14:43:07.5868024+02:00', [ModifiedDate] = '2020-07-25T14:43:07.5868031+02:00', [Password] = N'AErCRRcQvzk58bOnxaP+Z6m5oNZpfGEQqD4jjtBJ2ZZzqf69Z0cZjPKNSaWUaFxrbw=='
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

CREATE INDEX [IX_Tasks_ActionId] ON [Tasks] ([ActionId]);

GO

ALTER TABLE [Tasks] ADD CONSTRAINT [FK_Tasks_Actions_ActionId] FOREIGN KEY ([ActionId]) REFERENCES [Actions] ([Id]) ON DELETE NO ACTION;

GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20200725124308_Modify-TaskAction', N'3.1.5');

GO

DECLARE @var16 sysname;
SELECT @var16 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Tasks]') AND [c].[name] = N'Type');
IF @var16 IS NOT NULL EXEC(N'ALTER TABLE [Tasks] DROP CONSTRAINT [' + @var16 + '];');
ALTER TABLE [Tasks] DROP COLUMN [Type];

GO

ALTER TABLE [Tasks] ADD [EscalationType] int NOT NULL DEFAULT 0;

GO

UPDATE [Companies] SET [CreatedDate] = '2020-07-25T16:30:04.0897898+02:00', [ModifiedDate] = '2020-07-25T16:30:04.0907456+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-25T16:30:04.0980076+02:00', [ModifiedDate] = '2020-07-25T16:30:04.0980087+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-25T16:30:04.0981714+02:00', [ModifiedDate] = '2020-07-25T16:30:04.0981720+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-25T16:30:04.0981764+02:00', [ModifiedDate] = '2020-07-25T16:30:04.0981765+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-25T16:30:04.0981767+02:00', [ModifiedDate] = '2020-07-25T16:30:04.0981767+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-07-25T16:30:04.0924212+02:00', [ModifiedDate] = '2020-07-25T16:30:04.0924221+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-07-25T16:30:04.0926647+02:00', [ModifiedDate] = '2020-07-25T16:30:04.0926653+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-07-25T16:30:04.0984809+02:00', [ModifiedDate] = '2020-07-25T16:30:04.0984816+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-07-25T16:30:04.0986077+02:00', [ModifiedDate] = '2020-07-25T16:30:04.0986082+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Users] SET [CreatedDate] = '2020-07-25T16:30:04.0929512+02:00', [ModifiedDate] = '2020-07-25T16:30:04.0929519+02:00', [Password] = N'AEizNQBa3VS4GPlhpge3jZWv6QkSo/hlNK1W4972IBXJ531cQSJRBbTxqWLrSMwvEg=='
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20200725143004_Modify-Task', N'3.1.5');

GO

ALTER TABLE [Users] ADD [EmployeeId] nvarchar(max) NULL;

GO

UPDATE [Companies] SET [CreatedDate] = '2020-07-25T19:18:35.7724925+02:00', [ModifiedDate] = '2020-07-25T19:18:35.7734013+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-25T19:18:35.7820257+02:00', [ModifiedDate] = '2020-07-25T19:18:35.7820286+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-25T19:18:35.7822302+02:00', [ModifiedDate] = '2020-07-25T19:18:35.7822308+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-25T19:18:35.7822349+02:00', [ModifiedDate] = '2020-07-25T19:18:35.7822351+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-25T19:18:35.7822352+02:00', [ModifiedDate] = '2020-07-25T19:18:35.7822353+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-07-25T19:18:35.7752285+02:00', [ModifiedDate] = '2020-07-25T19:18:35.7752297+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-07-25T19:18:35.7754741+02:00', [ModifiedDate] = '2020-07-25T19:18:35.7754747+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-07-25T19:18:35.7825327+02:00', [ModifiedDate] = '2020-07-25T19:18:35.7825335+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-07-25T19:18:35.7826891+02:00', [ModifiedDate] = '2020-07-25T19:18:35.7826896+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Users] SET [CreatedDate] = '2020-07-25T19:18:35.7758012+02:00', [ModifiedDate] = '2020-07-25T19:18:35.7758020+02:00', [Password] = N'AGEYzJJXOOuqLWzlSyfPrMOv4RPGNcBYoThQ8aTXLuaisQ3zKH48xoev7JJKPWBq5g=='
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20200725151836_AddEmployeeIdToUserTable', N'3.1.5');

GO

DECLARE @var17 sysname;
SELECT @var17 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Users]') AND [c].[name] = N'EmployeeId');
IF @var17 IS NOT NULL EXEC(N'ALTER TABLE [Users] DROP CONSTRAINT [' + @var17 + '];');
ALTER TABLE [Users] DROP COLUMN [EmployeeId];

GO

UPDATE [Companies] SET [CreatedDate] = '2020-07-25T19:22:39.7067778+02:00', [ModifiedDate] = '2020-07-25T19:22:39.7076424+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-25T19:22:39.7154592+02:00', [ModifiedDate] = '2020-07-25T19:22:39.7154610+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-25T19:22:39.7156360+02:00', [ModifiedDate] = '2020-07-25T19:22:39.7156365+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-25T19:22:39.7156402+02:00', [ModifiedDate] = '2020-07-25T19:22:39.7156403+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-25T19:22:39.7156405+02:00', [ModifiedDate] = '2020-07-25T19:22:39.7156406+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-07-25T19:22:39.7095735+02:00', [ModifiedDate] = '2020-07-25T19:22:39.7095747+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-07-25T19:22:39.7098143+02:00', [ModifiedDate] = '2020-07-25T19:22:39.7098148+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-07-25T19:22:39.7159557+02:00', [ModifiedDate] = '2020-07-25T19:22:39.7159563+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-07-25T19:22:39.7160915+02:00', [ModifiedDate] = '2020-07-25T19:22:39.7160919+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Users] SET [CreatedDate] = '2020-07-25T19:22:39.7101114+02:00', [ModifiedDate] = '2020-07-25T19:22:39.7101122+02:00', [Password] = N'ALs1BkJMDmbJ/26OX2s90Xy6knL53F0SA4e5+96ZUKgHksgvNFRrWM4W0T4EZ5sSKA=='
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20200725152240_RemoveEmployeeIdFromUserTable', N'3.1.5');

GO

ALTER TABLE [Requests] DROP CONSTRAINT [FK_Requests_Status_StatusId];

GO

DECLARE @var18 sysname;
SELECT @var18 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Requests]') AND [c].[name] = N'StatusId');
IF @var18 IS NOT NULL EXEC(N'ALTER TABLE [Requests] DROP CONSTRAINT [' + @var18 + '];');
ALTER TABLE [Requests] ALTER COLUMN [StatusId] bigint NULL;

GO

UPDATE [Companies] SET [CreatedDate] = '2020-07-25T22:13:58.5498643+02:00', [ModifiedDate] = '2020-07-25T22:13:58.5508128+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-25T22:13:58.5587306+02:00', [ModifiedDate] = '2020-07-25T22:13:58.5587327+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-25T22:13:58.5589051+02:00', [ModifiedDate] = '2020-07-25T22:13:58.5589058+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-25T22:13:58.5589115+02:00', [ModifiedDate] = '2020-07-25T22:13:58.5589116+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-25T22:13:58.5589118+02:00', [ModifiedDate] = '2020-07-25T22:13:58.5589119+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-07-25T22:13:58.5524007+02:00', [ModifiedDate] = '2020-07-25T22:13:58.5524017+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-07-25T22:13:58.5526368+02:00', [ModifiedDate] = '2020-07-25T22:13:58.5526373+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-07-25T22:13:58.5592303+02:00', [ModifiedDate] = '2020-07-25T22:13:58.5592311+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-07-25T22:13:58.5593616+02:00', [ModifiedDate] = '2020-07-25T22:13:58.5593622+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Users] SET [CreatedDate] = '2020-07-25T22:13:58.5529140+02:00', [ModifiedDate] = '2020-07-25T22:13:58.5529147+02:00', [Password] = N'ANUj2Jb5/t8Nz3f8radKBRb5vcp2CXWJPMtD09qLOttD4Jg1OTgFYdjIUswqPflTqA=='
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

ALTER TABLE [Requests] ADD CONSTRAINT [FK_Requests_Status_StatusId] FOREIGN KEY ([StatusId]) REFERENCES [Status] ([Id]) ON DELETE NO ACTION;

GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20200725201359_Modify-Request', N'3.1.5');

GO

ALTER TABLE [Users] ADD [EmployeeId] nvarchar(max) NULL;

GO

UPDATE [Companies] SET [CreatedDate] = '2020-07-27T21:51:49.9765987+02:00', [ModifiedDate] = '2020-07-27T21:51:49.9779114+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-27T21:51:49.9854818+02:00', [ModifiedDate] = '2020-07-27T21:51:49.9854841+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-27T21:51:49.9855899+02:00', [ModifiedDate] = '2020-07-27T21:51:49.9855904+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-27T21:51:49.9855937+02:00', [ModifiedDate] = '2020-07-27T21:51:49.9855938+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-07-27T21:51:49.9855939+02:00', [ModifiedDate] = '2020-07-27T21:51:49.9855940+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-07-27T21:51:49.9797063+02:00', [ModifiedDate] = '2020-07-27T21:51:49.9797076+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-07-27T21:51:49.9799143+02:00', [ModifiedDate] = '2020-07-27T21:51:49.9799150+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-07-27T21:51:49.9858278+02:00', [ModifiedDate] = '2020-07-27T21:51:49.9858284+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-07-27T21:51:49.9859165+02:00', [ModifiedDate] = '2020-07-27T21:51:49.9859169+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Users] SET [CreatedDate] = '2020-07-27T21:51:49.9804675+02:00', [ModifiedDate] = '2020-07-27T21:51:49.9804684+02:00', [Password] = N'AFucpmhVV3LdOJ32HI2hMPmp5aU9aN3/+ueO8R98osD9vrDAitMZGfczYQfMGZtkrQ=='
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20200727185150_AddEmployeeIdToUserEntity', N'3.1.5');

GO

CREATE TABLE [DealCategories] (
    [Id] bigint NOT NULL IDENTITY,
    [CreatedById] bigint NULL,
    [CreatedDate] datetime2 NULL,
    [ModifiedDate] datetime2 NULL,
    [ModifiedById] bigint NULL,
    [IsDeleted] bit NOT NULL,
    [IsActive] bit NOT NULL,
    [NameAr] nvarchar(max) NULL,
    [NameEn] nvarchar(max) NULL,
    CONSTRAINT [PK_DealCategories] PRIMARY KEY ([Id])
);

GO

CREATE TABLE [Locations] (
    [Id] bigint NOT NULL IDENTITY,
    [CreatedById] bigint NULL,
    [CreatedDate] datetime2 NULL,
    [ModifiedDate] datetime2 NULL,
    [ModifiedById] bigint NULL,
    [IsDeleted] bit NOT NULL,
    [IsActive] bit NOT NULL,
    [NameEn] nvarchar(max) NULL,
    [NameAr] nvarchar(max) NULL,
    CONSTRAINT [PK_Locations] PRIMARY KEY ([Id])
);

GO

CREATE TABLE [Deals] (
    [Id] bigint NOT NULL IDENTITY,
    [CreatedById] bigint NULL,
    [CreatedDate] datetime2 NULL,
    [ModifiedDate] datetime2 NULL,
    [ModifiedById] bigint NULL,
    [IsDeleted] bit NOT NULL,
    [IsActive] bit NOT NULL,
    [NameEn] nvarchar(max) NULL,
    [NameAr] nvarchar(max) NULL,
    [DescriptionEn] nvarchar(max) NULL,
    [DescriptionAr] nvarchar(max) NULL,
    [DiscountAmount] decimal(18,2) NOT NULL,
    [DiscountType] int NOT NULL,
    [PromoCode] nvarchar(max) NULL,
    [ExpireDate] datetime2 NULL,
    [LocationId] bigint NULL,
    [CategoryId] bigint NOT NULL,
    CONSTRAINT [PK_Deals] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Deals_DealCategories_CategoryId] FOREIGN KEY ([CategoryId]) REFERENCES [DealCategories] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_Deals_Locations_LocationId] FOREIGN KEY ([LocationId]) REFERENCES [Locations] ([Id]) ON DELETE NO ACTION
);

GO

CREATE TABLE [DealAttachments] (
    [Id] bigint NOT NULL IDENTITY,
    [CreatedById] bigint NULL,
    [CreatedDate] datetime2 NULL,
    [ModifiedDate] datetime2 NULL,
    [ModifiedById] bigint NULL,
    [IsDeleted] bit NOT NULL,
    [IsActive] bit NOT NULL,
    [UrlEn] nvarchar(max) NULL,
    [UrlAr] nvarchar(max) NULL,
    [DealId] bigint NOT NULL,
    CONSTRAINT [PK_DealAttachments] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_DealAttachments_Deals_DealId] FOREIGN KEY ([DealId]) REFERENCES [Deals] ([Id]) ON DELETE CASCADE
);

GO

UPDATE [Companies] SET [CreatedDate] = '2020-08-05T23:24:29.4345653+02:00', [ModifiedDate] = '2020-08-05T23:24:29.4353938+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-08-05T23:24:29.4446143+02:00', [ModifiedDate] = '2020-08-05T23:24:29.4446172+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-08-05T23:24:29.4447746+02:00', [ModifiedDate] = '2020-08-05T23:24:29.4447752+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-08-05T23:24:29.4447790+02:00', [ModifiedDate] = '2020-08-05T23:24:29.4447791+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-08-05T23:24:29.4447793+02:00', [ModifiedDate] = '2020-08-05T23:24:29.4447794+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-08-05T23:24:29.4371675+02:00', [ModifiedDate] = '2020-08-05T23:24:29.4371690+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-08-05T23:24:29.4373978+02:00', [ModifiedDate] = '2020-08-05T23:24:29.4373985+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-08-05T23:24:29.4451481+02:00', [ModifiedDate] = '2020-08-05T23:24:29.4451489+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-08-05T23:24:29.4452686+02:00', [ModifiedDate] = '2020-08-05T23:24:29.4452691+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Users] SET [CreatedDate] = '2020-08-05T23:24:29.4376858+02:00', [ModifiedDate] = '2020-08-05T23:24:29.4376867+02:00', [Password] = N'ADPEi1GnZPOX/IyONGDUNmMI5GyfeHbKrn6SfU73QDQFQD5YsczE7LIwmsB0jlUPog=='
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

CREATE INDEX [IX_DealAttachments_DealId] ON [DealAttachments] ([DealId]);

GO

CREATE INDEX [IX_Deals_CategoryId] ON [Deals] ([CategoryId]);

GO

CREATE INDEX [IX_Deals_LocationId] ON [Deals] ([LocationId]);

GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20200805192430_AddDealEntities', N'3.1.5');

GO

ALTER TABLE [Actions] ADD [ActionType] int NOT NULL DEFAULT 0;

GO

UPDATE [Companies] SET [CreatedDate] = '2020-08-05T21:30:29.5285759+02:00', [ModifiedDate] = '2020-08-05T21:30:29.5299114+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-08-05T21:30:29.5451318+02:00', [ModifiedDate] = '2020-08-05T21:30:29.5451346+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-08-05T21:30:29.5453096+02:00', [ModifiedDate] = '2020-08-05T21:30:29.5453102+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-08-05T21:30:29.5453143+02:00', [ModifiedDate] = '2020-08-05T21:30:29.5453144+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-08-05T21:30:29.5453146+02:00', [ModifiedDate] = '2020-08-05T21:30:29.5453147+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-08-05T21:30:29.5315639+02:00', [ModifiedDate] = '2020-08-05T21:30:29.5315648+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-08-05T21:30:29.5317850+02:00', [ModifiedDate] = '2020-08-05T21:30:29.5317855+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-08-05T21:30:29.5456132+02:00', [ModifiedDate] = '2020-08-05T21:30:29.5456139+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-08-05T21:30:29.5457408+02:00', [ModifiedDate] = '2020-08-05T21:30:29.5457414+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Users] SET [CreatedDate] = '2020-08-05T21:30:29.5320843+02:00', [ModifiedDate] = '2020-08-05T21:30:29.5320849+02:00', [Password] = N'AJcnEa32p4bKDFNK6BOTN9Xdy9h6LL7aunwKYIttzGXGrLv/KHwosf+8E5Yz//bpDw=='
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20200805193030_AddActionType', N'3.1.5');

GO

UPDATE [Companies] SET [CreatedDate] = '2020-08-05T23:33:58.2864189+02:00', [ModifiedDate] = '2020-08-05T23:33:58.2873239+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'CreatedById', N'CreatedDate', N'IsActive', N'IsDeleted', N'ModifiedById', N'ModifiedDate', N'NameAr', N'NameEn') AND [object_id] = OBJECT_ID(N'[DealCategories]'))
    SET IDENTITY_INSERT [DealCategories] ON;
INSERT INTO [DealCategories] ([Id], [CreatedById], [CreatedDate], [IsActive], [IsDeleted], [ModifiedById], [ModifiedDate], [NameAr], [NameEn])
VALUES (CAST(7 AS bigint), NULL, '2020-08-05T23:33:58.2991630+02:00', CAST(0 AS bit), CAST(0 AS bit), NULL, '2020-08-05T23:33:58.2991631+02:00', N'الترفيه', N'Entertainment'),
(CAST(6 AS bigint), NULL, '2020-08-05T23:33:58.2991614+02:00', CAST(0 AS bit), CAST(0 AS bit), NULL, '2020-08-05T23:33:58.2991615+02:00', N'السيارات', N'Car'),
(CAST(5 AS bigint), NULL, '2020-08-05T23:33:58.2991612+02:00', CAST(0 AS bit), CAST(0 AS bit), NULL, '2020-08-05T23:33:58.2991613+02:00', N'الاثاث', N'Furniture'),
(CAST(1 AS bigint), NULL, '2020-08-05T23:33:58.2990346+02:00', CAST(0 AS bit), CAST(0 AS bit), NULL, '2020-08-05T23:33:58.2990353+02:00', N'المنزل', N'Home'),
(CAST(3 AS bigint), NULL, '2020-08-05T23:33:58.2991606+02:00', CAST(0 AS bit), CAST(0 AS bit), NULL, '2020-08-05T23:33:58.2991607+02:00', N'الجمال', N'Beauty'),
(CAST(2 AS bigint), NULL, '2020-08-05T23:33:58.2991577+02:00', CAST(0 AS bit), CAST(0 AS bit), NULL, '2020-08-05T23:33:58.2991583+02:00', N'التسوق', N'Shopping'),
(CAST(4 AS bigint), NULL, '2020-08-05T23:33:58.2991609+02:00', CAST(0 AS bit), CAST(0 AS bit), NULL, '2020-08-05T23:33:58.2991610+02:00', N'الرياضة', N'Sports');
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'CreatedById', N'CreatedDate', N'IsActive', N'IsDeleted', N'ModifiedById', N'ModifiedDate', N'NameAr', N'NameEn') AND [object_id] = OBJECT_ID(N'[DealCategories]'))
    SET IDENTITY_INSERT [DealCategories] OFF;

GO

UPDATE [Permissions] SET [CreatedDate] = '2020-08-05T23:33:58.2980290+02:00', [ModifiedDate] = '2020-08-05T23:33:58.2980336+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-08-05T23:33:58.2982002+02:00', [ModifiedDate] = '2020-08-05T23:33:58.2982008+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-08-05T23:33:58.2982057+02:00', [ModifiedDate] = '2020-08-05T23:33:58.2982058+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-08-05T23:33:58.2982060+02:00', [ModifiedDate] = '2020-08-05T23:33:58.2982061+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-08-05T23:33:58.2890012+02:00', [ModifiedDate] = '2020-08-05T23:33:58.2890026+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-08-05T23:33:58.2892263+02:00', [ModifiedDate] = '2020-08-05T23:33:58.2892268+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-08-05T23:33:58.2985298+02:00', [ModifiedDate] = '2020-08-05T23:33:58.2985305+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-08-05T23:33:58.2986536+02:00', [ModifiedDate] = '2020-08-05T23:33:58.2986542+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Users] SET [CreatedDate] = '2020-08-05T23:33:58.2895158+02:00', [ModifiedDate] = '2020-08-05T23:33:58.2895166+02:00', [Password] = N'ANm58dmmrI+BlGeqIj4hK5bTz33zNuDtcufFftOf5IGo7Uf4JHRLR1Gp6BYYoP7J9A=='
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20200805193359_SeedDealCategoryTable', N'3.1.5');

GO

CREATE TABLE [ServiceCategories] (
    [Id] bigint NOT NULL IDENTITY,
    [CreatedById] bigint NULL,
    [CreatedDate] datetime2 NULL,
    [ModifiedDate] datetime2 NULL,
    [ModifiedById] bigint NULL,
    [IsDeleted] bit NOT NULL,
    [IsActive] bit NOT NULL,
    [NameEn] nvarchar(max) NULL,
    [NameAr] nvarchar(max) NULL,
    CONSTRAINT [PK_ServiceCategories] PRIMARY KEY ([Id])
);

GO

UPDATE [Companies] SET [CreatedDate] = '2020-08-10T20:00:47.5348755+02:00', [ModifiedDate] = '2020-08-10T20:00:47.5357376+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-10T20:00:47.5508803+02:00', [ModifiedDate] = '2020-08-10T20:00:47.5508815+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-10T20:00:47.5510761+02:00', [ModifiedDate] = '2020-08-10T20:00:47.5510772+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-10T20:00:47.5510803+02:00', [ModifiedDate] = '2020-08-10T20:00:47.5510806+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-10T20:00:47.5510808+02:00', [ModifiedDate] = '2020-08-10T20:00:47.5510809+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-10T20:00:47.5510812+02:00', [ModifiedDate] = '2020-08-10T20:00:47.5510813+02:00'
WHERE [Id] = CAST(5 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-10T20:00:47.5510815+02:00', [ModifiedDate] = '2020-08-10T20:00:47.5510816+02:00'
WHERE [Id] = CAST(6 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-10T20:00:47.5510818+02:00', [ModifiedDate] = '2020-08-10T20:00:47.5510820+02:00'
WHERE [Id] = CAST(7 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-08-10T20:00:47.5493638+02:00', [ModifiedDate] = '2020-08-10T20:00:47.5493674+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-08-10T20:00:47.5496376+02:00', [ModifiedDate] = '2020-08-10T20:00:47.5496391+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-08-10T20:00:47.5496455+02:00', [ModifiedDate] = '2020-08-10T20:00:47.5496458+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-08-10T20:00:47.5496460+02:00', [ModifiedDate] = '2020-08-10T20:00:47.5496462+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-08-10T20:00:47.5375075+02:00', [ModifiedDate] = '2020-08-10T20:00:47.5375091+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-08-10T20:00:47.5377810+02:00', [ModifiedDate] = '2020-08-10T20:00:47.5377816+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-08-10T20:00:47.5500918+02:00', [ModifiedDate] = '2020-08-10T20:00:47.5500934+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-08-10T20:00:47.5502817+02:00', [ModifiedDate] = '2020-08-10T20:00:47.5502827+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Users] SET [CreatedDate] = '2020-08-10T20:00:47.5380780+02:00', [ModifiedDate] = '2020-08-10T20:00:47.5380788+02:00', [Password] = N'ANAmOmNuhDGQieqgb9xTAhy16MZ3wwTIuW4iQpv2pyfdadOvFrP8N1X/77ErBgcVGg=='
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20200810160048_AddServiceCategoryTable', N'3.1.5');

GO

ALTER TABLE [Services] ADD [CategoryId] bigint NOT NULL DEFAULT CAST(0 AS bigint);

GO

UPDATE [Companies] SET [CreatedDate] = '2020-08-10T20:07:15.0685810+02:00', [ModifiedDate] = '2020-08-10T20:07:15.0693874+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-10T20:07:15.0789599+02:00', [ModifiedDate] = '2020-08-10T20:07:15.0789608+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-10T20:07:15.0790834+02:00', [ModifiedDate] = '2020-08-10T20:07:15.0790839+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-10T20:07:15.0790863+02:00', [ModifiedDate] = '2020-08-10T20:07:15.0790864+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-10T20:07:15.0790866+02:00', [ModifiedDate] = '2020-08-10T20:07:15.0790867+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-10T20:07:15.0790868+02:00', [ModifiedDate] = '2020-08-10T20:07:15.0790869+02:00'
WHERE [Id] = CAST(5 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-10T20:07:15.0790870+02:00', [ModifiedDate] = '2020-08-10T20:07:15.0790871+02:00'
WHERE [Id] = CAST(6 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-10T20:07:15.0790873+02:00', [ModifiedDate] = '2020-08-10T20:07:15.0790874+02:00'
WHERE [Id] = CAST(7 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-08-10T20:07:15.0778070+02:00', [ModifiedDate] = '2020-08-10T20:07:15.0778122+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-08-10T20:07:15.0780527+02:00', [ModifiedDate] = '2020-08-10T20:07:15.0780534+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-08-10T20:07:15.0780591+02:00', [ModifiedDate] = '2020-08-10T20:07:15.0780592+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-08-10T20:07:15.0780594+02:00', [ModifiedDate] = '2020-08-10T20:07:15.0780595+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-08-10T20:07:15.0712545+02:00', [ModifiedDate] = '2020-08-10T20:07:15.0712559+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-08-10T20:07:15.0714728+02:00', [ModifiedDate] = '2020-08-10T20:07:15.0714733+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-08-10T20:07:15.0784072+02:00', [ModifiedDate] = '2020-08-10T20:07:15.0784080+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-08-10T20:07:15.0785355+02:00', [ModifiedDate] = '2020-08-10T20:07:15.0785361+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Users] SET [CreatedDate] = '2020-08-10T20:07:15.0717848+02:00', [ModifiedDate] = '2020-08-10T20:07:15.0717855+02:00', [Password] = N'ALucqzPRaK4lHcJO6hcNBqwTXlgLpgi7UtpNqDit30kScDS+YZwl1dnFcFh6KZJRvA=='
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

CREATE INDEX [IX_Services_CategoryId] ON [Services] ([CategoryId]);

GO

ALTER TABLE [Services] ADD CONSTRAINT [FK_Services_ServiceCategories_CategoryId] FOREIGN KEY ([CategoryId]) REFERENCES [ServiceCategories] ([Id]) ON DELETE CASCADE;

GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20200810160715_AddServiceCategoryToServiceTable', N'3.1.5');

GO

ALTER TABLE [Services] ADD [ImageUrl] nvarchar(max) NULL;

GO

UPDATE [Companies] SET [CreatedDate] = '2020-08-10T21:23:39.4187709+02:00', [ModifiedDate] = '2020-08-10T21:23:39.4195531+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-10T21:23:39.4316232+02:00', [ModifiedDate] = '2020-08-10T21:23:39.4316241+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-10T21:23:39.4317469+02:00', [ModifiedDate] = '2020-08-10T21:23:39.4317474+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-10T21:23:39.4317499+02:00', [ModifiedDate] = '2020-08-10T21:23:39.4317500+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-10T21:23:39.4317502+02:00', [ModifiedDate] = '2020-08-10T21:23:39.4317503+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-10T21:23:39.4317504+02:00', [ModifiedDate] = '2020-08-10T21:23:39.4317505+02:00'
WHERE [Id] = CAST(5 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-10T21:23:39.4317506+02:00', [ModifiedDate] = '2020-08-10T21:23:39.4317507+02:00'
WHERE [Id] = CAST(6 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-10T21:23:39.4317545+02:00', [ModifiedDate] = '2020-08-10T21:23:39.4317547+02:00'
WHERE [Id] = CAST(7 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-08-10T21:23:39.4303162+02:00', [ModifiedDate] = '2020-08-10T21:23:39.4303192+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-08-10T21:23:39.4304778+02:00', [ModifiedDate] = '2020-08-10T21:23:39.4304784+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-08-10T21:23:39.4304826+02:00', [ModifiedDate] = '2020-08-10T21:23:39.4304827+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-08-10T21:23:39.4304828+02:00', [ModifiedDate] = '2020-08-10T21:23:39.4304830+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-08-10T21:23:39.4217875+02:00', [ModifiedDate] = '2020-08-10T21:23:39.4217895+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-08-10T21:23:39.4221706+02:00', [ModifiedDate] = '2020-08-10T21:23:39.4221713+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-08-10T21:23:39.4308301+02:00', [ModifiedDate] = '2020-08-10T21:23:39.4308312+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-08-10T21:23:39.4310156+02:00', [ModifiedDate] = '2020-08-10T21:23:39.4310164+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Users] SET [CreatedDate] = '2020-08-10T21:23:39.4225051+02:00', [ModifiedDate] = '2020-08-10T21:23:39.4225060+02:00', [Password] = N'AIFNSD8id9mI8HAkyanEucZ7TAo2Zhd3Q8g67lPvl2/c07QTbWHOOM4t1HXQn17HIQ=='
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20200810172340_AddImageUrlToServiceTable', N'3.1.5');

GO

ALTER TABLE [Tasks] ADD [FormId] bigint NULL;

GO

CREATE TABLE [Forms] (
    [Id] bigint NOT NULL IDENTITY,
    [CreatedById] bigint NULL,
    [CreatedDate] datetime2 NULL,
    [ModifiedDate] datetime2 NULL,
    [ModifiedById] bigint NULL,
    [IsDeleted] bit NOT NULL,
    [IsActive] bit NOT NULL,
    [NameEn] nvarchar(max) NULL,
    [NameAr] nvarchar(max) NULL,
    [BodyEn] nvarchar(max) NULL,
    [BodyAr] nvarchar(max) NULL,
    [Code] nvarchar(max) NULL,
    CONSTRAINT [PK_Forms] PRIMARY KEY ([Id])
);

GO

UPDATE [Companies] SET [CreatedDate] = '2020-08-13T00:51:43.3959084+02:00', [ModifiedDate] = '2020-08-13T00:51:43.3972403+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-13T00:51:43.4135449+02:00', [ModifiedDate] = '2020-08-13T00:51:43.4135497+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-13T00:51:43.4137244+02:00', [ModifiedDate] = '2020-08-13T00:51:43.4137252+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-13T00:51:43.4137305+02:00', [ModifiedDate] = '2020-08-13T00:51:43.4137306+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-13T00:51:43.4137309+02:00', [ModifiedDate] = '2020-08-13T00:51:43.4137310+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-13T00:51:43.4137312+02:00', [ModifiedDate] = '2020-08-13T00:51:43.4137314+02:00'
WHERE [Id] = CAST(5 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-13T00:51:43.4137316+02:00', [ModifiedDate] = '2020-08-13T00:51:43.4137318+02:00'
WHERE [Id] = CAST(6 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-13T00:51:43.4137320+02:00', [ModifiedDate] = '2020-08-13T00:51:43.4137322+02:00'
WHERE [Id] = CAST(7 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-08-13T00:51:43.4120151+02:00', [ModifiedDate] = '2020-08-13T00:51:43.4120192+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-08-13T00:51:43.4121885+02:00', [ModifiedDate] = '2020-08-13T00:51:43.4121893+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-08-13T00:51:43.4121942+02:00', [ModifiedDate] = '2020-08-13T00:51:43.4121943+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-08-13T00:51:43.4121945+02:00', [ModifiedDate] = '2020-08-13T00:51:43.4121946+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-08-13T00:51:43.4007471+02:00', [ModifiedDate] = '2020-08-13T00:51:43.4007622+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-08-13T00:51:43.4010985+02:00', [ModifiedDate] = '2020-08-13T00:51:43.4011006+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-08-13T00:51:43.4125758+02:00', [ModifiedDate] = '2020-08-13T00:51:43.4125778+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-08-13T00:51:43.4127302+02:00', [ModifiedDate] = '2020-08-13T00:51:43.4127312+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Users] SET [CreatedDate] = '2020-08-13T00:51:43.4016296+02:00', [ModifiedDate] = '2020-08-13T00:51:43.4016316+02:00', [Password] = N'AP4NxOYEtfPl2QKndQVtR/6qssshdNSrqHAgx3Lhu1pk8Nq+0KIbWF80Lw30NwugAA=='
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

CREATE INDEX [IX_Tasks_FormId] ON [Tasks] ([FormId]);

GO

ALTER TABLE [Tasks] ADD CONSTRAINT [FK_Tasks_Forms_FormId] FOREIGN KEY ([FormId]) REFERENCES [Forms] ([Id]) ON DELETE NO ACTION;

GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20200812205144_AddFormEntity', N'3.1.5');

GO

ALTER TABLE [Tasks] ADD [Code] int NOT NULL DEFAULT 0;

GO

ALTER TABLE [Tasks] ADD [Order] int NOT NULL DEFAULT 0;

GO

UPDATE [Companies] SET [CreatedDate] = '2020-08-16T15:44:06.5228170+02:00', [ModifiedDate] = '2020-08-16T15:44:06.5236912+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-16T15:44:06.5321715+02:00', [ModifiedDate] = '2020-08-16T15:44:06.5321723+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-16T15:44:06.5323037+02:00', [ModifiedDate] = '2020-08-16T15:44:06.5323046+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-16T15:44:06.5323090+02:00', [ModifiedDate] = '2020-08-16T15:44:06.5323091+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-16T15:44:06.5323093+02:00', [ModifiedDate] = '2020-08-16T15:44:06.5323094+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-16T15:44:06.5323181+02:00', [ModifiedDate] = '2020-08-16T15:44:06.5323183+02:00'
WHERE [Id] = CAST(5 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-16T15:44:06.5323185+02:00', [ModifiedDate] = '2020-08-16T15:44:06.5323186+02:00'
WHERE [Id] = CAST(6 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-16T15:44:06.5323188+02:00', [ModifiedDate] = '2020-08-16T15:44:06.5323190+02:00'
WHERE [Id] = CAST(7 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-08-16T15:44:06.5312125+02:00', [ModifiedDate] = '2020-08-16T15:44:06.5312136+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-08-16T15:44:06.5313778+02:00', [ModifiedDate] = '2020-08-16T15:44:06.5313784+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-08-16T15:44:06.5313826+02:00', [ModifiedDate] = '2020-08-16T15:44:06.5313827+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-08-16T15:44:06.5313829+02:00', [ModifiedDate] = '2020-08-16T15:44:06.5313830+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-08-16T15:44:06.5252241+02:00', [ModifiedDate] = '2020-08-16T15:44:06.5252251+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-08-16T15:44:06.5254466+02:00', [ModifiedDate] = '2020-08-16T15:44:06.5254472+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-08-16T15:44:06.5316902+02:00', [ModifiedDate] = '2020-08-16T15:44:06.5316909+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-08-16T15:44:06.5318327+02:00', [ModifiedDate] = '2020-08-16T15:44:06.5318333+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Users] SET [CreatedDate] = '2020-08-16T15:44:06.5257236+02:00', [ModifiedDate] = '2020-08-16T15:44:06.5257243+02:00', [Password] = N'AEuu8XzRgfxq2qijaQLINVHhpdPMp/BKqhpzPoB/McL6tNosmXvy9sQkXUpGsz6e+w=='
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20200816134407_AddOrderAndCodeForTask', N'3.1.5');

GO

ALTER TABLE [Tasks] ADD [GroupId] bigint NULL;

GO

UPDATE [Companies] SET [CreatedDate] = '2020-08-17T00:27:18.7489598+02:00', [ModifiedDate] = '2020-08-17T00:27:18.7498613+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-17T00:27:18.7652772+02:00', [ModifiedDate] = '2020-08-17T00:27:18.7652779+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-17T00:27:18.7654015+02:00', [ModifiedDate] = '2020-08-17T00:27:18.7654021+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-17T00:27:18.7654044+02:00', [ModifiedDate] = '2020-08-17T00:27:18.7654045+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-17T00:27:18.7654047+02:00', [ModifiedDate] = '2020-08-17T00:27:18.7654048+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-17T00:27:18.7654049+02:00', [ModifiedDate] = '2020-08-17T00:27:18.7654050+02:00'
WHERE [Id] = CAST(5 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-17T00:27:18.7654051+02:00', [ModifiedDate] = '2020-08-17T00:27:18.7654052+02:00'
WHERE [Id] = CAST(6 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-17T00:27:18.7654054+02:00', [ModifiedDate] = '2020-08-17T00:27:18.7654054+02:00'
WHERE [Id] = CAST(7 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-08-17T00:27:18.7642505+02:00', [ModifiedDate] = '2020-08-17T00:27:18.7642535+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-08-17T00:27:18.7644338+02:00', [ModifiedDate] = '2020-08-17T00:27:18.7644345+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-08-17T00:27:18.7644388+02:00', [ModifiedDate] = '2020-08-17T00:27:18.7644389+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-08-17T00:27:18.7644390+02:00', [ModifiedDate] = '2020-08-17T00:27:18.7644391+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-08-17T00:27:18.7514309+02:00', [ModifiedDate] = '2020-08-17T00:27:18.7514318+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-08-17T00:27:18.7516454+02:00', [ModifiedDate] = '2020-08-17T00:27:18.7516461+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-08-17T00:27:18.7647841+02:00', [ModifiedDate] = '2020-08-17T00:27:18.7647848+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-08-17T00:27:18.7649167+02:00', [ModifiedDate] = '2020-08-17T00:27:18.7649173+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Users] SET [CreatedDate] = '2020-08-17T00:27:18.7519186+02:00', [ModifiedDate] = '2020-08-17T00:27:18.7519194+02:00', [Password] = N'AF4iTgtfpBrOVwHB9XRhPJf6Y0jh6EP7WQKebohxXINSGdGUoYuoVHwJKpokcQNmyA=='
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20200816222719_AddGroupIdInTask', N'3.1.5');

GO

ALTER TABLE [Forms] ADD [Component] nvarchar(max) NULL;

GO

ALTER TABLE [Forms] ADD [FormType] int NOT NULL DEFAULT 0;

GO

ALTER TABLE [Forms] ADD [Template] nvarchar(max) NULL;

GO

UPDATE [Companies] SET [CreatedDate] = '2020-08-17T08:01:48.1911791+02:00', [ModifiedDate] = '2020-08-17T08:01:48.1918950+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-17T08:01:48.2012027+02:00', [ModifiedDate] = '2020-08-17T08:01:48.2012034+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-17T08:01:48.2012691+02:00', [ModifiedDate] = '2020-08-17T08:01:48.2012696+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-17T08:01:48.2012714+02:00', [ModifiedDate] = '2020-08-17T08:01:48.2012715+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-17T08:01:48.2012716+02:00', [ModifiedDate] = '2020-08-17T08:01:48.2012717+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-17T08:01:48.2012718+02:00', [ModifiedDate] = '2020-08-17T08:01:48.2012719+02:00'
WHERE [Id] = CAST(5 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-17T08:01:48.2012721+02:00', [ModifiedDate] = '2020-08-17T08:01:48.2012721+02:00'
WHERE [Id] = CAST(6 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-17T08:01:48.2012723+02:00', [ModifiedDate] = '2020-08-17T08:01:48.2012724+02:00'
WHERE [Id] = CAST(7 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-08-17T08:01:48.2005526+02:00', [ModifiedDate] = '2020-08-17T08:01:48.2005545+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-08-17T08:01:48.2006408+02:00', [ModifiedDate] = '2020-08-17T08:01:48.2006413+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-08-17T08:01:48.2006444+02:00', [ModifiedDate] = '2020-08-17T08:01:48.2006445+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-08-17T08:01:48.2006446+02:00', [ModifiedDate] = '2020-08-17T08:01:48.2006447+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-08-17T08:01:48.1930533+02:00', [ModifiedDate] = '2020-08-17T08:01:48.1930542+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-08-17T08:01:48.1932046+02:00', [ModifiedDate] = '2020-08-17T08:01:48.1932058+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-08-17T08:01:48.2008676+02:00', [ModifiedDate] = '2020-08-17T08:01:48.2008683+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-08-17T08:01:48.2009354+02:00', [ModifiedDate] = '2020-08-17T08:01:48.2009358+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Users] SET [CreatedDate] = '2020-08-17T08:01:48.1934357+02:00', [ModifiedDate] = '2020-08-17T08:01:48.1934364+02:00', [Password] = N'AObBdzEDuwhsjb/b6onBojDq2I77AAlNwF6FHyWzrLkGqwvInV14PYlEV9yCQXPPOQ=='
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20200817040148_AddFormTemplateComponentAndTypeToFromTable', N'3.1.5');

GO

CREATE TABLE [Branches] (
    [Id] bigint NOT NULL IDENTITY,
    [CreatedById] bigint NULL,
    [CreatedDate] datetime2 NULL,
    [ModifiedDate] datetime2 NULL,
    [ModifiedById] bigint NULL,
    [IsDeleted] bit NOT NULL,
    [IsActive] bit NOT NULL,
    [NameEn] nvarchar(max) NULL,
    [NameAr] nvarchar(max) NULL,
    [LocationId] bigint NULL,
    [CompanyId] bigint NULL,
    CONSTRAINT [PK_Branches] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Branches_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_Branches_Locations_LocationId] FOREIGN KEY ([LocationId]) REFERENCES [Locations] ([Id]) ON DELETE NO ACTION
);

GO

UPDATE [Companies] SET [CreatedDate] = '2020-08-19T15:32:50.9422210+02:00', [ModifiedDate] = '2020-08-19T15:32:50.9430278+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-19T15:32:50.9535939+02:00', [ModifiedDate] = '2020-08-19T15:32:50.9535947+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-19T15:32:50.9537306+02:00', [ModifiedDate] = '2020-08-19T15:32:50.9537311+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-19T15:32:50.9537333+02:00', [ModifiedDate] = '2020-08-19T15:32:50.9537334+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-19T15:32:50.9537335+02:00', [ModifiedDate] = '2020-08-19T15:32:50.9537336+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-19T15:32:50.9537337+02:00', [ModifiedDate] = '2020-08-19T15:32:50.9537339+02:00'
WHERE [Id] = CAST(5 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-19T15:32:50.9537340+02:00', [ModifiedDate] = '2020-08-19T15:32:50.9537341+02:00'
WHERE [Id] = CAST(6 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-19T15:32:50.9537343+02:00', [ModifiedDate] = '2020-08-19T15:32:50.9537344+02:00'
WHERE [Id] = CAST(7 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-08-19T15:32:50.9525287+02:00', [ModifiedDate] = '2020-08-19T15:32:50.9525314+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-08-19T15:32:50.9527290+02:00', [ModifiedDate] = '2020-08-19T15:32:50.9527296+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-08-19T15:32:50.9527337+02:00', [ModifiedDate] = '2020-08-19T15:32:50.9527338+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-08-19T15:32:50.9527340+02:00', [ModifiedDate] = '2020-08-19T15:32:50.9527341+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-08-19T15:32:50.9448729+02:00', [ModifiedDate] = '2020-08-19T15:32:50.9448744+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-08-19T15:32:50.9451129+02:00', [ModifiedDate] = '2020-08-19T15:32:50.9451135+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-08-19T15:32:50.9530585+02:00', [ModifiedDate] = '2020-08-19T15:32:50.9530593+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-08-19T15:32:50.9532017+02:00', [ModifiedDate] = '2020-08-19T15:32:50.9532023+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Users] SET [CreatedDate] = '2020-08-19T15:32:50.9454160+02:00', [ModifiedDate] = '2020-08-19T15:32:50.9454167+02:00', [Password] = N'AKiq9rVt80WKWDlJJCnY51f1jqZ1rmjl8l5jcq1gmN1iiNn5KDt3AOZe6L/y63N1lA=='
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

CREATE INDEX [IX_Branches_CompanyId] ON [Branches] ([CompanyId]);

GO

CREATE INDEX [IX_Branches_LocationId] ON [Branches] ([LocationId]);

GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20200819113251_AddBranchTable', N'3.1.5');

GO

ALTER TABLE [Tasks] ADD [IsCompleted] bit NOT NULL DEFAULT CAST(0 AS bit);

GO

ALTER TABLE [Actions] ADD [IsCommentRequired] bit NOT NULL DEFAULT CAST(0 AS bit);

GO

UPDATE [Companies] SET [CreatedDate] = '2020-08-24T20:26:44.9114563+02:00', [ModifiedDate] = '2020-08-24T20:26:44.9122690+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-24T20:26:44.9203786+02:00', [ModifiedDate] = '2020-08-24T20:26:44.9203794+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-24T20:26:44.9205002+02:00', [ModifiedDate] = '2020-08-24T20:26:44.9205008+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-24T20:26:44.9205030+02:00', [ModifiedDate] = '2020-08-24T20:26:44.9205031+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-24T20:26:44.9205032+02:00', [ModifiedDate] = '2020-08-24T20:26:44.9205033+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-24T20:26:44.9205035+02:00', [ModifiedDate] = '2020-08-24T20:26:44.9205035+02:00'
WHERE [Id] = CAST(5 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-24T20:26:44.9205037+02:00', [ModifiedDate] = '2020-08-24T20:26:44.9205038+02:00'
WHERE [Id] = CAST(6 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-24T20:26:44.9205039+02:00', [ModifiedDate] = '2020-08-24T20:26:44.9205040+02:00'
WHERE [Id] = CAST(7 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-08-24T20:26:44.9194675+02:00', [ModifiedDate] = '2020-08-24T20:26:44.9194696+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-08-24T20:26:44.9196244+02:00', [ModifiedDate] = '2020-08-24T20:26:44.9196250+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-08-24T20:26:44.9196287+02:00', [ModifiedDate] = '2020-08-24T20:26:44.9196288+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-08-24T20:26:44.9196289+02:00', [ModifiedDate] = '2020-08-24T20:26:44.9196290+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-08-24T20:26:44.9137971+02:00', [ModifiedDate] = '2020-08-24T20:26:44.9137979+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-08-24T20:26:44.9140098+02:00', [ModifiedDate] = '2020-08-24T20:26:44.9140104+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-08-24T20:26:44.9199176+02:00', [ModifiedDate] = '2020-08-24T20:26:44.9199184+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-08-24T20:26:44.9200370+02:00', [ModifiedDate] = '2020-08-24T20:26:44.9200376+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Users] SET [CreatedDate] = '2020-08-24T20:26:44.9142790+02:00', [ModifiedDate] = '2020-08-24T20:26:44.9142796+02:00', [Password] = N'AH6IEyQ5XiTw6N4lrgIje7bQsu5y6HxygRF3PuaqsarjQeuzdIAj8e5BFUPWBPzaKQ=='
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20200824182645_AddIsRequiredCommentAndIsCompleted', N'3.1.5');

GO

ALTER TABLE [Requests] DROP CONSTRAINT [FK_Requests_Status_StatusId];

GO

ALTER TABLE [Services] DROP CONSTRAINT [FK_Services_ServiceTypes_ServiceTypeId];

GO

ALTER TABLE [ServiceTypeActions] DROP CONSTRAINT [FK_ServiceTypeActions_Actions_ActionId];

GO

ALTER TABLE [ServiceTypeActions] DROP CONSTRAINT [FK_ServiceTypeActions_ServiceTypes_ServiceTypeId];

GO

ALTER TABLE [Tasks] DROP CONSTRAINT [FK_Tasks_Actions_ActionId];

GO

ALTER TABLE [Status] DROP CONSTRAINT [PK_Status];

GO

ALTER TABLE [ServiceTypes] DROP CONSTRAINT [PK_ServiceTypes];

GO

ALTER TABLE [Actions] DROP CONSTRAINT [PK_Actions];

GO

DECLARE @var19 sysname;
SELECT @var19 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Status]') AND [c].[name] = N'Id');
IF @var19 IS NOT NULL EXEC(N'ALTER TABLE [Status] DROP CONSTRAINT [' + @var19 + '];');
ALTER TABLE [Status] DROP COLUMN [Id];

GO

DECLARE @var20 sysname;
SELECT @var20 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[ServiceTypes]') AND [c].[name] = N'Id');
IF @var20 IS NOT NULL EXEC(N'ALTER TABLE [ServiceTypes] DROP CONSTRAINT [' + @var20 + '];');
ALTER TABLE [ServiceTypes] DROP COLUMN [Id];

GO

DECLARE @var21 sysname;
SELECT @var21 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Actions]') AND [c].[name] = N'Id');
IF @var21 IS NOT NULL EXEC(N'ALTER TABLE [Actions] DROP CONSTRAINT [' + @var21 + '];');
ALTER TABLE [Actions] DROP COLUMN [Id];

GO

DECLARE @var22 sysname;
SELECT @var22 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Status]') AND [c].[name] = N'Code');
IF @var22 IS NOT NULL EXEC(N'ALTER TABLE [Status] DROP CONSTRAINT [' + @var22 + '];');
ALTER TABLE [Status] ALTER COLUMN [Code] nvarchar(100) NOT NULL;

GO

ALTER TABLE [Status] ADD [Id1] bigint NOT NULL IDENTITY;

GO

DECLARE @var23 sysname;
SELECT @var23 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[ServiceTypes]') AND [c].[name] = N'Color');
IF @var23 IS NOT NULL EXEC(N'ALTER TABLE [ServiceTypes] DROP CONSTRAINT [' + @var23 + '];');
ALTER TABLE [ServiceTypes] ALTER COLUMN [Color] nvarchar(255) NULL;

GO

DECLARE @var24 sysname;
SELECT @var24 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[ServiceTypes]') AND [c].[name] = N'Code');
IF @var24 IS NOT NULL EXEC(N'ALTER TABLE [ServiceTypes] DROP CONSTRAINT [' + @var24 + '];');
ALTER TABLE [ServiceTypes] ALTER COLUMN [Code] nvarchar(50) NOT NULL;

GO

ALTER TABLE [ServiceTypes] ADD [Id1] bigint NOT NULL IDENTITY;

GO

DECLARE @var25 sysname;
SELECT @var25 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[ServiceCategories]') AND [c].[name] = N'NameEn');
IF @var25 IS NOT NULL EXEC(N'ALTER TABLE [ServiceCategories] DROP CONSTRAINT [' + @var25 + '];');
ALTER TABLE [ServiceCategories] ALTER COLUMN [NameEn] nvarchar(100) NULL;

GO

DECLARE @var26 sysname;
SELECT @var26 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[ServiceCategories]') AND [c].[name] = N'NameAr');
IF @var26 IS NOT NULL EXEC(N'ALTER TABLE [ServiceCategories] DROP CONSTRAINT [' + @var26 + '];');
ALTER TABLE [ServiceCategories] ALTER COLUMN [NameAr] nvarchar(100) NULL;

GO

DECLARE @var27 sysname;
SELECT @var27 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Forms]') AND [c].[name] = N'Code');
IF @var27 IS NOT NULL EXEC(N'ALTER TABLE [Forms] DROP CONSTRAINT [' + @var27 + '];');
ALTER TABLE [Forms] ALTER COLUMN [Code] nvarchar(50) NOT NULL;

GO

DECLARE @var28 sysname;
SELECT @var28 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Actions]') AND [c].[name] = N'Color');
IF @var28 IS NOT NULL EXEC(N'ALTER TABLE [Actions] DROP CONSTRAINT [' + @var28 + '];');
ALTER TABLE [Actions] ALTER COLUMN [Color] nvarchar(255) NULL;

GO

DECLARE @var29 sysname;
SELECT @var29 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Actions]') AND [c].[name] = N'Code');
IF @var29 IS NOT NULL EXEC(N'ALTER TABLE [Actions] DROP CONSTRAINT [' + @var29 + '];');
ALTER TABLE [Actions] ALTER COLUMN [Code] nvarchar(50) NOT NULL;

GO

ALTER TABLE [Actions] ADD [Id1] bigint NOT NULL IDENTITY;

GO

ALTER TABLE [Status] ADD CONSTRAINT [PK_Status] PRIMARY KEY ([Id1]);

GO

ALTER TABLE [ServiceTypes] ADD CONSTRAINT [PK_ServiceTypes] PRIMARY KEY ([Id1]);

GO

ALTER TABLE [Actions] ADD CONSTRAINT [PK_Actions] PRIMARY KEY ([Id1]);

GO

UPDATE [Companies] SET [CreatedDate] = '2020-08-24T22:17:56.5721368+02:00', [ModifiedDate] = '2020-08-24T22:17:56.5730392+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-24T22:17:56.5815890+02:00', [ModifiedDate] = '2020-08-24T22:17:56.5815898+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-24T22:17:56.5817152+02:00', [ModifiedDate] = '2020-08-24T22:17:56.5817158+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-24T22:17:56.5817180+02:00', [ModifiedDate] = '2020-08-24T22:17:56.5817181+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-24T22:17:56.5817182+02:00', [ModifiedDate] = '2020-08-24T22:17:56.5817183+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-24T22:17:56.5817184+02:00', [ModifiedDate] = '2020-08-24T22:17:56.5817185+02:00'
WHERE [Id] = CAST(5 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-24T22:17:56.5817187+02:00', [ModifiedDate] = '2020-08-24T22:17:56.5817188+02:00'
WHERE [Id] = CAST(6 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-24T22:17:56.5817189+02:00', [ModifiedDate] = '2020-08-24T22:17:56.5817190+02:00'
WHERE [Id] = CAST(7 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-08-24T22:17:56.5806318+02:00', [ModifiedDate] = '2020-08-24T22:17:56.5806343+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-08-24T22:17:56.5807947+02:00', [ModifiedDate] = '2020-08-24T22:17:56.5807953+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-08-24T22:17:56.5807998+02:00', [ModifiedDate] = '2020-08-24T22:17:56.5807999+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-08-24T22:17:56.5808000+02:00', [ModifiedDate] = '2020-08-24T22:17:56.5808001+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-08-24T22:17:56.5747122+02:00', [ModifiedDate] = '2020-08-24T22:17:56.5747132+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-08-24T22:17:56.5749298+02:00', [ModifiedDate] = '2020-08-24T22:17:56.5749305+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-08-24T22:17:56.5810962+02:00', [ModifiedDate] = '2020-08-24T22:17:56.5810969+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-08-24T22:17:56.5812212+02:00', [ModifiedDate] = '2020-08-24T22:17:56.5812218+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Users] SET [CreatedDate] = '2020-08-24T22:17:56.5752218+02:00', [ModifiedDate] = '2020-08-24T22:17:56.5752226+02:00', [Password] = N'AJmT+Vkd8dSV6Tghawq1b41VtBe3NaK9ZNv8oZyNoYs/lA+2Yi8b524maIKwJCaQjw=='
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

ALTER TABLE [Requests] ADD CONSTRAINT [FK_Requests_Status_StatusId] FOREIGN KEY ([StatusId]) REFERENCES [Status] ([Id1]) ON DELETE NO ACTION;

GO

ALTER TABLE [Services] ADD CONSTRAINT [FK_Services_ServiceTypes_ServiceTypeId] FOREIGN KEY ([ServiceTypeId]) REFERENCES [ServiceTypes] ([Id1]) ON DELETE CASCADE;

GO

ALTER TABLE [ServiceTypeActions] ADD CONSTRAINT [FK_ServiceTypeActions_Actions_ActionId] FOREIGN KEY ([ActionId]) REFERENCES [Actions] ([Id1]) ON DELETE CASCADE;

GO

ALTER TABLE [ServiceTypeActions] ADD CONSTRAINT [FK_ServiceTypeActions_ServiceTypes_ServiceTypeId] FOREIGN KEY ([ServiceTypeId]) REFERENCES [ServiceTypes] ([Id1]) ON DELETE CASCADE;

GO

ALTER TABLE [Tasks] ADD CONSTRAINT [FK_Tasks_Actions_ActionId] FOREIGN KEY ([ActionId]) REFERENCES [Actions] ([Id1]) ON DELETE NO ACTION;

GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20200824201757_dropIdentity', N'3.1.5');

GO

ALTER TABLE [Requests] DROP CONSTRAINT [FK_Requests_Status_StatusId];

GO

ALTER TABLE [Services] DROP CONSTRAINT [FK_Services_ServiceTypes_ServiceTypeId];

GO

ALTER TABLE [ServiceTypeActions] DROP CONSTRAINT [FK_ServiceTypeActions_Actions_ActionId];

GO

ALTER TABLE [ServiceTypeActions] DROP CONSTRAINT [FK_ServiceTypeActions_ServiceTypes_ServiceTypeId];

GO

ALTER TABLE [Tasks] DROP CONSTRAINT [FK_Tasks_Actions_ActionId];

GO

ALTER TABLE [Status] DROP CONSTRAINT [PK_Status];

GO

ALTER TABLE [ServiceTypes] DROP CONSTRAINT [PK_ServiceTypes];

GO

ALTER TABLE [Actions] DROP CONSTRAINT [PK_Actions];

GO

DECLARE @var30 sysname;
SELECT @var30 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Status]') AND [c].[name] = N'Id1');
IF @var30 IS NOT NULL EXEC(N'ALTER TABLE [Status] DROP CONSTRAINT [' + @var30 + '];');
ALTER TABLE [Status] DROP COLUMN [Id1];

GO

DECLARE @var31 sysname;
SELECT @var31 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[ServiceTypes]') AND [c].[name] = N'Id1');
IF @var31 IS NOT NULL EXEC(N'ALTER TABLE [ServiceTypes] DROP CONSTRAINT [' + @var31 + '];');
ALTER TABLE [ServiceTypes] DROP COLUMN [Id1];

GO

DECLARE @var32 sysname;
SELECT @var32 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Actions]') AND [c].[name] = N'Id1');
IF @var32 IS NOT NULL EXEC(N'ALTER TABLE [Actions] DROP CONSTRAINT [' + @var32 + '];');
ALTER TABLE [Actions] DROP COLUMN [Id1];

GO

ALTER TABLE [Status] ADD [Id] bigint NOT NULL DEFAULT CAST(0 AS bigint);

GO

ALTER TABLE [ServiceTypes] ADD [Id] bigint NOT NULL DEFAULT CAST(0 AS bigint);

GO

ALTER TABLE [Actions] ADD [Id] bigint NOT NULL DEFAULT CAST(0 AS bigint);

GO

ALTER TABLE [Status] ADD CONSTRAINT [PK_Status] PRIMARY KEY ([Id]);

GO

ALTER TABLE [ServiceTypes] ADD CONSTRAINT [PK_ServiceTypes] PRIMARY KEY ([Id]);

GO

ALTER TABLE [Actions] ADD CONSTRAINT [PK_Actions] PRIMARY KEY ([Id]);

GO

UPDATE [Companies] SET [CreatedDate] = '2020-08-24T22:55:10.4648432+02:00', [ModifiedDate] = '2020-08-24T22:55:10.4658294+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-24T22:55:10.4746775+02:00', [ModifiedDate] = '2020-08-24T22:55:10.4746781+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-24T22:55:10.4748013+02:00', [ModifiedDate] = '2020-08-24T22:55:10.4748019+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-24T22:55:10.4748039+02:00', [ModifiedDate] = '2020-08-24T22:55:10.4748040+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-24T22:55:10.4748042+02:00', [ModifiedDate] = '2020-08-24T22:55:10.4748043+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-24T22:55:10.4748044+02:00', [ModifiedDate] = '2020-08-24T22:55:10.4748045+02:00'
WHERE [Id] = CAST(5 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-24T22:55:10.4748046+02:00', [ModifiedDate] = '2020-08-24T22:55:10.4748047+02:00'
WHERE [Id] = CAST(6 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-24T22:55:10.4748048+02:00', [ModifiedDate] = '2020-08-24T22:55:10.4748050+02:00'
WHERE [Id] = CAST(7 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-08-24T22:55:10.4737146+02:00', [ModifiedDate] = '2020-08-24T22:55:10.4737168+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-08-24T22:55:10.4738968+02:00', [ModifiedDate] = '2020-08-24T22:55:10.4738973+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-08-24T22:55:10.4739012+02:00', [ModifiedDate] = '2020-08-24T22:55:10.4739014+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-08-24T22:55:10.4739015+02:00', [ModifiedDate] = '2020-08-24T22:55:10.4739016+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-08-24T22:55:10.4673724+02:00', [ModifiedDate] = '2020-08-24T22:55:10.4673732+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-08-24T22:55:10.4676130+02:00', [ModifiedDate] = '2020-08-24T22:55:10.4676135+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-08-24T22:55:10.4741941+02:00', [ModifiedDate] = '2020-08-24T22:55:10.4741948+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-08-24T22:55:10.4743182+02:00', [ModifiedDate] = '2020-08-24T22:55:10.4743187+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Users] SET [CreatedDate] = '2020-08-24T22:55:10.4678891+02:00', [ModifiedDate] = '2020-08-24T22:55:10.4678898+02:00', [Password] = N'ANgEf5jg1OHVWGxC41LPKiQlVV0JI3tUMyJ1WOc88licCI4wK8uTsKIsACtQhviTxQ=='
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

CREATE UNIQUE INDEX [IX_Status_Code] ON [Status] ([Code]);

GO

CREATE UNIQUE INDEX [IX_ServiceTypes_Code] ON [ServiceTypes] ([Code]);

GO

CREATE UNIQUE INDEX [IX_Actions_Code] ON [Actions] ([Code]);

GO

ALTER TABLE [Requests] ADD CONSTRAINT [FK_Requests_Status_StatusId] FOREIGN KEY ([StatusId]) REFERENCES [Status] ([Id]) ON DELETE NO ACTION;

GO

ALTER TABLE [Services] ADD CONSTRAINT [FK_Services_ServiceTypes_ServiceTypeId] FOREIGN KEY ([ServiceTypeId]) REFERENCES [ServiceTypes] ([Id]) ON DELETE CASCADE;

GO

ALTER TABLE [ServiceTypeActions] ADD CONSTRAINT [FK_ServiceTypeActions_Actions_ActionId] FOREIGN KEY ([ActionId]) REFERENCES [Actions] ([Id]) ON DELETE CASCADE;

GO

ALTER TABLE [ServiceTypeActions] ADD CONSTRAINT [FK_ServiceTypeActions_ServiceTypes_ServiceTypeId] FOREIGN KEY ([ServiceTypeId]) REFERENCES [ServiceTypes] ([Id]) ON DELETE CASCADE;

GO

ALTER TABLE [Tasks] ADD CONSTRAINT [FK_Tasks_Actions_ActionId] FOREIGN KEY ([ActionId]) REFERENCES [Actions] ([Id]) ON DELETE NO ACTION;

GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20200824205511_ModifyEntitiesActionAndStatus', N'3.1.5');

GO

IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ActionType', N'Code', N'Color', N'CreatedById', N'CreatedDate', N'IsActive', N'IsCommentRequired', N'IsDeleted', N'ModifiedById', N'ModifiedDate', N'NameAr', N'NameEn') AND [object_id] = OBJECT_ID(N'[Actions]'))
    SET IDENTITY_INSERT [Actions] ON;
INSERT INTO [Actions] ([Id], [ActionType], [Code], [Color], [CreatedById], [CreatedDate], [IsActive], [IsCommentRequired], [IsDeleted], [ModifiedById], [ModifiedDate], [NameAr], [NameEn])
VALUES (CAST(1 AS bigint), 100, N'AC100', N'green', NULL, '2020-08-24T23:06:08.2934514+02:00', CAST(1 AS bit), CAST(0 AS bit), CAST(0 AS bit), NULL, '2020-08-24T23:06:08.2934538+02:00', N'موافقة', N'Approve'),
(CAST(2 AS bigint), 200, N'AC200', N'red', NULL, '2020-08-24T23:06:08.2943992+02:00', CAST(1 AS bit), CAST(0 AS bit), CAST(0 AS bit), NULL, '2020-08-24T23:06:08.2944010+02:00', N'رفض', N'Reject'),
(CAST(3 AS bigint), 300, N'AC300', N'blue', NULL, '2020-08-24T23:06:08.2944770+02:00', CAST(1 AS bit), CAST(0 AS bit), CAST(0 AS bit), NULL, '2020-08-24T23:06:08.2944774+02:00', N'اعادة توجية', N'ReAssign'),
(CAST(4 AS bigint), 100, N'AC400', N'green', NULL, '2020-08-24T23:06:08.2945168+02:00', CAST(1 AS bit), CAST(1 AS bit), CAST(0 AS bit), NULL, '2020-08-24T23:06:08.2945170+02:00', N'استجابة الطلب', N'Response');
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ActionType', N'Code', N'Color', N'CreatedById', N'CreatedDate', N'IsActive', N'IsCommentRequired', N'IsDeleted', N'ModifiedById', N'ModifiedDate', N'NameAr', N'NameEn') AND [object_id] = OBJECT_ID(N'[Actions]'))
    SET IDENTITY_INSERT [Actions] OFF;

GO

UPDATE [Companies] SET [CreatedDate] = '2020-08-24T23:06:08.2812052+02:00', [ModifiedDate] = '2020-08-24T23:06:08.2821843+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-24T23:06:08.2920417+02:00', [ModifiedDate] = '2020-08-24T23:06:08.2920435+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-24T23:06:08.2922380+02:00', [ModifiedDate] = '2020-08-24T23:06:08.2922392+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-24T23:06:08.2922416+02:00', [ModifiedDate] = '2020-08-24T23:06:08.2922417+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-24T23:06:08.2922418+02:00', [ModifiedDate] = '2020-08-24T23:06:08.2922419+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-24T23:06:08.2922513+02:00', [ModifiedDate] = '2020-08-24T23:06:08.2922514+02:00'
WHERE [Id] = CAST(5 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-24T23:06:08.2922517+02:00', [ModifiedDate] = '2020-08-24T23:06:08.2922518+02:00'
WHERE [Id] = CAST(6 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-24T23:06:08.2922519+02:00', [ModifiedDate] = '2020-08-24T23:06:08.2922520+02:00'
WHERE [Id] = CAST(7 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-08-24T23:06:08.2908913+02:00', [ModifiedDate] = '2020-08-24T23:06:08.2908947+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-08-24T23:06:08.2910826+02:00', [ModifiedDate] = '2020-08-24T23:06:08.2910838+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-08-24T23:06:08.2910883+02:00', [ModifiedDate] = '2020-08-24T23:06:08.2910884+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-08-24T23:06:08.2910886+02:00', [ModifiedDate] = '2020-08-24T23:06:08.2910887+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-08-24T23:06:08.2840695+02:00', [ModifiedDate] = '2020-08-24T23:06:08.2840720+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-08-24T23:06:08.2842968+02:00', [ModifiedDate] = '2020-08-24T23:06:08.2842977+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Code', N'Color', N'CreatedById', N'CreatedDate', N'IsActive', N'IsDeleted', N'ModifiedById', N'ModifiedDate', N'NameAr', N'NameEn') AND [object_id] = OBJECT_ID(N'[ServiceTypes]'))
    SET IDENTITY_INSERT [ServiceTypes] ON;
INSERT INTO [ServiceTypes] ([Id], [Code], [Color], [CreatedById], [CreatedDate], [IsActive], [IsDeleted], [ModifiedById], [ModifiedDate], [NameAr], [NameEn])
VALUES (CAST(3 AS bigint), N'ST300', N'red', NULL, '2020-08-24T23:06:08.2969064+02:00', CAST(1 AS bit), CAST(0 AS bit), NULL, '2020-08-24T23:06:08.2969067+02:00', N'بدون مراحل موافقة', N'No Approval'),
(CAST(1 AS bigint), N'ST100', N'green', NULL, '2020-08-24T23:06:08.2964913+02:00', CAST(1 AS bit), CAST(0 AS bit), NULL, '2020-08-24T23:06:08.2964931+02:00', N'عادي', N'Normal'),
(CAST(2 AS bigint), N'ST200', N'blue', NULL, '2020-08-24T23:06:08.2968520+02:00', CAST(1 AS bit), CAST(0 AS bit), NULL, '2020-08-24T23:06:08.2968527+02:00', N'الموظف اولا', N'Employee First');
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Code', N'Color', N'CreatedById', N'CreatedDate', N'IsActive', N'IsDeleted', N'ModifiedById', N'ModifiedDate', N'NameAr', N'NameEn') AND [object_id] = OBJECT_ID(N'[ServiceTypes]'))
    SET IDENTITY_INSERT [ServiceTypes] OFF;

GO

IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Code', N'Color', N'CreatedById', N'CreatedDate', N'IsActive', N'IsDeleted', N'ModifiedById', N'ModifiedDate', N'NameAr', N'NameEn') AND [object_id] = OBJECT_ID(N'[Status]'))
    SET IDENTITY_INSERT [Status] ON;
INSERT INTO [Status] ([Id], [Code], [Color], [CreatedById], [CreatedDate], [IsActive], [IsDeleted], [ModifiedById], [ModifiedDate], [NameAr], [NameEn])
VALUES (CAST(2 AS bigint), N'S300', N'red', NULL, '2020-08-24T23:06:08.2957505+02:00', CAST(1 AS bit), CAST(0 AS bit), NULL, '2020-08-24T23:06:08.2957508+02:00', N'تم الرفض', N'Rejected'),
(CAST(1 AS bigint), N'S200', N'green', NULL, '2020-08-24T23:06:08.2956908+02:00', CAST(1 AS bit), CAST(0 AS bit), NULL, '2020-08-24T23:06:08.2956917+02:00', N'تم الموافقة', N'Approved'),
(CAST(0 AS bigint), N'S100', N'blue', NULL, '2020-08-24T23:06:08.2953177+02:00', CAST(1 AS bit), CAST(0 AS bit), NULL, '2020-08-24T23:06:08.2953188+02:00', N'قيد الانتظار', N'In Progress');
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Code', N'Color', N'CreatedById', N'CreatedDate', N'IsActive', N'IsDeleted', N'ModifiedById', N'ModifiedDate', N'NameAr', N'NameEn') AND [object_id] = OBJECT_ID(N'[Status]'))
    SET IDENTITY_INSERT [Status] OFF;

GO

UPDATE [Teams] SET [CreatedDate] = '2020-08-24T23:06:08.2914352+02:00', [ModifiedDate] = '2020-08-24T23:06:08.2914371+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-08-24T23:06:08.2915678+02:00', [ModifiedDate] = '2020-08-24T23:06:08.2915685+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Users] SET [CreatedDate] = '2020-08-24T23:06:08.2846472+02:00', [ModifiedDate] = '2020-08-24T23:06:08.2846488+02:00', [Password] = N'AEyBJzU08GNvK0DYcgJNojMbrWYe1yD+kmJU1qrV73uECIWiANGYx6SaRkY/AG3KWw=='
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'ActionId', N'ServiceTypeId', N'CreatedById', N'CreatedDate', N'IsActive', N'IsDeleted', N'ModifiedById', N'ModifiedDate') AND [object_id] = OBJECT_ID(N'[ServiceTypeActions]'))
    SET IDENTITY_INSERT [ServiceTypeActions] ON;
INSERT INTO [ServiceTypeActions] ([ActionId], [ServiceTypeId], [CreatedById], [CreatedDate], [IsActive], [IsDeleted], [ModifiedById], [ModifiedDate])
VALUES (CAST(1 AS bigint), CAST(1 AS bigint), NULL, '2020-08-24T23:06:08.2972304+02:00', CAST(1 AS bit), CAST(0 AS bit), NULL, '2020-08-24T23:06:08.2972311+02:00'),
(CAST(2 AS bigint), CAST(1 AS bigint), NULL, '2020-08-24T23:06:08.2973273+02:00', CAST(1 AS bit), CAST(0 AS bit), NULL, '2020-08-24T23:06:08.2973277+02:00'),
(CAST(3 AS bigint), CAST(1 AS bigint), NULL, '2020-08-24T23:06:08.2973292+02:00', CAST(1 AS bit), CAST(0 AS bit), NULL, '2020-08-24T23:06:08.2973294+02:00'),
(CAST(4 AS bigint), CAST(2 AS bigint), NULL, '2020-08-24T23:06:08.2973295+02:00', CAST(1 AS bit), CAST(0 AS bit), NULL, '2020-08-24T23:06:08.2973296+02:00');
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'ActionId', N'ServiceTypeId', N'CreatedById', N'CreatedDate', N'IsActive', N'IsDeleted', N'ModifiedById', N'ModifiedDate') AND [object_id] = OBJECT_ID(N'[ServiceTypeActions]'))
    SET IDENTITY_INSERT [ServiceTypeActions] OFF;

GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20200824210609_addEServiceSeedData', N'3.1.5');

GO

UPDATE [Actions] SET [CreatedDate] = '2020-08-31T00:06:49.7950051+02:00', [ModifiedDate] = '2020-08-31T00:06:49.7950065+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-08-31T00:06:49.7959173+02:00', [ModifiedDate] = '2020-08-31T00:06:49.7959182+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-08-31T00:06:49.7959772+02:00', [ModifiedDate] = '2020-08-31T00:06:49.7959776+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [Color] = N'yellow', [CreatedDate] = '2020-08-31T00:06:49.7960206+02:00', [ModifiedDate] = '2020-08-31T00:06:49.7960209+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ActionType', N'Code', N'Color', N'CreatedById', N'CreatedDate', N'IsActive', N'IsCommentRequired', N'IsDeleted', N'ModifiedById', N'ModifiedDate', N'NameAr', N'NameEn') AND [object_id] = OBJECT_ID(N'[Actions]'))
    SET IDENTITY_INSERT [Actions] ON;
INSERT INTO [Actions] ([Id], [ActionType], [Code], [Color], [CreatedById], [CreatedDate], [IsActive], [IsCommentRequired], [IsDeleted], [ModifiedById], [ModifiedDate], [NameAr], [NameEn])
VALUES (CAST(5 AS bigint), 100, N'AC500', N'cyan', NULL, '2020-08-31T00:06:49.7960610+02:00', CAST(1 AS bit), CAST(1 AS bit), CAST(0 AS bit), NULL, '2020-08-31T00:06:49.7960613+02:00', N'تصعيد تلقائي', N'AutoEscalate');
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ActionType', N'Code', N'Color', N'CreatedById', N'CreatedDate', N'IsActive', N'IsCommentRequired', N'IsDeleted', N'ModifiedById', N'ModifiedDate', N'NameAr', N'NameEn') AND [object_id] = OBJECT_ID(N'[Actions]'))
    SET IDENTITY_INSERT [Actions] OFF;

GO

UPDATE [Companies] SET [CreatedDate] = '2020-08-31T00:06:49.7813668+02:00', [ModifiedDate] = '2020-08-31T00:06:49.7825494+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-31T00:06:49.7936317+02:00', [ModifiedDate] = '2020-08-31T00:06:49.7936325+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-31T00:06:49.7937749+02:00', [ModifiedDate] = '2020-08-31T00:06:49.7937755+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-31T00:06:49.7937777+02:00', [ModifiedDate] = '2020-08-31T00:06:49.7937778+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-31T00:06:49.7937780+02:00', [ModifiedDate] = '2020-08-31T00:06:49.7937781+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-31T00:06:49.7937782+02:00', [ModifiedDate] = '2020-08-31T00:06:49.7937783+02:00'
WHERE [Id] = CAST(5 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-31T00:06:49.7937785+02:00', [ModifiedDate] = '2020-08-31T00:06:49.7937786+02:00'
WHERE [Id] = CAST(6 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-08-31T00:06:49.7937787+02:00', [ModifiedDate] = '2020-08-31T00:06:49.7937788+02:00'
WHERE [Id] = CAST(7 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-08-31T00:06:49.7924405+02:00', [ModifiedDate] = '2020-08-31T00:06:49.7924432+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-08-31T00:06:49.7927419+02:00', [ModifiedDate] = '2020-08-31T00:06:49.7927428+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-08-31T00:06:49.7927473+02:00', [ModifiedDate] = '2020-08-31T00:06:49.7927474+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-08-31T00:06:49.7927476+02:00', [ModifiedDate] = '2020-08-31T00:06:49.7927477+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-08-31T00:06:49.7843994+02:00', [ModifiedDate] = '2020-08-31T00:06:49.7844009+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-08-31T00:06:49.7847262+02:00', [ModifiedDate] = '2020-08-31T00:06:49.7847270+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-08-31T00:06:49.7986913+02:00', [ModifiedDate] = '2020-08-31T00:06:49.7986921+02:00'
WHERE [ActionId] = CAST(1 AS bigint) AND [ServiceTypeId] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-08-31T00:06:49.7987930+02:00', [ModifiedDate] = '2020-08-31T00:06:49.7987936+02:00'
WHERE [ActionId] = CAST(2 AS bigint) AND [ServiceTypeId] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-08-31T00:06:49.7987954+02:00', [ModifiedDate] = '2020-08-31T00:06:49.7987955+02:00'
WHERE [ActionId] = CAST(3 AS bigint) AND [ServiceTypeId] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-08-31T00:06:49.7987956+02:00', [ModifiedDate] = '2020-08-31T00:06:49.7987957+02:00'
WHERE [ActionId] = CAST(4 AS bigint) AND [ServiceTypeId] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypes] SET [CreatedDate] = '2020-08-31T00:06:49.7979210+02:00', [ModifiedDate] = '2020-08-31T00:06:49.7979220+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypes] SET [CreatedDate] = '2020-08-31T00:06:49.7982420+02:00', [ModifiedDate] = '2020-08-31T00:06:49.7982427+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypes] SET [CreatedDate] = '2020-08-31T00:06:49.7982941+02:00', [ModifiedDate] = '2020-08-31T00:06:49.7982945+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Status] SET [CreatedDate] = '2020-08-31T00:06:49.7968255+02:00', [ModifiedDate] = '2020-08-31T00:06:49.7968264+02:00'
WHERE [Id] = CAST(0 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Status] SET [CreatedDate] = '2020-08-31T00:06:49.7972000+02:00', [ModifiedDate] = '2020-08-31T00:06:49.7972007+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Status] SET [CreatedDate] = '2020-08-31T00:06:49.7972481+02:00', [ModifiedDate] = '2020-08-31T00:06:49.7972484+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-08-31T00:06:49.7930668+02:00', [ModifiedDate] = '2020-08-31T00:06:49.7930676+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-08-31T00:06:49.7932170+02:00', [ModifiedDate] = '2020-08-31T00:06:49.7932176+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Users] SET [CreatedDate] = '2020-08-31T00:06:49.7851178+02:00', [ModifiedDate] = '2020-08-31T00:06:49.7851185+02:00', [Password] = N'APlX8rZ92EHpdDZkQPwFswBjqsSPXjgCCw5UZIRT9pJJobyC1qBf6opHxBOgAv5WdQ=='
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20200830200650_SeedActionTableWithAutoEscalate', N'3.1.5');

GO

CREATE TABLE [EmailTemplates] (
    [Id] bigint NOT NULL IDENTITY,
    [CreatedById] bigint NULL,
    [CreatedDate] datetime2 NULL,
    [ModifiedDate] datetime2 NULL,
    [ModifiedById] bigint NULL,
    [IsDeleted] bit NOT NULL,
    [IsActive] bit NOT NULL,
    [TemplateCode] nvarchar(max) NULL,
    CONSTRAINT [PK_EmailTemplates] PRIMARY KEY ([Id])
);

GO

CREATE TABLE [EmailTemplateForms] (
    [Id] bigint NOT NULL IDENTITY,
    [CreatedById] bigint NULL,
    [CreatedDate] datetime2 NULL,
    [ModifiedDate] datetime2 NULL,
    [ModifiedById] bigint NULL,
    [IsDeleted] bit NOT NULL,
    [IsActive] bit NOT NULL,
    [Form] nvarchar(max) NULL,
    [Language] nvarchar(max) NULL,
    [TemplateId] bigint NOT NULL,
    CONSTRAINT [PK_EmailTemplateForms] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_EmailTemplateForms_EmailTemplates_TemplateId] FOREIGN KEY ([TemplateId]) REFERENCES [EmailTemplates] ([Id]) ON DELETE CASCADE
);

GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-02T00:14:59.9589007+02:00', [ModifiedDate] = '2020-09-02T00:14:59.9589032+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-02T00:14:59.9603235+02:00', [ModifiedDate] = '2020-09-02T00:14:59.9603270+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-02T00:14:59.9604344+02:00', [ModifiedDate] = '2020-09-02T00:14:59.9604352+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-02T00:14:59.9604915+02:00', [ModifiedDate] = '2020-09-02T00:14:59.9604918+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-02T00:14:59.9605407+02:00', [ModifiedDate] = '2020-09-02T00:14:59.9605409+02:00'
WHERE [Id] = CAST(5 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Companies] SET [CreatedDate] = '2020-09-02T00:14:59.9460690+02:00', [ModifiedDate] = '2020-09-02T00:14:59.9475201+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-02T00:14:59.9576095+02:00', [ModifiedDate] = '2020-09-02T00:14:59.9576104+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-02T00:14:59.9577623+02:00', [ModifiedDate] = '2020-09-02T00:14:59.9577628+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-02T00:14:59.9577652+02:00', [ModifiedDate] = '2020-09-02T00:14:59.9577654+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-02T00:14:59.9577655+02:00', [ModifiedDate] = '2020-09-02T00:14:59.9577656+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-02T00:14:59.9577658+02:00', [ModifiedDate] = '2020-09-02T00:14:59.9577659+02:00'
WHERE [Id] = CAST(5 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-02T00:14:59.9577660+02:00', [ModifiedDate] = '2020-09-02T00:14:59.9577661+02:00'
WHERE [Id] = CAST(6 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-02T00:14:59.9577663+02:00', [ModifiedDate] = '2020-09-02T00:14:59.9577664+02:00'
WHERE [Id] = CAST(7 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-09-02T00:14:59.9561863+02:00', [ModifiedDate] = '2020-09-02T00:14:59.9561901+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-09-02T00:14:59.9564050+02:00', [ModifiedDate] = '2020-09-02T00:14:59.9564061+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-09-02T00:14:59.9564132+02:00', [ModifiedDate] = '2020-09-02T00:14:59.9564133+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-09-02T00:14:59.9564135+02:00', [ModifiedDate] = '2020-09-02T00:14:59.9564137+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-09-02T00:14:59.9494767+02:00', [ModifiedDate] = '2020-09-02T00:14:59.9494799+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-09-02T00:14:59.9497263+02:00', [ModifiedDate] = '2020-09-02T00:14:59.9497271+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-09-02T00:14:59.9637557+02:00', [ModifiedDate] = '2020-09-02T00:14:59.9637569+02:00'
WHERE [ActionId] = CAST(1 AS bigint) AND [ServiceTypeId] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-09-02T00:14:59.9638717+02:00', [ModifiedDate] = '2020-09-02T00:14:59.9638723+02:00'
WHERE [ActionId] = CAST(2 AS bigint) AND [ServiceTypeId] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-09-02T00:14:59.9638935+02:00', [ModifiedDate] = '2020-09-02T00:14:59.9638936+02:00'
WHERE [ActionId] = CAST(3 AS bigint) AND [ServiceTypeId] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-09-02T00:14:59.9638938+02:00', [ModifiedDate] = '2020-09-02T00:14:59.9638939+02:00'
WHERE [ActionId] = CAST(4 AS bigint) AND [ServiceTypeId] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypes] SET [CreatedDate] = '2020-09-02T00:14:59.9628926+02:00', [ModifiedDate] = '2020-09-02T00:14:59.9628944+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypes] SET [CreatedDate] = '2020-09-02T00:14:59.9633187+02:00', [ModifiedDate] = '2020-09-02T00:14:59.9633204+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypes] SET [CreatedDate] = '2020-09-02T00:14:59.9633783+02:00', [ModifiedDate] = '2020-09-02T00:14:59.9633786+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Status] SET [CreatedDate] = '2020-09-02T00:14:59.9615250+02:00', [ModifiedDate] = '2020-09-02T00:14:59.9615270+02:00'
WHERE [Id] = CAST(0 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Status] SET [CreatedDate] = '2020-09-02T00:14:59.9619673+02:00', [ModifiedDate] = '2020-09-02T00:14:59.9619684+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Status] SET [CreatedDate] = '2020-09-02T00:14:59.9620443+02:00', [ModifiedDate] = '2020-09-02T00:14:59.9620449+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-09-02T00:14:59.9570385+02:00', [ModifiedDate] = '2020-09-02T00:14:59.9570398+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-09-02T00:14:59.9571849+02:00', [ModifiedDate] = '2020-09-02T00:14:59.9571854+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Users] SET [CreatedDate] = '2020-09-02T00:14:59.9500667+02:00', [ModifiedDate] = '2020-09-02T00:14:59.9500676+02:00', [Password] = N'ADvHNVfgQPZij4KwnLc0GSCO+qORojULhl+9pt3OVzrtWF8vaQkEuYOIcaQ0PoZAvw=='
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

CREATE INDEX [IX_EmailTemplateForms_TemplateId] ON [EmailTemplateForms] ([TemplateId]);

GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20200901201501_AddEmailTemplateEntity', N'3.1.5');

GO

CREATE TABLE [Employees] (
    [EmployeeCode] nvarchar(20) NOT NULL,
    [Email] nvarchar(50) NOT NULL,
    [CompanyCode] nvarchar(50) NULL,
    [BranchCode] nvarchar(50) NOT NULL,
    [EmployeeNameArabic] nvarchar(100) NULL,
    [EmployeeNameEnglish] nvarchar(100) NULL,
    [ManagerCode] nvarchar(20) NULL,
    [ManagerEmail] nvarchar(50) NULL,
    [EmployeeHierachyCode] nvarchar(100) NULL,
    [Gender] nvarchar(20) NULL,
    [HiringDate] nvarchar(50) NULL,
    [BirthDate] nvarchar(50) NULL,
    [SocialStatus] nvarchar(50) NULL,
    [MarriageDate] nvarchar(50) NULL,
    [ReligionArabic] nvarchar(50) NULL,
    [ReligionEnglish] nvarchar(50) NULL,
    [ManagerPositionArabic] nvarchar(100) NULL,
    [ManagerPositionEnglish] nvarchar(100) NULL,
    [ClassificationArabic] nvarchar(100) NULL,
    [ClassificationEnglish] nvarchar(100) NULL,
    [DegreeArabic] nvarchar(100) NULL,
    [DegreeEnglish] nvarchar(100) NULL,
    [MainCategoryArabic] nvarchar(100) NULL,
    [MainCategoryEnglish] nvarchar(100) NULL,
    [SubCategoryArabic] nvarchar(100) NULL,
    [SubCategoryEnglish] nvarchar(100) NULL,
    [InsuranceStartDate] nvarchar(50) NULL,
    [InsuranceTypeArabic] nvarchar(100) NULL,
    [InsuranceTypeEnglish] nvarchar(100) NULL,
    [DocumentCode] nvarchar(50) NULL,
    [Permanent] nvarchar(20) NULL,
    [PermanentDate] nvarchar(50) NULL,
    [PaymentMethod] nvarchar(50) NULL,
    [BankArabic] nvarchar(100) NULL,
    [BankEnglish] nvarchar(100) NULL,
    [BankAccountCode] nvarchar(100) NULL,
    [ShiftCodeArabic] nvarchar(100) NULL,
    [ShiftCodeEnglish] nvarchar(100) NULL,
    [SectionArabic] nvarchar(100) NULL,
    [SectionEnglish] nvarchar(100) NULL,
    [SectionCode] nvarchar(100) NULL,
    [SectionPrefix] nvarchar(100) NULL,
    [DivisionArabic] nvarchar(100) NULL,
    [DivisionEnglish] nvarchar(100) NULL,
    [DivisionCode] nvarchar(100) NULL,
    [DivisionPrefix] nvarchar(100) NULL,
    [UnitCode] nvarchar(100) NULL,
    [UnitEnglish] nvarchar(100) NULL,
    [UnitArabic] nvarchar(100) NULL,
    [UnitPrefix] nvarchar(100) NULL,
    [PositionArabic] nvarchar(100) NULL,
    [PositionEnglish] nvarchar(100) NULL,
    [PositionCode] nvarchar(100) NULL,
    [PositionPrefix] nvarchar(100) NULL,
    [JobRefrence] nvarchar(100) NULL,
    [ServicePeriod] nvarchar(100) NULL,
    [ContractStartDate] nvarchar(50) NULL,
    [ContractEndDate] nvarchar(50) NULL,
    [ContractTypeArabic] nvarchar(100) NULL,
    [ContractTypeEnglish] nvarchar(100) NULL,
    [TerminationDate] nvarchar(50) NULL,
    [TerminationTypeEnglish] nvarchar(100) NULL,
    [TerminationTypeArabic] nvarchar(100) NULL,
    [TerminationCategoryArabic] nvarchar(100) NULL,
    [TerminationCategoryEnglish] nvarchar(100) NULL,
    [TerminationResonArabic] nvarchar(100) NULL,
    [TerminationResonEnglish] nvarchar(100) NULL,
    [EmployeePicture] nvarchar(300) NULL,
    CONSTRAINT [PK_Employees] PRIMARY KEY ([EmployeeCode], [Email])
);

GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-02T23:56:25.1291358+02:00', [ModifiedDate] = '2020-09-02T23:56:25.1291374+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-02T23:56:25.1305495+02:00', [ModifiedDate] = '2020-09-02T23:56:25.1305512+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-02T23:56:25.1306627+02:00', [ModifiedDate] = '2020-09-02T23:56:25.1306637+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-02T23:56:25.1308352+02:00', [ModifiedDate] = '2020-09-02T23:56:25.1308363+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-02T23:56:25.1309201+02:00', [ModifiedDate] = '2020-09-02T23:56:25.1309210+02:00'
WHERE [Id] = CAST(5 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Companies] SET [CreatedDate] = '2020-09-02T23:56:25.1140570+02:00', [ModifiedDate] = '2020-09-02T23:56:25.1150388+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-02T23:56:25.1275025+02:00', [ModifiedDate] = '2020-09-02T23:56:25.1275037+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-02T23:56:25.1276996+02:00', [ModifiedDate] = '2020-09-02T23:56:25.1277010+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-02T23:56:25.1277074+02:00', [ModifiedDate] = '2020-09-02T23:56:25.1277075+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-02T23:56:25.1277078+02:00', [ModifiedDate] = '2020-09-02T23:56:25.1277080+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-02T23:56:25.1277082+02:00', [ModifiedDate] = '2020-09-02T23:56:25.1277084+02:00'
WHERE [Id] = CAST(5 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-02T23:56:25.1277086+02:00', [ModifiedDate] = '2020-09-02T23:56:25.1277088+02:00'
WHERE [Id] = CAST(6 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-02T23:56:25.1277090+02:00', [ModifiedDate] = '2020-09-02T23:56:25.1277091+02:00'
WHERE [Id] = CAST(7 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-09-02T23:56:25.1257496+02:00', [ModifiedDate] = '2020-09-02T23:56:25.1257529+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-09-02T23:56:25.1260410+02:00', [ModifiedDate] = '2020-09-02T23:56:25.1260419+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-09-02T23:56:25.1260485+02:00', [ModifiedDate] = '2020-09-02T23:56:25.1260486+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-09-02T23:56:25.1260489+02:00', [ModifiedDate] = '2020-09-02T23:56:25.1260491+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-09-02T23:56:25.1169238+02:00', [ModifiedDate] = '2020-09-02T23:56:25.1169252+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-09-02T23:56:25.1172837+02:00', [ModifiedDate] = '2020-09-02T23:56:25.1172847+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-09-02T23:56:25.1350597+02:00', [ModifiedDate] = '2020-09-02T23:56:25.1350614+02:00'
WHERE [ActionId] = CAST(1 AS bigint) AND [ServiceTypeId] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-09-02T23:56:25.1352043+02:00', [ModifiedDate] = '2020-09-02T23:56:25.1352057+02:00'
WHERE [ActionId] = CAST(2 AS bigint) AND [ServiceTypeId] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-09-02T23:56:25.1352085+02:00', [ModifiedDate] = '2020-09-02T23:56:25.1352087+02:00'
WHERE [ActionId] = CAST(3 AS bigint) AND [ServiceTypeId] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-09-02T23:56:25.1352090+02:00', [ModifiedDate] = '2020-09-02T23:56:25.1352092+02:00'
WHERE [ActionId] = CAST(4 AS bigint) AND [ServiceTypeId] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypes] SET [CreatedDate] = '2020-09-02T23:56:25.1338799+02:00', [ModifiedDate] = '2020-09-02T23:56:25.1338817+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypes] SET [CreatedDate] = '2020-09-02T23:56:25.1343778+02:00', [ModifiedDate] = '2020-09-02T23:56:25.1343792+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypes] SET [CreatedDate] = '2020-09-02T23:56:25.1344641+02:00', [ModifiedDate] = '2020-09-02T23:56:25.1344649+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Status] SET [CreatedDate] = '2020-09-02T23:56:25.1320669+02:00', [ModifiedDate] = '2020-09-02T23:56:25.1320685+02:00'
WHERE [Id] = CAST(0 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Status] SET [CreatedDate] = '2020-09-02T23:56:25.1326505+02:00', [ModifiedDate] = '2020-09-02T23:56:25.1326518+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Status] SET [CreatedDate] = '2020-09-02T23:56:25.1327451+02:00', [ModifiedDate] = '2020-09-02T23:56:25.1327462+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-09-02T23:56:25.1266167+02:00', [ModifiedDate] = '2020-09-02T23:56:25.1266186+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-09-02T23:56:25.1268354+02:00', [ModifiedDate] = '2020-09-02T23:56:25.1268368+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Users] SET [CreatedDate] = '2020-09-02T23:56:25.1177073+02:00', [ModifiedDate] = '2020-09-02T23:56:25.1177083+02:00', [Password] = N'AIf/vKfo5OVHmP7S3YI6f679ll3mCi3SiCK0C+C3mx5gBZvkVE0MDjUBhXlBQ+T6AQ=='
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20200902215626_AddHrmsEmployees', N'3.1.5');

GO

DECLARE @var33 sysname;
SELECT @var33 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Requests]') AND [c].[name] = N'RequestBody');
IF @var33 IS NOT NULL EXEC(N'ALTER TABLE [Requests] DROP CONSTRAINT [' + @var33 + '];');
ALTER TABLE [Requests] ALTER COLUMN [RequestBody] nvarchar(max) NULL;

GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-14T14:25:35.0017230+02:00', [ModifiedDate] = '2020-09-14T14:25:35.0017492+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-14T14:25:35.0041977+02:00', [ModifiedDate] = '2020-09-14T14:25:35.0042010+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-14T14:25:35.0042952+02:00', [ModifiedDate] = '2020-09-14T14:25:35.0042961+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-14T14:25:35.0043573+02:00', [ModifiedDate] = '2020-09-14T14:25:35.0043577+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-14T14:25:35.0044256+02:00', [ModifiedDate] = '2020-09-14T14:25:35.0044261+02:00'
WHERE [Id] = CAST(5 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Companies] SET [CreatedDate] = '2020-09-14T14:25:34.9751918+02:00', [ModifiedDate] = '2020-09-14T14:25:34.9760809+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-14T14:25:34.9948181+02:00', [ModifiedDate] = '2020-09-14T14:25:34.9948205+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-14T14:25:34.9950397+02:00', [ModifiedDate] = '2020-09-14T14:25:34.9950418+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-14T14:25:34.9950481+02:00', [ModifiedDate] = '2020-09-14T14:25:34.9950483+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-14T14:25:34.9950486+02:00', [ModifiedDate] = '2020-09-14T14:25:34.9950487+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-14T14:25:34.9950489+02:00', [ModifiedDate] = '2020-09-14T14:25:34.9950490+02:00'
WHERE [Id] = CAST(5 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-14T14:25:34.9950492+02:00', [ModifiedDate] = '2020-09-14T14:25:34.9950493+02:00'
WHERE [Id] = CAST(6 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-14T14:25:34.9950495+02:00', [ModifiedDate] = '2020-09-14T14:25:34.9950496+02:00'
WHERE [Id] = CAST(7 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-09-14T14:25:34.9934783+02:00', [ModifiedDate] = '2020-09-14T14:25:34.9934821+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-09-14T14:25:34.9936793+02:00', [ModifiedDate] = '2020-09-14T14:25:34.9936799+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-09-14T14:25:34.9936840+02:00', [ModifiedDate] = '2020-09-14T14:25:34.9936841+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-09-14T14:25:34.9936843+02:00', [ModifiedDate] = '2020-09-14T14:25:34.9936845+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-09-14T14:25:34.9784417+02:00', [ModifiedDate] = '2020-09-14T14:25:34.9784462+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-09-14T14:25:34.9788914+02:00', [ModifiedDate] = '2020-09-14T14:25:34.9788971+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-09-14T14:25:35.0080969+02:00', [ModifiedDate] = '2020-09-14T14:25:35.0080976+02:00'
WHERE [ActionId] = CAST(1 AS bigint) AND [ServiceTypeId] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-09-14T14:25:35.0082903+02:00', [ModifiedDate] = '2020-09-14T14:25:35.0082922+02:00'
WHERE [ActionId] = CAST(2 AS bigint) AND [ServiceTypeId] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-09-14T14:25:35.0083080+02:00', [ModifiedDate] = '2020-09-14T14:25:35.0083082+02:00'
WHERE [ActionId] = CAST(3 AS bigint) AND [ServiceTypeId] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-09-14T14:25:35.0083084+02:00', [ModifiedDate] = '2020-09-14T14:25:35.0083085+02:00'
WHERE [ActionId] = CAST(4 AS bigint) AND [ServiceTypeId] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypes] SET [CreatedDate] = '2020-09-14T14:25:35.0073163+02:00', [ModifiedDate] = '2020-09-14T14:25:35.0073188+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypes] SET [CreatedDate] = '2020-09-14T14:25:35.0077019+02:00', [ModifiedDate] = '2020-09-14T14:25:35.0077026+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypes] SET [CreatedDate] = '2020-09-14T14:25:35.0077513+02:00', [ModifiedDate] = '2020-09-14T14:25:35.0077517+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Status] SET [CreatedDate] = '2020-09-14T14:25:35.0054249+02:00', [ModifiedDate] = '2020-09-14T14:25:35.0054274+02:00'
WHERE [Id] = CAST(0 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Status] SET [CreatedDate] = '2020-09-14T14:25:35.0060292+02:00', [ModifiedDate] = '2020-09-14T14:25:35.0060308+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Status] SET [CreatedDate] = '2020-09-14T14:25:35.0061193+02:00', [ModifiedDate] = '2020-09-14T14:25:35.0061201+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-09-14T14:25:34.9941535+02:00', [ModifiedDate] = '2020-09-14T14:25:34.9941546+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-09-14T14:25:34.9943390+02:00', [ModifiedDate] = '2020-09-14T14:25:34.9943398+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Users] SET [CreatedDate] = '2020-09-14T14:25:34.9797817+02:00', [ModifiedDate] = '2020-09-14T14:25:34.9797849+02:00', [Password] = N'ANHcZNpM4PBXUQ8RFbSOXdFUhPgr8FB9/Z5fXFS4uzx3Ro3pQEADCHiSJox1fQDJ5Q=='
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20200914102536_ChangeRequestBodyToNvarChar', N'3.1.5');

GO

ALTER TABLE [Employees] ADD [DepartmentArabic] nvarchar(100) NULL;

GO

ALTER TABLE [Employees] ADD [DepartmentCode] nvarchar(50) NULL;

GO

ALTER TABLE [Employees] ADD [DepartmentEnglish] nvarchar(100) NULL;

GO

ALTER TABLE [Employees] ADD [EmployeeStatus] nvarchar(300) NULL;

GO

ALTER TABLE [Employees] ADD [ManagerNameArabic] nvarchar(100) NULL;

GO

ALTER TABLE [Employees] ADD [ManagerNameEnglish] nvarchar(100) NULL;

GO

ALTER TABLE [Employees] ADD [Mobile] nvarchar(50) NULL;

GO

ALTER TABLE [Employees] ADD [NationalityArabic] nvarchar(100) NULL;

GO

ALTER TABLE [Employees] ADD [NationalityEnglish] nvarchar(100) NULL;

GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-15T23:50:30.0533245+02:00', [ModifiedDate] = '2020-09-15T23:50:30.0533253+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-15T23:50:30.0542077+02:00', [ModifiedDate] = '2020-09-15T23:50:30.0542084+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-15T23:50:30.0542734+02:00', [ModifiedDate] = '2020-09-15T23:50:30.0542738+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-15T23:50:30.0543125+02:00', [ModifiedDate] = '2020-09-15T23:50:30.0543128+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-15T23:50:30.0543545+02:00', [ModifiedDate] = '2020-09-15T23:50:30.0543547+02:00'
WHERE [Id] = CAST(5 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Companies] SET [CreatedDate] = '2020-09-15T23:50:30.0432819+02:00', [ModifiedDate] = '2020-09-15T23:50:30.0441147+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-15T23:50:30.0523168+02:00', [ModifiedDate] = '2020-09-15T23:50:30.0523176+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-15T23:50:30.0524397+02:00', [ModifiedDate] = '2020-09-15T23:50:30.0524402+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-15T23:50:30.0524422+02:00', [ModifiedDate] = '2020-09-15T23:50:30.0524423+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-15T23:50:30.0524425+02:00', [ModifiedDate] = '2020-09-15T23:50:30.0524426+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-15T23:50:30.0524427+02:00', [ModifiedDate] = '2020-09-15T23:50:30.0524428+02:00'
WHERE [Id] = CAST(5 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-15T23:50:30.0524429+02:00', [ModifiedDate] = '2020-09-15T23:50:30.0524430+02:00'
WHERE [Id] = CAST(6 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-15T23:50:30.0524431+02:00', [ModifiedDate] = '2020-09-15T23:50:30.0524432+02:00'
WHERE [Id] = CAST(7 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-09-15T23:50:30.0513794+02:00', [ModifiedDate] = '2020-09-15T23:50:30.0513805+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-09-15T23:50:30.0515384+02:00', [ModifiedDate] = '2020-09-15T23:50:30.0515389+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-09-15T23:50:30.0515438+02:00', [ModifiedDate] = '2020-09-15T23:50:30.0515439+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-09-15T23:50:30.0515441+02:00', [ModifiedDate] = '2020-09-15T23:50:30.0515442+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-09-15T23:50:30.0457156+02:00', [ModifiedDate] = '2020-09-15T23:50:30.0457165+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-09-15T23:50:30.0459421+02:00', [ModifiedDate] = '2020-09-15T23:50:30.0459427+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-09-15T23:50:30.0566255+02:00', [ModifiedDate] = '2020-09-15T23:50:30.0566262+02:00'
WHERE [ActionId] = CAST(1 AS bigint) AND [ServiceTypeId] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-09-15T23:50:30.0567296+02:00', [ModifiedDate] = '2020-09-15T23:50:30.0567301+02:00'
WHERE [ActionId] = CAST(2 AS bigint) AND [ServiceTypeId] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-09-15T23:50:30.0567332+02:00', [ModifiedDate] = '2020-09-15T23:50:30.0567333+02:00'
WHERE [ActionId] = CAST(3 AS bigint) AND [ServiceTypeId] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-09-15T23:50:30.0567334+02:00', [ModifiedDate] = '2020-09-15T23:50:30.0567335+02:00'
WHERE [ActionId] = CAST(4 AS bigint) AND [ServiceTypeId] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypes] SET [CreatedDate] = '2020-09-15T23:50:30.0560134+02:00', [ModifiedDate] = '2020-09-15T23:50:30.0560142+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypes] SET [CreatedDate] = '2020-09-15T23:50:30.0563037+02:00', [ModifiedDate] = '2020-09-15T23:50:30.0563044+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypes] SET [CreatedDate] = '2020-09-15T23:50:30.0563488+02:00', [ModifiedDate] = '2020-09-15T23:50:30.0563491+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Status] SET [CreatedDate] = '2020-09-15T23:50:30.0549797+02:00', [ModifiedDate] = '2020-09-15T23:50:30.0549805+02:00'
WHERE [Id] = CAST(0 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Status] SET [CreatedDate] = '2020-09-15T23:50:30.0553262+02:00', [ModifiedDate] = '2020-09-15T23:50:30.0553268+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Status] SET [CreatedDate] = '2020-09-15T23:50:30.0553734+02:00', [ModifiedDate] = '2020-09-15T23:50:30.0553737+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-09-15T23:50:30.0518256+02:00', [ModifiedDate] = '2020-09-15T23:50:30.0518264+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-09-15T23:50:30.0519523+02:00', [ModifiedDate] = '2020-09-15T23:50:30.0519528+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Users] SET [CreatedDate] = '2020-09-15T23:50:30.0462314+02:00', [ModifiedDate] = '2020-09-15T23:50:30.0462321+02:00', [Password] = N'AD8nTK13clLN5MNeu2Isk+Ji/vy+fywnRygb7I4a004K+AasGfTzlygay9iztlbhnA=='
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20200915215030_ModifyHrmsEmployees', N'3.1.5');

GO

ALTER TABLE [Employees] ADD [NationalCode] nvarchar(50) NULL;

GO

ALTER TABLE [Employees] ADD [ResidenceCode] nvarchar(50) NULL;

GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-16T20:53:24.7019502+02:00', [ModifiedDate] = '2020-09-16T20:53:24.7019512+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-16T20:53:24.7036247+02:00', [ModifiedDate] = '2020-09-16T20:53:24.7036259+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-16T20:53:24.7037138+02:00', [ModifiedDate] = '2020-09-16T20:53:24.7037143+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-16T20:53:24.7037592+02:00', [ModifiedDate] = '2020-09-16T20:53:24.7037595+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-16T20:53:24.7038175+02:00', [ModifiedDate] = '2020-09-16T20:53:24.7038180+02:00'
WHERE [Id] = CAST(5 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Companies] SET [CreatedDate] = '2020-09-16T20:53:24.6860732+02:00', [ModifiedDate] = '2020-09-16T20:53:24.6873328+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-16T20:53:24.7003876+02:00', [ModifiedDate] = '2020-09-16T20:53:24.7003883+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-16T20:53:24.7005274+02:00', [ModifiedDate] = '2020-09-16T20:53:24.7005280+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-16T20:53:24.7005301+02:00', [ModifiedDate] = '2020-09-16T20:53:24.7005302+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-16T20:53:24.7005304+02:00', [ModifiedDate] = '2020-09-16T20:53:24.7005305+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-16T20:53:24.7005306+02:00', [ModifiedDate] = '2020-09-16T20:53:24.7005307+02:00'
WHERE [Id] = CAST(5 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-16T20:53:24.7005309+02:00', [ModifiedDate] = '2020-09-16T20:53:24.7005310+02:00'
WHERE [Id] = CAST(6 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-16T20:53:24.7005311+02:00', [ModifiedDate] = '2020-09-16T20:53:24.7005312+02:00'
WHERE [Id] = CAST(7 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-09-16T20:53:24.6993313+02:00', [ModifiedDate] = '2020-09-16T20:53:24.6993334+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-09-16T20:53:24.6995226+02:00', [ModifiedDate] = '2020-09-16T20:53:24.6995232+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-09-16T20:53:24.6995282+02:00', [ModifiedDate] = '2020-09-16T20:53:24.6995283+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-09-16T20:53:24.6995285+02:00', [ModifiedDate] = '2020-09-16T20:53:24.6995286+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-09-16T20:53:24.6890897+02:00', [ModifiedDate] = '2020-09-16T20:53:24.6890906+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-09-16T20:53:24.6893416+02:00', [ModifiedDate] = '2020-09-16T20:53:24.6893423+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-09-16T20:53:24.7066906+02:00', [ModifiedDate] = '2020-09-16T20:53:24.7066914+02:00'
WHERE [ActionId] = CAST(1 AS bigint) AND [ServiceTypeId] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-09-16T20:53:24.7067786+02:00', [ModifiedDate] = '2020-09-16T20:53:24.7067792+02:00'
WHERE [ActionId] = CAST(2 AS bigint) AND [ServiceTypeId] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-09-16T20:53:24.7067827+02:00', [ModifiedDate] = '2020-09-16T20:53:24.7067829+02:00'
WHERE [ActionId] = CAST(3 AS bigint) AND [ServiceTypeId] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-09-16T20:53:24.7067832+02:00', [ModifiedDate] = '2020-09-16T20:53:24.7067833+02:00'
WHERE [ActionId] = CAST(4 AS bigint) AND [ServiceTypeId] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypes] SET [CreatedDate] = '2020-09-16T20:53:24.7059532+02:00', [ModifiedDate] = '2020-09-16T20:53:24.7059540+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypes] SET [CreatedDate] = '2020-09-16T20:53:24.7063133+02:00', [ModifiedDate] = '2020-09-16T20:53:24.7063142+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypes] SET [CreatedDate] = '2020-09-16T20:53:24.7063769+02:00', [ModifiedDate] = '2020-09-16T20:53:24.7063774+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Status] SET [CreatedDate] = '2020-09-16T20:53:24.7045378+02:00', [ModifiedDate] = '2020-09-16T20:53:24.7045387+02:00'
WHERE [Id] = CAST(0 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Status] SET [CreatedDate] = '2020-09-16T20:53:24.7049891+02:00', [ModifiedDate] = '2020-09-16T20:53:24.7049897+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Status] SET [CreatedDate] = '2020-09-16T20:53:24.7050795+02:00', [ModifiedDate] = '2020-09-16T20:53:24.7050801+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-09-16T20:53:24.6998599+02:00', [ModifiedDate] = '2020-09-16T20:53:24.6998605+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-09-16T20:53:24.7000026+02:00', [ModifiedDate] = '2020-09-16T20:53:24.7000032+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Users] SET [CreatedDate] = '2020-09-16T20:53:24.6896519+02:00', [ModifiedDate] = '2020-09-16T20:53:24.6896526+02:00', [Password] = N'AFYgwY5zoNbiOJuJfUFL+kuABC3Ug5iOTt8fu+V/9SE9LPbkZNyjGLxs/smqklXqjA=='
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20200916185325_AddNationalCode', N'3.1.5');

GO

ALTER TABLE [Users] ADD [HasChangedPassword] bit NOT NULL DEFAULT CAST(0 AS bit);

GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-18T15:55:35.6876168+02:00', [ModifiedDate] = '2020-09-18T15:55:35.6876177+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-18T15:55:35.6885353+02:00', [ModifiedDate] = '2020-09-18T15:55:35.6885362+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-18T15:55:35.6885952+02:00', [ModifiedDate] = '2020-09-18T15:55:35.6885956+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-18T15:55:35.6886337+02:00', [ModifiedDate] = '2020-09-18T15:55:35.6886339+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-18T15:55:35.6886791+02:00', [ModifiedDate] = '2020-09-18T15:55:35.6886793+02:00'
WHERE [Id] = CAST(5 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Companies] SET [CreatedDate] = '2020-09-18T15:55:35.6749127+02:00', [ModifiedDate] = '2020-09-18T15:55:35.6757040+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-18T15:55:35.6865736+02:00', [ModifiedDate] = '2020-09-18T15:55:35.6865744+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-18T15:55:35.6866950+02:00', [ModifiedDate] = '2020-09-18T15:55:35.6866955+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-18T15:55:35.6866978+02:00', [ModifiedDate] = '2020-09-18T15:55:35.6866979+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-18T15:55:35.6866981+02:00', [ModifiedDate] = '2020-09-18T15:55:35.6866982+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-18T15:55:35.6866983+02:00', [ModifiedDate] = '2020-09-18T15:55:35.6866984+02:00'
WHERE [Id] = CAST(5 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-18T15:55:35.6866985+02:00', [ModifiedDate] = '2020-09-18T15:55:35.6866986+02:00'
WHERE [Id] = CAST(6 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-18T15:55:35.6866988+02:00', [ModifiedDate] = '2020-09-18T15:55:35.6866989+02:00'
WHERE [Id] = CAST(7 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-09-18T15:55:35.6856149+02:00', [ModifiedDate] = '2020-09-18T15:55:35.6856177+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-09-18T15:55:35.6857749+02:00', [ModifiedDate] = '2020-09-18T15:55:35.6857754+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-09-18T15:55:35.6857791+02:00', [ModifiedDate] = '2020-09-18T15:55:35.6857792+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-09-18T15:55:35.6857794+02:00', [ModifiedDate] = '2020-09-18T15:55:35.6857795+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-09-18T15:55:35.6778115+02:00', [ModifiedDate] = '2020-09-18T15:55:35.6778128+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-09-18T15:55:35.6781355+02:00', [ModifiedDate] = '2020-09-18T15:55:35.6781363+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-09-18T15:55:35.6911007+02:00', [ModifiedDate] = '2020-09-18T15:55:35.6911013+02:00'
WHERE [ActionId] = CAST(1 AS bigint) AND [ServiceTypeId] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-09-18T15:55:35.6911846+02:00', [ModifiedDate] = '2020-09-18T15:55:35.6911850+02:00'
WHERE [ActionId] = CAST(2 AS bigint) AND [ServiceTypeId] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-09-18T15:55:35.6911871+02:00', [ModifiedDate] = '2020-09-18T15:55:35.6911872+02:00'
WHERE [ActionId] = CAST(3 AS bigint) AND [ServiceTypeId] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-09-18T15:55:35.6911874+02:00', [ModifiedDate] = '2020-09-18T15:55:35.6911875+02:00'
WHERE [ActionId] = CAST(4 AS bigint) AND [ServiceTypeId] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypes] SET [CreatedDate] = '2020-09-18T15:55:35.6904721+02:00', [ModifiedDate] = '2020-09-18T15:55:35.6904730+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypes] SET [CreatedDate] = '2020-09-18T15:55:35.6907599+02:00', [ModifiedDate] = '2020-09-18T15:55:35.6907606+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypes] SET [CreatedDate] = '2020-09-18T15:55:35.6908051+02:00', [ModifiedDate] = '2020-09-18T15:55:35.6908054+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Status] SET [CreatedDate] = '2020-09-18T15:55:35.6893880+02:00', [ModifiedDate] = '2020-09-18T15:55:35.6893890+02:00'
WHERE [Id] = CAST(0 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Status] SET [CreatedDate] = '2020-09-18T15:55:35.6897343+02:00', [ModifiedDate] = '2020-09-18T15:55:35.6897350+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Status] SET [CreatedDate] = '2020-09-18T15:55:35.6897833+02:00', [ModifiedDate] = '2020-09-18T15:55:35.6897836+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-09-18T15:55:35.6860886+02:00', [ModifiedDate] = '2020-09-18T15:55:35.6860893+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-09-18T15:55:35.6862110+02:00', [ModifiedDate] = '2020-09-18T15:55:35.6862115+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Users] SET [CreatedDate] = '2020-09-18T15:55:35.6787361+02:00', [ModifiedDate] = '2020-09-18T15:55:35.6787371+02:00', [Password] = N'AOv836qeUUZSVn6JC/IwMDwv51ld86CHcAcC7RncN1tI3ORI97fI6Uj9M9Y99nydYQ=='
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20200918115536_AddHasChangedPasswordToUserTable', N'3.1.5');

GO

ALTER TABLE [Tasks] ADD [SendToEmployeeEmail] nvarchar(max) NULL;

GO

ALTER TABLE [Tasks] ADD [SendToEmployeeId] nvarchar(max) NULL;

GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-24T22:14:34.3540633+02:00', [ModifiedDate] = '2020-09-24T22:14:34.3540642+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-24T22:14:34.3549509+02:00', [ModifiedDate] = '2020-09-24T22:14:34.3549516+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-24T22:14:34.3550135+02:00', [ModifiedDate] = '2020-09-24T22:14:34.3550139+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-24T22:14:34.3550511+02:00', [ModifiedDate] = '2020-09-24T22:14:34.3550514+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-24T22:14:34.3550970+02:00', [ModifiedDate] = '2020-09-24T22:14:34.3550973+02:00'
WHERE [Id] = CAST(5 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Companies] SET [CreatedDate] = '2020-09-24T22:14:34.3439387+02:00', [ModifiedDate] = '2020-09-24T22:14:34.3447028+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-24T22:14:34.3530044+02:00', [ModifiedDate] = '2020-09-24T22:14:34.3530051+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-24T22:14:34.3531302+02:00', [ModifiedDate] = '2020-09-24T22:14:34.3531307+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-24T22:14:34.3531366+02:00', [ModifiedDate] = '2020-09-24T22:14:34.3531368+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-24T22:14:34.3531369+02:00', [ModifiedDate] = '2020-09-24T22:14:34.3531370+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-24T22:14:34.3531372+02:00', [ModifiedDate] = '2020-09-24T22:14:34.3531373+02:00'
WHERE [Id] = CAST(5 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-24T22:14:34.3531374+02:00', [ModifiedDate] = '2020-09-24T22:14:34.3531375+02:00'
WHERE [Id] = CAST(6 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-24T22:14:34.3531376+02:00', [ModifiedDate] = '2020-09-24T22:14:34.3531377+02:00'
WHERE [Id] = CAST(7 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-09-24T22:14:34.3520873+02:00', [ModifiedDate] = '2020-09-24T22:14:34.3520884+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-09-24T22:14:34.3522508+02:00', [ModifiedDate] = '2020-09-24T22:14:34.3522514+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-09-24T22:14:34.3522554+02:00', [ModifiedDate] = '2020-09-24T22:14:34.3522555+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-09-24T22:14:34.3522557+02:00', [ModifiedDate] = '2020-09-24T22:14:34.3522558+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-09-24T22:14:34.3462383+02:00', [ModifiedDate] = '2020-09-24T22:14:34.3462390+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-09-24T22:14:34.3464597+02:00', [ModifiedDate] = '2020-09-24T22:14:34.3464603+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-09-24T22:14:34.3574365+02:00', [ModifiedDate] = '2020-09-24T22:14:34.3574372+02:00'
WHERE [ActionId] = CAST(1 AS bigint) AND [ServiceTypeId] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-09-24T22:14:34.3576046+02:00', [ModifiedDate] = '2020-09-24T22:14:34.3576052+02:00'
WHERE [ActionId] = CAST(2 AS bigint) AND [ServiceTypeId] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-09-24T22:14:34.3576068+02:00', [ModifiedDate] = '2020-09-24T22:14:34.3576069+02:00'
WHERE [ActionId] = CAST(3 AS bigint) AND [ServiceTypeId] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-09-24T22:14:34.3576071+02:00', [ModifiedDate] = '2020-09-24T22:14:34.3576072+02:00'
WHERE [ActionId] = CAST(4 AS bigint) AND [ServiceTypeId] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypes] SET [CreatedDate] = '2020-09-24T22:14:34.3567475+02:00', [ModifiedDate] = '2020-09-24T22:14:34.3567483+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypes] SET [CreatedDate] = '2020-09-24T22:14:34.3570466+02:00', [ModifiedDate] = '2020-09-24T22:14:34.3570473+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypes] SET [CreatedDate] = '2020-09-24T22:14:34.3570922+02:00', [ModifiedDate] = '2020-09-24T22:14:34.3570925+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Status] SET [CreatedDate] = '2020-09-24T22:14:34.3557042+02:00', [ModifiedDate] = '2020-09-24T22:14:34.3557051+02:00'
WHERE [Id] = CAST(0 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Status] SET [CreatedDate] = '2020-09-24T22:14:34.3560514+02:00', [ModifiedDate] = '2020-09-24T22:14:34.3560521+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Status] SET [CreatedDate] = '2020-09-24T22:14:34.3560981+02:00', [ModifiedDate] = '2020-09-24T22:14:34.3560984+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-09-24T22:14:34.3525402+02:00', [ModifiedDate] = '2020-09-24T22:14:34.3525410+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-09-24T22:14:34.3526654+02:00', [ModifiedDate] = '2020-09-24T22:14:34.3526659+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Users] SET [CreatedDate] = '2020-09-24T22:14:34.3467323+02:00', [ModifiedDate] = '2020-09-24T22:14:34.3467330+02:00', [Password] = N'APULRgyWtmFay5n15ID+p2Y49g9PLs9UrLMpfPfuF6zc0tqVh1vtVMN+DVdXAArp2w=='
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20200924201435_AddSendToEmployee', N'3.1.5');

GO

CREATE TABLE [PaySalaries] (
    [Id] bigint NOT NULL IDENTITY,
    [CompanyCode] nvarchar(max) NULL,
    [EmployeeCode] nvarchar(max) NULL,
    [Year] bigint NULL,
    [Month] bigint NULL,
    [FirstAllowance] decimal(18,2) NULL,
    [SecondAllowance] decimal(18,2) NULL,
    [ThirdAmount] decimal(18,2) NULL,
    [VacationAmount] decimal(18,2) NULL,
    [OtherAllowance] decimal(18,2) NULL,
    [OtherIncome] decimal(18,2) NULL,
    [TotalIncome] decimal(18,2) NULL,
    [SavingFundAmount] decimal(18,2) NULL,
    [MonthlyDeduction] decimal(18,2) NULL,
    [OtherDeduction] decimal(18,2) NULL,
    [TotalDeductions] decimal(18,2) NULL,
    [NetSalary] decimal(18,2) NULL,
    [SalaryReleased] decimal(18,2) NULL,
    [BasicSalaryAmount] decimal(18,2) NULL,
    [CalcFromDate] datetime2 NULL,
    [CalcToDate] datetime2 NULL,
    [IbanNumber] nvarchar(max) NULL,
    CONSTRAINT [PK_PaySalaries] PRIMARY KEY ([Id])
);

GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-25T17:38:58.8453995+02:00', [ModifiedDate] = '2020-09-25T17:38:58.8454006+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-25T17:38:58.8463579+02:00', [ModifiedDate] = '2020-09-25T17:38:58.8463590+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-25T17:38:58.8464225+02:00', [ModifiedDate] = '2020-09-25T17:38:58.8464229+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-25T17:38:58.8464667+02:00', [ModifiedDate] = '2020-09-25T17:38:58.8464671+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-25T17:38:58.8465090+02:00', [ModifiedDate] = '2020-09-25T17:38:58.8465092+02:00'
WHERE [Id] = CAST(5 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Companies] SET [CreatedDate] = '2020-09-25T17:38:58.8281390+02:00', [ModifiedDate] = '2020-09-25T17:38:58.8287808+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-25T17:38:58.8442730+02:00', [ModifiedDate] = '2020-09-25T17:38:58.8442738+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-25T17:38:58.8444086+02:00', [ModifiedDate] = '2020-09-25T17:38:58.8444091+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-25T17:38:58.8444117+02:00', [ModifiedDate] = '2020-09-25T17:38:58.8444118+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-25T17:38:58.8444120+02:00', [ModifiedDate] = '2020-09-25T17:38:58.8444121+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-25T17:38:58.8444122+02:00', [ModifiedDate] = '2020-09-25T17:38:58.8444123+02:00'
WHERE [Id] = CAST(5 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-25T17:38:58.8444124+02:00', [ModifiedDate] = '2020-09-25T17:38:58.8444125+02:00'
WHERE [Id] = CAST(6 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-25T17:38:58.8444127+02:00', [ModifiedDate] = '2020-09-25T17:38:58.8444128+02:00'
WHERE [Id] = CAST(7 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-09-25T17:38:58.8432002+02:00', [ModifiedDate] = '2020-09-25T17:38:58.8432037+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-09-25T17:38:58.8433857+02:00', [ModifiedDate] = '2020-09-25T17:38:58.8433863+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-09-25T17:38:58.8433908+02:00', [ModifiedDate] = '2020-09-25T17:38:58.8433909+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-09-25T17:38:58.8433911+02:00', [ModifiedDate] = '2020-09-25T17:38:58.8433912+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-09-25T17:38:58.8306502+02:00', [ModifiedDate] = '2020-09-25T17:38:58.8306517+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-09-25T17:38:58.8308935+02:00', [ModifiedDate] = '2020-09-25T17:38:58.8308941+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-09-25T17:38:58.8491571+02:00', [ModifiedDate] = '2020-09-25T17:38:58.8491581+02:00'
WHERE [ActionId] = CAST(1 AS bigint) AND [ServiceTypeId] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-09-25T17:38:58.8493215+02:00', [ModifiedDate] = '2020-09-25T17:38:58.8493220+02:00'
WHERE [ActionId] = CAST(2 AS bigint) AND [ServiceTypeId] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-09-25T17:38:58.8493237+02:00', [ModifiedDate] = '2020-09-25T17:38:58.8493239+02:00'
WHERE [ActionId] = CAST(3 AS bigint) AND [ServiceTypeId] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-09-25T17:38:58.8493240+02:00', [ModifiedDate] = '2020-09-25T17:38:58.8493241+02:00'
WHERE [ActionId] = CAST(4 AS bigint) AND [ServiceTypeId] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypes] SET [CreatedDate] = '2020-09-25T17:38:58.8483624+02:00', [ModifiedDate] = '2020-09-25T17:38:58.8483634+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypes] SET [CreatedDate] = '2020-09-25T17:38:58.8486786+02:00', [ModifiedDate] = '2020-09-25T17:38:58.8486793+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypes] SET [CreatedDate] = '2020-09-25T17:38:58.8487365+02:00', [ModifiedDate] = '2020-09-25T17:38:58.8487369+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Status] SET [CreatedDate] = '2020-09-25T17:38:58.8472566+02:00', [ModifiedDate] = '2020-09-25T17:38:58.8472592+02:00'
WHERE [Id] = CAST(0 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Status] SET [CreatedDate] = '2020-09-25T17:38:58.8476380+02:00', [ModifiedDate] = '2020-09-25T17:38:58.8476387+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Status] SET [CreatedDate] = '2020-09-25T17:38:58.8476877+02:00', [ModifiedDate] = '2020-09-25T17:38:58.8476881+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-09-25T17:38:58.8437178+02:00', [ModifiedDate] = '2020-09-25T17:38:58.8437185+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-09-25T17:38:58.8438539+02:00', [ModifiedDate] = '2020-09-25T17:38:58.8438545+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Users] SET [CreatedDate] = '2020-09-25T17:38:58.8312583+02:00', [ModifiedDate] = '2020-09-25T17:38:58.8312591+02:00', [Password] = N'API5VWEVQ8yX682iuGVfAghuaABcA60Ebohg5atjNAYWHxt8TOcmnhCweqJc2a0x2A=='
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20200925133859_AddSalaryTable', N'3.1.5');

GO

CREATE TABLE [Vacations] (
    [EmployeeCode] nvarchar(450) NOT NULL,
    [VacationCode] nvarchar(max) NULL,
    [VacationTypeEn] nvarchar(max) NULL,
    [VacationTypeAr] nvarchar(max) NULL,
    [PreviousYearBalance] float NULL,
    [NewYearBalance] float NULL,
    [NetBalance] float NULL,
    [VacationAdjustments] float NULL,
    [Year] bigint NULL,
    CONSTRAINT [PK_Vacations] PRIMARY KEY ([EmployeeCode])
);

GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-25T17:42:19.1367630+02:00', [ModifiedDate] = '2020-09-25T17:42:19.1367643+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-25T17:42:19.1385227+02:00', [ModifiedDate] = '2020-09-25T17:42:19.1385239+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-25T17:42:19.1386287+02:00', [ModifiedDate] = '2020-09-25T17:42:19.1386295+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-25T17:42:19.1387114+02:00', [ModifiedDate] = '2020-09-25T17:42:19.1387121+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-25T17:42:19.1387894+02:00', [ModifiedDate] = '2020-09-25T17:42:19.1387900+02:00'
WHERE [Id] = CAST(5 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Companies] SET [CreatedDate] = '2020-09-25T17:42:19.1242555+02:00', [ModifiedDate] = '2020-09-25T17:42:19.1249031+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-25T17:42:19.1352268+02:00', [ModifiedDate] = '2020-09-25T17:42:19.1352296+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-25T17:42:19.1354334+02:00', [ModifiedDate] = '2020-09-25T17:42:19.1354344+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-25T17:42:19.1354380+02:00', [ModifiedDate] = '2020-09-25T17:42:19.1354382+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-25T17:42:19.1354384+02:00', [ModifiedDate] = '2020-09-25T17:42:19.1354385+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-25T17:42:19.1354387+02:00', [ModifiedDate] = '2020-09-25T17:42:19.1354389+02:00'
WHERE [Id] = CAST(5 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-25T17:42:19.1354391+02:00', [ModifiedDate] = '2020-09-25T17:42:19.1354392+02:00'
WHERE [Id] = CAST(6 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-25T17:42:19.1354394+02:00', [ModifiedDate] = '2020-09-25T17:42:19.1354395+02:00'
WHERE [Id] = CAST(7 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-09-25T17:42:19.1338004+02:00', [ModifiedDate] = '2020-09-25T17:42:19.1338035+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-09-25T17:42:19.1339792+02:00', [ModifiedDate] = '2020-09-25T17:42:19.1339797+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-09-25T17:42:19.1339836+02:00', [ModifiedDate] = '2020-09-25T17:42:19.1339838+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-09-25T17:42:19.1339839+02:00', [ModifiedDate] = '2020-09-25T17:42:19.1339840+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-09-25T17:42:19.1267545+02:00', [ModifiedDate] = '2020-09-25T17:42:19.1267562+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-09-25T17:42:19.1269944+02:00', [ModifiedDate] = '2020-09-25T17:42:19.1269951+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-09-25T17:42:19.1425808+02:00', [ModifiedDate] = '2020-09-25T17:42:19.1425818+02:00'
WHERE [ActionId] = CAST(1 AS bigint) AND [ServiceTypeId] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-09-25T17:42:19.1427162+02:00', [ModifiedDate] = '2020-09-25T17:42:19.1427171+02:00'
WHERE [ActionId] = CAST(2 AS bigint) AND [ServiceTypeId] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-09-25T17:42:19.1427205+02:00', [ModifiedDate] = '2020-09-25T17:42:19.1427207+02:00'
WHERE [ActionId] = CAST(3 AS bigint) AND [ServiceTypeId] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-09-25T17:42:19.1427208+02:00', [ModifiedDate] = '2020-09-25T17:42:19.1427210+02:00'
WHERE [ActionId] = CAST(4 AS bigint) AND [ServiceTypeId] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypes] SET [CreatedDate] = '2020-09-25T17:42:19.1415331+02:00', [ModifiedDate] = '2020-09-25T17:42:19.1415343+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypes] SET [CreatedDate] = '2020-09-25T17:42:19.1419902+02:00', [ModifiedDate] = '2020-09-25T17:42:19.1419912+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypes] SET [CreatedDate] = '2020-09-25T17:42:19.1421062+02:00', [ModifiedDate] = '2020-09-25T17:42:19.1421070+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Status] SET [CreatedDate] = '2020-09-25T17:42:19.1397891+02:00', [ModifiedDate] = '2020-09-25T17:42:19.1397902+02:00'
WHERE [Id] = CAST(0 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Status] SET [CreatedDate] = '2020-09-25T17:42:19.1403864+02:00', [ModifiedDate] = '2020-09-25T17:42:19.1403876+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Status] SET [CreatedDate] = '2020-09-25T17:42:19.1404777+02:00', [ModifiedDate] = '2020-09-25T17:42:19.1404786+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-09-25T17:42:19.1344558+02:00', [ModifiedDate] = '2020-09-25T17:42:19.1344574+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-09-25T17:42:19.1346569+02:00', [ModifiedDate] = '2020-09-25T17:42:19.1346579+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Users] SET [CreatedDate] = '2020-09-25T17:42:19.1273514+02:00', [ModifiedDate] = '2020-09-25T17:42:19.1273522+02:00', [Password] = N'AFwi4ZLbAs6+Q89B2bRWleI3Kz8I91G5dBeEWyIxfguQU/4Wx2LYckkfJSCHconcGg=='
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20200925134220_AddVacationTable', N'3.1.5');

GO

CREATE TABLE [Transaction] (
    [TransactionId] bigint NULL,
    [EmployeeCode] nvarchar(max) NULL,
    [TransactionCode] nvarchar(max) NULL,
    [Year] bigint NULL,
    [TransactionPeriod] datetime2 NULL,
    [TransactionAmount] decimal(18,2) NULL,
    [LoanCode] nvarchar(max) NULL,
    [WfStatus] nvarchar(max) NULL,
    [TransDescription] nvarchar(max) NULL
);

GO

CREATE TABLE [TransactionDetail] (
    [EmployeeCode] nvarchar(max) NULL,
    [Year] bigint NOT NULL,
    [DueAmount] decimal(18,2) NULL,
    [PayStatus] nvarchar(max) NULL,
    [LoanSer] nvarchar(max) NULL,
    [TransactionId] bigint NULL,
    [InstallmentMonth] bigint NULL
);

GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-25T17:44:17.1071395+02:00', [ModifiedDate] = '2020-09-25T17:44:17.1071407+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-25T17:44:17.1084320+02:00', [ModifiedDate] = '2020-09-25T17:44:17.1084330+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-25T17:44:17.1084927+02:00', [ModifiedDate] = '2020-09-25T17:44:17.1084929+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-25T17:44:17.1085303+02:00', [ModifiedDate] = '2020-09-25T17:44:17.1085305+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-25T17:44:17.1085994+02:00', [ModifiedDate] = '2020-09-25T17:44:17.1085998+02:00'
WHERE [Id] = CAST(5 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Companies] SET [CreatedDate] = '2020-09-25T17:44:17.0952617+02:00', [ModifiedDate] = '2020-09-25T17:44:17.0959894+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-25T17:44:17.1059951+02:00', [ModifiedDate] = '2020-09-25T17:44:17.1059961+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-25T17:44:17.1061277+02:00', [ModifiedDate] = '2020-09-25T17:44:17.1061282+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-25T17:44:17.1061307+02:00', [ModifiedDate] = '2020-09-25T17:44:17.1061308+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-25T17:44:17.1061310+02:00', [ModifiedDate] = '2020-09-25T17:44:17.1061311+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-25T17:44:17.1061312+02:00', [ModifiedDate] = '2020-09-25T17:44:17.1061313+02:00'
WHERE [Id] = CAST(5 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-25T17:44:17.1061315+02:00', [ModifiedDate] = '2020-09-25T17:44:17.1061316+02:00'
WHERE [Id] = CAST(6 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-25T17:44:17.1061317+02:00', [ModifiedDate] = '2020-09-25T17:44:17.1061318+02:00'
WHERE [Id] = CAST(7 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-09-25T17:44:17.1045396+02:00', [ModifiedDate] = '2020-09-25T17:44:17.1045434+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-09-25T17:44:17.1047996+02:00', [ModifiedDate] = '2020-09-25T17:44:17.1048003+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-09-25T17:44:17.1048151+02:00', [ModifiedDate] = '2020-09-25T17:44:17.1048153+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-09-25T17:44:17.1048155+02:00', [ModifiedDate] = '2020-09-25T17:44:17.1048156+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-09-25T17:44:17.0978532+02:00', [ModifiedDate] = '2020-09-25T17:44:17.0978548+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-09-25T17:44:17.0980945+02:00', [ModifiedDate] = '2020-09-25T17:44:17.0980952+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-09-25T17:44:17.1111836+02:00', [ModifiedDate] = '2020-09-25T17:44:17.1111843+02:00'
WHERE [ActionId] = CAST(1 AS bigint) AND [ServiceTypeId] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-09-25T17:44:17.1112732+02:00', [ModifiedDate] = '2020-09-25T17:44:17.1112737+02:00'
WHERE [ActionId] = CAST(2 AS bigint) AND [ServiceTypeId] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-09-25T17:44:17.1112755+02:00', [ModifiedDate] = '2020-09-25T17:44:17.1112756+02:00'
WHERE [ActionId] = CAST(3 AS bigint) AND [ServiceTypeId] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-09-25T17:44:17.1112758+02:00', [ModifiedDate] = '2020-09-25T17:44:17.1112759+02:00'
WHERE [ActionId] = CAST(4 AS bigint) AND [ServiceTypeId] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypes] SET [CreatedDate] = '2020-09-25T17:44:17.1104475+02:00', [ModifiedDate] = '2020-09-25T17:44:17.1104484+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypes] SET [CreatedDate] = '2020-09-25T17:44:17.1108381+02:00', [ModifiedDate] = '2020-09-25T17:44:17.1108389+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypes] SET [CreatedDate] = '2020-09-25T17:44:17.1108838+02:00', [ModifiedDate] = '2020-09-25T17:44:17.1108841+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Status] SET [CreatedDate] = '2020-09-25T17:44:17.1092968+02:00', [ModifiedDate] = '2020-09-25T17:44:17.1092978+02:00'
WHERE [Id] = CAST(0 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Status] SET [CreatedDate] = '2020-09-25T17:44:17.1097499+02:00', [ModifiedDate] = '2020-09-25T17:44:17.1097507+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Status] SET [CreatedDate] = '2020-09-25T17:44:17.1097985+02:00', [ModifiedDate] = '2020-09-25T17:44:17.1097988+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-09-25T17:44:17.1053760+02:00', [ModifiedDate] = '2020-09-25T17:44:17.1053770+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-09-25T17:44:17.1055278+02:00', [ModifiedDate] = '2020-09-25T17:44:17.1055283+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Users] SET [CreatedDate] = '2020-09-25T17:44:17.0984008+02:00', [ModifiedDate] = '2020-09-25T17:44:17.0984015+02:00', [Password] = N'AGRFmZclMXDdzjVjhm+LsKp/YV/qryBkkpJxgf370VlDAHnAYP+Ng8Ra2a+3VTCi9w=='
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20200925134418_AddTransactionAndTransactionDetailTable', N'3.1.5');

GO

DECLARE @var34 sysname;
SELECT @var34 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Transaction]') AND [c].[name] = N'TransactionId');
IF @var34 IS NOT NULL EXEC(N'ALTER TABLE [Transaction] DROP CONSTRAINT [' + @var34 + '];');
ALTER TABLE [Transaction] DROP COLUMN [TransactionId];

GO

DECLARE @var35 sysname;
SELECT @var35 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Transaction]') AND [c].[name] = N'TransactionPeriod');
IF @var35 IS NOT NULL EXEC(N'ALTER TABLE [Transaction] DROP CONSTRAINT [' + @var35 + '];');
ALTER TABLE [Transaction] ALTER COLUMN [TransactionPeriod] nvarchar(max) NULL;

GO

ALTER TABLE [Transaction] ADD [Id] bigint NOT NULL IDENTITY;

GO

ALTER TABLE [Transaction] ADD CONSTRAINT [PK_Transaction] PRIMARY KEY ([Id]);

GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-28T09:43:35.2559562+02:00', [ModifiedDate] = '2020-09-28T09:43:35.2559569+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-28T09:43:35.2569623+02:00', [ModifiedDate] = '2020-09-28T09:43:35.2569630+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-28T09:43:35.2570134+02:00', [ModifiedDate] = '2020-09-28T09:43:35.2570137+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-28T09:43:35.2570459+02:00', [ModifiedDate] = '2020-09-28T09:43:35.2570461+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-28T09:43:35.2570831+02:00', [ModifiedDate] = '2020-09-28T09:43:35.2570833+02:00'
WHERE [Id] = CAST(5 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Companies] SET [CreatedDate] = '2020-09-28T09:43:35.2472609+02:00', [ModifiedDate] = '2020-09-28T09:43:35.2480196+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-28T09:43:35.2550874+02:00', [ModifiedDate] = '2020-09-28T09:43:35.2550879+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-28T09:43:35.2552099+02:00', [ModifiedDate] = '2020-09-28T09:43:35.2552103+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-28T09:43:35.2552120+02:00', [ModifiedDate] = '2020-09-28T09:43:35.2552121+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-28T09:43:35.2552122+02:00', [ModifiedDate] = '2020-09-28T09:43:35.2552123+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-28T09:43:35.2552124+02:00', [ModifiedDate] = '2020-09-28T09:43:35.2552125+02:00'
WHERE [Id] = CAST(5 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-28T09:43:35.2552126+02:00', [ModifiedDate] = '2020-09-28T09:43:35.2552127+02:00'
WHERE [Id] = CAST(6 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-28T09:43:35.2552128+02:00', [ModifiedDate] = '2020-09-28T09:43:35.2552129+02:00'
WHERE [Id] = CAST(7 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-09-28T09:43:35.2542595+02:00', [ModifiedDate] = '2020-09-28T09:43:35.2542607+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-09-28T09:43:35.2544123+02:00', [ModifiedDate] = '2020-09-28T09:43:35.2544128+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-09-28T09:43:35.2544158+02:00', [ModifiedDate] = '2020-09-28T09:43:35.2544159+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-09-28T09:43:35.2544161+02:00', [ModifiedDate] = '2020-09-28T09:43:35.2544161+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-09-28T09:43:35.2494262+02:00', [ModifiedDate] = '2020-09-28T09:43:35.2494269+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-09-28T09:43:35.2496323+02:00', [ModifiedDate] = '2020-09-28T09:43:35.2496327+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-09-28T09:43:35.2593203+02:00', [ModifiedDate] = '2020-09-28T09:43:35.2593209+02:00'
WHERE [ActionId] = CAST(1 AS bigint) AND [ServiceTypeId] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-09-28T09:43:35.2594008+02:00', [ModifiedDate] = '2020-09-28T09:43:35.2594012+02:00'
WHERE [ActionId] = CAST(2 AS bigint) AND [ServiceTypeId] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-09-28T09:43:35.2594025+02:00', [ModifiedDate] = '2020-09-28T09:43:35.2594026+02:00'
WHERE [ActionId] = CAST(3 AS bigint) AND [ServiceTypeId] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-09-28T09:43:35.2594027+02:00', [ModifiedDate] = '2020-09-28T09:43:35.2594028+02:00'
WHERE [ActionId] = CAST(4 AS bigint) AND [ServiceTypeId] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypes] SET [CreatedDate] = '2020-09-28T09:43:35.2587648+02:00', [ModifiedDate] = '2020-09-28T09:43:35.2587655+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypes] SET [CreatedDate] = '2020-09-28T09:43:35.2590326+02:00', [ModifiedDate] = '2020-09-28T09:43:35.2590332+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypes] SET [CreatedDate] = '2020-09-28T09:43:35.2590747+02:00', [ModifiedDate] = '2020-09-28T09:43:35.2590750+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Status] SET [CreatedDate] = '2020-09-28T09:43:35.2576583+02:00', [ModifiedDate] = '2020-09-28T09:43:35.2576591+02:00'
WHERE [Id] = CAST(0 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Status] SET [CreatedDate] = '2020-09-28T09:43:35.2581589+02:00', [ModifiedDate] = '2020-09-28T09:43:35.2581597+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Status] SET [CreatedDate] = '2020-09-28T09:43:35.2581999+02:00', [ModifiedDate] = '2020-09-28T09:43:35.2582002+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-09-28T09:43:35.2546656+02:00', [ModifiedDate] = '2020-09-28T09:43:35.2546662+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-09-28T09:43:35.2547821+02:00', [ModifiedDate] = '2020-09-28T09:43:35.2547827+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Users] SET [CreatedDate] = '2020-09-28T09:43:35.2498771+02:00', [ModifiedDate] = '2020-09-28T09:43:35.2498777+02:00', [Password] = N'AFEPlnoFqfLFtYZeXav2GDJuffrjOsEqtyf8ykjv3Cjxt/NAPcJ8nE3xK8N2Qqmj7Q=='
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20200928054335_AddPrimaryKeyToTransaction', N'3.1.5');

GO

ALTER TABLE [Vacations] DROP CONSTRAINT [PK_Vacations];

GO

DECLARE @var36 sysname;
SELECT @var36 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Vacations]') AND [c].[name] = N'EmployeeCode');
IF @var36 IS NOT NULL EXEC(N'ALTER TABLE [Vacations] DROP CONSTRAINT [' + @var36 + '];');
ALTER TABLE [Vacations] ALTER COLUMN [EmployeeCode] nvarchar(max) NULL;

GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-28T09:45:15.7554271+02:00', [ModifiedDate] = '2020-09-28T09:45:15.7554278+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-28T09:45:15.7564296+02:00', [ModifiedDate] = '2020-09-28T09:45:15.7564302+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-28T09:45:15.7564829+02:00', [ModifiedDate] = '2020-09-28T09:45:15.7564832+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-28T09:45:15.7565158+02:00', [ModifiedDate] = '2020-09-28T09:45:15.7565160+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-28T09:45:15.7565536+02:00', [ModifiedDate] = '2020-09-28T09:45:15.7565538+02:00'
WHERE [Id] = CAST(5 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Companies] SET [CreatedDate] = '2020-09-28T09:45:15.7467047+02:00', [ModifiedDate] = '2020-09-28T09:45:15.7474696+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-28T09:45:15.7545574+02:00', [ModifiedDate] = '2020-09-28T09:45:15.7545580+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-28T09:45:15.7546714+02:00', [ModifiedDate] = '2020-09-28T09:45:15.7546718+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-28T09:45:15.7546737+02:00', [ModifiedDate] = '2020-09-28T09:45:15.7546738+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-28T09:45:15.7546739+02:00', [ModifiedDate] = '2020-09-28T09:45:15.7546740+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-28T09:45:15.7546742+02:00', [ModifiedDate] = '2020-09-28T09:45:15.7546742+02:00'
WHERE [Id] = CAST(5 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-28T09:45:15.7546744+02:00', [ModifiedDate] = '2020-09-28T09:45:15.7546744+02:00'
WHERE [Id] = CAST(6 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-28T09:45:15.7546746+02:00', [ModifiedDate] = '2020-09-28T09:45:15.7546747+02:00'
WHERE [Id] = CAST(7 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-09-28T09:45:15.7537139+02:00', [ModifiedDate] = '2020-09-28T09:45:15.7537155+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-09-28T09:45:15.7538656+02:00', [ModifiedDate] = '2020-09-28T09:45:15.7538661+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-09-28T09:45:15.7538691+02:00', [ModifiedDate] = '2020-09-28T09:45:15.7538692+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-09-28T09:45:15.7538694+02:00', [ModifiedDate] = '2020-09-28T09:45:15.7538695+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-09-28T09:45:15.7488597+02:00', [ModifiedDate] = '2020-09-28T09:45:15.7488604+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-09-28T09:45:15.7490620+02:00', [ModifiedDate] = '2020-09-28T09:45:15.7490625+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-09-28T09:45:15.7585605+02:00', [ModifiedDate] = '2020-09-28T09:45:15.7585611+02:00'
WHERE [ActionId] = CAST(1 AS bigint) AND [ServiceTypeId] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-09-28T09:45:15.7586395+02:00', [ModifiedDate] = '2020-09-28T09:45:15.7586399+02:00'
WHERE [ActionId] = CAST(2 AS bigint) AND [ServiceTypeId] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-09-28T09:45:15.7586413+02:00', [ModifiedDate] = '2020-09-28T09:45:15.7586414+02:00'
WHERE [ActionId] = CAST(3 AS bigint) AND [ServiceTypeId] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-09-28T09:45:15.7586415+02:00', [ModifiedDate] = '2020-09-28T09:45:15.7586416+02:00'
WHERE [ActionId] = CAST(4 AS bigint) AND [ServiceTypeId] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypes] SET [CreatedDate] = '2020-09-28T09:45:15.7580048+02:00', [ModifiedDate] = '2020-09-28T09:45:15.7580056+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypes] SET [CreatedDate] = '2020-09-28T09:45:15.7582694+02:00', [ModifiedDate] = '2020-09-28T09:45:15.7582699+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypes] SET [CreatedDate] = '2020-09-28T09:45:15.7583074+02:00', [ModifiedDate] = '2020-09-28T09:45:15.7583077+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Status] SET [CreatedDate] = '2020-09-28T09:45:15.7570971+02:00', [ModifiedDate] = '2020-09-28T09:45:15.7570979+02:00'
WHERE [Id] = CAST(0 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Status] SET [CreatedDate] = '2020-09-28T09:45:15.7574211+02:00', [ModifiedDate] = '2020-09-28T09:45:15.7574217+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Status] SET [CreatedDate] = '2020-09-28T09:45:15.7574635+02:00', [ModifiedDate] = '2020-09-28T09:45:15.7574637+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-09-28T09:45:15.7541215+02:00', [ModifiedDate] = '2020-09-28T09:45:15.7541221+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-09-28T09:45:15.7542369+02:00', [ModifiedDate] = '2020-09-28T09:45:15.7542374+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Users] SET [CreatedDate] = '2020-09-28T09:45:15.7493094+02:00', [ModifiedDate] = '2020-09-28T09:45:15.7493100+02:00', [Password] = N'AB0v56PurP5qRvxgcWtvcoBLCXWxwWotD8fDDa5lbV4y2VcQYQ40ZfC65KjKOrqokg=='
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20200928054516_RemovePrimaryKeyFromVacation', N'3.1.5');

GO

ALTER TABLE [TransactionDetail] ADD [Id] bigint NOT NULL IDENTITY;

GO

ALTER TABLE [TransactionDetail] ADD CONSTRAINT [PK_TransactionDetail] PRIMARY KEY ([Id]);

GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-28T09:54:26.3110650+02:00', [ModifiedDate] = '2020-09-28T09:54:26.3110658+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-28T09:54:26.3118383+02:00', [ModifiedDate] = '2020-09-28T09:54:26.3118390+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-28T09:54:26.3118896+02:00', [ModifiedDate] = '2020-09-28T09:54:26.3118900+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-28T09:54:26.3119220+02:00', [ModifiedDate] = '2020-09-28T09:54:26.3119222+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-28T09:54:26.3119590+02:00', [ModifiedDate] = '2020-09-28T09:54:26.3119592+02:00'
WHERE [Id] = CAST(5 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Companies] SET [CreatedDate] = '2020-09-28T09:54:26.3020281+02:00', [ModifiedDate] = '2020-09-28T09:54:26.3027814+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-28T09:54:26.3101730+02:00', [ModifiedDate] = '2020-09-28T09:54:26.3101737+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-28T09:54:26.3103003+02:00', [ModifiedDate] = '2020-09-28T09:54:26.3103007+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-28T09:54:26.3103026+02:00', [ModifiedDate] = '2020-09-28T09:54:26.3103027+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-28T09:54:26.3103029+02:00', [ModifiedDate] = '2020-09-28T09:54:26.3103029+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-28T09:54:26.3103030+02:00', [ModifiedDate] = '2020-09-28T09:54:26.3103031+02:00'
WHERE [Id] = CAST(5 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-28T09:54:26.3103033+02:00', [ModifiedDate] = '2020-09-28T09:54:26.3103033+02:00'
WHERE [Id] = CAST(6 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-28T09:54:26.3103035+02:00', [ModifiedDate] = '2020-09-28T09:54:26.3103035+02:00'
WHERE [Id] = CAST(7 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-09-28T09:54:26.3093309+02:00', [ModifiedDate] = '2020-09-28T09:54:26.3093321+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-09-28T09:54:26.3094849+02:00', [ModifiedDate] = '2020-09-28T09:54:26.3094853+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-09-28T09:54:26.3094882+02:00', [ModifiedDate] = '2020-09-28T09:54:26.3094884+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-09-28T09:54:26.3094885+02:00', [ModifiedDate] = '2020-09-28T09:54:26.3094886+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-09-28T09:54:26.3042072+02:00', [ModifiedDate] = '2020-09-28T09:54:26.3042080+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-09-28T09:54:26.3044162+02:00', [ModifiedDate] = '2020-09-28T09:54:26.3044168+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-09-28T09:54:26.3139827+02:00', [ModifiedDate] = '2020-09-28T09:54:26.3139834+02:00'
WHERE [ActionId] = CAST(1 AS bigint) AND [ServiceTypeId] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-09-28T09:54:26.3140630+02:00', [ModifiedDate] = '2020-09-28T09:54:26.3140634+02:00'
WHERE [ActionId] = CAST(2 AS bigint) AND [ServiceTypeId] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-09-28T09:54:26.3140649+02:00', [ModifiedDate] = '2020-09-28T09:54:26.3140649+02:00'
WHERE [ActionId] = CAST(3 AS bigint) AND [ServiceTypeId] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-09-28T09:54:26.3140651+02:00', [ModifiedDate] = '2020-09-28T09:54:26.3140652+02:00'
WHERE [ActionId] = CAST(4 AS bigint) AND [ServiceTypeId] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypes] SET [CreatedDate] = '2020-09-28T09:54:26.3134277+02:00', [ModifiedDate] = '2020-09-28T09:54:26.3134285+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypes] SET [CreatedDate] = '2020-09-28T09:54:26.3136963+02:00', [ModifiedDate] = '2020-09-28T09:54:26.3136969+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypes] SET [CreatedDate] = '2020-09-28T09:54:26.3137355+02:00', [ModifiedDate] = '2020-09-28T09:54:26.3137357+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Status] SET [CreatedDate] = '2020-09-28T09:54:26.3125066+02:00', [ModifiedDate] = '2020-09-28T09:54:26.3125073+02:00'
WHERE [Id] = CAST(0 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Status] SET [CreatedDate] = '2020-09-28T09:54:26.3128311+02:00', [ModifiedDate] = '2020-09-28T09:54:26.3128316+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Status] SET [CreatedDate] = '2020-09-28T09:54:26.3128715+02:00', [ModifiedDate] = '2020-09-28T09:54:26.3128718+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-09-28T09:54:26.3097492+02:00', [ModifiedDate] = '2020-09-28T09:54:26.3097499+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-09-28T09:54:26.3098663+02:00', [ModifiedDate] = '2020-09-28T09:54:26.3098668+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Users] SET [CreatedDate] = '2020-09-28T09:54:26.3046763+02:00', [ModifiedDate] = '2020-09-28T09:54:26.3046770+02:00', [Password] = N'ALEnu22EAkC+Xyke5eeUMbIArw0Ojc847F8Z2s6PNL3gYaR81EcquKD1VUacHlcLjA=='
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

CREATE UNIQUE INDEX [IX_TransactionDetail_TransactionId] ON [TransactionDetail] ([TransactionId]) WHERE [TransactionId] IS NOT NULL;

GO

ALTER TABLE [TransactionDetail] ADD CONSTRAINT [FK_TransactionDetail_Transaction_TransactionId] FOREIGN KEY ([TransactionId]) REFERENCES [Transaction] ([Id]) ON DELETE NO ACTION;

GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20200928055426_AddRelationBetweenTransactionAndTransactionDetail', N'3.1.5');

GO

DROP TABLE [TransactionDetail];

GO

DROP TABLE [Transaction];

GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-28T09:56:38.0397767+02:00', [ModifiedDate] = '2020-09-28T09:56:38.0397776+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-28T09:56:38.0407963+02:00', [ModifiedDate] = '2020-09-28T09:56:38.0407972+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-28T09:56:38.0408496+02:00', [ModifiedDate] = '2020-09-28T09:56:38.0408499+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-28T09:56:38.0408826+02:00', [ModifiedDate] = '2020-09-28T09:56:38.0408828+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-28T09:56:38.0409242+02:00', [ModifiedDate] = '2020-09-28T09:56:38.0409244+02:00'
WHERE [Id] = CAST(5 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Companies] SET [CreatedDate] = '2020-09-28T09:56:38.0307059+02:00', [ModifiedDate] = '2020-09-28T09:56:38.0315073+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-28T09:56:38.0388868+02:00', [ModifiedDate] = '2020-09-28T09:56:38.0388874+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-28T09:56:38.0390098+02:00', [ModifiedDate] = '2020-09-28T09:56:38.0390103+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-28T09:56:38.0390119+02:00', [ModifiedDate] = '2020-09-28T09:56:38.0390119+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-28T09:56:38.0390121+02:00', [ModifiedDate] = '2020-09-28T09:56:38.0390122+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-28T09:56:38.0390123+02:00', [ModifiedDate] = '2020-09-28T09:56:38.0390124+02:00'
WHERE [Id] = CAST(5 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-28T09:56:38.0390125+02:00', [ModifiedDate] = '2020-09-28T09:56:38.0390126+02:00'
WHERE [Id] = CAST(6 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-28T09:56:38.0390127+02:00', [ModifiedDate] = '2020-09-28T09:56:38.0390128+02:00'
WHERE [Id] = CAST(7 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-09-28T09:56:38.0379341+02:00', [ModifiedDate] = '2020-09-28T09:56:38.0379360+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-09-28T09:56:38.0380882+02:00', [ModifiedDate] = '2020-09-28T09:56:38.0380886+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-09-28T09:56:38.0380917+02:00', [ModifiedDate] = '2020-09-28T09:56:38.0380918+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-09-28T09:56:38.0380919+02:00', [ModifiedDate] = '2020-09-28T09:56:38.0380920+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-09-28T09:56:38.0329614+02:00', [ModifiedDate] = '2020-09-28T09:56:38.0329624+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-09-28T09:56:38.0331716+02:00', [ModifiedDate] = '2020-09-28T09:56:38.0331721+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-09-28T09:56:38.0429905+02:00', [ModifiedDate] = '2020-09-28T09:56:38.0429911+02:00'
WHERE [ActionId] = CAST(1 AS bigint) AND [ServiceTypeId] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-09-28T09:56:38.0430719+02:00', [ModifiedDate] = '2020-09-28T09:56:38.0430723+02:00'
WHERE [ActionId] = CAST(2 AS bigint) AND [ServiceTypeId] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-09-28T09:56:38.0430737+02:00', [ModifiedDate] = '2020-09-28T09:56:38.0430738+02:00'
WHERE [ActionId] = CAST(3 AS bigint) AND [ServiceTypeId] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-09-28T09:56:38.0430739+02:00', [ModifiedDate] = '2020-09-28T09:56:38.0430740+02:00'
WHERE [ActionId] = CAST(4 AS bigint) AND [ServiceTypeId] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypes] SET [CreatedDate] = '2020-09-28T09:56:38.0424228+02:00', [ModifiedDate] = '2020-09-28T09:56:38.0424235+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypes] SET [CreatedDate] = '2020-09-28T09:56:38.0426920+02:00', [ModifiedDate] = '2020-09-28T09:56:38.0426925+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypes] SET [CreatedDate] = '2020-09-28T09:56:38.0427331+02:00', [ModifiedDate] = '2020-09-28T09:56:38.0427334+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Status] SET [CreatedDate] = '2020-09-28T09:56:38.0414932+02:00', [ModifiedDate] = '2020-09-28T09:56:38.0414940+02:00'
WHERE [Id] = CAST(0 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Status] SET [CreatedDate] = '2020-09-28T09:56:38.0418258+02:00', [ModifiedDate] = '2020-09-28T09:56:38.0418264+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Status] SET [CreatedDate] = '2020-09-28T09:56:38.0418666+02:00', [ModifiedDate] = '2020-09-28T09:56:38.0418669+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-09-28T09:56:38.0383386+02:00', [ModifiedDate] = '2020-09-28T09:56:38.0383393+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-09-28T09:56:38.0384549+02:00', [ModifiedDate] = '2020-09-28T09:56:38.0384554+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Users] SET [CreatedDate] = '2020-09-28T09:56:38.0334237+02:00', [ModifiedDate] = '2020-09-28T09:56:38.0334243+02:00', [Password] = N'AAmCUdRIUYV1qnBFNXqgExQ2xMTsfi8Kxxcj+EXLPpdcZsFdLB57cd0viF/x/8sTyw=='
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20200928055638_RemoveTransactionEntities', N'3.1.5');

GO

CREATE TABLE [Transactions] (
    [Id] bigint NOT NULL IDENTITY,
    [EmployeeCode] nvarchar(max) NULL,
    [TransactionCode] nvarchar(max) NULL,
    [Year] bigint NULL,
    [TransactionPeriod] nvarchar(max) NULL,
    [TransactionAmount] decimal(18,2) NULL,
    [LoanCode] nvarchar(max) NULL,
    [WfStatus] nvarchar(max) NULL,
    [TransDescription] nvarchar(max) NULL,
    CONSTRAINT [PK_Transactions] PRIMARY KEY ([Id])
);

GO

CREATE TABLE [TransactionDetails] (
    [Id] bigint NOT NULL IDENTITY,
    [EmployeeCode] nvarchar(max) NULL,
    [Year] bigint NOT NULL,
    [DueAmount] decimal(18,2) NULL,
    [PayStatus] nvarchar(max) NULL,
    [LoanSer] nvarchar(max) NULL,
    [TransactionId] bigint NULL,
    [InstallmentMonth] bigint NULL,
    CONSTRAINT [PK_TransactionDetails] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_TransactionDetails_Transactions_TransactionId] FOREIGN KEY ([TransactionId]) REFERENCES [Transactions] ([Id]) ON DELETE NO ACTION
);

GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-28T09:57:36.2126686+02:00', [ModifiedDate] = '2020-09-28T09:57:36.2126694+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-28T09:57:36.2134554+02:00', [ModifiedDate] = '2020-09-28T09:57:36.2134560+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-28T09:57:36.2135119+02:00', [ModifiedDate] = '2020-09-28T09:57:36.2135122+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-28T09:57:36.2135455+02:00', [ModifiedDate] = '2020-09-28T09:57:36.2135457+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-28T09:57:36.2135828+02:00', [ModifiedDate] = '2020-09-28T09:57:36.2135829+02:00'
WHERE [Id] = CAST(5 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Companies] SET [CreatedDate] = '2020-09-28T09:57:36.2033094+02:00', [ModifiedDate] = '2020-09-28T09:57:36.2040893+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-28T09:57:36.2117510+02:00', [ModifiedDate] = '2020-09-28T09:57:36.2117516+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-28T09:57:36.2118750+02:00', [ModifiedDate] = '2020-09-28T09:57:36.2118754+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-28T09:57:36.2118772+02:00', [ModifiedDate] = '2020-09-28T09:57:36.2118773+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-28T09:57:36.2118774+02:00', [ModifiedDate] = '2020-09-28T09:57:36.2118775+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-28T09:57:36.2118776+02:00', [ModifiedDate] = '2020-09-28T09:57:36.2118777+02:00'
WHERE [Id] = CAST(5 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-28T09:57:36.2118778+02:00', [ModifiedDate] = '2020-09-28T09:57:36.2118779+02:00'
WHERE [Id] = CAST(6 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-28T09:57:36.2118780+02:00', [ModifiedDate] = '2020-09-28T09:57:36.2118781+02:00'
WHERE [Id] = CAST(7 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-09-28T09:57:36.2108839+02:00', [ModifiedDate] = '2020-09-28T09:57:36.2108857+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-09-28T09:57:36.2110417+02:00', [ModifiedDate] = '2020-09-28T09:57:36.2110421+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-09-28T09:57:36.2110453+02:00', [ModifiedDate] = '2020-09-28T09:57:36.2110454+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-09-28T09:57:36.2110456+02:00', [ModifiedDate] = '2020-09-28T09:57:36.2110457+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-09-28T09:57:36.2055702+02:00', [ModifiedDate] = '2020-09-28T09:57:36.2055711+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-09-28T09:57:36.2057899+02:00', [ModifiedDate] = '2020-09-28T09:57:36.2057904+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-09-28T09:57:36.2156643+02:00', [ModifiedDate] = '2020-09-28T09:57:36.2156649+02:00'
WHERE [ActionId] = CAST(1 AS bigint) AND [ServiceTypeId] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-09-28T09:57:36.2157449+02:00', [ModifiedDate] = '2020-09-28T09:57:36.2157453+02:00'
WHERE [ActionId] = CAST(2 AS bigint) AND [ServiceTypeId] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-09-28T09:57:36.2157467+02:00', [ModifiedDate] = '2020-09-28T09:57:36.2157468+02:00'
WHERE [ActionId] = CAST(3 AS bigint) AND [ServiceTypeId] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-09-28T09:57:36.2157470+02:00', [ModifiedDate] = '2020-09-28T09:57:36.2157471+02:00'
WHERE [ActionId] = CAST(4 AS bigint) AND [ServiceTypeId] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypes] SET [CreatedDate] = '2020-09-28T09:57:36.2150946+02:00', [ModifiedDate] = '2020-09-28T09:57:36.2150953+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypes] SET [CreatedDate] = '2020-09-28T09:57:36.2153748+02:00', [ModifiedDate] = '2020-09-28T09:57:36.2153753+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypes] SET [CreatedDate] = '2020-09-28T09:57:36.2154161+02:00', [ModifiedDate] = '2020-09-28T09:57:36.2154165+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Status] SET [CreatedDate] = '2020-09-28T09:57:36.2141500+02:00', [ModifiedDate] = '2020-09-28T09:57:36.2141508+02:00'
WHERE [Id] = CAST(0 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Status] SET [CreatedDate] = '2020-09-28T09:57:36.2144851+02:00', [ModifiedDate] = '2020-09-28T09:57:36.2144857+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Status] SET [CreatedDate] = '2020-09-28T09:57:36.2145266+02:00', [ModifiedDate] = '2020-09-28T09:57:36.2145269+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-09-28T09:57:36.2113109+02:00', [ModifiedDate] = '2020-09-28T09:57:36.2113115+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-09-28T09:57:36.2114411+02:00', [ModifiedDate] = '2020-09-28T09:57:36.2114415+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Users] SET [CreatedDate] = '2020-09-28T09:57:36.2060517+02:00', [ModifiedDate] = '2020-09-28T09:57:36.2060523+02:00', [Password] = N'AP4KXnCac3Z+64z2x65I94dN85vEOWG4ZqwakWenO9M+gKGpNw2Jhn8hCev/oHB7VQ=='
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

CREATE UNIQUE INDEX [IX_TransactionDetails_TransactionId] ON [TransactionDetails] ([TransactionId]) WHERE [TransactionId] IS NOT NULL;

GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20200928055737_AddTransactionEntities', N'3.1.5');

GO

DROP TABLE [TransactionDetails];

GO

DROP TABLE [Transactions];

GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-28T10:02:19.9791374+02:00', [ModifiedDate] = '2020-09-28T10:02:19.9791382+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-28T10:02:19.9801443+02:00', [ModifiedDate] = '2020-09-28T10:02:19.9801450+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-28T10:02:19.9802005+02:00', [ModifiedDate] = '2020-09-28T10:02:19.9802009+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-28T10:02:19.9802338+02:00', [ModifiedDate] = '2020-09-28T10:02:19.9802341+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-28T10:02:19.9802670+02:00', [ModifiedDate] = '2020-09-28T10:02:19.9802671+02:00'
WHERE [Id] = CAST(5 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Companies] SET [CreatedDate] = '2020-09-28T10:02:19.9701017+02:00', [ModifiedDate] = '2020-09-28T10:02:19.9708545+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-28T10:02:19.9782358+02:00', [ModifiedDate] = '2020-09-28T10:02:19.9782365+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-28T10:02:19.9783539+02:00', [ModifiedDate] = '2020-09-28T10:02:19.9783543+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-28T10:02:19.9783560+02:00', [ModifiedDate] = '2020-09-28T10:02:19.9783560+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-28T10:02:19.9783562+02:00', [ModifiedDate] = '2020-09-28T10:02:19.9783563+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-28T10:02:19.9783564+02:00', [ModifiedDate] = '2020-09-28T10:02:19.9783565+02:00'
WHERE [Id] = CAST(5 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-28T10:02:19.9783566+02:00', [ModifiedDate] = '2020-09-28T10:02:19.9783567+02:00'
WHERE [Id] = CAST(6 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-28T10:02:19.9783568+02:00', [ModifiedDate] = '2020-09-28T10:02:19.9783569+02:00'
WHERE [Id] = CAST(7 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-09-28T10:02:19.9773819+02:00', [ModifiedDate] = '2020-09-28T10:02:19.9773838+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-09-28T10:02:19.9775378+02:00', [ModifiedDate] = '2020-09-28T10:02:19.9775383+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-09-28T10:02:19.9775410+02:00', [ModifiedDate] = '2020-09-28T10:02:19.9775411+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-09-28T10:02:19.9775413+02:00', [ModifiedDate] = '2020-09-28T10:02:19.9775414+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-09-28T10:02:19.9723332+02:00', [ModifiedDate] = '2020-09-28T10:02:19.9723341+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-09-28T10:02:19.9725448+02:00', [ModifiedDate] = '2020-09-28T10:02:19.9725453+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-09-28T10:02:19.9823596+02:00', [ModifiedDate] = '2020-09-28T10:02:19.9823603+02:00'
WHERE [ActionId] = CAST(1 AS bigint) AND [ServiceTypeId] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-09-28T10:02:19.9824431+02:00', [ModifiedDate] = '2020-09-28T10:02:19.9824434+02:00'
WHERE [ActionId] = CAST(2 AS bigint) AND [ServiceTypeId] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-09-28T10:02:19.9824449+02:00', [ModifiedDate] = '2020-09-28T10:02:19.9824450+02:00'
WHERE [ActionId] = CAST(3 AS bigint) AND [ServiceTypeId] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-09-28T10:02:19.9824452+02:00', [ModifiedDate] = '2020-09-28T10:02:19.9824452+02:00'
WHERE [ActionId] = CAST(4 AS bigint) AND [ServiceTypeId] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypes] SET [CreatedDate] = '2020-09-28T10:02:19.9817697+02:00', [ModifiedDate] = '2020-09-28T10:02:19.9817703+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypes] SET [CreatedDate] = '2020-09-28T10:02:19.9820477+02:00', [ModifiedDate] = '2020-09-28T10:02:19.9820482+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypes] SET [CreatedDate] = '2020-09-28T10:02:19.9820888+02:00', [ModifiedDate] = '2020-09-28T10:02:19.9820892+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Status] SET [CreatedDate] = '2020-09-28T10:02:19.9808431+02:00', [ModifiedDate] = '2020-09-28T10:02:19.9808438+02:00'
WHERE [Id] = CAST(0 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Status] SET [CreatedDate] = '2020-09-28T10:02:19.9811750+02:00', [ModifiedDate] = '2020-09-28T10:02:19.9811756+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Status] SET [CreatedDate] = '2020-09-28T10:02:19.9812238+02:00', [ModifiedDate] = '2020-09-28T10:02:19.9812241+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-09-28T10:02:19.9777999+02:00', [ModifiedDate] = '2020-09-28T10:02:19.9778005+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-09-28T10:02:19.9779229+02:00', [ModifiedDate] = '2020-09-28T10:02:19.9779234+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Users] SET [CreatedDate] = '2020-09-28T10:02:19.9728038+02:00', [ModifiedDate] = '2020-09-28T10:02:19.9728044+02:00', [Password] = N'AP2vz8fnY5DjHn+V5XSF7YIZ5GaYcYsi5LdXL0Ys1q0wH9vbjTyDspY59pNjoJz1tw=='
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20200928060220_DropWrongTablesForTransaction', N'3.1.5');

GO

CREATE TABLE [Transactions] (
    [Id] bigint NOT NULL,
    [EmployeeCode] nvarchar(max) NULL,
    [TransactionCode] nvarchar(max) NULL,
    [Year] bigint NULL,
    [TransactionPeriod] nvarchar(max) NULL,
    [TransactionAmount] decimal(18,2) NULL,
    [LoanCode] nvarchar(max) NULL,
    [WfStatus] nvarchar(max) NULL,
    [TransDescription] nvarchar(max) NULL,
    CONSTRAINT [PK_Transactions] PRIMARY KEY ([Id])
);

GO

CREATE TABLE [TransactionDetails] (
    [Id] bigint NOT NULL IDENTITY,
    [EmployeeCode] nvarchar(max) NULL,
    [Year] bigint NOT NULL,
    [DueAmount] decimal(18,2) NULL,
    [PayStatus] nvarchar(max) NULL,
    [LoanSer] nvarchar(max) NULL,
    [TransactionId] bigint NULL,
    [InstallmentMonth] bigint NULL,
    CONSTRAINT [PK_TransactionDetails] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_TransactionDetails_Transactions_TransactionId] FOREIGN KEY ([TransactionId]) REFERENCES [Transactions] ([Id]) ON DELETE NO ACTION
);

GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-28T10:02:59.8941328+02:00', [ModifiedDate] = '2020-09-28T10:02:59.8941336+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-28T10:02:59.8949202+02:00', [ModifiedDate] = '2020-09-28T10:02:59.8949208+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-28T10:02:59.8949704+02:00', [ModifiedDate] = '2020-09-28T10:02:59.8949707+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-28T10:02:59.8950026+02:00', [ModifiedDate] = '2020-09-28T10:02:59.8950028+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-28T10:02:59.8950420+02:00', [ModifiedDate] = '2020-09-28T10:02:59.8950422+02:00'
WHERE [Id] = CAST(5 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Companies] SET [CreatedDate] = '2020-09-28T10:02:59.8846924+02:00', [ModifiedDate] = '2020-09-28T10:02:59.8854238+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-28T10:02:59.8932465+02:00', [ModifiedDate] = '2020-09-28T10:02:59.8932472+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-28T10:02:59.8933674+02:00', [ModifiedDate] = '2020-09-28T10:02:59.8933679+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-28T10:02:59.8933696+02:00', [ModifiedDate] = '2020-09-28T10:02:59.8933697+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-28T10:02:59.8933699+02:00', [ModifiedDate] = '2020-09-28T10:02:59.8933700+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-28T10:02:59.8933701+02:00', [ModifiedDate] = '2020-09-28T10:02:59.8933702+02:00'
WHERE [Id] = CAST(5 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-28T10:02:59.8933703+02:00', [ModifiedDate] = '2020-09-28T10:02:59.8933704+02:00'
WHERE [Id] = CAST(6 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-28T10:02:59.8933705+02:00', [ModifiedDate] = '2020-09-28T10:02:59.8933706+02:00'
WHERE [Id] = CAST(7 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-09-28T10:02:59.8923806+02:00', [ModifiedDate] = '2020-09-28T10:02:59.8923824+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-09-28T10:02:59.8925354+02:00', [ModifiedDate] = '2020-09-28T10:02:59.8925358+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-09-28T10:02:59.8925395+02:00', [ModifiedDate] = '2020-09-28T10:02:59.8925396+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-09-28T10:02:59.8925398+02:00', [ModifiedDate] = '2020-09-28T10:02:59.8925398+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-09-28T10:02:59.8869574+02:00', [ModifiedDate] = '2020-09-28T10:02:59.8869583+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-09-28T10:02:59.8871655+02:00', [ModifiedDate] = '2020-09-28T10:02:59.8871660+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-09-28T10:02:59.8970872+02:00', [ModifiedDate] = '2020-09-28T10:02:59.8970878+02:00'
WHERE [ActionId] = CAST(1 AS bigint) AND [ServiceTypeId] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-09-28T10:02:59.8971697+02:00', [ModifiedDate] = '2020-09-28T10:02:59.8971701+02:00'
WHERE [ActionId] = CAST(2 AS bigint) AND [ServiceTypeId] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-09-28T10:02:59.8971715+02:00', [ModifiedDate] = '2020-09-28T10:02:59.8971716+02:00'
WHERE [ActionId] = CAST(3 AS bigint) AND [ServiceTypeId] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-09-28T10:02:59.8971718+02:00', [ModifiedDate] = '2020-09-28T10:02:59.8971719+02:00'
WHERE [ActionId] = CAST(4 AS bigint) AND [ServiceTypeId] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypes] SET [CreatedDate] = '2020-09-28T10:02:59.8965340+02:00', [ModifiedDate] = '2020-09-28T10:02:59.8965347+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypes] SET [CreatedDate] = '2020-09-28T10:02:59.8968020+02:00', [ModifiedDate] = '2020-09-28T10:02:59.8968026+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypes] SET [CreatedDate] = '2020-09-28T10:02:59.8968406+02:00', [ModifiedDate] = '2020-09-28T10:02:59.8968409+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Status] SET [CreatedDate] = '2020-09-28T10:02:59.8956166+02:00', [ModifiedDate] = '2020-09-28T10:02:59.8956173+02:00'
WHERE [Id] = CAST(0 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Status] SET [CreatedDate] = '2020-09-28T10:02:59.8959441+02:00', [ModifiedDate] = '2020-09-28T10:02:59.8959446+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Status] SET [CreatedDate] = '2020-09-28T10:02:59.8959849+02:00', [ModifiedDate] = '2020-09-28T10:02:59.8959851+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-09-28T10:02:59.8927920+02:00', [ModifiedDate] = '2020-09-28T10:02:59.8927926+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-09-28T10:02:59.8929080+02:00', [ModifiedDate] = '2020-09-28T10:02:59.8929084+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Users] SET [CreatedDate] = '2020-09-28T10:02:59.8874233+02:00', [ModifiedDate] = '2020-09-28T10:02:59.8874239+02:00', [Password] = N'AF10xnEs3z0/yF3q2Ekk6gfx5hk5Oc6vlf6QFtTEs5xtLx5IBPTN3Qw0/bYy7Dcujg=='
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

CREATE UNIQUE INDEX [IX_TransactionDetails_TransactionId] ON [TransactionDetails] ([TransactionId]) WHERE [TransactionId] IS NOT NULL;

GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20200928060300_AddCoreectTablesForTransaction', N'3.1.5');

GO

DROP INDEX [IX_TransactionDetails_TransactionId] ON [TransactionDetails];

GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-28T10:07:58.4231737+02:00', [ModifiedDate] = '2020-09-28T10:07:58.4231745+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-28T10:07:58.4242071+02:00', [ModifiedDate] = '2020-09-28T10:07:58.4242078+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-28T10:07:58.4242586+02:00', [ModifiedDate] = '2020-09-28T10:07:58.4242588+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-28T10:07:58.4242992+02:00', [ModifiedDate] = '2020-09-28T10:07:58.4242995+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-09-28T10:07:58.4243329+02:00', [ModifiedDate] = '2020-09-28T10:07:58.4243331+02:00'
WHERE [Id] = CAST(5 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Companies] SET [CreatedDate] = '2020-09-28T10:07:58.4133610+02:00', [ModifiedDate] = '2020-09-28T10:07:58.4144757+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-28T10:07:58.4222745+02:00', [ModifiedDate] = '2020-09-28T10:07:58.4222751+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-28T10:07:58.4223890+02:00', [ModifiedDate] = '2020-09-28T10:07:58.4223894+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-28T10:07:58.4223914+02:00', [ModifiedDate] = '2020-09-28T10:07:58.4223915+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-28T10:07:58.4223916+02:00', [ModifiedDate] = '2020-09-28T10:07:58.4223917+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-28T10:07:58.4223918+02:00', [ModifiedDate] = '2020-09-28T10:07:58.4223919+02:00'
WHERE [Id] = CAST(5 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-28T10:07:58.4223920+02:00', [ModifiedDate] = '2020-09-28T10:07:58.4223921+02:00'
WHERE [Id] = CAST(6 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-09-28T10:07:58.4223922+02:00', [ModifiedDate] = '2020-09-28T10:07:58.4223923+02:00'
WHERE [Id] = CAST(7 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-09-28T10:07:58.4214519+02:00', [ModifiedDate] = '2020-09-28T10:07:58.4214541+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-09-28T10:07:58.4216027+02:00', [ModifiedDate] = '2020-09-28T10:07:58.4216031+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-09-28T10:07:58.4216063+02:00', [ModifiedDate] = '2020-09-28T10:07:58.4216064+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-09-28T10:07:58.4216066+02:00', [ModifiedDate] = '2020-09-28T10:07:58.4216067+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-09-28T10:07:58.4162962+02:00', [ModifiedDate] = '2020-09-28T10:07:58.4162993+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-09-28T10:07:58.4165158+02:00', [ModifiedDate] = '2020-09-28T10:07:58.4165164+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-09-28T10:07:58.4263417+02:00', [ModifiedDate] = '2020-09-28T10:07:58.4263423+02:00'
WHERE [ActionId] = CAST(1 AS bigint) AND [ServiceTypeId] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-09-28T10:07:58.4264214+02:00', [ModifiedDate] = '2020-09-28T10:07:58.4264217+02:00'
WHERE [ActionId] = CAST(2 AS bigint) AND [ServiceTypeId] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-09-28T10:07:58.4264231+02:00', [ModifiedDate] = '2020-09-28T10:07:58.4264232+02:00'
WHERE [ActionId] = CAST(3 AS bigint) AND [ServiceTypeId] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-09-28T10:07:58.4264234+02:00', [ModifiedDate] = '2020-09-28T10:07:58.4264234+02:00'
WHERE [ActionId] = CAST(4 AS bigint) AND [ServiceTypeId] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypes] SET [CreatedDate] = '2020-09-28T10:07:58.4257889+02:00', [ModifiedDate] = '2020-09-28T10:07:58.4257896+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypes] SET [CreatedDate] = '2020-09-28T10:07:58.4260557+02:00', [ModifiedDate] = '2020-09-28T10:07:58.4260563+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypes] SET [CreatedDate] = '2020-09-28T10:07:58.4260946+02:00', [ModifiedDate] = '2020-09-28T10:07:58.4260948+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Status] SET [CreatedDate] = '2020-09-28T10:07:58.4248948+02:00', [ModifiedDate] = '2020-09-28T10:07:58.4248955+02:00'
WHERE [Id] = CAST(0 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Status] SET [CreatedDate] = '2020-09-28T10:07:58.4252110+02:00', [ModifiedDate] = '2020-09-28T10:07:58.4252116+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Status] SET [CreatedDate] = '2020-09-28T10:07:58.4252553+02:00', [ModifiedDate] = '2020-09-28T10:07:58.4252555+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-09-28T10:07:58.4218567+02:00', [ModifiedDate] = '2020-09-28T10:07:58.4218574+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-09-28T10:07:58.4219708+02:00', [ModifiedDate] = '2020-09-28T10:07:58.4219712+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Users] SET [CreatedDate] = '2020-09-28T10:07:58.4168197+02:00', [ModifiedDate] = '2020-09-28T10:07:58.4168205+02:00', [Password] = N'ANnjHpV2nzceKekNPiz3W7EvChmd+l/LMJehDYylSxLe4BwWxK+fsbnLMreoX9+/Cg=='
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

CREATE INDEX [IX_TransactionDetails_TransactionId] ON [TransactionDetails] ([TransactionId]);

GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20200928060759_MakeRelationBetweenTransactionAndDetailOneToMany', N'3.1.5');

GO

UPDATE [Actions] SET [CreatedDate] = '2020-10-01T01:19:17.7034425+02:00', [ModifiedDate] = '2020-10-01T01:19:17.7034434+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-10-01T01:19:17.7043646+02:00', [ModifiedDate] = '2020-10-01T01:19:17.7043653+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-10-01T01:19:17.7044263+02:00', [ModifiedDate] = '2020-10-01T01:19:17.7044267+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-10-01T01:19:17.7044676+02:00', [ModifiedDate] = '2020-10-01T01:19:17.7044679+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-10-01T01:19:17.7045193+02:00', [ModifiedDate] = '2020-10-01T01:19:17.7045196+02:00'
WHERE [Id] = CAST(5 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Companies] SET [CreatedDate] = '2020-10-01T01:19:17.6872754+02:00', [ModifiedDate] = '2020-10-01T01:19:17.6879673+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-10-01T01:19:17.7022511+02:00', [ModifiedDate] = '2020-10-01T01:19:17.7022520+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-10-01T01:19:17.7024339+02:00', [ModifiedDate] = '2020-10-01T01:19:17.7024345+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-10-01T01:19:17.7024377+02:00', [ModifiedDate] = '2020-10-01T01:19:17.7024378+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-10-01T01:19:17.7024380+02:00', [ModifiedDate] = '2020-10-01T01:19:17.7024381+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-10-01T01:19:17.7024383+02:00', [ModifiedDate] = '2020-10-01T01:19:17.7024384+02:00'
WHERE [Id] = CAST(5 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-10-01T01:19:17.7024385+02:00', [ModifiedDate] = '2020-10-01T01:19:17.7024387+02:00'
WHERE [Id] = CAST(6 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-10-01T01:19:17.7024388+02:00', [ModifiedDate] = '2020-10-01T01:19:17.7024389+02:00'
WHERE [Id] = CAST(7 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-10-01T01:19:17.7011149+02:00', [ModifiedDate] = '2020-10-01T01:19:17.7011173+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-10-01T01:19:17.7012870+02:00', [ModifiedDate] = '2020-10-01T01:19:17.7012874+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-10-01T01:19:17.7012910+02:00', [ModifiedDate] = '2020-10-01T01:19:17.7012911+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-10-01T01:19:17.7012913+02:00', [ModifiedDate] = '2020-10-01T01:19:17.7012914+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-10-01T01:19:17.6902643+02:00', [ModifiedDate] = '2020-10-01T01:19:17.6902658+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-10-01T01:19:17.6905069+02:00', [ModifiedDate] = '2020-10-01T01:19:17.6905074+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-10-01T01:19:17.7069603+02:00', [ModifiedDate] = '2020-10-01T01:19:17.7069609+02:00'
WHERE [ActionId] = CAST(1 AS bigint) AND [ServiceTypeId] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-10-01T01:19:17.7070533+02:00', [ModifiedDate] = '2020-10-01T01:19:17.7070536+02:00'
WHERE [ActionId] = CAST(2 AS bigint) AND [ServiceTypeId] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-10-01T01:19:17.7070553+02:00', [ModifiedDate] = '2020-10-01T01:19:17.7070554+02:00'
WHERE [ActionId] = CAST(3 AS bigint) AND [ServiceTypeId] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-10-01T01:19:17.7070563+02:00', [ModifiedDate] = '2020-10-01T01:19:17.7070564+02:00'
WHERE [ActionId] = CAST(4 AS bigint) AND [ServiceTypeId] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'ActionId', N'ServiceTypeId', N'CreatedById', N'CreatedDate', N'IsActive', N'IsDeleted', N'ModifiedById', N'ModifiedDate') AND [object_id] = OBJECT_ID(N'[ServiceTypeActions]'))
    SET IDENTITY_INSERT [ServiceTypeActions] ON;
INSERT INTO [ServiceTypeActions] ([ActionId], [ServiceTypeId], [CreatedById], [CreatedDate], [IsActive], [IsDeleted], [ModifiedById], [ModifiedDate])
VALUES (CAST(2 AS bigint), CAST(2 AS bigint), NULL, '2020-10-01T01:19:17.7070558+02:00', CAST(1 AS bit), CAST(0 AS bit), NULL, '2020-10-01T01:19:17.7070560+02:00'),
(CAST(1 AS bigint), CAST(2 AS bigint), NULL, '2020-10-01T01:19:17.7070556+02:00', CAST(1 AS bit), CAST(0 AS bit), NULL, '2020-10-01T01:19:17.7070557+02:00');
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'ActionId', N'ServiceTypeId', N'CreatedById', N'CreatedDate', N'IsActive', N'IsDeleted', N'ModifiedById', N'ModifiedDate') AND [object_id] = OBJECT_ID(N'[ServiceTypeActions]'))
    SET IDENTITY_INSERT [ServiceTypeActions] OFF;

GO

UPDATE [ServiceTypes] SET [CreatedDate] = '2020-10-01T01:19:17.7062478+02:00', [ModifiedDate] = '2020-10-01T01:19:17.7062486+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypes] SET [CreatedDate] = '2020-10-01T01:19:17.7065493+02:00', [ModifiedDate] = '2020-10-01T01:19:17.7065499+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypes] SET [CreatedDate] = '2020-10-01T01:19:17.7065953+02:00', [ModifiedDate] = '2020-10-01T01:19:17.7065956+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Status] SET [CreatedDate] = '2020-10-01T01:19:17.7051640+02:00', [ModifiedDate] = '2020-10-01T01:19:17.7051650+02:00'
WHERE [Id] = CAST(0 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Status] SET [CreatedDate] = '2020-10-01T01:19:17.7055303+02:00', [ModifiedDate] = '2020-10-01T01:19:17.7055309+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Status] SET [CreatedDate] = '2020-10-01T01:19:17.7055773+02:00', [ModifiedDate] = '2020-10-01T01:19:17.7055776+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-10-01T01:19:17.7015893+02:00', [ModifiedDate] = '2020-10-01T01:19:17.7015901+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-10-01T01:19:17.7017190+02:00', [ModifiedDate] = '2020-10-01T01:19:17.7017195+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Users] SET [CreatedDate] = '2020-10-01T01:19:17.6908179+02:00', [ModifiedDate] = '2020-10-01T01:19:17.6908186+02:00', [Password] = N'ANProVt0pNlcbT2vpQnfFYnvWlv3TbPWbnK0Eplx7RzZRhlRqps1y7HsgOFl/CYnIw=='
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20200930211918_SeedServiceTypeActionTable', N'3.1.5');

GO

CREATE TABLE [ServiceVisibilities] (
    [Id] bigint NOT NULL IDENTITY,
    [CreatedById] bigint NULL,
    [CreatedDate] datetime2 NULL,
    [ModifiedDate] datetime2 NULL,
    [ModifiedById] bigint NULL,
    [IsDeleted] bit NOT NULL,
    [IsActive] bit NOT NULL,
    [Code] nvarchar(max) NULL,
    [ServiceId] bigint NOT NULL,
    [VisiablityType] int NOT NULL,
    CONSTRAINT [PK_ServiceVisibilities] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_ServiceVisibilities_Services_ServiceId] FOREIGN KEY ([ServiceId]) REFERENCES [Services] ([Id]) ON DELETE CASCADE
);

GO

UPDATE [Actions] SET [CreatedDate] = '2020-10-15T17:23:21.7763181+02:00', [ModifiedDate] = '2020-10-15T17:23:21.7763192+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-10-15T17:23:21.7775254+02:00', [ModifiedDate] = '2020-10-15T17:23:21.7775262+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-10-15T17:23:21.7776665+02:00', [ModifiedDate] = '2020-10-15T17:23:21.7776673+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-10-15T17:23:21.7777868+02:00', [ModifiedDate] = '2020-10-15T17:23:21.7777877+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-10-15T17:23:21.7778876+02:00', [ModifiedDate] = '2020-10-15T17:23:21.7778883+02:00'
WHERE [Id] = CAST(5 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Companies] SET [CreatedDate] = '2020-10-15T17:23:21.7603475+02:00', [ModifiedDate] = '2020-10-15T17:23:21.7619330+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-10-15T17:23:21.7751837+02:00', [ModifiedDate] = '2020-10-15T17:23:21.7751847+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-10-15T17:23:21.7753179+02:00', [ModifiedDate] = '2020-10-15T17:23:21.7753185+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-10-15T17:23:21.7753207+02:00', [ModifiedDate] = '2020-10-15T17:23:21.7753208+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-10-15T17:23:21.7753209+02:00', [ModifiedDate] = '2020-10-15T17:23:21.7753210+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-10-15T17:23:21.7753212+02:00', [ModifiedDate] = '2020-10-15T17:23:21.7753213+02:00'
WHERE [Id] = CAST(5 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-10-15T17:23:21.7753214+02:00', [ModifiedDate] = '2020-10-15T17:23:21.7753215+02:00'
WHERE [Id] = CAST(6 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-10-15T17:23:21.7753217+02:00', [ModifiedDate] = '2020-10-15T17:23:21.7753218+02:00'
WHERE [Id] = CAST(7 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-10-15T17:23:21.7741563+02:00', [ModifiedDate] = '2020-10-15T17:23:21.7741593+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-10-15T17:23:21.7743282+02:00', [ModifiedDate] = '2020-10-15T17:23:21.7743289+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-10-15T17:23:21.7743334+02:00', [ModifiedDate] = '2020-10-15T17:23:21.7743335+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-10-15T17:23:21.7743337+02:00', [ModifiedDate] = '2020-10-15T17:23:21.7743338+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-10-15T17:23:21.7644315+02:00', [ModifiedDate] = '2020-10-15T17:23:21.7644347+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-10-15T17:23:21.7646633+02:00', [ModifiedDate] = '2020-10-15T17:23:21.7646648+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-10-15T17:23:21.7814303+02:00', [ModifiedDate] = '2020-10-15T17:23:21.7814312+02:00'
WHERE [ActionId] = CAST(1 AS bigint) AND [ServiceTypeId] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-10-15T17:23:21.7815221+02:00', [ModifiedDate] = '2020-10-15T17:23:21.7815222+02:00'
WHERE [ActionId] = CAST(1 AS bigint) AND [ServiceTypeId] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-10-15T17:23:21.7815195+02:00', [ModifiedDate] = '2020-10-15T17:23:21.7815201+02:00'
WHERE [ActionId] = CAST(2 AS bigint) AND [ServiceTypeId] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-10-15T17:23:21.7815223+02:00', [ModifiedDate] = '2020-10-15T17:23:21.7815225+02:00'
WHERE [ActionId] = CAST(2 AS bigint) AND [ServiceTypeId] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-10-15T17:23:21.7815218+02:00', [ModifiedDate] = '2020-10-15T17:23:21.7815219+02:00'
WHERE [ActionId] = CAST(3 AS bigint) AND [ServiceTypeId] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-10-15T17:23:21.7815230+02:00', [ModifiedDate] = '2020-10-15T17:23:21.7815230+02:00'
WHERE [ActionId] = CAST(4 AS bigint) AND [ServiceTypeId] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypes] SET [CreatedDate] = '2020-10-15T17:23:21.7806986+02:00', [ModifiedDate] = '2020-10-15T17:23:21.7806998+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypes] SET [CreatedDate] = '2020-10-15T17:23:21.7810195+02:00', [ModifiedDate] = '2020-10-15T17:23:21.7810204+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypes] SET [CreatedDate] = '2020-10-15T17:23:21.7810699+02:00', [ModifiedDate] = '2020-10-15T17:23:21.7810703+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Status] SET [CreatedDate] = '2020-10-15T17:23:21.7792969+02:00', [ModifiedDate] = '2020-10-15T17:23:21.7792985+02:00'
WHERE [Id] = CAST(0 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Status] SET [CreatedDate] = '2020-10-15T17:23:21.7798132+02:00', [ModifiedDate] = '2020-10-15T17:23:21.7798144+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Status] SET [CreatedDate] = '2020-10-15T17:23:21.7798746+02:00', [ModifiedDate] = '2020-10-15T17:23:21.7798750+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-10-15T17:23:21.7746681+02:00', [ModifiedDate] = '2020-10-15T17:23:21.7746693+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-10-15T17:23:21.7748008+02:00', [ModifiedDate] = '2020-10-15T17:23:21.7748015+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Users] SET [CreatedDate] = '2020-10-15T17:23:21.7650406+02:00', [ModifiedDate] = '2020-10-15T17:23:21.7650423+02:00', [Password] = N'ANaCdSKnVCFNOKUir4i1jJApO0nvX0A2mnfbUye3W2pPGAUg8qa/vfCyf7foN57I9g=='
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

CREATE INDEX [IX_ServiceVisibilities_ServiceId] ON [ServiceVisibilities] ([ServiceId]);

GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20201015152322_AddVisiablityTable', N'3.1.5');

GO

create proc [dbo].[GetAttendanceTime](@employeeId as nvarchar(50))
                as

                DECLARE @sql NVARCHAR(MAX) , @SQLMain NVARCHAR(MAX)
            declare @viewName nvarchar(100)
            set @viewName = '[dbo].[Attendance]'

            set @sql = '
            declare @dateIn as date
            set @dateIn = (select top(1) convert(date,[TransactionTime]) from '+@viewName+' where FunctionKey = 1 and substring([UserID], patindex('' %[^0] % '',[UserID]), 10) = '+@employeeId+' order by TransactionTime desc);

            declare @dateOut as date
            set @dateOut = (select top(1) convert(date,[TransactionTime]) from '+@viewName+' where FunctionKey = 4 and substring([UserID], patindex('' %[^0] % '',[UserID]), 10) = '+@employeeId+' order by TransactionTime desc);

            select top(1) [TransactionTime] as CheckIn,
            (
                select top(1)[TransactionTime] from '+@viewName+'
            where[FunctionKey] = 4 and CONVERT(date, [TransactionTime]) = @dateOut and substring([UserID], patindex('' %[^0] % '',[UserID]), 10) = '+@employeeId+'
            order by[TransactionTime] desc
                ) as CheckOut

                from '+@viewName+'
            where[FunctionKey] = 1 and CONVERT(date, [TransactionTime]) = @dateIn and substring([UserID], patindex('' %[^0] % '',[UserID]), 10) = '+@employeeId+'
            order by[TransactionTime]'
            SELECT @SQLMain = N'EXEC dbo.sp_executesql @SQL'
            EXEC sp_executesql @SQLMain, N'@SQL nvarchar(max)', @SQL = @SQL; 

GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20201020070125_StoredProcedure', N'3.1.5');

GO

ALTER proc [dbo].[GetAttendanceTime](@employeeId as nvarchar(50))
                as

                DECLARE @sql NVARCHAR(MAX) , @SQLMain NVARCHAR(MAX)
            declare @viewName nvarchar(100)
            set @viewName = '[dbo].[Attendance]'

            set @sql = '
            declare @dateIn as date
            set @dateIn = (select top(1) convert(date,[TransactionTime]) from '+@viewName+' where FunctionKey = 1 and substring([UserID], patindex('' %[^0] % '',[UserID]), 10) = '+@employeeId+' order by TransactionTime desc);

            declare @dateOut as date
            set @dateOut = (select top(1) convert(date,[TransactionTime]) from '+@viewName+' where FunctionKey = 4 and substring([UserID], patindex('' %[^0] % '',[UserID]), 10) = '+@employeeId+' order by TransactionTime desc);

            select top(1) [TransactionTime] as CheckIn,
            (
                select top(1)[TransactionTime] from '+@viewName+'
            where[FunctionKey] = 4 and CONVERT(date, [TransactionTime]) = @dateOut and substring([UserID], patindex('' %[^0] % '',[UserID]), 10) = '+@employeeId+'
            order by[TransactionTime] desc
                ) as CheckOut

                from '+@viewName+'
            where[FunctionKey] = 1 and CONVERT(date, [TransactionTime]) = @dateIn and substring([UserID], patindex('' %[^0] % '',[UserID]), 10) = '+@employeeId+'
            order by[TransactionTime]'
            SELECT @SQLMain = N'EXEC dbo.sp_executesql @SQL'
            EXEC sp_executesql @SQLMain, N'@SQL nvarchar(max)', @SQL = @SQL; 

GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20201024084655_ModifyStrodProcedure', N'3.1.5');

GO

ALTER proc [dbo].[GetAttendanceTime](@employeeId as nvarchar(50))
                as

                DECLARE @sql NVARCHAR(MAX) , @SQLMain NVARCHAR(MAX)
            declare @viewName nvarchar(100)
            set @viewName = '[dbo].[Attendance]'

            set @sql = '
            declare @dateIn as date
            set @dateIn = (select top(1) convert(date,[TransactionTime]) from '+@viewName+' where FunctionKey = 1 and substring([UserID], patindex('' %[^0] % '',[UserID]), 10) = '+@employeeId+' order by TransactionTime desc);

            declare @dateOut as date
            set @dateOut = (select top(1) convert(date,[TransactionTime]) from '+@viewName+' where FunctionKey = 4 and substring([UserID], patindex('' %[^0] % '',[UserID]), 10) = '+@employeeId+' order by TransactionTime desc);

            select top(1) [TransactionTime] as CheckIn,
            (
                select top(1)[TransactionTime] from '+@viewName+'
            where[FunctionKey] = 4 and CONVERT(date, [TransactionTime]) = @dateOut and substring([UserID], patindex('' %[^0] % '',[UserID]), 10) = '+@employeeId+'
            order by[TransactionTime] desc
                ) as CheckOut

                from '+@viewName+'
            where[FunctionKey] = 1 and CONVERT(date, [TransactionTime]) = @dateIn and substring([UserID], patindex('' %[^0] % '',[UserID]), 10) = '+@employeeId+'
            order by[TransactionTime]'
            SELECT @SQLMain = N'EXEC dbo.sp_executesql @SQL'
            EXEC sp_executesql @SQLMain, N'@SQL nvarchar(max)', @SQL = @SQL; 

GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20201024093103_AlterStrodProcedure', N'3.1.5');

GO

ALTER TABLE [Banners] ADD [Language] nvarchar(max) NULL;

GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20201027053806_AddBanarLanguage', N'3.1.5');

GO

ALTER TABLE [TemplateOrders] ADD [SendOtp] bit NOT NULL DEFAULT CAST(0 AS bit);

GO

ALTER TABLE [Tasks] ADD [SendOtp] bit NOT NULL DEFAULT CAST(0 AS bit);

GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20201120180111_AddSendOtpColumn', N'3.1.5');

GO

CREATE TABLE [Discounts] (
    [Id] bigint NOT NULL IDENTITY,
    [CreatedById] bigint NULL,
    [CreatedDate] datetime2 NULL,
    [ModifiedDate] datetime2 NULL,
    [ModifiedById] bigint NULL,
    [IsDeleted] bit NOT NULL,
    [IsActive] bit NOT NULL,
    [Site] int NOT NULL,
    [Price] decimal(18,2) NOT NULL,
    [Regular] decimal(18,2) NOT NULL,
    [DescriptionEn] nvarchar(max) NULL,
    [DescriptionAr] nvarchar(max) NULL,
    [StockUnit] nvarchar(max) NULL,
    [Barcode] nvarchar(max) NULL,
    [MerchPath] nvarchar(max) NULL,
    [MerchExtIdCls] bigint NOT NULL,
    [Status] nvarchar(max) NULL,
    [Soclmag] nvarchar(max) NULL,
    CONSTRAINT [PK_Discounts] PRIMARY KEY ([Id])
);

GO

UPDATE [Actions] SET [CreatedDate] = '2020-11-21T14:19:07.1882434+02:00', [ModifiedDate] = '2020-11-21T14:19:07.1882447+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-11-21T14:19:07.1891103+02:00', [ModifiedDate] = '2020-11-21T14:19:07.1891111+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-11-21T14:19:07.1891748+02:00', [ModifiedDate] = '2020-11-21T14:19:07.1891751+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-11-21T14:19:07.1892178+02:00', [ModifiedDate] = '2020-11-21T14:19:07.1892180+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-11-21T14:19:07.1892587+02:00', [ModifiedDate] = '2020-11-21T14:19:07.1892589+02:00'
WHERE [Id] = CAST(5 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Companies] SET [CreatedDate] = '2020-11-21T14:19:07.1755664+02:00', [ModifiedDate] = '2020-11-21T14:19:07.1764591+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-11-21T14:19:07.1871658+02:00', [ModifiedDate] = '2020-11-21T14:19:07.1871665+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-11-21T14:19:07.1872888+02:00', [ModifiedDate] = '2020-11-21T14:19:07.1872892+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-11-21T14:19:07.1872917+02:00', [ModifiedDate] = '2020-11-21T14:19:07.1872918+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-11-21T14:19:07.1872920+02:00', [ModifiedDate] = '2020-11-21T14:19:07.1872921+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-11-21T14:19:07.1872922+02:00', [ModifiedDate] = '2020-11-21T14:19:07.1872924+02:00'
WHERE [Id] = CAST(5 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-11-21T14:19:07.1872925+02:00', [ModifiedDate] = '2020-11-21T14:19:07.1872926+02:00'
WHERE [Id] = CAST(6 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-11-21T14:19:07.1872927+02:00', [ModifiedDate] = '2020-11-21T14:19:07.1872928+02:00'
WHERE [Id] = CAST(7 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-11-21T14:19:07.1861523+02:00', [ModifiedDate] = '2020-11-21T14:19:07.1861554+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-11-21T14:19:07.1863333+02:00', [ModifiedDate] = '2020-11-21T14:19:07.1863339+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-11-21T14:19:07.1863388+02:00', [ModifiedDate] = '2020-11-21T14:19:07.1863389+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-11-21T14:19:07.1863391+02:00', [ModifiedDate] = '2020-11-21T14:19:07.1863392+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-11-21T14:19:07.1785411+02:00', [ModifiedDate] = '2020-11-21T14:19:07.1785435+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-11-21T14:19:07.1787715+02:00', [ModifiedDate] = '2020-11-21T14:19:07.1787721+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-11-21T14:19:07.1917001+02:00', [ModifiedDate] = '2020-11-21T14:19:07.1917009+02:00'
WHERE [ActionId] = CAST(1 AS bigint) AND [ServiceTypeId] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-11-21T14:19:07.1917872+02:00', [ModifiedDate] = '2020-11-21T14:19:07.1917873+02:00'
WHERE [ActionId] = CAST(1 AS bigint) AND [ServiceTypeId] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-11-21T14:19:07.1917848+02:00', [ModifiedDate] = '2020-11-21T14:19:07.1917853+02:00'
WHERE [ActionId] = CAST(2 AS bigint) AND [ServiceTypeId] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-11-21T14:19:07.1917874+02:00', [ModifiedDate] = '2020-11-21T14:19:07.1917875+02:00'
WHERE [ActionId] = CAST(2 AS bigint) AND [ServiceTypeId] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-11-21T14:19:07.1917869+02:00', [ModifiedDate] = '2020-11-21T14:19:07.1917870+02:00'
WHERE [ActionId] = CAST(3 AS bigint) AND [ServiceTypeId] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-11-21T14:19:07.1917880+02:00', [ModifiedDate] = '2020-11-21T14:19:07.1917881+02:00'
WHERE [ActionId] = CAST(4 AS bigint) AND [ServiceTypeId] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypes] SET [CreatedDate] = '2020-11-21T14:19:07.1910115+02:00', [ModifiedDate] = '2020-11-21T14:19:07.1910123+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypes] SET [CreatedDate] = '2020-11-21T14:19:07.1913124+02:00', [ModifiedDate] = '2020-11-21T14:19:07.1913131+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypes] SET [CreatedDate] = '2020-11-21T14:19:07.1913633+02:00', [ModifiedDate] = '2020-11-21T14:19:07.1913636+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Status] SET [CreatedDate] = '2020-11-21T14:19:07.1899136+02:00', [ModifiedDate] = '2020-11-21T14:19:07.1899145+02:00'
WHERE [Id] = CAST(0 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Status] SET [CreatedDate] = '2020-11-21T14:19:07.1902637+02:00', [ModifiedDate] = '2020-11-21T14:19:07.1902644+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Status] SET [CreatedDate] = '2020-11-21T14:19:07.1903171+02:00', [ModifiedDate] = '2020-11-21T14:19:07.1903174+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-11-21T14:19:07.1866439+02:00', [ModifiedDate] = '2020-11-21T14:19:07.1866445+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-11-21T14:19:07.1867659+02:00', [ModifiedDate] = '2020-11-21T14:19:07.1867663+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Users] SET [CreatedDate] = '2020-11-21T14:19:07.1790883+02:00', [ModifiedDate] = '2020-11-21T14:19:07.1790891+02:00', [Password] = N'AC2T0i5HtmZAGY6/cl/NWt+ftmaMYydiksLmF29GJVTbApZ+v8L0hncij27767Y8Fw=='
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20201121101908_AddDiscountTable', N'3.1.5');

GO

DROP TABLE [Discounts];

GO

UPDATE [Actions] SET [CreatedDate] = '2020-11-21T15:11:31.1707395+02:00', [ModifiedDate] = '2020-11-21T15:11:31.1707404+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-11-21T15:11:31.1716159+02:00', [ModifiedDate] = '2020-11-21T15:11:31.1716168+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-11-21T15:11:31.1716797+02:00', [ModifiedDate] = '2020-11-21T15:11:31.1716801+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-11-21T15:11:31.1717185+02:00', [ModifiedDate] = '2020-11-21T15:11:31.1717187+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-11-21T15:11:31.1717620+02:00', [ModifiedDate] = '2020-11-21T15:11:31.1717623+02:00'
WHERE [Id] = CAST(5 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Companies] SET [CreatedDate] = '2020-11-21T15:11:31.1604034+02:00', [ModifiedDate] = '2020-11-21T15:11:31.1610850+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-11-21T15:11:31.1696095+02:00', [ModifiedDate] = '2020-11-21T15:11:31.1696104+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-11-21T15:11:31.1697318+02:00', [ModifiedDate] = '2020-11-21T15:11:31.1697324+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-11-21T15:11:31.1697347+02:00', [ModifiedDate] = '2020-11-21T15:11:31.1697348+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-11-21T15:11:31.1697349+02:00', [ModifiedDate] = '2020-11-21T15:11:31.1697351+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-11-21T15:11:31.1697352+02:00', [ModifiedDate] = '2020-11-21T15:11:31.1697353+02:00'
WHERE [Id] = CAST(5 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-11-21T15:11:31.1697354+02:00', [ModifiedDate] = '2020-11-21T15:11:31.1697356+02:00'
WHERE [Id] = CAST(6 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-11-21T15:11:31.1697357+02:00', [ModifiedDate] = '2020-11-21T15:11:31.1697358+02:00'
WHERE [Id] = CAST(7 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-11-21T15:11:31.1685881+02:00', [ModifiedDate] = '2020-11-21T15:11:31.1685909+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-11-21T15:11:31.1687497+02:00', [ModifiedDate] = '2020-11-21T15:11:31.1687501+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-11-21T15:11:31.1687540+02:00', [ModifiedDate] = '2020-11-21T15:11:31.1687541+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-11-21T15:11:31.1687543+02:00', [ModifiedDate] = '2020-11-21T15:11:31.1687544+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-11-21T15:11:31.1628530+02:00', [ModifiedDate] = '2020-11-21T15:11:31.1628545+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-11-21T15:11:31.1630777+02:00', [ModifiedDate] = '2020-11-21T15:11:31.1630783+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-11-21T15:11:31.1742296+02:00', [ModifiedDate] = '2020-11-21T15:11:31.1742305+02:00'
WHERE [ActionId] = CAST(1 AS bigint) AND [ServiceTypeId] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-11-21T15:11:31.1743355+02:00', [ModifiedDate] = '2020-11-21T15:11:31.1743356+02:00'
WHERE [ActionId] = CAST(1 AS bigint) AND [ServiceTypeId] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-11-21T15:11:31.1743329+02:00', [ModifiedDate] = '2020-11-21T15:11:31.1743333+02:00'
WHERE [ActionId] = CAST(2 AS bigint) AND [ServiceTypeId] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-11-21T15:11:31.1743358+02:00', [ModifiedDate] = '2020-11-21T15:11:31.1743359+02:00'
WHERE [ActionId] = CAST(2 AS bigint) AND [ServiceTypeId] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-11-21T15:11:31.1743352+02:00', [ModifiedDate] = '2020-11-21T15:11:31.1743353+02:00'
WHERE [ActionId] = CAST(3 AS bigint) AND [ServiceTypeId] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-11-21T15:11:31.1743363+02:00', [ModifiedDate] = '2020-11-21T15:11:31.1743364+02:00'
WHERE [ActionId] = CAST(4 AS bigint) AND [ServiceTypeId] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypes] SET [CreatedDate] = '2020-11-21T15:11:31.1735705+02:00', [ModifiedDate] = '2020-11-21T15:11:31.1735714+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypes] SET [CreatedDate] = '2020-11-21T15:11:31.1738598+02:00', [ModifiedDate] = '2020-11-21T15:11:31.1738605+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypes] SET [CreatedDate] = '2020-11-21T15:11:31.1739062+02:00', [ModifiedDate] = '2020-11-21T15:11:31.1739065+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Status] SET [CreatedDate] = '2020-11-21T15:11:31.1724922+02:00', [ModifiedDate] = '2020-11-21T15:11:31.1724933+02:00'
WHERE [Id] = CAST(0 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Status] SET [CreatedDate] = '2020-11-21T15:11:31.1728370+02:00', [ModifiedDate] = '2020-11-21T15:11:31.1728378+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Status] SET [CreatedDate] = '2020-11-21T15:11:31.1728859+02:00', [ModifiedDate] = '2020-11-21T15:11:31.1728861+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-11-21T15:11:31.1690642+02:00', [ModifiedDate] = '2020-11-21T15:11:31.1690651+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-11-21T15:11:31.1691883+02:00', [ModifiedDate] = '2020-11-21T15:11:31.1691888+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Users] SET [CreatedDate] = '2020-11-21T15:11:31.1634290+02:00', [ModifiedDate] = '2020-11-21T15:11:31.1634297+02:00', [Password] = N'ABuzYGqQx4cPkhTNmd4NSUmfkAElVKh27LaAq2xsO7KA7Ipiv9UudDNLBqik1sGZpw=='
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20201121111132_DropDiscountTable', N'3.1.5');

GO

CREATE TABLE [Discounts] (
    [Id] bigint NOT NULL,
    [CreatedById] bigint NULL,
    [CreatedDate] datetime2 NULL,
    [ModifiedDate] datetime2 NULL,
    [ModifiedById] bigint NULL,
    [IsDeleted] bit NOT NULL,
    [IsActive] bit NOT NULL,
    [Site] int NOT NULL,
    [Price] decimal(18,2) NOT NULL,
    [Regular] decimal(18,2) NOT NULL,
    [DescriptionEn] nvarchar(max) NULL,
    [DescriptionAr] nvarchar(max) NULL,
    [StockUnit] nvarchar(max) NULL,
    [Barcode] nvarchar(max) NULL,
    [MerchPath] nvarchar(max) NULL,
    [MerchExtIdCls] bigint NOT NULL,
    [Status] nvarchar(max) NULL,
    [Soclmag] nvarchar(max) NULL,
    CONSTRAINT [PK_Discounts] PRIMARY KEY ([Id])
);

GO

UPDATE [Actions] SET [CreatedDate] = '2020-11-21T15:12:52.2974323+02:00', [ModifiedDate] = '2020-11-21T15:12:52.2974340+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-11-21T15:12:52.2985611+02:00', [ModifiedDate] = '2020-11-21T15:12:52.2985632+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-11-21T15:12:52.2986546+02:00', [ModifiedDate] = '2020-11-21T15:12:52.2986549+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-11-21T15:12:52.2986993+02:00', [ModifiedDate] = '2020-11-21T15:12:52.2986995+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-11-21T15:12:52.2987443+02:00', [ModifiedDate] = '2020-11-21T15:12:52.2987445+02:00'
WHERE [Id] = CAST(5 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Companies] SET [CreatedDate] = '2020-11-21T15:12:52.2869131+02:00', [ModifiedDate] = '2020-11-21T15:12:52.2876217+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-11-21T15:12:52.2962854+02:00', [ModifiedDate] = '2020-11-21T15:12:52.2962862+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-11-21T15:12:52.2964147+02:00', [ModifiedDate] = '2020-11-21T15:12:52.2964152+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-11-21T15:12:52.2964174+02:00', [ModifiedDate] = '2020-11-21T15:12:52.2964175+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-11-21T15:12:52.2964177+02:00', [ModifiedDate] = '2020-11-21T15:12:52.2964178+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-11-21T15:12:52.2964179+02:00', [ModifiedDate] = '2020-11-21T15:12:52.2964180+02:00'
WHERE [Id] = CAST(5 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-11-21T15:12:52.2964181+02:00', [ModifiedDate] = '2020-11-21T15:12:52.2964183+02:00'
WHERE [Id] = CAST(6 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-11-21T15:12:52.2964184+02:00', [ModifiedDate] = '2020-11-21T15:12:52.2964185+02:00'
WHERE [Id] = CAST(7 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-11-21T15:12:52.2952891+02:00', [ModifiedDate] = '2020-11-21T15:12:52.2952923+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-11-21T15:12:52.2954511+02:00', [ModifiedDate] = '2020-11-21T15:12:52.2954518+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-11-21T15:12:52.2954556+02:00', [ModifiedDate] = '2020-11-21T15:12:52.2954557+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-11-21T15:12:52.2954559+02:00', [ModifiedDate] = '2020-11-21T15:12:52.2954560+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-11-21T15:12:52.2894671+02:00', [ModifiedDate] = '2020-11-21T15:12:52.2894693+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-11-21T15:12:52.2896868+02:00', [ModifiedDate] = '2020-11-21T15:12:52.2896875+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-11-21T15:12:52.3013899+02:00', [ModifiedDate] = '2020-11-21T15:12:52.3013908+02:00'
WHERE [ActionId] = CAST(1 AS bigint) AND [ServiceTypeId] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-11-21T15:12:52.3014796+02:00', [ModifiedDate] = '2020-11-21T15:12:52.3014797+02:00'
WHERE [ActionId] = CAST(1 AS bigint) AND [ServiceTypeId] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-11-21T15:12:52.3014773+02:00', [ModifiedDate] = '2020-11-21T15:12:52.3014778+02:00'
WHERE [ActionId] = CAST(2 AS bigint) AND [ServiceTypeId] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-11-21T15:12:52.3014799+02:00', [ModifiedDate] = '2020-11-21T15:12:52.3014800+02:00'
WHERE [ActionId] = CAST(2 AS bigint) AND [ServiceTypeId] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-11-21T15:12:52.3014794+02:00', [ModifiedDate] = '2020-11-21T15:12:52.3014795+02:00'
WHERE [ActionId] = CAST(3 AS bigint) AND [ServiceTypeId] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-11-21T15:12:52.3014804+02:00', [ModifiedDate] = '2020-11-21T15:12:52.3014806+02:00'
WHERE [ActionId] = CAST(4 AS bigint) AND [ServiceTypeId] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypes] SET [CreatedDate] = '2020-11-21T15:12:52.3006762+02:00', [ModifiedDate] = '2020-11-21T15:12:52.3006773+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypes] SET [CreatedDate] = '2020-11-21T15:12:52.3009807+02:00', [ModifiedDate] = '2020-11-21T15:12:52.3009814+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypes] SET [CreatedDate] = '2020-11-21T15:12:52.3010320+02:00', [ModifiedDate] = '2020-11-21T15:12:52.3010323+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Status] SET [CreatedDate] = '2020-11-21T15:12:52.2995137+02:00', [ModifiedDate] = '2020-11-21T15:12:52.2995149+02:00'
WHERE [Id] = CAST(0 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Status] SET [CreatedDate] = '2020-11-21T15:12:52.2998919+02:00', [ModifiedDate] = '2020-11-21T15:12:52.2998928+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Status] SET [CreatedDate] = '2020-11-21T15:12:52.2999424+02:00', [ModifiedDate] = '2020-11-21T15:12:52.2999426+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-11-21T15:12:52.2957699+02:00', [ModifiedDate] = '2020-11-21T15:12:52.2957708+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-11-21T15:12:52.2958924+02:00', [ModifiedDate] = '2020-11-21T15:12:52.2958930+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Users] SET [CreatedDate] = '2020-11-21T15:12:52.2900215+02:00', [ModifiedDate] = '2020-11-21T15:12:52.2900222+02:00', [Password] = N'ADbLMofl03CbeplznyQbPPZhfIgBkwF0VESZPRmsE6DuZX9nigISb7jEvtfN3+V4yQ=='
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20201121111253_CreateDiscountTable', N'3.1.5');

GO

CREATE TABLE [Wisdoms] (
    [Id] bigint NOT NULL IDENTITY,
    [CreatedById] bigint NULL,
    [CreatedDate] datetime2 NULL,
    [ModifiedDate] datetime2 NULL,
    [ModifiedById] bigint NULL,
    [IsDeleted] bit NOT NULL,
    [IsActive] bit NOT NULL,
    [TitleEn] nvarchar(max) NULL,
    [TitleAr] nvarchar(max) NULL,
    [DescriptionEn] nvarchar(max) NULL,
    [DescriptionAr] nvarchar(max) NULL,
    [EmployeeId] nvarchar(max) NULL,
    CONSTRAINT [PK_Wisdoms] PRIMARY KEY ([Id])
);

GO

UPDATE [Actions] SET [CreatedDate] = '2020-11-26T02:21:11.8929492+02:00', [ModifiedDate] = '2020-11-26T02:21:11.8929513+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-11-26T02:21:11.8940243+02:00', [ModifiedDate] = '2020-11-26T02:21:11.8940262+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-11-26T02:21:11.8940995+02:00', [ModifiedDate] = '2020-11-26T02:21:11.8940998+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-11-26T02:21:11.8941476+02:00', [ModifiedDate] = '2020-11-26T02:21:11.8941478+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Actions] SET [CreatedDate] = '2020-11-26T02:21:11.8941907+02:00', [ModifiedDate] = '2020-11-26T02:21:11.8941909+02:00'
WHERE [Id] = CAST(5 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Companies] SET [CreatedDate] = '2020-11-26T02:21:11.8758939+02:00', [ModifiedDate] = '2020-11-26T02:21:11.8774708+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-11-26T02:21:11.8915360+02:00', [ModifiedDate] = '2020-11-26T02:21:11.8915369+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-11-26T02:21:11.8916697+02:00', [ModifiedDate] = '2020-11-26T02:21:11.8916702+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-11-26T02:21:11.8916741+02:00', [ModifiedDate] = '2020-11-26T02:21:11.8916742+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-11-26T02:21:11.8916743+02:00', [ModifiedDate] = '2020-11-26T02:21:11.8916744+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-11-26T02:21:11.8916746+02:00', [ModifiedDate] = '2020-11-26T02:21:11.8916747+02:00'
WHERE [Id] = CAST(5 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-11-26T02:21:11.8916748+02:00', [ModifiedDate] = '2020-11-26T02:21:11.8916749+02:00'
WHERE [Id] = CAST(6 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [DealCategories] SET [CreatedDate] = '2020-11-26T02:21:11.8916750+02:00', [ModifiedDate] = '2020-11-26T02:21:11.8916751+02:00'
WHERE [Id] = CAST(7 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-11-26T02:21:11.8904023+02:00', [ModifiedDate] = '2020-11-26T02:21:11.8904055+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-11-26T02:21:11.8906315+02:00', [ModifiedDate] = '2020-11-26T02:21:11.8906321+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-11-26T02:21:11.8906360+02:00', [ModifiedDate] = '2020-11-26T02:21:11.8906361+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Permissions] SET [CreatedDate] = '2020-11-26T02:21:11.8906362+02:00', [ModifiedDate] = '2020-11-26T02:21:11.8906363+02:00'
WHERE [Id] = CAST(4 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-11-26T02:21:11.8794026+02:00', [ModifiedDate] = '2020-11-26T02:21:11.8794044+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Roles] SET [CreatedDate] = '2020-11-26T02:21:11.8796432+02:00', [ModifiedDate] = '2020-11-26T02:21:11.8796437+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-11-26T02:21:11.8972010+02:00', [ModifiedDate] = '2020-11-26T02:21:11.8972018+02:00'
WHERE [ActionId] = CAST(1 AS bigint) AND [ServiceTypeId] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-11-26T02:21:11.8973688+02:00', [ModifiedDate] = '2020-11-26T02:21:11.8973690+02:00'
WHERE [ActionId] = CAST(1 AS bigint) AND [ServiceTypeId] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-11-26T02:21:11.8973501+02:00', [ModifiedDate] = '2020-11-26T02:21:11.8973593+02:00'
WHERE [ActionId] = CAST(2 AS bigint) AND [ServiceTypeId] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-11-26T02:21:11.8973692+02:00', [ModifiedDate] = '2020-11-26T02:21:11.8973693+02:00'
WHERE [ActionId] = CAST(2 AS bigint) AND [ServiceTypeId] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-11-26T02:21:11.8973681+02:00', [ModifiedDate] = '2020-11-26T02:21:11.8973683+02:00'
WHERE [ActionId] = CAST(3 AS bigint) AND [ServiceTypeId] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypeActions] SET [CreatedDate] = '2020-11-26T02:21:11.8973707+02:00', [ModifiedDate] = '2020-11-26T02:21:11.8973708+02:00'
WHERE [ActionId] = CAST(4 AS bigint) AND [ServiceTypeId] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypes] SET [CreatedDate] = '2020-11-26T02:21:11.8964110+02:00', [ModifiedDate] = '2020-11-26T02:21:11.8964120+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypes] SET [CreatedDate] = '2020-11-26T02:21:11.8967349+02:00', [ModifiedDate] = '2020-11-26T02:21:11.8967357+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [ServiceTypes] SET [CreatedDate] = '2020-11-26T02:21:11.8967821+02:00', [ModifiedDate] = '2020-11-26T02:21:11.8967823+02:00'
WHERE [Id] = CAST(3 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Status] SET [CreatedDate] = '2020-11-26T02:21:11.8951539+02:00', [ModifiedDate] = '2020-11-26T02:21:11.8951552+02:00'
WHERE [Id] = CAST(0 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Status] SET [CreatedDate] = '2020-11-26T02:21:11.8955726+02:00', [ModifiedDate] = '2020-11-26T02:21:11.8955733+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Status] SET [CreatedDate] = '2020-11-26T02:21:11.8956266+02:00', [ModifiedDate] = '2020-11-26T02:21:11.8956270+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-11-26T02:21:11.8910337+02:00', [ModifiedDate] = '2020-11-26T02:21:11.8910345+02:00'
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Teams] SET [CreatedDate] = '2020-11-26T02:21:11.8911660+02:00', [ModifiedDate] = '2020-11-26T02:21:11.8911665+02:00'
WHERE [Id] = CAST(2 AS bigint);
SELECT @@ROWCOUNT;


GO

UPDATE [Users] SET [CreatedDate] = '2020-11-26T02:21:11.8800887+02:00', [ModifiedDate] = '2020-11-26T02:21:11.8800900+02:00', [Password] = N'AM2Hy7GprJnBI/FIF1jan1FfmTMe9iFrkkGOvoNAsACv1oT9ihesTXQy3CG87qSA+g=='
WHERE [Id] = CAST(1 AS bigint);
SELECT @@ROWCOUNT;


GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20201125222115_AddWisdomEntity', N'3.1.5');

GO

