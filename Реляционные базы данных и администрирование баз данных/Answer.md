### Задание 1  

1. Установите [Docker](https://www.docker.com/).
2. Выполните: [инструкцию linux post install](https://docs.docker.com/engine/install/linux-postinstall/) 
![](img/image1.png)
3. Запустите образ hello-world  без использования sudo(см п2).
![](img/image2.png)
4. Удалите ваш контейнер с hello-world.
docker rmi -f hello-world

---

### Задание 2

1. Найдите в Docker Hub образ Apache(httpd) и запустите его на 80 порту вашей ВМ.
![](img/image3.png)
![](img/image4.png)
![](img/image5.png)
2. Откройте страницу http://localhost и убедитесь, что видите приветвенную страницу Apache.
![](img/image6.png)

---

### Задание 3

1. Создайте свой Docker образ с Apache и подмените стандартную страницу index.html на страницу, содержащую ваши ФИО.
2. Запустите ваш образ, откройте страницу http://localhost и убедитесь, что страница изменилась.
![](img/image7.png)