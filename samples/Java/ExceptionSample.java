package note.Programming.Java.samples;

public class ExceptionSample {

    public static void main(String[] args) {
        test1();
        System.out.println(test2());
        System.out.println(test3());
        System.out.println(test4());
    }

    static void test1() {
        // 1. Error : try-catch 不可以捕获错误, 程序退出, 仅 finally 代码会执行
        // 2. Exception : try-catch 可以捕获异常, catch finally outside 之后代码均执行
        // 3. finally 和 printStackTrace (异常堆栈打印) 是在另一个线程执行，打印顺序随机
        try {
//            return;
            throw new Exception("1 exception");
            //throw new Error("error...");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("1 catch.");
//            return;
        } finally {
            System.out.println("1 finally.");
        }
        System.out.println("1 outside.");
    }

    static int test2() {
        // catch 有 return，结果是 finally 内容会显示
        try {
            throw new Exception();
         } catch (Exception e) {
            System.out.println("2 catch.");
            return 1;
         } finally {
            System.out.println("2 finally.");
         }
    }

    static int test3() {
        // catch 和 finally 都有 return，结果是 finally return 的值
        try {
            throw new Exception();
         } catch (Exception e) {
            System.out.println("3 catch.");
            return 1;
         } finally {
            System.out.println("3 finally.");
            return 2;
         }
    }

    static int test4() {
        // 在 finally 中修改 catch 中 return 的值无效
        int i = 0;
        try {
            throw new Exception();
         } catch (Exception e) {
            System.out.println("4 catch.");
            return i;
         } finally {
            System.out.println("4 finally.");
            ++i;
         }
    }
}