IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191002020409_createDB')
BEGIN
    CREATE TABLE [OpeningBalances] (
        [Id] uniqueidentifier NOT NULL,
        [CreateUserId] uniqueidentifier NOT NULL,
        [CreateDate] datetime2 NOT NULL,
        [ModifyUserId] uniqueidentifier NULL,
        [ModifyDate] datetime2 NULL,
        [Type] int NOT NULL,
        [TypeId] uniqueidentifier NOT NULL,
        [DebitCridet] int NOT NULL,
        [Value] decimal(18,2) NOT NULL,
        [Notes] nvarchar(512) NULL,
        [OpeningBlanceDate] datetime2 NOT NULL,
        CONSTRAINT [PK_OpeningBalances] PRIMARY KEY ([Id])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191002020409_createDB')
BEGIN
    CREATE TABLE [Policies] (
        [Id] uniqueidentifier NOT NULL,
        [CreateUserId] uniqueidentifier NOT NULL,
        [CreateDate] datetime2 NOT NULL,
        [ModifyUserId] uniqueidentifier NULL,
        [ModifyDate] datetime2 NULL,
        [CustomerId] uniqueidentifier NOT NULL,
        [CustomerCategoryId] uniqueidentifier NOT NULL,
        [InvoicTypeId] uniqueidentifier NOT NULL,
        [PolicyDatetime] datetime2 NULL,
        [PolicyNumber] nvarchar(64) NULL,
        [RepresentativeId] uniqueidentifier NOT NULL,
        [CarId] uniqueidentifier NOT NULL,
        [CarTypeId] uniqueidentifier NOT NULL,
        [TrackSettingId] uniqueidentifier NOT NULL,
        [TrackCost] decimal(18,2) NULL,
        [TrackValue] decimal(18,2) NULL,
        [OverNightPrice] decimal(18,2) NULL,
        [TownPrice] decimal(18,2) NULL,
        [RecallPrice] decimal(18,2) NULL,
        [Discount] decimal(18,2) NULL,
        [TotalPriceBeforTax] decimal(18,2) NULL,
        [TaxTypeId] uniqueidentifier NOT NULL,
        [TaxValue] decimal(18,2) NULL,
        [TotalPriceAfterTax] decimal(18,2) NULL,
        [Notes] nvarchar(512) NULL,
        [IsRentedCar] bit NOT NULL,
        [CarNo] nvarchar(16) NULL,
        [THeadId] bigint NULL,
        CONSTRAINT [PK_Policies] PRIMARY KEY ([Id])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191002020409_createDB')
BEGIN
    CREATE TABLE [ClaimCustomers] (
        [Id] uniqueidentifier NOT NULL,
        [CreateUserId] uniqueidentifier NOT NULL,
        [CreateDate] datetime2 NOT NULL,
        [ModifyUserId] uniqueidentifier NULL,
        [ModifyDate] datetime2 NULL,
        [CustomerId] uniqueidentifier NOT NULL,
        [ClaimCustomerDate] datetime2 NOT NULL,
        [Notes] nvarchar(512) NULL,
        [Total] decimal(18,2) NOT NULL,
        [Tax] decimal(18,2) NOT NULL,
        [TotalAfterTax] decimal(18,2) NOT NULL,
        [PolicyId] uniqueidentifier NOT NULL,
        CONSTRAINT [PK_ClaimCustomers] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_ClaimCustomers_Policies_PolicyId] FOREIGN KEY ([PolicyId]) REFERENCES [Policies] ([Id]) ON DELETE CASCADE
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191002020409_createDB')
BEGIN
    CREATE TABLE [CollectReceipts] (
        [Id] uniqueidentifier NOT NULL,
        [CreateUserId] uniqueidentifier NOT NULL,
        [CreateDate] datetime2 NOT NULL,
        [ModifyUserId] uniqueidentifier NULL,
        [ModifyDate] datetime2 NULL,
        [CustomerId] uniqueidentifier NOT NULL,
        [CollectReceiptDate] datetime2 NOT NULL,
        [CollectReceiptDateHegry] datetime2 NULL,
        [Notes] nvarchar(512) NULL,
        [CollectReceiptNumber] nvarchar(450) NULL,
        [Paid] decimal(18,2) NOT NULL,
        [PaymentType] int NOT NULL,
        [AccountCode] nvarchar(128) NULL,
        [CostCenter] nvarchar(128) NULL,
        [CollectReceiptType] int NOT NULL,
        [PolicyId] uniqueidentifier NOT NULL,
        CONSTRAINT [PK_CollectReceipts] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_CollectReceipts_Policies_PolicyId] FOREIGN KEY ([PolicyId]) REFERENCES [Policies] ([Id]) ON DELETE CASCADE
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191002020409_createDB')
BEGIN
    CREATE INDEX [IX_ClaimCustomers_PolicyId] ON [ClaimCustomers] ([PolicyId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191002020409_createDB')
BEGIN
    CREATE UNIQUE INDEX [IX_CollectReceipts_CollectReceiptNumber] ON [CollectReceipts] ([CollectReceiptNumber]) WHERE [CollectReceiptNumber] IS NOT NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191002020409_createDB')
BEGIN
    CREATE INDEX [IX_CollectReceipts_PolicyId] ON [CollectReceipts] ([PolicyId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191002020409_createDB')
BEGIN
    CREATE UNIQUE INDEX [IX_Policies_PolicyNumber] ON [Policies] ([PolicyNumber]) WHERE [PolicyNumber] IS NOT NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191002020409_createDB')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20191002020409_createDB', N'2.2.6-servicing-10079');
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191004204954_ModifyPolicy')
BEGIN
    ALTER TABLE [Policies] ADD [DriverId] uniqueidentifier NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191004204954_ModifyPolicy')
BEGIN
    ALTER TABLE [Policies] ADD [DriverName] nvarchar(max) NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191004204954_ModifyPolicy')
BEGIN
    ALTER TABLE [Policies] ADD [DriverNationality] nvarchar(max) NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191004204954_ModifyPolicy')
BEGIN
    ALTER TABLE [Policies] ADD [DriverPhone] nvarchar(max) NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191004204954_ModifyPolicy')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20191004204954_ModifyPolicy', N'2.2.6-servicing-10079');
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191005154154_AddSequancePolicyNumber')
BEGIN
    DROP INDEX [IX_Policies_PolicyNumber] ON [Policies];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191005154154_AddSequancePolicyNumber')
BEGIN
    CREATE SEQUENCE [PolicyNumbers] START WITH 1000 INCREMENT BY 1 NO MINVALUE NO MAXVALUE NO CYCLE;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191005154154_AddSequancePolicyNumber')
BEGIN
    DECLARE @var0 sysname;
    SELECT @var0 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Policies]') AND [c].[name] = N'PolicyNumber');
    IF @var0 IS NOT NULL EXEC(N'ALTER TABLE [Policies] DROP CONSTRAINT [' + @var0 + '];');
    ALTER TABLE [Policies] ALTER COLUMN [PolicyNumber] bigint NOT NULL;
    ALTER TABLE [Policies] ADD DEFAULT (NEXT VALUE FOR PolicyNumbers) FOR [PolicyNumber];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191005154154_AddSequancePolicyNumber')
BEGIN
    CREATE UNIQUE INDEX [IX_Policies_PolicyNumber] ON [Policies] ([PolicyNumber]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191005154154_AddSequancePolicyNumber')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20191005154154_AddSequancePolicyNumber', N'2.2.6-servicing-10079');
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191005205733_CancelSequancePolicyNumber')
BEGIN
    DECLARE @var1 sysname;
    SELECT @var1 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Policies]') AND [c].[name] = N'PolicyNumber');
    IF @var1 IS NOT NULL EXEC(N'ALTER TABLE [Policies] DROP CONSTRAINT [' + @var1 + '];');
    ALTER TABLE [Policies] ALTER COLUMN [PolicyNumber] bigint NOT NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191005205733_CancelSequancePolicyNumber')
BEGIN
    DROP SEQUENCE [PolicyNumbers];
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191005205733_CancelSequancePolicyNumber')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20191005205733_CancelSequancePolicyNumber', N'2.2.6-servicing-10079');
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191013191646_AddNew')
BEGIN
    EXEC sp_rename N'[Policies].[DriverNationality]', N'ManafestNumber', N'COLUMN';
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191013191646_AddNew')
BEGIN
    ALTER TABLE [Policies] ADD [BranchId] uniqueidentifier NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000';
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191013191646_AddNew')
BEGIN
    ALTER TABLE [Policies] ADD [ColdNumber] nvarchar(max) NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191013191646_AddNew')
BEGIN
    ALTER TABLE [Policies] ADD [DriverNationalityId] uniqueidentifier NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191013191646_AddNew')
BEGIN
    ALTER TABLE [Policies] ADD [RequestPaymentId] uniqueidentifier NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191013191646_AddNew')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20191013191646_AddNew', N'2.2.6-servicing-10079');
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191013200459_AddNew1')
BEGIN
    EXEC sp_rename N'[Policies].[DriverNationalityId]', N'NationalityId', N'COLUMN';
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191013200459_AddNew1')
BEGIN
    ALTER TABLE [Policies] ADD [IdentifacationNumber] nvarchar(max) NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20191013200459_AddNew1')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20191013200459_AddNew1', N'2.2.6-servicing-10079');
END;

GO

