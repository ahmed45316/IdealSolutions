IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190727131138_CreateDB')
BEGIN
    CREATE TABLE [Cars] (
        [Id] uniqueidentifier NOT NULL,
        [CreateUserId] uniqueidentifier NOT NULL,
        [CreateDate] datetime2 NOT NULL,
        [ModifyUserId] uniqueidentifier NULL,
        [ModifyDate] datetime2 NULL,
        [PlateNumber] nvarchar(64) NULL,
        [Model] nvarchar(64) NULL,
        [Notes] nvarchar(512) NULL,
        [CostCenter] nvarchar(128) NULL,
        CONSTRAINT [PK_Cars] PRIMARY KEY ([Id])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190727131138_CreateDB')
BEGIN
    CREATE TABLE [CarTypes] (
        [Id] uniqueidentifier NOT NULL,
        [CreateUserId] uniqueidentifier NOT NULL,
        [CreateDate] datetime2 NOT NULL,
        [ModifyUserId] uniqueidentifier NULL,
        [ModifyDate] datetime2 NULL,
        [NameAr] nvarchar(128) NULL,
        [NameEn] nvarchar(128) NULL,
        CONSTRAINT [PK_CarTypes] PRIMARY KEY ([Id])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190727131138_CreateDB')
BEGIN
    CREATE TABLE [Companies] (
        [Id] uniqueidentifier NOT NULL,
        [CreateUserId] uniqueidentifier NOT NULL,
        [CreateDate] datetime2 NOT NULL,
        [ModifyUserId] uniqueidentifier NULL,
        [ModifyDate] datetime2 NULL,
        [NameAr] nvarchar(128) NULL,
        [NameEn] nvarchar(128) NULL,
        [TaxNumber] nvarchar(128) NULL,
        [Address] nvarchar(256) NULL,
        [Logo] nvarchar(128) NULL,
        [CompanyGeneralLadgerId] nvarchar(128) NULL,
        CONSTRAINT [PK_Companies] PRIMARY KEY ([Id])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190727131138_CreateDB')
BEGIN
    CREATE TABLE [Countries] (
        [Id] uniqueidentifier NOT NULL,
        [CreateUserId] uniqueidentifier NOT NULL,
        [CreateDate] datetime2 NOT NULL,
        [ModifyUserId] uniqueidentifier NULL,
        [ModifyDate] datetime2 NULL,
        [NameAr] nvarchar(128) NULL,
        [NameEn] nvarchar(128) NULL,
        [CountryKey] nvarchar(8) NULL,
        [NationalityAr] nvarchar(128) NULL,
        [NationalityEn] nvarchar(128) NULL,
        CONSTRAINT [PK_Countries] PRIMARY KEY ([Id])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190727131138_CreateDB')
BEGIN
    CREATE TABLE [CustomerCategories] (
        [Id] uniqueidentifier NOT NULL,
        [CreateUserId] uniqueidentifier NOT NULL,
        [CreateDate] datetime2 NOT NULL,
        [ModifyUserId] uniqueidentifier NULL,
        [ModifyDate] datetime2 NULL,
        [NameAr] nvarchar(128) NULL,
        [NameEn] nvarchar(128) NULL,
        CONSTRAINT [PK_CustomerCategories] PRIMARY KEY ([Id])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190727131138_CreateDB')
BEGIN
    CREATE TABLE [InvoiceTypes] (
        [Id] uniqueidentifier NOT NULL,
        [CreateUserId] uniqueidentifier NOT NULL,
        [CreateDate] datetime2 NOT NULL,
        [ModifyUserId] uniqueidentifier NULL,
        [ModifyDate] datetime2 NULL,
        [NameAr] nvarchar(128) NULL,
        [NameEn] nvarchar(128) NULL,
        CONSTRAINT [PK_InvoiceTypes] PRIMARY KEY ([Id])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190727131138_CreateDB')
BEGIN
    CREATE TABLE [Rents] (
        [Id] uniqueidentifier NOT NULL,
        [CreateUserId] uniqueidentifier NOT NULL,
        [CreateDate] datetime2 NOT NULL,
        [ModifyUserId] uniqueidentifier NULL,
        [ModifyDate] datetime2 NULL,
        [NameAr] nvarchar(128) NULL,
        [NameEn] nvarchar(128) NULL,
        [RentCode] int NOT NULL,
        [Phone] nvarchar(20) NULL,
        [Mobile] nvarchar(20) NULL,
        [Fax] nvarchar(30) NULL,
        [ResponsibleFor] nvarchar(128) NULL,
        [Address] nvarchar(256) NULL,
        [Email] nvarchar(64) NULL,
        [IsWorking] bit NOT NULL DEFAULT (0),
        [AccountCode] nvarchar(128) NULL,
        [CostCenter] nvarchar(128) NULL,
        CONSTRAINT [PK_Rents] PRIMARY KEY ([Id])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190727131138_CreateDB')
BEGIN
    CREATE TABLE [Representatives] (
        [Id] uniqueidentifier NOT NULL,
        [CreateUserId] uniqueidentifier NOT NULL,
        [CreateDate] datetime2 NOT NULL,
        [ModifyUserId] uniqueidentifier NULL,
        [ModifyDate] datetime2 NULL,
        [NameAr] nvarchar(128) NULL,
        [NameEn] nvarchar(128) NULL,
        [RepresentativeCode] int NOT NULL,
        [Phone] nvarchar(20) NULL,
        [Mobile] nvarchar(20) NULL,
        [Fax] nvarchar(30) NULL,
        [ResponsibleFor] nvarchar(128) NULL,
        [Address] nvarchar(256) NULL,
        [Email] nvarchar(64) NULL,
        [IsWorking] bit NOT NULL DEFAULT (0),
        [AccountCode] nvarchar(128) NULL,
        [CostCenter] nvarchar(128) NULL,
        CONSTRAINT [PK_Representatives] PRIMARY KEY ([Id])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190727131138_CreateDB')
BEGIN
    CREATE TABLE [TaxCategories] (
        [Id] uniqueidentifier NOT NULL,
        [CreateUserId] uniqueidentifier NOT NULL,
        [CreateDate] datetime2 NOT NULL,
        [ModifyUserId] uniqueidentifier NULL,
        [ModifyDate] datetime2 NULL,
        [NameAr] nvarchar(128) NULL,
        [NameEn] nvarchar(128) NULL,
        CONSTRAINT [PK_TaxCategories] PRIMARY KEY ([Id])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190727131138_CreateDB')
BEGIN
    CREATE TABLE [Tracks] (
        [Id] uniqueidentifier NOT NULL,
        [CreateUserId] uniqueidentifier NOT NULL,
        [CreateDate] datetime2 NOT NULL,
        [ModifyUserId] uniqueidentifier NULL,
        [ModifyDate] datetime2 NULL,
        [NameAr] nvarchar(128) NULL,
        [NameEn] nvarchar(128) NULL,
        CONSTRAINT [PK_Tracks] PRIMARY KEY ([Id])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190727131138_CreateDB')
BEGIN
    CREATE TABLE [Branches] (
        [Id] uniqueidentifier NOT NULL,
        [CreateUserId] uniqueidentifier NOT NULL,
        [CreateDate] datetime2 NOT NULL,
        [ModifyUserId] uniqueidentifier NULL,
        [ModifyDate] datetime2 NULL,
        [NameAr] nvarchar(128) NULL,
        [NameEn] nvarchar(128) NULL,
        [CompanyId] uniqueidentifier NOT NULL,
        [BranchGeneralLadgerId] nvarchar(128) NULL,
        CONSTRAINT [PK_Branches] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Branches_Companies_CompanyId] FOREIGN KEY ([CompanyId]) REFERENCES [Companies] ([Id]) ON DELETE CASCADE
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190727131138_CreateDB')
BEGIN
    CREATE TABLE [Cities] (
        [Id] uniqueidentifier NOT NULL,
        [CreateUserId] uniqueidentifier NOT NULL,
        [CreateDate] datetime2 NOT NULL,
        [ModifyUserId] uniqueidentifier NULL,
        [ModifyDate] datetime2 NULL,
        [NameAr] nvarchar(128) NULL,
        [NameEn] nvarchar(128) NULL,
        [CountryId] uniqueidentifier NOT NULL,
        CONSTRAINT [PK_Cities] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Cities_Countries_CountryId] FOREIGN KEY ([CountryId]) REFERENCES [Countries] ([Id]) ON DELETE CASCADE
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190727131138_CreateDB')
BEGIN
    CREATE TABLE [Customers] (
        [Id] uniqueidentifier NOT NULL,
        [CreateUserId] uniqueidentifier NOT NULL,
        [CreateDate] datetime2 NOT NULL,
        [ModifyUserId] uniqueidentifier NULL,
        [ModifyDate] datetime2 NULL,
        [NameAr] nvarchar(128) NULL,
        [NameEn] nvarchar(128) NULL,
        [CustomerCode] int NOT NULL,
        [Phone] nvarchar(20) NULL,
        [Mobile] nvarchar(20) NULL,
        [Fax] nvarchar(30) NULL,
        [ResponsibleFor] nvarchar(128) NULL,
        [Address] nvarchar(256) NULL,
        [Email] nvarchar(64) NULL,
        [IsWorking] bit NOT NULL DEFAULT (0),
        [IsOutSideCustomer] bit NOT NULL DEFAULT (0),
        [AccountCode] nvarchar(128) NULL,
        [CostCenter] nvarchar(128) NULL,
        [RepresentativeId] uniqueidentifier NOT NULL,
        CONSTRAINT [PK_Customers] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Customers_Representatives_RepresentativeId] FOREIGN KEY ([RepresentativeId]) REFERENCES [Representatives] ([Id]) ON DELETE CASCADE
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190727131138_CreateDB')
BEGIN
    CREATE TABLE [TaxTypes] (
        [Id] uniqueidentifier NOT NULL,
        [CreateUserId] uniqueidentifier NOT NULL,
        [CreateDate] datetime2 NOT NULL,
        [ModifyUserId] uniqueidentifier NULL,
        [ModifyDate] datetime2 NULL,
        [NameAr] nvarchar(128) NULL,
        [NameEn] nvarchar(128) NULL,
        [Percentage] float NOT NULL,
        [AccountCode] nvarchar(128) NULL,
        [CostCenter] nvarchar(128) NULL,
        [TaxCategoryId] uniqueidentifier NOT NULL,
        CONSTRAINT [PK_TaxTypes] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_TaxTypes_TaxCategories_TaxCategoryId] FOREIGN KEY ([TaxCategoryId]) REFERENCES [TaxCategories] ([Id]) ON DELETE CASCADE
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190727131138_CreateDB')
BEGIN
    CREATE TABLE [TrackPrices] (
        [Id] uniqueidentifier NOT NULL,
        [CreateUserId] uniqueidentifier NOT NULL,
        [CreateDate] datetime2 NOT NULL,
        [ModifyUserId] uniqueidentifier NULL,
        [ModifyDate] datetime2 NULL,
        [CustomerId] uniqueidentifier NOT NULL,
        [FromTrackId] uniqueidentifier NULL,
        [ToTrackId] uniqueidentifier NULL,
        CONSTRAINT [PK_TrackPrices] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_TrackPrices_Customers_CustomerId] FOREIGN KEY ([CustomerId]) REFERENCES [Customers] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_TrackPrices_Tracks_FromTrackId] FOREIGN KEY ([FromTrackId]) REFERENCES [Tracks] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_TrackPrices_Tracks_ToTrackId] FOREIGN KEY ([ToTrackId]) REFERENCES [Tracks] ([Id]) ON DELETE NO ACTION
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190727131138_CreateDB')
BEGIN
    CREATE INDEX [IX_Branches_CompanyId] ON [Branches] ([CompanyId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190727131138_CreateDB')
BEGIN
    CREATE INDEX [IX_Cities_CountryId] ON [Cities] ([CountryId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190727131138_CreateDB')
BEGIN
    CREATE UNIQUE INDEX [IX_Customers_CustomerCode] ON [Customers] ([CustomerCode]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190727131138_CreateDB')
BEGIN
    CREATE INDEX [IX_Customers_RepresentativeId] ON [Customers] ([RepresentativeId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190727131138_CreateDB')
BEGIN
    CREATE UNIQUE INDEX [IX_Rents_RentCode] ON [Rents] ([RentCode]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190727131138_CreateDB')
BEGIN
    CREATE UNIQUE INDEX [IX_Representatives_RepresentativeCode] ON [Representatives] ([RepresentativeCode]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190727131138_CreateDB')
BEGIN
    CREATE INDEX [IX_TaxTypes_TaxCategoryId] ON [TaxTypes] ([TaxCategoryId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190727131138_CreateDB')
BEGIN
    CREATE INDEX [IX_TrackPrices_CustomerId] ON [TrackPrices] ([CustomerId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190727131138_CreateDB')
BEGIN
    CREATE INDEX [IX_TrackPrices_FromTrackId] ON [TrackPrices] ([FromTrackId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190727131138_CreateDB')
BEGIN
    CREATE INDEX [IX_TrackPrices_ToTrackId] ON [TrackPrices] ([ToTrackId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190727131138_CreateDB')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20190727131138_CreateDB', N'2.2.6-servicing-10079');
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190802083857_AddDriversTrackSettingTrackPriceWithDetailsWithCarType')
BEGIN
    ALTER TABLE [TrackPrices] DROP CONSTRAINT [FK_TrackPrices_Tracks_FromTrackId];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190802083857_AddDriversTrackSettingTrackPriceWithDetailsWithCarType')
BEGIN
    ALTER TABLE [TrackPrices] DROP CONSTRAINT [FK_TrackPrices_Tracks_ToTrackId];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190802083857_AddDriversTrackSettingTrackPriceWithDetailsWithCarType')
BEGIN
    DROP INDEX [IX_TrackPrices_FromTrackId] ON [TrackPrices];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190802083857_AddDriversTrackSettingTrackPriceWithDetailsWithCarType')
BEGIN
    DROP INDEX [IX_TrackPrices_ToTrackId] ON [TrackPrices];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190802083857_AddDriversTrackSettingTrackPriceWithDetailsWithCarType')
BEGIN
    DECLARE @var0 sysname;
    SELECT @var0 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[TrackPrices]') AND [c].[name] = N'FromTrackId');
    IF @var0 IS NOT NULL EXEC(N'ALTER TABLE [TrackPrices] DROP CONSTRAINT [' + @var0 + '];');
    ALTER TABLE [TrackPrices] DROP COLUMN [FromTrackId];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190802083857_AddDriversTrackSettingTrackPriceWithDetailsWithCarType')
BEGIN
    DECLARE @var1 sysname;
    SELECT @var1 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[TrackPrices]') AND [c].[name] = N'ToTrackId');
    IF @var1 IS NOT NULL EXEC(N'ALTER TABLE [TrackPrices] DROP CONSTRAINT [' + @var1 + '];');
    ALTER TABLE [TrackPrices] DROP COLUMN [ToTrackId];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190802083857_AddDriversTrackSettingTrackPriceWithDetailsWithCarType')
BEGIN
    ALTER TABLE [TrackPrices] ADD [FromDate] datetime2 NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190802083857_AddDriversTrackSettingTrackPriceWithDetailsWithCarType')
BEGIN
    ALTER TABLE [TrackPrices] ADD [OverNightPrice] decimal(18,2) NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190802083857_AddDriversTrackSettingTrackPriceWithDetailsWithCarType')
BEGIN
    ALTER TABLE [TrackPrices] ADD [RecallPrice] decimal(18,2) NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190802083857_AddDriversTrackSettingTrackPriceWithDetailsWithCarType')
BEGIN
    ALTER TABLE [TrackPrices] ADD [ToDate] datetime2 NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190802083857_AddDriversTrackSettingTrackPriceWithDetailsWithCarType')
BEGIN
    ALTER TABLE [TrackPrices] ADD [TownPrice] decimal(18,2) NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190802083857_AddDriversTrackSettingTrackPriceWithDetailsWithCarType')
BEGIN
    CREATE TABLE [TrackSetting] (
        [Id] uniqueidentifier NOT NULL,
        [CreateUserId] uniqueidentifier NOT NULL,
        [CreateDate] datetime2 NOT NULL,
        [ModifyUserId] uniqueidentifier NULL,
        [ModifyDate] datetime2 NULL,
        [FromTrackId] uniqueidentifier NULL,
        [ToTrackId] uniqueidentifier NULL,
        [DistanceByKilloMeters] float NOT NULL,
        [TrackSettingType] tinyint NOT NULL,
        [DriverMotivation] decimal(18,2) NULL,
        CONSTRAINT [PK_TrackSetting] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_TrackSetting_Tracks_FromTrackId] FOREIGN KEY ([FromTrackId]) REFERENCES [Tracks] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_TrackSetting_Tracks_ToTrackId] FOREIGN KEY ([ToTrackId]) REFERENCES [Tracks] ([Id]) ON DELETE NO ACTION
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190802083857_AddDriversTrackSettingTrackPriceWithDetailsWithCarType')
BEGIN
    CREATE TABLE [TrackPriceDetail] (
        [Id] uniqueidentifier NOT NULL,
        [CreateUserId] uniqueidentifier NOT NULL,
        [CreateDate] datetime2 NOT NULL,
        [ModifyUserId] uniqueidentifier NULL,
        [ModifyDate] datetime2 NULL,
        [TrackPriceId] uniqueidentifier NOT NULL,
        [TrackSettingId] uniqueidentifier NOT NULL,
        CONSTRAINT [PK_TrackPriceDetail] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_TrackPriceDetail_TrackPrices_TrackPriceId] FOREIGN KEY ([TrackPriceId]) REFERENCES [TrackPrices] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_TrackPriceDetail_TrackSetting_TrackSettingId] FOREIGN KEY ([TrackSettingId]) REFERENCES [TrackSetting] ([Id]) ON DELETE CASCADE
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190802083857_AddDriversTrackSettingTrackPriceWithDetailsWithCarType')
BEGIN
    CREATE TABLE [TrackPriceDetailCarType] (
        [Id] uniqueidentifier NOT NULL,
        [CreateUserId] uniqueidentifier NOT NULL,
        [CreateDate] datetime2 NOT NULL,
        [ModifyUserId] uniqueidentifier NULL,
        [ModifyDate] datetime2 NULL,
        [TrackPriceDetailId] uniqueidentifier NOT NULL,
        [CarTypeId] uniqueidentifier NOT NULL,
        [CarTypePrice] float NOT NULL,
        CONSTRAINT [PK_TrackPriceDetailCarType] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_TrackPriceDetailCarType_CarTypes_CarTypeId] FOREIGN KEY ([CarTypeId]) REFERENCES [CarTypes] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_TrackPriceDetailCarType_TrackPriceDetail_TrackPriceDetailId] FOREIGN KEY ([TrackPriceDetailId]) REFERENCES [TrackPriceDetail] ([Id]) ON DELETE CASCADE
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190802083857_AddDriversTrackSettingTrackPriceWithDetailsWithCarType')
BEGIN
    CREATE INDEX [IX_TrackPriceDetail_TrackPriceId] ON [TrackPriceDetail] ([TrackPriceId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190802083857_AddDriversTrackSettingTrackPriceWithDetailsWithCarType')
BEGIN
    CREATE INDEX [IX_TrackPriceDetail_TrackSettingId] ON [TrackPriceDetail] ([TrackSettingId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190802083857_AddDriversTrackSettingTrackPriceWithDetailsWithCarType')
BEGIN
    CREATE INDEX [IX_TrackPriceDetailCarType_CarTypeId] ON [TrackPriceDetailCarType] ([CarTypeId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190802083857_AddDriversTrackSettingTrackPriceWithDetailsWithCarType')
BEGIN
    CREATE INDEX [IX_TrackPriceDetailCarType_TrackPriceDetailId] ON [TrackPriceDetailCarType] ([TrackPriceDetailId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190802083857_AddDriversTrackSettingTrackPriceWithDetailsWithCarType')
BEGIN
    CREATE INDEX [IX_TrackSetting_FromTrackId] ON [TrackSetting] ([FromTrackId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190802083857_AddDriversTrackSettingTrackPriceWithDetailsWithCarType')
BEGIN
    CREATE INDEX [IX_TrackSetting_ToTrackId] ON [TrackSetting] ([ToTrackId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190802083857_AddDriversTrackSettingTrackPriceWithDetailsWithCarType')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20190802083857_AddDriversTrackSettingTrackPriceWithDetailsWithCarType', N'2.2.6-servicing-10079');
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190802084644_AddDrivers')
BEGIN
    ALTER TABLE [TrackPriceDetail] DROP CONSTRAINT [FK_TrackPriceDetail_TrackPrices_TrackPriceId];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190802084644_AddDrivers')
BEGIN
    ALTER TABLE [TrackPriceDetail] DROP CONSTRAINT [FK_TrackPriceDetail_TrackSetting_TrackSettingId];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190802084644_AddDrivers')
BEGIN
    ALTER TABLE [TrackPriceDetailCarType] DROP CONSTRAINT [FK_TrackPriceDetailCarType_CarTypes_CarTypeId];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190802084644_AddDrivers')
BEGIN
    ALTER TABLE [TrackPriceDetailCarType] DROP CONSTRAINT [FK_TrackPriceDetailCarType_TrackPriceDetail_TrackPriceDetailId];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190802084644_AddDrivers')
BEGIN
    ALTER TABLE [TrackPriceDetailCarType] DROP CONSTRAINT [PK_TrackPriceDetailCarType];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190802084644_AddDrivers')
BEGIN
    ALTER TABLE [TrackPriceDetail] DROP CONSTRAINT [PK_TrackPriceDetail];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190802084644_AddDrivers')
BEGIN
    EXEC sp_rename N'[TrackPriceDetailCarType]', N'TrackPriceDetailCarTypes';
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190802084644_AddDrivers')
BEGIN
    EXEC sp_rename N'[TrackPriceDetail]', N'TrackPriceDetails';
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190802084644_AddDrivers')
BEGIN
    EXEC sp_rename N'[TrackPriceDetailCarTypes].[IX_TrackPriceDetailCarType_TrackPriceDetailId]', N'IX_TrackPriceDetailCarTypes_TrackPriceDetailId', N'INDEX';
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190802084644_AddDrivers')
BEGIN
    EXEC sp_rename N'[TrackPriceDetailCarTypes].[IX_TrackPriceDetailCarType_CarTypeId]', N'IX_TrackPriceDetailCarTypes_CarTypeId', N'INDEX';
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190802084644_AddDrivers')
BEGIN
    EXEC sp_rename N'[TrackPriceDetails].[IX_TrackPriceDetail_TrackSettingId]', N'IX_TrackPriceDetails_TrackSettingId', N'INDEX';
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190802084644_AddDrivers')
BEGIN
    EXEC sp_rename N'[TrackPriceDetails].[IX_TrackPriceDetail_TrackPriceId]', N'IX_TrackPriceDetails_TrackPriceId', N'INDEX';
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190802084644_AddDrivers')
BEGIN
    ALTER TABLE [TrackPriceDetailCarTypes] ADD CONSTRAINT [PK_TrackPriceDetailCarTypes] PRIMARY KEY ([Id]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190802084644_AddDrivers')
BEGIN
    ALTER TABLE [TrackPriceDetails] ADD CONSTRAINT [PK_TrackPriceDetails] PRIMARY KEY ([Id]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190802084644_AddDrivers')
BEGIN
    CREATE TABLE [Drivers] (
        [Id] uniqueidentifier NOT NULL,
        [CreateUserId] uniqueidentifier NOT NULL,
        [CreateDate] datetime2 NOT NULL,
        [ModifyUserId] uniqueidentifier NULL,
        [ModifyDate] datetime2 NULL,
        [NameAr] nvarchar(128) NULL,
        [NameEn] nvarchar(128) NULL,
        [RepresentativeCode] int NOT NULL,
        [Phone] nvarchar(20) NULL,
        [Mobile] nvarchar(20) NULL,
        [Fax] nvarchar(30) NULL,
        [Address] nvarchar(256) NULL,
        [Email] nvarchar(64) NULL,
        [IsWorking] bit NOT NULL,
        [AccountCode] nvarchar(128) NULL,
        [CostCenter] nvarchar(128) NULL,
        CONSTRAINT [PK_Drivers] PRIMARY KEY ([Id])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190802084644_AddDrivers')
BEGIN
    ALTER TABLE [TrackPriceDetailCarTypes] ADD CONSTRAINT [FK_TrackPriceDetailCarTypes_CarTypes_CarTypeId] FOREIGN KEY ([CarTypeId]) REFERENCES [CarTypes] ([Id]) ON DELETE CASCADE;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190802084644_AddDrivers')
BEGIN
    ALTER TABLE [TrackPriceDetailCarTypes] ADD CONSTRAINT [FK_TrackPriceDetailCarTypes_TrackPriceDetails_TrackPriceDetailId] FOREIGN KEY ([TrackPriceDetailId]) REFERENCES [TrackPriceDetails] ([Id]) ON DELETE CASCADE;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190802084644_AddDrivers')
BEGIN
    ALTER TABLE [TrackPriceDetails] ADD CONSTRAINT [FK_TrackPriceDetails_TrackPrices_TrackPriceId] FOREIGN KEY ([TrackPriceId]) REFERENCES [TrackPrices] ([Id]) ON DELETE CASCADE;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190802084644_AddDrivers')
BEGIN
    ALTER TABLE [TrackPriceDetails] ADD CONSTRAINT [FK_TrackPriceDetails_TrackSetting_TrackSettingId] FOREIGN KEY ([TrackSettingId]) REFERENCES [TrackSetting] ([Id]) ON DELETE CASCADE;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190802084644_AddDrivers')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20190802084644_AddDrivers', N'2.2.6-servicing-10079');
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190802122955_ModifyDriverCode')
BEGIN
    EXEC sp_rename N'[Drivers].[RepresentativeCode]', N'DriverCode', N'COLUMN';
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190802122955_ModifyDriverCode')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20190802122955_ModifyDriverCode', N'2.2.6-servicing-10079');
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190802125144_DriverUniqueCode')
BEGIN
    DECLARE @var2 sysname;
    SELECT @var2 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Drivers]') AND [c].[name] = N'IsWorking');
    IF @var2 IS NOT NULL EXEC(N'ALTER TABLE [Drivers] DROP CONSTRAINT [' + @var2 + '];');
    ALTER TABLE [Drivers] ALTER COLUMN [IsWorking] bit NOT NULL;
    ALTER TABLE [Drivers] ADD DEFAULT (0) FOR [IsWorking];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190802125144_DriverUniqueCode')
BEGIN
    CREATE UNIQUE INDEX [IX_Drivers_DriverCode] ON [Drivers] ([DriverCode]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190802125144_DriverUniqueCode')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20190802125144_DriverUniqueCode', N'2.2.6-servicing-10079');
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190807163150_AddSettingTable')
BEGIN
    CREATE TABLE [Setting] (
        [Id] uniqueidentifier NOT NULL,
        [CreateUserId] uniqueidentifier NOT NULL,
        [CreateDate] datetime2 NOT NULL,
        [ModifyUserId] uniqueidentifier NULL,
        [ModifyDate] datetime2 NULL,
        [DatabaseAccount] nvarchar(128) NULL,
        [RevenueAccount] nvarchar(128) NULL,
        [FundAccount] nvarchar(128) NULL,
        [BankAccount] nvarchar(128) NULL,
        [JournalEntry] nvarchar(128) NULL,
        [TransportCost] nvarchar(128) NULL,
        [TaxTypeId] uniqueidentifier NOT NULL,
        CONSTRAINT [PK_Setting] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Setting_TaxTypes_TaxTypeId] FOREIGN KEY ([TaxTypeId]) REFERENCES [TaxTypes] ([Id]) ON DELETE CASCADE
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190807163150_AddSettingTable')
BEGIN
    CREATE INDEX [IX_Setting_TaxTypeId] ON [Setting] ([TaxTypeId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20190807163150_AddSettingTable')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20190807163150_AddSettingTable', N'2.2.6-servicing-10079');
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191004204454_ModifyDriver')
BEGIN
    ALTER TABLE [Drivers] ADD [IsOutSource] bit NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191004204454_ModifyDriver')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20191004204454_ModifyDriver', N'2.2.6-servicing-10079');
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191013191509_AddNew')
BEGIN
    ALTER TABLE [Drivers] ADD [IdentifacationNumber] nvarchar(max) NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191013191509_AddNew')
BEGIN
    ALTER TABLE [Drivers] ADD [NationalityId] uniqueidentifier NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191013191509_AddNew')
BEGIN
    CREATE TABLE [Nationalities] (
        [Id] uniqueidentifier NOT NULL,
        [CreateUserId] uniqueidentifier NOT NULL,
        [CreateDate] datetime2 NOT NULL,
        [ModifyUserId] uniqueidentifier NULL,
        [ModifyDate] datetime2 NULL,
        [NameAr] nvarchar(128) NULL,
        [NameEn] nvarchar(128) NULL,
        CONSTRAINT [PK_Nationalities] PRIMARY KEY ([Id])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191013191509_AddNew')
BEGIN
    CREATE INDEX [IX_Drivers_NationalityId] ON [Drivers] ([NationalityId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191013191509_AddNew')
BEGIN
    ALTER TABLE [Drivers] ADD CONSTRAINT [FK_Drivers_Nationalities_NationalityId] FOREIGN KEY ([NationalityId]) REFERENCES [Nationalities] ([Id]) ON DELETE NO ACTION;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191013191509_AddNew')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20191013191509_AddNew', N'2.2.6-servicing-10079');
END;

GO

