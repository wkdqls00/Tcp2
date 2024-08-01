const express = require('express');
const cors = require("cors");
const http = require("http");
const app = express();
const path = require("path");
const server = http.createServer(app);
const socketIO = require("socket.io");
const moment = require("moment");

const io = socketIO(server);

// cors({ origin: 허용 오리진 주소 })

// 서버 실행 시 보여주는 파일
app.use(express.static(path.join(__dirname, "/")))

app.use(cors({
	origin: '*'
}));


app.use(function (req, res, next) {
	// Website you wish to allow to connect
	// res.setHeader('Access-Control-Allow-Origin', 'http://localhost:9090');
	res.setHeader('Access-Control-Allow-Origin' , '*')

    // Request methods you wish to allow
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, PATCH, DELETE');

    // Request headers you wish to allow
    res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With,content-type');

    // Set to true if you need the website to include cookies in the requests sent
    // to the API (e.g. in case you use sessions)
    res.setHeader('Access-Control-Allow-Credentials', true);

    // Pass to next layer of middleware
    next();
})

const PORT = process.env.PORT || 3000;

io.on("connection", (socket) => {
  socket.on("chatting", (data) => {  // 채팅 아이디
    const { name, msg } = data;
    io.emit("chatting", {
      name,
      msg,
      time : moment(new Date()).format("h:mm A"),
    })
  })
});

server.listen(PORT, ()=>console.log(`server is running ${PORT}`))