class Main {
	public static int overload;
    public static void overload(int n){
        System.out.print("I have a parameter");
    }

    public static void overload(){
         System.out.print("I don't have a parameter");
    }

    public static int main(int n){
    	overload();
    }

}