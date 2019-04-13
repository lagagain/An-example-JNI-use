class Main{

    public native void hello(String name);

    static{
        System.loadLibrary("hello");
    }

    public static void main(String[] args){
        new Main().hello("jni");
    }
}
