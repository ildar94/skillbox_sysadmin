# skillbox_sysadmin
## Данный репозиторий является Финальной работой курса старт в системное администрирование
### Все вируальные сервера и нароботки перспособлены для yandex-cloud

> # Опиание
> Сдесь представлены 4 сервера
>
> > Сервер OpenVPN
> 
> > Сервер Удостоверяющего центра
> 
> > Сервер сбора данных и оповещения
> 
> > Сервер локальный репозиторий deb пакетов + хранение нароботок.

В yandex cloud есть 3 зоны доступности: *ru-central-a*, *ru-central-b*, *ru-central-c*. Связь по tcp/ip между ниму аккумулируется через *network load balancer*.
Виртуальные машины находятся в сервисе *compute cloud*

В моей схеме 4 основных сервера расположены в зоне доступности *ru-central-a* и один запасной сервер dep repo в *ru-central-b*
Схема расположена сдесь https://drive.google.com/file/d/1Ueqj2GZxYHGoB1mm5_U_XnZF-v_hkinx/view?usp=sharing
https://drive.google.com/file/d/1U6dfylKBVkmAiTOZe4wus_GkSuKj1uHm/view?usp=sharing
