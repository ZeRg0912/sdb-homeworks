### Задание 1

Получите уникальные названия районов из таблицы с адресами, которые начинаются на “K” и заканчиваются на “a” и не содержат пробелов.

**Ответ**

![](img/image1.png)

SQL-script:
```
SELECT DISTINCT district
FROM sakila.address
WHERE district LIKE 'K%a'
  AND district NOT LIKE '% %';
```

---

### Задание 2

Получите из таблицы платежей за прокат фильмов информацию по платежам, которые выполнялись в промежуток с 15 июня 2005 года по 18 июня 2005 года **включительно** и стоимость которых превышает 10.00.

**Ответ**

![](img/image2.png)

SQL-script:
```
SELECT *
FROM sakila.payment
WHERE payment_date >= '2005-06-15'
  AND payment_date < '2005-06-19'
  AND amount > 10.00;
```

---

### Задание 3

Получите последние пять аренд фильмов.

**Ответ**

![](img/image3.png)

SQL-script:
```
SELECT *
FROM sakila.rental
ORDER BY rental_date DESC
LIMIT 5;
```

---

### Задание 4

Одним запросом получите активных покупателей, имена которых Kelly или Willie. 

Сформируйте вывод в результат таким образом:
- все буквы в фамилии и имени из верхнего регистра переведите в нижний регистр,
- замените буквы 'll' в именах на 'pp'.

**Ответ**

![](img/image4.png)

SQL-script:
```
SELECT
    REPLACE(LOWER(first_name), 'll', 'pp') AS first_name,
    LOWER(last_name) AS last_name
FROM sakila.customer
WHERE active = 1
  AND first_name IN ('Kelly', 'Willie');
```

---

### Задание 5*

Выведите Email каждого покупателя, разделив значение Email на две отдельных колонки: в первой колонке должно быть значение, указанное до @, во второй — значение, указанное после @.

**Ответ**

![](img/image5.png)

SQL-script:
```
SELECT
    SUBSTRING_INDEX(email, '@', 1) AS before_at,
    SUBSTRING_INDEX(email, '@', -1) AS after_at
FROM sakila.customer;
```

---

### Задание 6*

Доработайте запрос из предыдущего задания, скорректируйте значения в новых колонках: первая буква должна быть заглавной, остальные — строчными.

**Ответ**

![](img/image6.png)

SQL-script:
```
SELECT
    CONCAT(
        UPPER(LEFT(SUBSTRING_INDEX(email, '@', 1), 1)),
        LOWER(SUBSTRING(SUBSTRING_INDEX(email, '@', 1), 2))
    ) AS before_at,
    CONCAT(
        UPPER(LEFT(SUBSTRING_INDEX(email, '@', -1), 1)),
        LOWER(SUBSTRING(SUBSTRING_INDEX(email, '@', -1), 2))
    ) AS after_at
FROM sakila.customer;
```