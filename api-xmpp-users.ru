<h3>Пользователи</h3>
<p>Универсальный формат описания пользователя:</p>
<pre>&lt;user xmlns=&quot;http://juick.com/user&quot;
  uid=&quot;123&quot;
  uname=&quot;nickname&quot;
  jid=&quot;user@example.com&quot;
  pro=&quot;true&quot;
/&gt;</pre>
<p><b>uid</b> <i>(User ID)</i> &mdash; числовой идентификатор пользователя.<br/>
<b>uname</b> <i>(User name)</i> &mdash; ник пользователя.<br/>
<b>pro</b> &mdash; владелец pro-аккаунта.</p>

<h3>Кто я?</h3>
<p>Чтобы получить свой UID, ник и активный JID:</p>
<pre>&lt;iq to='juick@juick.com' id='id345' type='get'&gt;
  &lt;query xmlns='http://juick.com/query#users'/&gt;
&lt;/iq&gt;

&lt;iq from='juick@juick.com' to='...' id='id345' type='result'&gt;
  &lt;query xmlns='http://juick.com/query#users'&gt;
    &lt;user xmlns=&quot;http://juick.com/user&quot;
      <b>uid=&quot;123&quot; uname=&quot;joe&quot; jid=&quot;joe@example.com&quot;</b>/&gt;
  &lt;/query&gt;
&lt;/iq&gt;</pre>

<h3>Друзья и подписчики пользователя</h3>
<p>Получить список друзей, на которых подписан пользователь с UID=123:</p>
<pre>&lt;iq to='juick@juick.com' id='id123' type='get'&gt;
  &lt;query xmlns='http://juick.com/query#users' <b>friends='123'</b>/&gt;
&lt;/iq&gt;

&lt;iq from='juick@juick.com' to='...' id='id123' type='result'&gt;
  &lt;query xmlns='http://juick.com/query#users'&gt;
    &lt;user xmlns=&quot;http://juick.com/user&quot; .../&gt;
    &lt;user xmlns=&quot;http://juick.com/user&quot; .../&gt;
    &lt;user xmlns=&quot;http://juick.com/user&quot; .../&gt;
    ...
  &lt;/query&gt;
&lt;/iq&gt;</pre>

<p>Получить список людей, которые подписаны на пользователя с UID=123:</p>
<pre>&lt;iq to='juick@juick.com' id='id123' type='get'&gt;
  &lt;query xmlns='http://juick.com/query#users' <b>subscribers='123'</b>/&gt;
&lt;/iq&gt;</pre>

<h3>UName по UID, UID по UName и UID+UName по JID</h3>
<p>Не более 20 пользователей в одном запросе, все запросы внутри IQ должны быть
одного типа:</p>
<pre>&lt;iq to='juick@juick.com' id='id123' type='get'&gt;
  &lt;query xmlns='http://juick.com/query#users'&gt;
    &lt;user xmlns=&quot;http://juick.com/user&quot; <b>uid=&quot;1&quot;</b>/&gt;
    &lt;user xmlns=&quot;http://juick.com/user&quot; <b>uid=&quot;2&quot;</b>/&gt;
    &lt;user xmlns=&quot;http://juick.com/user&quot; <b>uid=&quot;3&quot;</b>/&gt;
    ...
  &lt;/query&gt;
&lt;/iq&gt;

&lt;iq from='juick@juick.com' to='...' id='id123' type='result'&gt;
  &lt;query xmlns='http://juick.com/query#users'&gt;
    &lt;user xmlns=&quot;http://juick.com/user&quot; <b>uid=&quot;1&quot; uname=&quot;user1&quot;</b>/&gt;
    &lt;user xmlns=&quot;http://juick.com/user&quot; <b>uid=&quot;2&quot; uname=&quot;someuser&quot;</b>/&gt;
    &lt;user xmlns=&quot;http://juick.com/user&quot; <b>uid=&quot;3&quot; uname=&quot;nickname&quot;</b>/&gt;
    ...
  &lt;/query&gt;
&lt;/iq&gt;

&lt;iq to='juick@juick.com' id='id234' type='get'&gt;
  &lt;query xmlns='http://juick.com/query#users'&gt;
    &lt;user xmlns=&quot;http://juick.com/user&quot; <b>uname=&quot;joe&quot;</b>/&gt;
    &lt;user xmlns=&quot;http://juick.com/user&quot; <b>uname=&quot;bill&quot;</b>/&gt;
    &lt;user xmlns=&quot;http://juick.com/user&quot; <b>uname=&quot;smith&quot;</b>/&gt;
    ...
  &lt;/query&gt;
&lt;/iq&gt;

&lt;iq from='juick@juick.com' to='...' id='id234' type='result'&gt;
  &lt;query xmlns='http://juick.com/query#users'&gt;
    &lt;user xmlns=&quot;http://juick.com/user&quot; <b>uid=&quot;123&quot; uname=&quot;joe&quot;</b>/&gt;
    &lt;user xmlns=&quot;http://juick.com/user&quot; <b>uid=&quot;21&quot; uname=&quot;bill&quot;</b>/&gt;
    &lt;user xmlns=&quot;http://juick.com/user&quot; <b>uid=&quot;32&quot; uname=&quot;smith&quot;</b>/&gt;
    ...
  &lt;/query&gt;
&lt;/iq&gt;

&lt;iq to='juick@juick.com' id='id345' type='get'&gt;
  &lt;query xmlns='http://juick.com/query#users'&gt;
    &lt;user xmlns=&quot;http://juick.com/user&quot; <b>jid=&quot;joe@example.com&quot;</b>/&gt;
    &lt;user xmlns=&quot;http://juick.com/user&quot; <b>jid=&quot;billy@jabber.org&quot;</b>/&gt;
    &lt;user xmlns=&quot;http://juick.com/user&quot; <b>jid=&quot;john-smith@example.net&quot;</b>/&gt;
    ...
  &lt;/query&gt;
&lt;/iq&gt;

&lt;iq from='juick@juick.com' to='...' id='id345' type='result'&gt;
  &lt;query xmlns='http://juick.com/query#users'&gt;
    &lt;user xmlns=&quot;http://juick.com/user&quot;
      <b>uid=&quot;123&quot; uname=&quot;joe&quot; jid=&quot;joe@example.com&quot;</b>/&gt;
    &lt;user xmlns=&quot;http://juick.com/user&quot;
      <b>uid=&quot;21&quot; uname=&quot;bill&quot; jid=&quot;billy@jabber.org&quot;</b>/&gt;
    &lt;user xmlns=&quot;http://juick.com/user&quot;
      <b>uid=&quot;32&quot; uname=&quot;smith&quot; jid=&quot;john-smith@example.net&quot;</b>/&gt;
    ...
  &lt;/query&gt;
&lt;/iq&gt;</pre>

<h3>Ошибки</h3>
<p>В случае, если по вашему запросу нет пользователей, ответ будет следующим:</p>
<pre>&lt;iq from='juick@juick.com' to='...' id='id123' type='error'&gt;
  &lt;error code='404'/&gt;
&lt;/iq&gt;</pre>
<!--
<p>Если вы запрашиваете информацию о пользователе, к которой у вас нет доступа, возвратится ошибка:</p>
<pre>&lt;iq from='juick@juick.com' to='...' id='id123' type='error'&gt;
  &lt;error code='403'/&gt;
&lt;/iq&gt;</pre>
-->
