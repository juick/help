<h2>Текущее местоположение</h2>
<p>Вы можете поделиться информацией о своем текущем местоположении и
регулярно обновлять эти данные. Эту возможность поддерживают клиенты
<a href="http://coccinella.im/" rel="nofollow">Coccinella</a> и
<a href="http://tkabber.jabber.ru/" rel="nofollow">Tkabber</a>.</p>

<h2>Сообщение с гео-данными</h2>
<!--
<p>Для любого сообщения (поста или ответа) можно указать географические
координаты: точку на карте, которая относится к этому сообщению.</p>
<p>Хотя эта возможность и основана на одном из стандартных расширений протокола XMPP,
но, к сожалению, нам пока не известны Jabber-клиенты, которые её поддерживают.</p>
-->
<p>Для того, чтобы привязать новый пост к вашему текущему местоположению, укажите
в начале текста поста тег <strong>*geo</strong>. Также этот тег можно указывать
в начале описания отправляемой фотографии.</p>

<h2>Скучные технические подробности</h2>
<p>Текущее местоположение Juick принимает через
<a href="http://xmpp.org/extensions/xep-0163.html" rel="nofollow">PEP</a>, в
формате <a href="http://xmpp.org/extensions/xep-0080.html" rel="nofollow">XEP-0080 (User Location)</a>,
поля &quot;lat&quot; и &quot;lon&quot;.</p>
<!--
<p>Сообщение с гео-данными следует отправлять в следующем виде:</p>
<pre>&lt;message from=&quot;example@example.com&quot; to=&quot;juick@juick.com&quot;&gt;
  &lt;body&gt;Message text&lt;/body&gt;
  &lt;geoloc xmlns=&quot;http://jabber.org/protocol/geoloc&quot;&gt;
    &lt;lat&gt;41.1358739&lt;/lat&gt;
    &lt;lon&gt;29.0708542&lt;/lon&gt;
  &lt;/geoloc&gt;
&lt;/message&gt;</pre>
-->