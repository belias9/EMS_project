-- ============================================================
-- Recruitment Management System - Member 3 Database Schema
-- Compatible with MySQL 5.7+ / MariaDB 10.2+
-- ============================================================

-- Support table: Users (shared across system)
CREATE TABLE IF NOT EXISTS Users (
    userID INT AUTO_INCREMENT PRIMARY KEY,
    fullName VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    passwordHash VARCHAR(255) NOT NULL,
    userRole ENUM('SuperAdmin','Admin','Employer','Applicant','Employee') DEFAULT 'Applicant',
    profilePhoto VARCHAR(255),
    phone VARCHAR(20),
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- Support table: Applicants (for job applications)
CREATE TABLE IF NOT EXISTS Applicants (
    applicantID INT AUTO_INCREMENT PRIMARY KEY,
    userID INT NOT NULL,
    headline VARCHAR(150),
    summary TEXT,
    currentSalary DECIMAL(12,2),
    expectedSalary DECIMAL(12,2),
    availability ENUM('Immediate','Within 1 month','Within 3 months','Negotiable') DEFAULT 'Negotiable',
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (userID) REFERENCES Users(userID) ON DELETE CASCADE
) ENGINE=InnoDB;

-- 1. Companies
ALTER TABLE Companies(
    taxNumber VARCHAR(50),
)

-- 2. Company_Branches
CREATE TABLE IF NOT EXISTS Company_Branches (
    branchID INT AUTO_INCREMENT PRIMARY KEY,
    companyID INT NOT NULL,
    branchName VARCHAR(100) NOT NULL,
    address VARCHAR(255),
    city VARCHAR(80),
    region VARCHAR(80),
    country VARCHAR(80),
    phone VARCHAR(25),
    branchStatus ENUM('Active','Inactive') DEFAULT 'Active',
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (companyID) REFERENCES Companies(companyID) ON DELETE CASCADE
) ENGINE=InnoDB;

-- 3. Employers (users linked to a company with employer role)
CREATE TABLE IF NOT EXISTS Employers (
    employerID INT AUTO_INCREMENT PRIMARY KEY,
    userID INT NOT NULL,
    companyID INT NOT NULL,
    jobTitle VARCHAR(100),
    employerStatus ENUM('Active','Inactive') DEFAULT 'Active',
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (userID) REFERENCES Users(userID) ON DELETE CASCADE,
    FOREIGN KEY (companyID) REFERENCES Companies(companyID) ON DELETE CASCADE
) ENGINE=InnoDB;

-- 4. Departments
CREATE TABLE IF NOT EXISTS Departments (
    departmentID INT AUTO_INCREMENT PRIMARY KEY,
    companyID INT NOT NULL,
    departmentName VARCHAR(100) NOT NULL,
    departmentCode VARCHAR(20) UNIQUE,
    description TEXT,
    managerID INT,
    status ENUM('Active','Inactive') DEFAULT 'Active',
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (companyID) REFERENCES Companies(companyID) ON DELETE CASCADE,
    FOREIGN KEY (managerID) REFERENCES Employers(employerID) ON DELETE SET NULL
) ENGINE=InnoDB;

-- 5. Job_Positions
CREATE TABLE IF NOT EXISTS Job_Positions (
    positionID INT AUTO_INCREMENT PRIMARY KEY,
    companyID INT NOT NULL,
    departmentID INT,
    positionName VARCHAR(100) NOT NULL,
    description TEXT,
    minimumSalary DECIMAL(12,2),
    maximumSalary DECIMAL(12,2),
    status ENUM('Active','Inactive') DEFAULT 'Active',
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (companyID) REFERENCES Companies(companyID) ON DELETE CASCADE,
    FOREIGN KEY (departmentID) REFERENCES Departments(departmentID) ON DELETE SET NULL
) ENGINE=InnoDB;

-- 6. Job_Categories
CREATE TABLE IF NOT EXISTS Job_Categories (
    categoryID INT AUTO_INCREMENT PRIMARY KEY,
    categoryName VARCHAR(80) NOT NULL UNIQUE,
    description TEXT,
    status ENUM('Active','Inactive') DEFAULT 'Active',
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- 7. Job_Types
CREATE TABLE IF NOT EXISTS Job_Types (
    jobTypeID INT AUTO_INCREMENT PRIMARY KEY,
    typeName VARCHAR(60) NOT NULL UNIQUE,
    description TEXT,
    status ENUM('Active','Inactive') DEFAULT 'Active',
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- 8. Job_Vacancies
CREATE TABLE IF NOT EXISTS Job_Vacancies (
    vacancyID INT AUTO_INCREMENT PRIMARY KEY,
    companyID INT NOT NULL,
    branchID INT,
    departmentID INT,
    positionID INT,
    categoryID INT,
    jobTypeID INT,
    postedBy INT NOT NULL,
    jobTitle VARCHAR(150) NOT NULL,
    jobDescription TEXT,
    responsibilities TEXT,
    requirements TEXT,
    experienceRequired VARCHAR(100),
    educationRequired VARCHAR(100),
    vacancies INT DEFAULT 1,
    salaryMin DECIMAL(12,2),
    salaryMax DECIMAL(12,2),
    applicationDeadline DATE,
    location VARCHAR(150),
    vacancyStatus ENUM('Draft','Published','Closed','Archived') DEFAULT 'Draft',
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (companyID) REFERENCES Companies(companyID) ON DELETE CASCADE,
    FOREIGN KEY (branchID) REFERENCES Company_Branches(branchID) ON DELETE SET NULL,
    FOREIGN KEY (departmentID) REFERENCES Departments(departmentID) ON DELETE SET NULL,
    FOREIGN KEY (positionID) REFERENCES Job_Positions(positionID) ON DELETE SET NULL,
    FOREIGN KEY (categoryID) REFERENCES Job_Categories(categoryID) ON DELETE SET NULL,
    FOREIGN KEY (jobTypeID) REFERENCES Job_Types(jobTypeID) ON DELETE SET NULL,
    FOREIGN KEY (postedBy) REFERENCES Employers(employerID) ON DELETE CASCADE
) ENGINE=InnoDB;

-- 9. Application_Status (lookup table)
CREATE TABLE IF NOT EXISTS Application_Status (
    statusID INT AUTO_INCREMENT PRIMARY KEY,
    statusName VARCHAR(50) NOT NULL UNIQUE,
    description TEXT
) ENGINE=InnoDB;

-- Insert default statuses
INSERT INTO Application_Status (statusName, description) VALUES
('Pending', 'Application received, awaiting review'),
('Shortlisted', 'Candidate has been shortlisted'),
('Interview', 'Interview has been scheduled'),
('Rejected', 'Application rejected'),
('Offered', 'Job offer sent'),
('Hired', 'Candidate hired'),
('Withdrawn', 'Candidate withdrew application');

-- 10. Job_Applications
CREATE TABLE IF NOT EXISTS Job_Applications (
    applicationID INT AUTO_INCREMENT PRIMARY KEY,
    applicantID INT NOT NULL,
    vacancyID INT NOT NULL,
    statusID INT NOT NULL DEFAULT 1,
    applicationDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    coverLetter TEXT,
    employerRemarks TEXT,
    applicantRemarks TEXT,
    FOREIGN KEY (applicantID) REFERENCES Applicants(applicantID) ON DELETE CASCADE,
    FOREIGN KEY (vacancyID) REFERENCES Job_Vacancies(vacancyID) ON DELETE CASCADE,
    FOREIGN KEY (statusID) REFERENCES Application_Status(statusID) ON DELETE RESTRICT
) ENGINE=InnoDB;

-- 11. Interviews
CREATE TABLE IF NOT EXISTS Interviews (
    interviewID INT AUTO_INCREMENT PRIMARY KEY,
    applicationID INT NOT NULL,
    interviewerID INT NOT NULL,
    interviewType ENUM('Video Call','In-Person','Phone') NOT NULL,
    interviewDate DATETIME NOT NULL,
    interviewLocation VARCHAR(255),
    meetingLink VARCHAR(255),
    interviewStatus ENUM('Scheduled','Completed','Cancelled','No Show') DEFAULT 'Scheduled',
    notes TEXT,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (applicationID) REFERENCES Job_Applications(applicationID) ON DELETE CASCADE,
    FOREIGN KEY (interviewerID) REFERENCES Employers(employerID) ON DELETE CASCADE
) ENGINE=InnoDB;

-- 12. Interview_Feedback
CREATE TABLE IF NOT EXISTS Interview_Feedback (
    feedbackID INT AUTO_INCREMENT PRIMARY KEY,
    interviewID INT NOT NULL,
    interviewerID INT NOT NULL,
    technicalScore TINYINT CHECK (technicalScore BETWEEN 1 AND 10),
    communicationScore TINYINT CHECK (communicationScore BETWEEN 1 AND 10),
    confidenceScore TINYINT CHECK (confidenceScore BETWEEN 1 AND 10),
    overallScore TINYINT CHECK (overallScore BETWEEN 1 AND 10),
    recommendation ENUM('Strongly Recommend','Recommend','Neutral','Do Not Recommend') NOT NULL,
    strengths TEXT,
    weaknesses TEXT,
    comments TEXT,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (interviewID) REFERENCES Interviews(interviewID) ON DELETE CASCADE,
    FOREIGN KEY (interviewerID) REFERENCES Employers(employerID) ON DELETE CASCADE
) ENGINE=InnoDB;

-- 13. Job_Offers
CREATE TABLE IF NOT EXISTS Job_Offers (
    offerID INT AUTO_INCREMENT PRIMARY KEY,
    applicationID INT NOT NULL,
    offeredBy INT NOT NULL,
    positionID INT,
    departmentID INT,
    offeredSalary DECIMAL(12,2) NOT NULL,
    employmentType ENUM('Full-time Permanent','Part-time','Contract','Temporary') NOT NULL,
    startDate DATE,
    offerDate DATE DEFAULT (CURRENT_DATE),
    expiryDate DATE,
    offerStatus ENUM('Draft','Sent','Accepted','Declined','Expired') DEFAULT 'Draft',
    offerLetter VARCHAR(255),
    remarks TEXT,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (applicationID) REFERENCES Job_Applications(applicationID) ON DELETE CASCADE,
    FOREIGN KEY (offeredBy) REFERENCES Employers(employerID) ON DELETE CASCADE,
    FOREIGN KEY (positionID) REFERENCES Job_Positions(positionID) ON DELETE SET NULL,
    FOREIGN KEY (departmentID) REFERENCES Departments(departmentID) ON DELETE SET NULL
) ENGINE=InnoDB;

-- 14. Messages
CREATE TABLE IF NOT EXISTS Messages (
    messageID INT AUTO_INCREMENT PRIMARY KEY,
    senderUserID INT NOT NULL,
    receiverUserID INT NOT NULL,
    subject VARCHAR(150),
    message TEXT,
    attachment VARCHAR(255),
    isRead BOOLEAN DEFAULT FALSE,
    sentAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    readAt DATETIME,
    messageStatus ENUM('Sent','Delivered','Read','Archived') DEFAULT 'Sent',
    FOREIGN KEY (senderUserID) REFERENCES Users(userID) ON DELETE CASCADE,
    FOREIGN KEY (receiverUserID) REFERENCES Users(userID) ON DELETE CASCADE
) ENGINE=InnoDB;

-- 15. Notifications
CREATE TABLE IF NOT EXISTS Notifications (
    notificationID INT AUTO_INCREMENT PRIMARY KEY,
    userID INT NOT NULL,
    companyID INT,
    type VARCHAR(50) NOT NULL,
    title VARCHAR(150),
    message TEXT,
    isRead BOOLEAN DEFAULT FALSE,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (userID) REFERENCES Users(userID) ON DELETE CASCADE,
    FOREIGN KEY (companyID) REFERENCES Companies(companyID) ON DELETE CASCADE
) ENGINE=InnoDB;

-- 16. Company_Members (NEW ADDITION - Page 33)
CREATE TABLE IF NOT EXISTS Company_Members (
    memberID INT AUTO_INCREMENT PRIMARY KEY,
    companyID INT NOT NULL,
    userID INT NOT NULL,
    memberRole VARCHAR(60) NOT NULL,
    departmentID INT,
    status ENUM('Active','Invited','Inactive','Suspended') DEFAULT 'Invited',
    joinedDate DATE,
    FOREIGN KEY (companyID) REFERENCES Companies(companyID) ON DELETE CASCADE,
    FOREIGN KEY (userID) REFERENCES Users(userID) ON DELETE CASCADE,
    FOREIGN KEY (departmentID) REFERENCES Departments(departmentID) ON DELETE SET NULL
) ENGINE=InnoDB;




-- Indexes for performance
CREATE INDEX idx_job_applications_applicant ON Job_Applications(applicantID);
CREATE INDEX idx_job_applications_vacancy ON Job_Applications(vacancyID);
CREATE INDEX idx_interviews_application ON Interviews(applicationID);
CREATE INDEX idx_interviews_interviewer ON Interviews(interviewerID);
CREATE INDEX idx_messages_sender ON Messages(senderUserID);
CREATE INDEX idx_messages_receiver ON Messages(receiverUserID);
CREATE INDEX idx_notifications_user ON Notifications(userID);
CREATE INDEX idx_company_members_company ON Company_Members(companyID);
CREATE INDEX idx_company_members_user ON Company_Members(userID);
CREATE INDEX idx_job_vacancies_company ON Job_Vacancies(companyID);
CREATE INDEX idx_job_vacancies_status ON Job_Vacancies(vacancyStatus);
