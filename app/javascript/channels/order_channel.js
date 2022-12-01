import consumer from "./consumer"

consumer.subscriptions.create("OrderChannel", {
  connected() {
  console.log("Connected to the server....")
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    console.log(data)
    console.log("Data received......")
    var table = document.getElementById("test")
    var row = table.insertRow();
    var cell1 = row.insertCell(0);
    var cell2 = row.insertCell(1);
    var cell3 = row.insertCell(2);
    var cell4 = row.insertCell(3);
    var cell5 = row.insertCell(4);
    var cell6 = row.insertCell(5);
    var cell7 = row.insertCell(6);
    var cell8 = row.insertCell(7);
    var cell9 = row.insertCell(8);
    cell1.innerHTML = data[0].id;
    cell3.innerHTML = data[0].created_at.toString().substr(data[0].created_at.toString().length - 13);
    cell5.innerHTML = data[0].status;
    cell4.innerHTML = data[0].comment;
    var productts = ""
    for(var i of data[1]){
      productts = productts + i + "(" + data[0].quantity[data[1].indexOf(i)] + "),";
    } 
    cell2.innerHTML = productts;
    cell6.innerHTML = data[0].table;
    cell7.innerHTML = data[0].tell;
    var a = document.createElement('a'); 
    var link = document.createTextNode("Edit");
    a.appendChild(link); 
    a.href = "/orders/"+data[0].id+"/edit"; 
    cell8.appendChild(a)
    var b = document.createElement('a'); 
    var link2 = document.createTextNode("Mark Complete");
    b.appendChild(link2); 
    b.href = "/orders/mark_complete/"+data[0].id; 
    b.onclick=(e)=>{
      confirm("Are you sure?");
    }
    cell9.appendChild(b)
    // Called when there's incoming data on the websocket for this channel
  }
});
