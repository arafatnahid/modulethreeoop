
class first{
  var name="arafat";
  var address="dhaka";
  first(){

    print("this is constructor");
  }
  firstmethod(){
    int x=9;
    int y=9;
    int z=x+y;
    print(z);
    print(this.address);

  }

  callfromclass(){

    firstmethod();
  }

}