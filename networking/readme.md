Network architecture 

![](images/image5.png) 

1\. На Server\_1 налаштувати статичні адреси на всіх інтерфейсах

![](images/image9.png)

![](images/image15.png)

2\. На Server\_1 налаштувати DHCP сервіс, який буде конфігурувати адреси Int1 Client\_1 та Client\_2  

![](images/image7.png)

![](images/image21.png)

![](images/image13.png)

3\. За допомогою команд ping та traceroute перевірити зв'язок між віртуальними машинами

![](images/image19.png)

![](images/image12.png)

![](images/image14.png)

4\. На віртуальному інтерфейсу lo Client\_1 призначити дві ІР адреси за таким правилом: 172.17.25.1/24 та 172.17.35.1/24. Налаштувати маршрутизацію таким чином, щоб трафік з Client\_2 до 172.17.25.1 проходив через Server\_1, а до 172.17.35.1 через Net4. Для перевірки використати traceroute.

![](images/image6.png)

Via server1

![](images/image16.png)

Via net4

![](images/image17.png)

5\. Розрахувати спільну адресу та маску (summarizing) адрес 172.17.D+10.1 та 172.17.D+20.1, при чому префікс має бути максимально можливим. Видалити маршрути, встановлені на попередньому кроці та замінити їх об’єднаним маршрутом, якій має проходити через Server\_1

Summarized net

![](images/image3.png)

Delete routes added before

![](images/image4.png)

![](images/image11.png)

6\. Налаштувати SSH сервіс таким чином, щоб Client\_1 та Client\_2 могли підключатись до Server\_1 та один до одного.

![](images/image2.png)

![](images/image18.png)

![](images/image1.png)

7\. Налаштуйте на Server\_1 firewall таким чином:

*   Дозволено підключатись через SSH з Client\_1 та заборонено з Client\_2

![](images/image20.png)

*   З Client\_2 на 172.17.D+10.1 ping проходив, а на 172.17.D+20.1 не проходив

![](images/image8.png)

8\. На Server\_1 налаштувати NAT сервіс таким чином, щоб з Client\_1 та Client\_2 проходив ping в мережу Інтернет

![](images/image10.png)
