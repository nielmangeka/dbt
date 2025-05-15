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
* Access to a terminal or command prompt.

---

## 📥 Installation

### 1. Install DBT

You can follow the official documentation for installation guidance. In this project, I used **DBT Core with the Postgres adapter**, but you can choose the adapter that fits your own data warehouse setup.

🔗 [DBT Installation Guide](https://docs.getdbt.com/docs/core/pip-install#installing-the-adapter)

### 2. Configure Database Connection

* Create or update your `profiles.yml` file (usually located at `~/.dbt/profiles.yml`) to connect to your PostgreSQL database.
* Ensure your connection details (host, database, user, password, port, schema/database name for dbt) are correct and match the configuration expected by this dbt project (check `dbt_project.yml` if unsure).

---

## ▶️ How to Run the Project

Follow these steps to set up and run the dbt project locally:

1.  **Clone the repository** (if not already done):
    ```bash
    git clone <repository_url>
    cd dbt-learn
    ```
    (Replace `<repository_url>` with the actual URL of your project repository)

2.  **Install dbt dependencies:**
    Navigate to the project root directory (`dbt-learn/`) in your terminal and run:
    ```bash
    dbt deps
    ```
    This will install any required packages listed in `packages.yml`.

3.  **Load seed data:**
    This project uses CSV files as source data, located in the `seeds` directory. Load this data into your `raw` schema by running:
    ```bash
    dbt seed
    ```

4.  **Run dbt models:**
    Execute the dbt models to perform the transformations and build your staging and mart tables:
    ```bash
    dbt run
    ```

5.  **Test your data:**
    After running the models, it's good practice to run tests to ensure data quality:
    ```bash
    dbt test
    ```

---

## 🗂️ Project Architecture & Structure

This project simulates a basic data pipeline and warehousing flow using **PostgreSQL** and **dbt**.

### 📚 Data Sources

The raw data for this project is provided as **CSV files** included in the `seeds` directory. These files simulate data coming from different source systems:

* `users.csv`: Contains user information.
* `cards.csv`: Contains details about different card types.
* `transactions.csv`: Contains transaction records.

When you run `dbt seed`, these CSV files are loaded directly into tables within the `raw` schema in your PostgreSQL database.

### 🏗️ DBT Project Structure

The core transformation logic resides in the `models` directory, organized by the data layers: