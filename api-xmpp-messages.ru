<h3>Сообщения</h3>
<p>Универсальный формат описания сообщения:</p>
<pre>&lt;juick xmlns=&quot;http://juick.com/message&quot;
  mid=&quot;123456&quot;
  rid=&quot;7&quot;
  replies=&quot;12&quot;
  photo=&quot;true&quot;
  ts=&quot;2009-01-01 15:30:45&quot;&gt;
    &lt;user xmlns=&quot;http://juick.com/user&quot; uid=&quot;123&quot; uname=&quot;nickname&quot;/&gt;
    &lt;tag&gt;first&lt;/tag&gt;
    &lt;tag&gt;second&lt;/tag&gt;
    &lt;body&gt;some text&lt;/body&gt;
&lt;/juick&gt;</pre>
<p><b>uid</b> <i>(User ID)</i> &mdash; числовой идентификатор пользователя.<br/>
<b>uname</b> <i>(User name)</i> &mdash; ник пользователя.<br/>
<b>mid</b> <i>(Message ID)</i> &mdash; номер поста.<br/>
<b>rid</b> <i>(Reply ID)</i> &mdash; номер ответа.<br/>
<b>replies</b> &mdash; количество ответов на это сообщение (только для постов).<br/>
<b>photo</b> &mdash; если сообщение с фотографией, аттрибут имеет значение &quot;true&quot;.<br/>
<b>ts</b> &mdash; время создания сообщения, GMT.<br/>
Текст внутри тега &lt;body&gt; &mdash; текст сообщения в исходном виде.</p>

<h3>Отправка сообщений в Juick</h3>
<p>Если в отправляемое сообщение включить элемент &lt;juick&gt;, то вместо
стандартного текстового уведомления вы получите свой пост в обозначенном выше
формате.</p>
<pre><font color="#999">&lt;message to=&quot;juick@juick.com/Juick&quot;&gt;
  &lt;body&gt;*first *second some text&lt;/body&gt;</font>
  &lt;juick xmlns=&quot;http://juick.com/message&quot; /&gt;
<font color="#999">&lt;/message&gt;</font></pre>

<h3>Сообщения по подписке</h3>
<p>Каждое сообщение (новые посты и ответы), которое рассылается пользователям
по подписке, содержит служебную информацию:</p>
<pre><font color="#999">&lt;message from=&quot;juick@juick.com/Juick&quot; ...&gt;
  &lt;body&gt;@username: *first *second some text #123456/7&lt;/body&gt;</font>
  &lt;juick xmlns=&quot;http://juick.com/message&quot; ...&gt;...&lt;/juick&gt;
<font color="#999">&lt;/message&gt;</font></pre>

<h3>PM</h3>
<p>Приватные сообщения содержат ту же информацию, что и рассылаемые по подписке,
но у них отсутствует аттрибут <b>mid</b>.</p>

<h3>Последние сообщения (по запросу)</h3>
<p>Получение последних сообщений (не более 10 штук), начиная с определенного:</p>
<pre>&lt;iq to='juick@juick.com' id='id123' type='get'&gt;
  &lt;query xmlns='http://juick.com/query#messages' aftermid='123456'/&gt;
&lt;/iq&gt;

&lt;iq from='juick@juick.com' to='...' id='id123' type='result'&gt;
  &lt;query xmlns='http://juick.com/query#messages'&gt;
    &lt;juick xmlns=&quot;http://juick.com/message&quot; ...&gt;...&lt;/juick&gt;
    &lt;juick xmlns=&quot;http://juick.com/message&quot; ...&gt;...&lt;/juick&gt;
    &lt;juick xmlns=&quot;http://juick.com/message&quot; ...&gt;...&lt;/juick&gt;
    ...
  &lt;/query&gt;
&lt;/iq&gt;</pre>
<p><b>Важно:</b> если ваша программа регулярно запрашивает новые сообщения, при первом вызове
аттрибут <b>aftermid</b> можно не указывать, а во всех последующих присваивайте
ему значение <b>mid</b> последнего полученного сообщения. Обязательно делайте паузу
между запросами. Лучше всего, случайную задержку от 60 до 90 секунд.</p>

<p>Чтобы получить сообщения только одного конкретного пользователя, добавьте к
запросу его UID:</p>
<pre>&lt;iq to='juick@juick.com' id='id123' type='get'&gt;
  &lt;query xmlns='http://juick.com/query#messages'
    <b>uid='123'</b> aftermid='123456'/&gt;
&lt;/iq&gt;</pre>

<h3 id="myfeed">Личная лента сообщений (по запросу)</h3>
<p>Последние 10 сообщений из личной ленты (собственные сообщения и рекомендации,
сообщения и рекомендации друзей, треды, на которые подписан пользователь):</p>
<pre>&lt;iq to='juick@juick.com' id='id123' type='get'&gt;
  &lt;query xmlns='http://juick.com/query#messages' <b>filter='myfeed'</b>/&gt;
&lt;/iq&gt;</pre>

<h3>Пост и ответы к нему (по запросу)</h3>
<p>Запрос одного поста:</p>
<pre>&lt;iq to='juick@juick.com' id='id123' type='get'&gt;
  &lt;query xmlns='http://juick.com/query#messages' <b>mid='123456'</b>/&gt;
&lt;/iq&gt;

&lt;iq from='juick@juick.com' to='...' id='id123' type='result'&gt;
  &lt;query xmlns='http://juick.com/query#messages'&gt;
    &lt;juick xmlns=&quot;http://juick.com/message&quot; ...&gt;...&lt;/juick&gt;
  &lt;/query&gt;
&lt;/iq&gt;</pre>

<p>Запрос ответов к посту:</p>
<pre>&lt;iq to='juick@juick.com' id='id123' type='get'&gt;
  &lt;query xmlns='http://juick.com/query#messages' <b>mid='123456' rid='*'</b>/&gt;
&lt;/iq&gt;

&lt;iq from='juick@juick.com' to='...' id='id123' type='result'&gt;
  &lt;query xmlns='http://juick.com/query#messages'&gt;
    &lt;juick xmlns=&quot;http://juick.com/message&quot; ...&gt;...&lt;/juick&gt;
    &lt;juick xmlns=&quot;http://juick.com/message&quot; ...&gt;...&lt;/juick&gt;
    &lt;juick xmlns=&quot;http://juick.com/message&quot; ...&gt;...&lt;/juick&gt;
    ...
  &lt;/query&gt;
&lt;/iq&gt;</pre>
<p>В случаев, если ответов много, они отправляются отдельными группами
(IQ-станзы с одинаковыми id), в каждой максимум по 10 штук.</p>

<h3>Ошибки</h3>
<p>В случае, если по вашему запросу нет сообщений, ответ будет следующим:</p>
<pre>&lt;iq from='juick@juick.com' to='...' id='id123' type='error'&gt;
  &lt;error code='404'/&gt;
&lt;/iq&gt;</pre>
<p>Если вы запрашиваете сообщение, к которому у вас нет доступа, возвратится ошибка:</p>
<pre>&lt;iq from='juick@juick.com' to='...' id='id123' type='error'&gt;
  &lt;error code='403'/&gt;
&lt;/iq&gt;</pre>
