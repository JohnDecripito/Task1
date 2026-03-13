CREATE TABLE `AspNetUsers` (
  `UserId` string PRIMARY KEY,
  `UserName` string,
  `NormalizedUserName` string,
  `Email` string,
  `NormalizedEmail` string,
  `EmailConfirmed` bool,
  `PasswordHash` string,
  `SecurityStamp` string,
  `ConcurrencyStamp` string,
  `PhoneNumber` string,
  `PhoneNumberConfirmed` bool,
  `TwoFactorEnabled` bool,
  `LockoutEnd` datetime,
  `LockoutEnabled` bool,
  `AccessFailedCount` int
);

CREATE TABLE `AspNetUserRoles` (
  `UserId` string,
  `RoleId` string
);

CREATE TABLE `AspNetRoles` (
  `RoleId` string PRIMARY KEY,
  `Name` string,
  `NormalizedName` string,
  `ConcurrencyStamp` string
);

CREATE TABLE `AspNetUserClaims` (
  `Id` int PRIMARY KEY,
  `UserId` string,
  `ClaimType` string,
  `ClaimValue` string
);

CREATE TABLE `AspNetUserLogins` (
  `LoginProvider` string,
  `ProviderKey` string,
  `ProviderDisplayName` string,
  `UserId` string,
  PRIMARY KEY (`LoginProvider`, `ProviderKey`)
);

CREATE TABLE `AspNetUserTokens` (
  `UserId` string,
  `LoginProvider` string,
  `Name` string,
  `Value` string,
  PRIMARY KEY (`LoginProvider`, `Name`)
);

CREATE TABLE `AspNetRoleClaims` (
  `Id` int PRIMARY KEY,
  `RoleId` string,
  `ClaimType` string,
  `ClaimValue` string
);

CREATE TABLE `Products` (
  `ProductId` int PRIMARY KEY,
  `Name` string,
  `Description` string,
  `ShortDescription` string,
  `Price` decimal,
  `InStock` int,
  `Image` string,
  `IsAvailable` bool,
  `DateAdded` datetime,
  `DateUpdated` datetime,
  `Rating` decimal,
  `ProductBasket` ICollection
);

CREATE TABLE `Basket` (
  `BasketId` int PRIMARY KEY,
  `ProductBasketId` int,
  `BasketStatus` bool,
  `UserId` string,
  `ProductBasket` ICollection
);

CREATE TABLE `ProductBasket` (
  `ProductBasketID` int PRIMARY KEY,
  `ProductID` int,
  `BasketId` int,
  `Total` decimal,
  `Product` product,
  `Basket` basket
);

CREATE TABLE `Orders` (
  `OrdersId` int PRIMARY KEY,
  `Subtotal` int,
  `OrderDate` datetime,
  `DeliveryType` string,
  `UserId` string,
  `OrderProduct` ICollection
);

CREATE TABLE `OrderProduct` (
  `OrderProductId` int PRIMARY KEY,
  `OrderId` int,
  `ProductId` int,
  `Order` order,
  `Product` product
);

CREATE TABLE `Loyalty` (
  `LoyaltyId` int PRIMARY KEY,
  `Points` int
);

ALTER TABLE `AspNetUserRoles` ADD FOREIGN KEY (`UserId`) REFERENCES `AspNetUsers` (`UserId`);

ALTER TABLE `AspNetUserClaims` ADD FOREIGN KEY (`UserId`) REFERENCES `AspNetUsers` (`UserId`);

ALTER TABLE `AspNetUserLogins` ADD FOREIGN KEY (`UserId`) REFERENCES `AspNetUsers` (`UserId`);

ALTER TABLE `AspNetUserTokens` ADD FOREIGN KEY (`UserId`) REFERENCES `AspNetUsers` (`UserId`);

ALTER TABLE `AspNetUserRoles` ADD FOREIGN KEY (`RoleId`) REFERENCES `AspNetRoles` (`RoleId`);

ALTER TABLE `AspNetRoleClaims` ADD FOREIGN KEY (`Id`) REFERENCES `AspNetRoles` (`RoleId`);

ALTER TABLE `ProductBasket` ADD FOREIGN KEY (`ProductID`) REFERENCES `Products` (`ProductId`);

ALTER TABLE `ProductBasket` ADD FOREIGN KEY (`BasketId`) REFERENCES `Basket` (`BasketId`);

ALTER TABLE `Basket` ADD FOREIGN KEY (`UserId`) REFERENCES `AspNetUsers` (`UserId`);

ALTER TABLE `Orders` ADD FOREIGN KEY (`UserId`) REFERENCES `AspNetUsers` (`UserId`);

ALTER TABLE `OrderProduct` ADD FOREIGN KEY (`OrderId`) REFERENCES `Orders` (`OrdersId`);

ALTER TABLE `OrderProduct` ADD FOREIGN KEY (`ProductId`) REFERENCES `Products` (`ProductId`);
