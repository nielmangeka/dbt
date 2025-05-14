# 🧠 dbt-learn

## 🚀 Introduction

Welcome to **dbt-learn** — a mini project created to make productive use of holiday time while diving deeper into modern data tools, especially those commonly used in the data engineering and analytics space.

This project focuses on exploring **DBT (Data Build Tool)** and **PostgreSQL**, aiming to simulate a simple data warehousing flow using modern data transformation practices. It’s also a personal learning journey I’ve long wanted to embark on — and now finally had the time to start!

Any feedback, suggestions, or ideas are very welcome 🙌

---

## ⚙️ Prerequisites

### 🔧 Tools Used

* **DBT Core**
* **PostgreSQL**

---

## 📥 Installation

### 1. Install DBT

You can follow the official documentation for installation guidance. In this project, I used **DBT Core with the Postgres adapter**, but you can choose the adapter that fits your own data warehouse setup.

🔗 [DBT Installation Guide](https://docs.getdbt.com/docs/core/pip-install#installing-the-adapter)

---

## 🗂️ Project Architecture

This project simulates a basic data pipeline and warehousing flow using **PostgreSQL** and **dbt**:

1. **Raw Layer**
   Raw data is stored in a schema called `raw`.

2. **Staging Layer**
   The raw data is cleaned and standardized using **dbt models**, then loaded into staging tables (dimension and fact tables).

3. **Data Mart**
   Final datasets (data marts) are created from the staging layer — ready for analytics and reporting.

> All transformations are written and managed using **dbt**, making the pipeline modular, testable, and production-friendly.

### 🗺️ Data Flow Diagram

![Data Flow Diagram](images.png)

---

## 📫 Feedback

If you have ideas to improve this project, found something unclear, or simply want to connect — feel free to open an issue or message me. This is a learning project, and collaboration is always welcome!

---

Let me know if you want to add more sections like:

* How to run the project
* Example queries or outputs
* DBT model directory structure
* Dataset sources

I'd be happy to help tailor this further.
