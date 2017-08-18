<h3>XMPP API</h3>
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
