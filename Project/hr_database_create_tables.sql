-- 1. Department Table
CREATE TABLE Department (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);

-- 2. Position Table
CREATE TABLE JOB_TITLE (
    job_title_id INT PRIMARY KEY,
    department_id INT NOT NULL,
    position_name VARCHAR(100) NOT NULL,
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

-- 3. Gender Table
CREATE TABLE Gender (
    gender_id INT PRIMARY KEY,
    gender_label VARCHAR(20) NOT NULL
);

-- 4. Employment_Status Table
CREATE TABLE Employment_Status (
    status_id INT PRIMARY KEY,
    status_label VARCHAR(50) NOT NULL
);

-- 5. Education Table
CREATE TABLE Education (
    education_id INT PRIMARY KEY,
    education_level VARCHAR(50) NOT NULL
);

-- 6. Performance_Rating Table
CREATE TABLE Performance_Rating (
    rating_id INT PRIMARY KEY,
    category VARCHAR(50) NOT NULL
);

-- 7. Turnover_Reason Table
CREATE TABLE Turnover_Reason (
    reason_id INT PRIMARY KEY,
    reason_label VARCHAR(100) NOT NULL,
    reason_category VARCHAR(50) NOT NULL
);

-- 8. Employee Table
CREATE TABLE Employee (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender_id INT NOT NULL,
    status_id INT NOT NULL,
    hire_date DATE NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    job_title_id INT NOT NULL,
    education_id INT NOT NULL,
    manager_id INT,  -- Nullable (only for certain roles)
    FOREIGN KEY (gender_id) REFERENCES Gender(gender_id),
    FOREIGN KEY (status_id) REFERENCES Employment_Status(status_id),
    FOREIGN KEY (job_title_id) REFERENCES JOB_TITLE(job_title_id),
    FOREIGN KEY (education_id) REFERENCES Education(education_id),
    FOREIGN KEY (manager_id) REFERENCES Employee(employee_id)
);

-- 9. Salary Table
CREATE TABLE Salary (
    salary_id INT PRIMARY KEY,
    employee_id INT NOT NULL,
    base_salary DECIMAL(10, 2) NOT NULL,
    bonus DECIMAL(10, 2) NOT NULL,
    effective_date DATE NOT NULL,
    end_date DATE,  -- Nullable for current salary
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
);

-- 10. Performance Table
CREATE TABLE Performance (
    performance_id INT PRIMARY KEY,
    employee_id INT NOT NULL,
    review_period VARCHAR(20) NOT NULL,
    performance_score INT NOT NULL,
    kpi_score FLOAT,
    feedback_notes TEXT,
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
);

-- 11. Turnover Table
CREATE TABLE Turnover (
    turnover_id INT PRIMARY KEY,
    employee_id INT NOT NULL,
    termination_date DATE NOT NULL,
    reason_id INT NOT NULL,
    exit_interview_notes TEXT,
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id),
    FOREIGN KEY (reason_id) REFERENCES Turnover_Reason(reason_id)
);