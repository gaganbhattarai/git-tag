var express = require("express");
var app = express();
var cors = require("cors");

app.use(cors());
app.use(express.json());

// Simulated functions to check if they are working or not..
function checkFunction1() {
  return true; // Return true if the function is healthy, false otherwise
}

function checkFunction2() {
  return true; // Return true if the function is healthy, false otherwise
}

app.post("/api/login", function (req, res) {
  const data = req.body;
  console.log(data);
  if (data.username === "gritfeat" && data.password === "fellowship") {
    res.send({
      status: 200,
      message: "Login Successful!",
    });
  } else {
    res.send({
      status: 401,
      message: "Unauthorized",
    });
  }
});

app.get("/api/health", function (req, res) {
  const isFunction1Healthy = checkFunction1();
  const isFunction2Healthy = checkFunction2();
  if (isFunction1Healthy && isFunction2Healthy) {
    res.send({
      status: 200,
      message: "API is Healthy! ❤️‍🩹",
    });
  } else {
    res.send({
      status: 500,
      message: "API is Unhealthy! ❤️‍🩹",
      data: {
        function1: isFunction1Healthy ? "HEALTHY" : "UNHEALTHY",
        function2: isFunction2Healthy ? "HEALTHY" : "UNHEALTHY",
      },
    });
  }
});

var server = app.listen(5000, function () {
  var port = server.address().port;
  console.log("App listening at %s", port);
});
