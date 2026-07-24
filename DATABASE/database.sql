-- ==========================================
-- MEMBER 1 DATABASE
-- AUTHENTICATION + ADMIN + COMMON STRUCTURE
-- ==========================================

-- ==========================
-- 1. ROLES
-- ==========================
CREATE TABLE Roles (
    roleID INT PRIMARY KEY AUTO_INCREMENT,
    roleName VARCHAR(50) NOT NULL UNIQUE,
    roleDescription TEXT,
    status ENUM('Active','Inactive') DEFAULT 'Active',
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP
);

-- ==========================
-- 2. PERMISSIONS
-- ==========================
CREATE TABLE Permissions (
    permissionID INT PRIMARY KEY AUTO_INCREMENT,
    permissionName VARCHAR(100) NOT NULL UNIQUE,
    permissionDescription TEXT,
    moduleName VARCHAR(100),
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ==========================
-- 3. ROLE_PERMISSIONS
-- ==========================
CREATE TABLE Role_Permissions (
    rolePermissionID INT PRIMARY KEY AUTO_INCREMENT,
    roleID INT NOT NULL,
    permissionID INT NOT NULL,
    assignedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (roleID)
        REFERENCES Roles(roleID)
        ON DELETE CASCADE,

    FOREIGN KEY (permissionID)
        REFERENCES Permissions(permissionID)
        ON DELETE CASCADE
);

-- ==========================
-- 4. USERS
-- ==========================
CREATE TABLE Users (
    userID INT PRIMARY KEY AUTO_INCREMENT,
    roleID INT NOT NULL,

    firstName VARCHAR(100) NOT NULL,
    lastName VARCHAR(100) NOT NULL,
    username VARCHAR(100) UNIQUE NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    passwordHash VARCHAR(255) NOT NULL,
    phoneNumber VARCHAR(20),
    profilePhoto VARCHAR(255),

    accountStatus ENUM('Pending','Active','Suspended','Blocked')
        DEFAULT 'Pending',

    emailVerified BOOLEAN DEFAULT FALSE,

    lastLogin DATETIME,

    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,

    FOREIGN KEY(roleID)
        REFERENCES Roles(roleID)
    
);

-- ==========================
-- 5. COMPANIES
-- ==========================
CREATE TABLE Companies (

    companyID INT PRIMARY KEY AUTO_INCREMENT,

    companyName VARCHAR(200) NOT NULL,

    registrationNumber VARCHAR(100) UNIQUE,

    companyEmail VARCHAR(150),

    phoneNumber VARCHAR(20),

    website VARCHAR(255),

    logo VARCHAR(255),

    industry VARCHAR(100),

    companyDescription TEXT,

    address TEXT,

    city VARCHAR(100),

    region VARCHAR(100),

    country VARCHAR(100),

    verifiedStatus ENUM('Pending','Approved','Rejected')
        DEFAULT 'Pending',

    createdBy INT,

    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,

    FOREIGN KEY(createdBy)
        REFERENCES Users(userID)
);

-- ==========================
-- 6. COMPANY_REGISTRATIONS
-- ==========================
CREATE TABLE Company_Registrations (

    registrationID INT PRIMARY KEY AUTO_INCREMENT,

    companyID INT NOT NULL,

    submittedBy INT NOT NULL,

    approvedBy INT,

    registrationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    approvalDate DATETIME,

    registrationStatus ENUM('Pending','Approved','Rejected')
        DEFAULT 'Pending',

    remarks TEXT,

    FOREIGN KEY(companyID)
        REFERENCES Companies(companyID),

    FOREIGN KEY(submittedBy)
        REFERENCES Users(userID),

    FOREIGN KEY(approvedBy)
        REFERENCES Users(userID)
);

-- ==========================
-- 7. ANNOUNCEMENTS
-- ==========================
CREATE TABLE Announcements (

    announcementID INT PRIMARY KEY AUTO_INCREMENT,

    companyID INT,

    postedBy INT NOT NULL,

    title VARCHAR(200),

    announcement TEXT,

    targetAudience ENUM(
        'All',
        'Applicants',
        'Employers',
        'Employees',
        'Admins'
    ),

    publishDate DATETIME,

    expiryDate DATETIME,

    announcementStatus ENUM(
        'Draft',
        'Published',
        'Expired'
    ) DEFAULT 'Draft',

    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,

    FOREIGN KEY(companyID)
        REFERENCES Companies(companyID),

    FOREIGN KEY(postedBy)
        REFERENCES Users(userID)
);

-- ==========================
-- 8. COMPLAINTS
-- ==========================
CREATE TABLE Complaints (

    complaintID INT PRIMARY KEY AUTO_INCREMENT,

    submittedBy INT NOT NULL,

    assignedTo INT,

    companyID INT,

    subject VARCHAR(200),

    complaint TEXT,

    complaintCategory VARCHAR(100),

    priority ENUM(
        'Low',
        'Medium',
        'High',
        'Urgent'
    ) DEFAULT 'Medium',

    complaintStatus ENUM(
        'Pending',
        'In Progress',
        'Resolved',
        'Closed'
    ) DEFAULT 'Pending',

    resolution TEXT,

    submittedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    resolvedAt DATETIME,

    FOREIGN KEY(submittedBy)
        REFERENCES Users(userID),

    FOREIGN KEY(assignedTo)
        REFERENCES Users(userID),

    FOREIGN KEY(companyID)
        REFERENCES Companies(companyID)
);

-- ==========================
-- 9. NOTIFICATIONS
-- ==========================
CREATE TABLE Notifications (

    notificationID INT PRIMARY KEY AUTO_INCREMENT,

    userID INT NOT NULL,

    title VARCHAR(200),

    message TEXT,

    notificationType VARCHAR(50),

    isRead BOOLEAN DEFAULT FALSE,

    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY(userID)
        REFERENCES Users(userID)
);

-- ==========================
-- 10. SYSTEM_SETTINGS
-- ==========================
CREATE TABLE System_Settings (

    settingID INT PRIMARY KEY AUTO_INCREMENT,

    settingName VARCHAR(100) UNIQUE,

    settingValue TEXT,

    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP
);

-- DEFAULT ROLES
INSERT INTO Roles(roleName,roleDescription) VALUES
('Administrator','System administrator'),
('Employer','Company account'),
('Employee','Employee account'),
('Applicant','Job seeker');



ALTER TABLE