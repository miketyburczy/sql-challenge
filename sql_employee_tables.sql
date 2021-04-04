CREATE TABLE "Employees" (
    "Emp_no" VARCHAR(50)   NOT NULL,
    "Emp_title_id" VARCHAR(50)   NOT NULL,
    "Birth_date" DATE   NOT NULL,
    "First_name" VARCHAR(50)   NOT NULL,
    "Last_name" VARCHAR(50)   NOT NULL,
    "sex" VARCHAR(1)   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "Emp_no"
     )
);

CREATE TABLE "Departments" (
    "dept_no" VARCHAR(50)   NOT NULL,
    "dept_name" VARCHAR(50)   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "Dept_emp" (
    "Emp_no" VARCHAR(50)   NOT NULL UNIQUE,
    "Dept_no" VARCHAR(50)   NOT NULL UNIQUE,
    CONSTRAINT "pk_Dept_emp" PRIMARY KEY (
        "Emp_no","Dept_no"
     )
);

CREATE TABLE "Dept_manager" (
    "Dept_no" VARCHAR(50)   NOT NULL,
    "Emp_no" VARCHAR(50)   NOT NULL,
    CONSTRAINT "pk_Dept_manager" PRIMARY KEY (
        "Dept_no","Emp_no"
     )
);


CREATE TABLE "Salaries" (
    "Emp_no" VARCHAR(50)   NOT NULL UNIQUE,
    "Salary" int   NOT NULL UNIQUE,
    CONSTRAINT "pk_Salaries" PRIMARY KEY (
        "Emp_no","Salary"
     )
);

CREATE TABLE "Titles" (
    "Emp_title_id" VARCHAR(50)  NOT NULL,
    "title" VARCHAR(50)   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "Emp_title_id"
     )
);

ALTER TABLE "Departments" ADD CONSTRAINT "fk_Departments_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Dept_emp" ("Dept_no");

ALTER TABLE "Dept_emp" ADD CONSTRAINT "fk_Dept_emp_Emp_no" FOREIGN KEY("Emp_no")
REFERENCES "Employees" ("Emp_no");

ALTER TABLE "Dept_manager" ADD CONSTRAINT "fk_Dept_manager_Dept_no" FOREIGN KEY("Dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Dept_manager" ADD CONSTRAINT "fk_Dept_manager_Emp_no" FOREIGN KEY("Emp_no")
REFERENCES "Employees" ("Emp_no");

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_Emp_no" FOREIGN KEY("Emp_no")
REFERENCES "Salaries" ("Emp_no");

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_Emp_title_id" FOREIGN KEY("Emp_title_id")
REFERENCES "Titles" ("Emp_title_id");