<h3>Управление подписками</h3>

<h3>Подписки на ответы к сообщению</h3>

<p>Подписаться:</p>
<pre>&lt;iq to='juick@juick.com' id='id123' type='set'&gt;
  &lt;subscriptions xmlns='http://juick.com/subscriptions#messages'
    <b>action='subscribe' mid='123456'</b>/&gt;
&lt;/iq&gt;

&lt;iq from='juick@juick.com' to='...' id='id123' type='result'/&gt;</pre>

<p>Отписаться:</p>
<pre>&lt;iq to='juick@juick.com' id='id123' type='set'&gt;
  &lt;subscriptions xmlns='http://juick.com/subscriptions#messages'
    <b>action='unsubscribe' mid='123456'</b>/&gt;
&lt;/iq&gt;</pre>

<h3>Подписки на уведомления о количестве ответов</h3>
<p>Уведомления о количестве ответов &mdash; это небольшие IQ-станзы, которые
дают возможность следить за активностью в треде, не подписываясь на него. Они
имеют вид:</p>
<pre>&lt;iq from='juick@juick.com/Juick' to='...' id='...' type='set'&gt;
  &lt;juick xmlns='http://juick.com/message' <b>mid='123456' replies='12'</b>/&gt;
&lt;/iq&gt;</pre>
<p>Каждый раз, когда кто-то будет отвечать в треде, вам будет приходить такая
станза с новым значением <b>replies</b>. Подписаться и отписаться на эти
уведомления можно аналогично подписке на ответы:</p>
<pre>&lt;iq to='juick@juick.com' id='id123' type='set'&gt;
  &lt;subscriptions xmlns='<b>http://juick.com/subscriptions#messages-notify</b>'
    <b>action='subscribe' mid='123456'</b>/&gt;
&lt;/iq&gt;

&lt;iq to='juick@juick.com' id='id123' type='set'&gt;
  &lt;subscriptions xmlns='<b>http://juick.com/subscriptions#messages-notify</b>'
    <b>action='unsubscribe' mid='123456'</b>/&gt;
&lt;/iq&gt;</pre>
<p>Уведомления приходят только на тот JID/ресурс, с которого был послан запрос
подписки. Когда этот JID/ресурс присылает &lt;presence type='unavailable'/&gt;,
всего его подписки удаляются.</p>
<p>Если на момент получения запроса подписки у треда уже есть некоторое
количество ответов, вам сразу же прийдет уведомление с этим числом.</p>
<p>Несмотря на автоматическое удаление, отписывайтесь от треда, когда
пользователь вашего клиента больше не следит за тредом. Это сэкономит трафик и
ресурсы.</p>
