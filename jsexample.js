<script type="text/javascript">
	
var lendths = "wdqdqwjdqwj jijvididiqwvijdivqivivqjivjdqqvdqvjdqivjd".length;

var sapve = "One fish,two fish".length

var num1 = 43;
var num2 = 10;
var divisin =  num1%num2;
 
var add1  = 3;
add1 = 9;
 add1 += 3;

var syntex = "all of our sentext "+(add1*3)+ " complete sentense";
traning = 3;
traning--;
 
 var welcpme = "loemdjwqhd uhdquhd uwqhd hdqw wuqjh u";
 var asgd = "lkrok ek oe okfoeko  kwoekfw okwoek";
 //var tottal = welcpme +"/n"+ asgd;
  var cpmpare = welcpme.length < asgd.length;
  console.log(cpmpare);
  var char  = welcpme.charAt(5);
  console.log(char);
   var Totaltrains = "12";
   var trainsOptional = 12;

    console.log("There are " + trainsOptional + " running the trains");
    console.log(Totaltrains == trainsOptional); 
    console.log(Totaltrains === trainsOptional);

    var Traingnum;
    var traingnumOption = 10;
    for(var Traingnum = 1; Traingnum <= traingnumOption; Traingnum++){
 	console.log("The train num is" +Traingnum+ "running");
    }

    for(var number =5;number>0; number--){
    	console.log(number);
    }

     var startTrain = 8; 
     var totalTrain = 12;
     var trainNumber = 1;
   
    while(trainNumber<=startTrain){
     console.log("the train is "+trainNumber+" running");
      trainNumber++; 
    }

    for(var stopTrain = startTrain+1; stopTrain<=totalTrain; stopTrain++){
      console.log("the number of stop train"+stopTrain+"!!");
    }

     number = 1;
      while(number <=5){
      console.log(number);
      number++; 
    }

      //  var gotName = false;
      //  while(gotName == false){
      //  var userName = prompt("Hi What is your Name " +userName);
      //  if(confirm("Are you sure your name is "+userName + "?")){
      //    alert("your name" +userName+ "!!");
      //     gotName = true;
      //  }
      // }
       var a = 4;
       var b = 9;
       var aCube = a*a*a;
       var bCube = b*b*b;
       var sum = aCube+bCube;
       console.log(sum);

    function sumOfCube(a,b){
       var aCube = a*a*a;
       var bCube = b*b*b;
       var sum = aCube+bCube;
       return sum;
    }
    var sumCube = sumOfCube(5,6);
    console.log(sumCube);

    function addNumber(a, b){
      var sum = a+b;
      return sum;
    }
    var sumofnum = addNumber(4,100);
    console.log(sumofnum);

    function factorial(n){
      var fact = 1;
      for(var i=n; i>1; i--){
      var fact = fact*i;
      }
      return fact;
    }
    var factorialNum = factorial(5);
    console.log(factorialNum);

   var NumberList = [2, 20, 5,7,8,9,10,12,18,55];

   evenCount = 0;
   for(var i =0; i< NumberList.length; i++){
     if(NumberList[i]%2 ==0){
      evenCount++;
     }else{
        NumberList[i]==undefined;
     }
   } 
  //console.log(evenCount);
   function addPassenger(name,list){ 
     if(list.length == 0){
       list.push(name);
     }else{
        for(var i =0 ; i< list.length; i++){
           if(list[i]==undefined){
          list[i] = name;
          return list; 
         }else if(i == list.length-1){  
          list.push(name);
          return list;
         }
        }   
     }
   } 
   var passengerList = [];
     addPassenger("John Doe",passengerList);
     addPassenger("John Doe1",passengerList);
     addPassenger("John Doe2",passengerList);
     addPassenger("John Doe3",passengerList);
     addPassenger("John Doe4",passengerList);
     addPassenger("John Doe5",passengerList);
     addPassenger("John Doe6",passengerList);
     addPassenger("John Doe7",passengerList);
     addPassenger("John Doe8",passengerList);
     addPassenger("John Doe9",passengerList);
     addPassenger("John Doe10",passengerList);
     addPassenger("John Doe11",passengerList);
     addPassenger("John Doe12",passengerList);

    console.log(passengerList);

   function deletePassanger(name, list){
      if(list.length == 0){
        console.log("List is empty");
      }else{
        for(var i=0; i< list.length; i++){
          if(list[i]==name){
            list[i] = undefined;
          }else if(i== list.length-1){
             console.log("Passander Not Found");
          }
        }
      }
      return list ;
   }
   deletePassanger("John Doe", passengerList);
   deletePassanger("John Doe1", passengerList);
   deletePassanger("John Doe2", passengerList);
   deletePassanger("John Doe3", passengerList);

   console.log(passengerList);

</script>
