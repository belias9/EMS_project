 DROP TABLE IF EXISTS Applicants;

 -- 1. APPLICANTS TABLE
 USE nexora;

 CREATE TABLE Applicants (
    applicantID INT PRIMARY KEY AUTO_INCREMENT,
    userID INT UNIQUE,
    applicantTypeID INT,
    firstName VARCHAR(100) NOT NULL,
    lastName VARCHAR(100) NOT NULL,
    gender ENUM('Male','Female','Other'),
    dateOfBirth DATE,
    nationality VARCHAR(100),
    phoneNumber VARCHAR(20),
    email VARCHAR(100) UNIQUE NOT NULL,
    address TEXT,
    city VARCHAR(100),
    region VARCHAR(100),
    country VARCHAR(100),
    professionalSummary TEXT,
    yearsOfExperience INT DEFAULT 0,
    profilePhoto VARCHAR(255),
    applicationStatus ENUM('Active','Inactive','Blocked') DEFAULT 'Active',
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
 );
 
 DROP TABLE IF EXISTS Applicant_Types;
 -- 2. APPLICANT_TYPES
 CREATE TABLE Applicant_Types (
    applicantTypeID INT PRIMARY KEY AUTO_INCREMENT,
    typeName VARCHAR(50) NOT NULL,
    description TEXT
 );

 -- 3. SKILLS
 USE ems;

 CREATE TABLE Skills (
    skillID INT PRIMARY KEY AUTO_INCREMENT,
    skillName VARCHAR(100) NOT NULL,
    skillCategory VARCHAR(100),
    description TEXT,
    status ENUM('Active','Inactive') DEFAULT 'Active',
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
 );

 -- 4. APPLICANT_SKILLS
 CREATE TABLE Applicant_Skills (
    applicantSkillID INT PRIMARY KEY AUTO_INCREMENT,
    applicantID INT NOT NULL,
    skillID INT NOT NULL,
    proficiencyLevel ENUM('Beginner','Intermediate','Advanced','expert') DEFAULT 'Intermediate',
    yearsOfExperience DECIMAL(3,1) DEFAULT 0.0,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (applicantID) REFERENCES Applicants(applicantID) ON DELETE CASCADE,
    FOREIGN KEY (skillID) REFERENCES Skills(skillID) ON DELETE CASCADE 
 );

 -- 5. EDUCATION
 CREATE TABLE Education (
    educationID INT PRIMARY KEY AUTO_INCREMENT,
    applicantID INT NOT NULL,
    institutionName VARCHAR(200) NOT NULL,
    qualification VARCHAR(200),
    fieldOfStudy VARCHAR(200),
    educationLevel ENUM('High School','Diploma','Bachelors','Masters','PhD','Other'),
    startDate DATE,
    endDate DATE,
    grade VARCHAR(50),
    certificateFile VARCHAR(255),
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (applicantID) REFERENCES Applicants(applicantID) ON DELETE CASCADE
 );

 -- 6. WORK_EXPERIENCE
 CREATE TABLE Work_Experience (
    experienceID INT PRIMARY KEY AUTO_INCREMENT,
    applicantID INT NOT NULL,
    companyName VARCAHR(200) NOT NULL,
    jobTitle VARCAHR(200) NOT NULL,
    employmentType ENUM('Full-time','Part-time','Contract','internship','Freelance'),
    startDate DATE,
    currentlyWorking BOOLEAN DEFAULT FALSE,
    responsibilties TEXT,
    supervisorName VARCAHR(100),
    ctreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (applicantID) REFERENCES Aplicants(applicantID) ON DELETE CASCADE
 );

 -- 7. APPLICANT_DOCUMENTS
 CREATE TABLE Applicant_Documents (
    documentID INT PRIMARY KEY AUTO_INCREMENT,
    applicantID INT NOT NULL,
    documenttype ENUM('CV','Cover Letter','Certificate','ID','Other') NOT NULL,
    documentTitle VARCAHR(200),
    filePath VARCHAR(255) NOT NULL,
    uploadDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    verificationStatus ENUM('Pending','Verified','Rejected') DEFAULT 'Pending',
    remarks TEXT,
    FOREIGN KEY (applicantID) REFERENCES Applicants(applicantID) ON DELETE CASCADE
 );

 -- 8. TALENT_POSTS
 CREATE TABLE Talent_Posts (
    talentPostID INT PRIMARY KEY AUTO_INCREMENT,
    applicantID INT NOT NULL,
    title VARCHAR(200) NOT NULL,
    description TEXT NOT NULL,
    category INT,
    availabilityType ENUM('Remote','On-site','Hybrid','part-time','Full-time') NOT NULL,
    location VARCHAR(200),
    status ENUM('Active','Inactive') DEFAULT 'Active',
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (applicantID) REFERENCES Applicants(applicantID) ON DELETE CASCADE
 );

 -- 9. CV_PROFILE
 CREATE TABLE CV_Profile (
    cvID INT PRIMARY KEY AUTO_INCREMENT,
    applicantID INT NOT NULL,
    templateName VARCHAR(100) DEFAULT 'Standard',
    generatedFile VARCHAR(255),
    createdDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (applicantID) REFERENCES Applicants(applicantID) ON DELETE CASCADE
 );
 -- 10. APPLICANT_PREFERENCES
 CREATE TABLE Applicant_Preferences (
    preferenceID INT PRIMARY KEY AUTO_INCREMENT,
    applicantID INT NOT NULL,
    jobTypeID INT NOT NULL,
    preferredLocation VARCHAR(200),
    preferredIndustry VARCHAR(200),
    expectedsalaryMin DECIMAL(10,2),
    expectedsalaryMax DECIMAL(10,2),
    ctreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (applicantID) REFERENCES Applicants(applicantID) ON DELETE CASCADE
 );

 -- 11. SAVED_JOBS
 CREATE TABLE Saved_Jobs (
    savedjobID INT PRIMARY KEY AUTO_INCREMENT,
    applicantID INT NOT NULL,
    vacancyID INT NOT NULL,
    savedDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (applicantID) REFERENCES Applicants(applicantID) ON DELETE CASCADE
 );

 -- 12. JOB_APPLICATIONS (Updated with proper references)
 CREATE TABLE Job_Applications (
    applicationID INT PRIMARY KEY AUTO_INCREMENT,
    applicantID INT NOT NULL,
    vacancyID INT NOT NULL,
    statusID INT,
    applicationDate TIMESTAMP DEFAULT
    coverLetter TEXT,
    employerRemarks TEXT,
    applicantRemarks TEXT,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (applicantID) REFERENCES Applicants(applicantID) ON DELETE CASCADE
 );

 -- 13. MESSAGES
 CREATE TABLE Messages (
    messageID INT PRIMARY KEY AUTO_INCREMENT,
    senderUserID INT NOT NULL,
    receiverUserID INT NOT NULL,
    subject VARCAHR(200),
    message TEXT NOT NULL,
    attachment VARCHAR(255),
    isRead BOOLEAN DEFAULT FALSE,
    sentAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_sender_user FOREIGN KEY(senderUserID) REFERENCES users(userID),
    CONSTRAINT fk_receiver_user FOREIGN KEY(receiverUserID) REFERENCES users(userID)
 );

 -- Insert some sample skills
 INSERT INTO SKILLS (skillName, skillCategory) VALUES
 ('HTML/CSS','Web Development'),
 ('JavaScript','Web Development'),
 ('Python','Programming',)
 ('PHP','Web Development'),
 ('Java','Programming'),
 ('Graphic Design','Design'),
 ('UI/UX Design','Design'),
 ('Project Manager','Management'),
 ('Data Analysis','Data'),
 ('Machine Learning','Data'),
 ('Digital Marketing','Marketing'),
 ('SEO','Marketing');


