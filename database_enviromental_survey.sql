create database environmental_survey

use  environmental_survey

   CREATE TABLE Users (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Email NVARCHAR(150) UNIQUE NOT NULL DEFAULT '',
    Password NVARCHAR(255) NOT NULL,
    Role NVARCHAR(20) NOT NULL CHECK (Role IN ('Student', 'Faculty')),
    RollNo NVARCHAR(50) NULL,     
    Class NVARCHAR(50) NULL,        
    Specification NVARCHAR(100) NULL,
    Section NVARCHAR(50) NULL,
    AdmissionDate DATE NULL,        
    EmployeeNo NVARCHAR(50) NULL,  
    Department NVARCHAR(100) NULL,
    Qualification NVARCHAR(100) NULL,
    JoiningDate DATE NULL,          
    Status NVARCHAR(20) DEFAULT 'Pending', 
   CreatedAt DATETIME DEFAULT GETDATE()
);
CREATE TABLE Surveys (
    SurveyID INT IDENTITY(1,1) PRIMARY KEY,
    Title NVARCHAR(200) NOT NULL,
    Description NVARCHAR(MAX),
    TargetRole NVARCHAR(20) NOT NULL CHECK (TargetRole IN ('Student', 'Faculty')),
    CreatedDate DATETIME DEFAULT GETDATE(),
    IsActive BIT DEFAULT 1
);

CREATE TABLE SurveyQuestions (
    QuestionID INT IDENTITY(1,1) PRIMARY KEY,
    SurveyID INT NOT NULL,
    QuestionText NVARCHAR(MAX) NOT NULL,
    FOREIGN KEY (SurveyID) REFERENCES Surveys(SurveyID) ON DELETE CASCADE
);

CREATE TABLE SurveyOptions (
    OptionID INT IDENTITY(1,1) PRIMARY KEY,
    QuestionID INT NOT NULL,
    OptionText NVARCHAR(500) NOT NULL,
    IsCorrect BIT DEFAULT 0,  -- agar future me correct option rakhna ho
    FOREIGN KEY (QuestionID) REFERENCES SurveyQuestions(QuestionID) ON DELETE CASCADE
);

CREATE TABLE SurveyResponses (
    ResponseID INT IDENTITY(1,1) PRIMARY KEY,
    SurveyID INT NOT NULL,
    QuestionID INT NULL,
    UserID INT NOT NULL,
	OptionID INT NOT NULL,

    ResponseText NVARCHAR(MAX),
    SubmittedDate DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (SurveyID) REFERENCES Surveys(SurveyID) ON DELETE CASCADE,
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE,
    FOREIGN KEY (QuestionID) REFERENCES SurveyQuestions(QuestionID) ON DELETE NO ACTION,
	FOREIGN KEY (OptionID) REFERENCES SurveyOptions(OptionID) ON DELETE NO ACTION
);

CREATE TABLE Competitions (
    CompetitionID INT IDENTITY(1,1) PRIMARY KEY,
    Title NVARCHAR(200),
    Description NVARCHAR(MAX),
    WinnerUserID INT FOREIGN KEY REFERENCES Users(UserID),
    CompetitionDate DATE DEFAULT GETDATE()
);
CREATE TABLE EffectiveParticipation (
    ParticipationID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT FOREIGN KEY REFERENCES Users(UserID),
    SeminarTitle NVARCHAR(200),
    Location NVARCHAR(200),
    ParticipantsCount INT,
    ConductedDate DATE,
    CreatedDate DATETIME DEFAULT GETDATE()
);
CREATE TABLE FAQs (
    FAQID INT IDENTITY(1,1) PRIMARY KEY,
    Question NVARCHAR(500),
    Answer NVARCHAR(MAX)
);
CREATE TABLE SupportInfo (
    SupportID INT IDENTITY(1,1) PRIMARY KEY,
    ContactPerson NVARCHAR(100),
    Email NVARCHAR(100),
    Phone NVARCHAR(20),
    Description NVARCHAR(MAX)
);
CREATE TABLE Admins (
    AdminID INT IDENTITY(1,1) PRIMARY KEY,
    Email NVARCHAR(150) UNIQUE NOT NULL,
    PasswordHash NVARCHAR(255) NOT NULL, -- plain for now, hash later

    LastLogin DATETIME NULL
);

INSERT INTO Admins (Email, PasswordHash)
VALUES ('admin@gmail.com', 'admin123');

select* from Admins
select* from Users
select* from Surveys
select* from Competitions
select* from SupportInfo
select* from SurveyQuestions
select* from SurveyOptions
select* from SurveyResponses
select* from FAQs
select* from EffectiveParticipation





