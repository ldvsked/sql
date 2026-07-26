# SQL Bootcamp — Базы данных

Коллекция из 12 проектов по SQL, выполненных в процессе обучения в School21 (Ecole 42). Проекты охватывают широкий спектр тем: от основ SQL до построения хранилищ данных и оптимизации запросов.

---

## О проекте

В рамках курса я изучала и применяла на практике различные аспекты работы с базами данных. Это серия из 12 самостоятельных и групповых работ, каждая из которых посвящена определенной теме. Я решала реальные задачи, связанные с созданием схем баз данных, написанием запросов разной сложности, оптимизацией производительности и работой с данными в многопользовательской среде.

**Общая модель данных:** база данных пиццерий (5 таблиц: `pizzeria`, `person`, `menu`, `person_visits`, `person_order`), которая используется во всех проектах.

---

## Список проектов

| № | Проект | Описание | Заданий |
|---|--------|----------|---------|
| 1 | SQLB1_Basics | Базовые SELECT-запросы, фильтрация, сортировка, подзапросы, вычисляемые поля, условная логика (CASE), диапазоны дат | 10 |
| 2 | SQLB2_Retrieving_data | Операторы множеств (UNION, EXCEPT, INTERSECT), JOIN, Cartesian Product, IN vs EXISTS | 11 |
| 3 | SQLB3_Retrieving_data | Реляционная алгебра, типы соединений (LEFT/RIGHT/FULL/CROSS), CTE, работа с NULL | 11 |
| 4 | SQLB4_DML | INSERT, UPDATE, DELETE, каскадные операции, подзапросы в DML | 14 |
| 5 | SQLB5_Snapshots | Views, Materialized Views, фильтрация, симметрическая разность множеств | 9 |
| 6 | SQLB6_Salesman_problem | Задача коммивояжёра, рекурсивные CTE, поиск маршрутов (групповой) | 2 |
| 7 | SQLB7_Database_index | BTree-индексы, функциональные и многоколоночные индексы, EXPLAIN ANALYZE | 7 |
| 8 | SQLB8_Integrating_features | Ограничения (FK, NOT NULL, CHECK, UNIQUE), оконные функции, последовательности | 7 |
| 9 | SQLB9_OLAP | Агрегатные функции, GROUP BY, HAVING, статистика, средние рейтинги | 10 |
| 10 | SQLB10_Isolation_levels | Транзакции, аномалии, уровни изоляции (Read Committed, Repeatable Read, Serializable), deadlock | 8 |
| 11 | SQLB11_Functions_and_procs | UDF на SQL и PL/pgSQL, триггеры, аудит, параметризованные функции | 9 |
| 12 | SQLB12_Warehouse_fundamentals | DWH, ETL-процесс, несколько источников данных, конвертация валют, обработка аномалий (групповой) | 2 |

**Итого:** 12 проектов, **100 заданий**

---

## Технологии и инструменты

- **СУБД:** PostgreSQL
- **Язык:** SQL, PL/pgSQL
- **Инструменты:** DBeaver, psql, командная строка Linux
- **Система контроля версий:** Git
- **Среда выполнения:** Удаленные серверы School21, терминал Linux

---

## Структура репозитория

```
sql/
├── SQLB1_Basics/
├── SQLB2_Retrieving_data/
├── SQLB3_Retrieving_data/
├── SQLB4_DML/
├── SQLB5_Snapshots/
├── SQLB6_Salesman_problem/
├── SQLB7_Database_index/
├── SQLB8_Integrating_features/
├── SQLB9_OLAP/
├── SQLB10_Isolation_levels/
├── SQLB11_Functions_and_procs/
└── SQLB12_Warehouse_fundamentals/
```

Каждый проект содержит файлы с решениями заданий, SQL-скрипты и при необходимости вспомогательные материалы.

---

## Как использовать

1. Клонируйте репозиторий:
```bash
git clone https://github.com/ldvsked/sql.git
```

2. Перейдите в папку нужного проекта:
```bash
cd sql/SQLB1_Basics
```

3. Изучите SQL-файлы с решениями

4. Для запуска запросов используйте PostgreSQL:
```bash
psql -d your_database -f solution.sql
```
