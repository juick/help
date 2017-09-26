<h2>HTTP API</h2>

<p>Запросы GET (для чтения) и POST (для написания сообщений / комментариев) на http://api.juick.com.</p>
<p>Для GET-запросов возвращается результат в формате JSON / JSONP; имя callback-функции для JSONP – в параметре callback.</p>

<h3>Блоги</h3>

Список последних сообщений:
<pre>http://api.juick.com/messages</pre>

Поиск по сообщениям:
<pre>http://api.juick.com/messages?search=<b>запрос</b></pre>

Фильтрация по тегу:
<pre>http://api.juick.com/messages?tag=<b>тег</b></pre>

Фильтрация по типу контента:
<pre>http://api.juick.com/messages?media=all
http://api.juick.com/messages?media=photo
http://api.juick.com/messages?media=video</pre>

Последние сообщения пользователя:
<pre>http://api.juick.com/messages?uname=<b>nick</b>
http://api.juick.com/messages?uname=<b>nick</b>&tag=<b>тег</b></pre>

Для списков сообщений выводится одна «страница». Для вывода дополнительных «страниц»: параметр before_mid
<pre>http://api.juick.com/messages?before_mid=<b>id последнего загруженного сообщения</b></pre>

Просмотр сообщения с комментариями:
<pre>http://api.juick.com/thread?mid=<b>message ID</b></pre>

<h3>Приватные сообщения (чаты)</h3>

Последние сообщения чата:
<pre>http://api.juick.com/pm?uname=<b>ugnich</b></pre>

Отправить сообщение (POST):
<pre>http://api.juick.com/pm?uname=<b>ugnich</b>&body=<b>hello+world</b></pre>

<h3>Пользователи</h3>

Получение информации о пользователе по нику или JabberID (не более 20 за один вызов):
<pre>http://api.juick.com/users?uname=ugnich&uname=test&jid=jid@example.net&jid=i@example.com</pre>

Блоги, которые читает пользователь:
<pre>http://api.juick.com/users/read?uname=<b>ugnich</b></pre>

Подписчики пользователя:
<pre>http://api.juick.com/users/readers?uname=<b>ugnich</b></pre>

Блоги, которые читает текущий аутентифицированный пользователь:
<pre>http://api.juick.com/users/read</pre>

Подписчики текущего аутентифицированного пользователя:
<pre>http://api.juick.com/users/readers</pre>

<h3>Список тегов</h3>

Популярные теги:
<pre>http://api.juick.com/tags</pre>

Все теги пользователя:
<pre>http://api.juick.com/tags?user_id=<b>uid</b></pre>

<h3>Прочее</h3>

Аватары:
<p>Аватар пользователя с UID=123 доступен по адресу:<br/>
<strong>http://i.juick.com/a/<b>123</b>.png</strong> &mdash; 96x96px<br/>
<strong>http://i.juick.com/as/<b>123</b>.png</strong> &mdash; 32x32px</p>

<p>Аватар пользователя с ником <b>ugnich</b> доступен по адресу:<br/>
<strong>http://api.juick.com/avatar?uname=ugnich<br/>
http://api.juick.com/avatar?uname=ugnich&size=32</strong></p>

<p>Все аватары хранятся в формате PNG.</p>

<h3>WebSocket</h3>

Все публичные посты:
<pre>ws://ws.juick.com/_all</pre>

Ответы во всех публичных постах:
<pre>ws://ws.juick.com/_replies</pre>

Публичные сообщения пользователя:
<pre>ws://ws.juick.com/<b>ugnich</b>/</pre>

Комментарии к публичному сообщению:
<pre>ws://ws.juick.com/<b>1234567</b></pre>

Соединение с сервером WebSocket и обмен данными осуществляются в формате, описанном в <a href="http://tools.ietf.org/html/rfc6455" rel="nofollow">RFC 6455</a>.

Если клиент ничего не передавал серверу через websocket соединение в течение 60 секунд, то сервер отправит ему текстовое сообщение состоящее из одного символа пробела.
Если клиент ничего не передавал серверу в течение 3-х минут, то сервер разорвет соединение.
Чтобы поддерживать длительные соединения, желательно отвечать на "пинги" сервера. Например, следующим кодом на JavaScript:
<pre>websocket.onmessage=function(event) {  
  if(event.data==' ') {
    websocket.send(' ');
  } else {
    // ...
  }
};</pre>

<h3>Push уведомления</h3>
Google Cloud Messaging:
<pre>http://api.juick.com/android/register?regid=...
http://api.juick.com/android/unregister?regid=...</pre>
Microsoft Push Notification Service:
<pre>http://api.juick.com/winphone/register?url=...
http://api.juick.com/winphone/unregister?url=...</pre>
