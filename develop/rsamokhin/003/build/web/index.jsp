<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>
    <script>
        var ws = null;
        function connect() {
            var target = 'ws://'+location.host+location.pathname+'ws/echo';
            if ('WebSocket' in window) {
                ws = new WebSocket(target);
            } else if ('MozWebSocket' in window) {
                ws = new MozWebSocket(target);
            } else {
                alert('WebSocket is not supported by this browser.');
                return;
            }
            ws.onopen = function () {
                log('Info: WebSocket connection opened.');
            };
            ws.onmessage = function (event) {
                log('Received: ' + event.data);
            };
            ws.onclose = function (event) {
                log('Info: WebSocket connection closed, Code: ' + event.code + (event.reason == "" ? "" : ", Reason: " + event.reason));
            };
        }
         function echo() {
            if (ws != null) {
                var message = document.getElementById('message').value;
                log('Sent: ' + message);
                ws.send(message);
            }
        }
        function log(message) {
            var chat = document.getElementById('chat');
            var p = document.createElement('p');
            p.style.wordWrap = 'break-word';
            p.appendChild(document.createTextNode(message));
            chat.appendChild(p);
            while (chat.childNodes.length > 25) {
                chat.removeChild(chat.firstChild);
            }
            chat.scrollTop = chat.scrollHeight;
        }
        connect();
    </script>
</head>
<body>
    <span>wsAddress: </span> <span>/ws/echo</span>
    <input id = 'message'/>
    <button id = 'send' onclick=echo()>Send</button>
    <br/>
    <div id = 'chat' style='border: 1px solid black;width: 500px; height: 500px;'></div>
</body>
</html>