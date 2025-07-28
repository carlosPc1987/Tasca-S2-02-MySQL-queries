# Tasca-S2-02-MySQL-queries


```text
//=============================\
|| Crafted with 💛 by Carlos ||
||    and approved by 🦆     ||
\=============================//
```

# SQL Projects: University and Store Databases

##  University Database

This project builds a relational database for a university system. It models key academic entities and operations, including departments, students, professors, courses, enrollment, and academic years.

###  Features

- Management of people (`persona`) with attributes like name, date of birth, gender, and role (student/professor).
- Department structure (`departamento`) to organize professors.
- Degree programs (`grado`) and detailed subjects (`asignatura`) with credit distribution and curriculum layout.
- Academic year tracking (`curso_escolar`) and enrollment mapping (`alumno_se_matricula_asignatura`).
- Referential integrity through foreign keys and ENUM types to constrain values.

###  Sample Queries (Highlights)

- List all students sorted by surnames and name.
- Find students born in a specific year or lacking a phone number.
- Retrieve professors without assigned departments or teaching responsibilities.
- Identify departments with or without assigned professors or subject involvement.
- Analyze enrollment trends per course, student, or degree.

---

##  Store Database *(assuming typical structure)*

This project defines a database for managing a retail store. It tracks product inventory, customer data, orders, and sales transactions.

###  Features

- Product catalog: item name, price, category, and stock.
- Customer registry: contact details and purchase history.
- Order management: linking orders to customers and purchased items.
- Sales analytics: revenue tracking, best-selling items, and customer behavior.

###  Example Extensions

- List products with low stock.
- Find top customers by total purchase amount.
- Track daily, monthly, or yearly sales trends.
- Apply constraints to ensure data consistency and traceability.

---

##  Technologies

- **SQL**: schema creation, data manipulation (DML), and queries.
- **MySQL / MariaDB compatible**.
- **Normalization** principles applied to avoid redundancy.

##  How to Use

1. Import schema using SQL scripts.
2. Insert sample data (`INSERT INTO ...`) to populate tables.
3. Run queries to analyze or report on the data.
4. Expand with views, stored procedures or triggers if needed.

---

##  Author


```text
//=============================\
|| Crafted with 💛 by Carlos ||
||    and approved by 🦆     ||
\=============================//
```


