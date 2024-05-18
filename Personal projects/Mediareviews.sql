USE Master
GO
DROP DATABASE IF EXISTS Mediareviews;
GO
CREATE DATABASE Mediareviews;
GO
USE Mediareviews;
GO

CREATE TABLE DigitalMediaProducts (
    Id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
    [Name] NVARCHAR(50),
    Price FLOAT(53),
	Type NVARCHAR(50)
);

CREATE TABLE Reviewers (
    Id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
    [Name] NVARCHAR(50),
    Mail NVARCHAR(50),
);
CREATE TABLE Reviews (
    Id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
    Rating INT,
    [Text] NVARCHAR(50),
    [Date] DATETIME,
    ReviewerId INT,
    DigitalMediaProductId INT
);

GO

ALTER TABLE Reviews
    ADD CONSTRAINT FK_Reviews_Reviewers FOREIGN KEY(ReviewerId) REFERENCES Reviewers(Id);

ALTER TABLE Reviews
    ADD CONSTRAINT FK_Reviews_DigitalMediaProducts FOREIGN KEY(DigitalMediaProductId) REFERENCES DigitalMediaProducts(Id);
GO