<h3>Формат</h3>
<p>Универсальный формат описания локации, из <a href="http://xmpp.org/extensions/xep-0080.html" rel="nofollow">XEP-0080</a>:</p>
<pre>&lt;geoloc xmlns=&quot;http://jabber.org/protocol/geoloc&quot;<!--
 xmlns:juick=&quot;http://juick.com/places&quot;-->&gt;
  &lt;lat&gt;39.75&lt;/lat&gt;
  &lt;lon&gt;-104.99&lt;/lon&gt;
  &lt;description&gt;Закусочная McDonalds&lt;/description&gt;
  &lt;text&gt;Гамбургеры, картофель фри, охлажденные напитки, чай и кофе.&lt;/text&gt;
  &lt;uri&gt;http://juick.com/places/123&lt;/uri&gt;
  &lt;accuracy&gt;150&lt;/accuracy&gt;
<!--  &lt;juick:users&gt;12&lt;/juick:users&gt;
  &lt;juick:messages&gt;34&lt;/juick:messages&gt;
-->&lt;/geoloc&gt;</pre>
<p><b>lat</b> <i>(latitude)</i> &mdash; широта.<br/>
<b>lon</b> <i>(longitude)</i> &mdash; долгота.<br/>
<b>description</b> &mdash; тип (&quot;закусочная&quot;) и название (&quot;McDonalds&quot;) места.<br/>
<b>text</b> &mdash; описание (любая объективная информация), <i>опциональное</i>.<br/>
<b>uri</b> &mdash; уникальный идентификатор места в виде URL.<br/>
<b>accuracy</b> &mdash; расстояние до этого объекта, в метрах, <i>только в ответах сервера</i>.<br/>
<!--<b>juick:users</b> &mdash; статистика, количество уникальных пользователей, которые написали сообщение из этой локации, за последние 90 дней.<br/>
<b>juick:messages</b> &mdash; статистика, количество сообщений из этой локации, за последние 90 дней.--></p>

<h3>Ближайшие локации</h3>
<p>Локации в радиусе 300м, с сортировкой по удалённости, не более 20шт:</p>
<pre>&lt;iq to='juick@juick.com' id='id345' type='get'&gt;
  &lt;query xmlns='http://juick.com/query#places' <b>show='nearest'</b>&gt;
    &lt;geoloc xmlns=&quot;http://jabber.org/protocol/geoloc&quot;&gt;
      &lt;lat&gt;47.8378904&lt;/lat&gt;
      &lt;lon&gt;35.1384187&lt;/lon&gt;
    &lt;/geoloc&gt;
  &lt;/query&gt;
&lt;/iq&gt;</pre>
<p>Локации в радиусе 1км, с сортировкой по популярности, не более 20шт:</p>
<pre>&lt;iq to='juick@juick.com' id='id345' type='get'&gt;
  &lt;query xmlns='http://juick.com/query#places' <b>show='popular'</b>&gt;
    &lt;geoloc xmlns=&quot;http://jabber.org/protocol/geoloc&quot;&gt;
      &lt;lat&gt;47.8378904&lt;/lat&gt;
      &lt;lon&gt;35.1384187&lt;/lon&gt;
    &lt;/geoloc&gt;
  &lt;/query&gt;
&lt;/iq&gt;</pre>
<p>Ответ сервера:</p>
<pre>&lt;iq from='juick@juick.com' to='...' id='id345' type='result'&gt;
  &lt;query xmlns='http://juick.com/query#places'&gt;
    &lt;geoloc xmlns=&quot;http://jabber.org/protocol/geoloc&quot;&gt;...&lt;/geoloc&gt;
    &lt;geoloc xmlns=&quot;http://jabber.org/protocol/geoloc&quot;&gt;...&lt;/geoloc&gt;
    &lt;geoloc xmlns=&quot;http://jabber.org/protocol/geoloc&quot;&gt;...&lt;/geoloc&gt;
    ...
  &lt;/query&gt;
&lt;/iq&gt;</pre>

<h3 id="Search">Поиск локации по имени</h3>
<p>Поиск по названию и описанию, среди локаций в радиусе от 1 до 100км (задается в обязательном параметре accuracy, в метрах), с сортировкой по релевантности, не более 20шт:</p>
<pre>&lt;iq to='juick@juick.com' id='id345' type='get'&gt;
  &lt;query xmlns='http://juick.com/query#places'&gt;
    &lt;geoloc xmlns=&quot;http://jabber.org/protocol/geoloc&quot;&gt;
      &lt;lat&gt;47.85&lt;/lat&gt;
      &lt;lon&gt;35.17&lt;/lon&gt;
      &lt;accuracy&gt;20000&lt;/accuracy&gt;
      &lt;description&gt;coffee&lt;/description&gt;
    &lt;/geoloc&gt;
  &lt;/query&gt;
&lt;/iq&gt;</pre>
<p><i>Ответ такой же, как и при запросе ближайших локаций.</i></p>

<h3 id="Attach">Отправка сообщения с указанием локации</h3>
<pre>&lt;message to='juick@juick.com'&gt;
  &lt;body&gt;*tag test message&lt;/body&gt;
  &lt;geoloc xmlns=&quot;http://jabber.org/protocol/geoloc&quot;&gt;
    &lt;uri&gt;http://juick.com/places/123&lt;/uri&gt;
  &lt;/geoloc&gt;
&lt;/message&gt;</pre>

<h3 id="Add">Добавить локацию</h3>
<p>Обязательные для заполнения поля: <b>lat</b>, <b>lon</b>, <b>description</b>. Необязательное: <b>text</b>.
<pre>&lt;iq to='juick@juick.com' id='id123' <b>type='set'</b>&gt;
  &lt;geoloc xmlns=&quot;http://jabber.org/protocol/geoloc&quot;&gt;
    &lt;lat&gt;39.75&lt;/lat&gt;
    &lt;lon&gt;-104.99&lt;/lon&gt;
    &lt;description&gt;Закусочная McDonalds&lt;/description&gt;
    &lt;text&gt;Гамбургеры, картофель фри, охлажденные напитки, чай и кофе.&lt;/text&gt;
  &lt;/geoloc&gt;
&lt;/iq&gt;

&lt;iq from='juick@juick.com' to='...' id='id123' type='result'&gt;
  &lt;geoloc xmlns=&quot;http://jabber.org/protocol/geoloc&quot;&gt;
    &lt;uri&gt;http://juick.com/places/123&lt;/uri&gt;
  &lt;/geoloc&gt;
&lt;/iq&gt;</pre>

<h3>Ошибки</h3>
<p>В случае, если по вашему запросу нет локаций, ответ будет следующим:</p>
<pre>&lt;iq from='juick@juick.com' to='...' id='id123' type='error'&gt;
  &lt;error code='404'/&gt;
&lt;/iq&gt;</pre>
