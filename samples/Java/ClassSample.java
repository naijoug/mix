// 顶级类(top level class) : 非嵌套类就是顶级类，主类 & 文件类

// 0. 主类 : (main class) public 修饰的类，一个 java 文件只能有一个主类
public class ClassSample {
    public ClassSample(String name) {
        this.name = name;
        System.out.println("This is main class.");

        // 构造函数内的局部类 : 含有 enclose constructor 属性
        // 类名 : ClassSample$1LocalClass
        class LocalClass {
            public LocalClass() {
                System.out.println("This local class in constructor.");
            }
        }

        new LocalClass();

    }

    // 2. 嵌套类 : (nested class) 定义在类内部的类
    // 按照类型分类:
    //      * 静态嵌套类
    //      * 非静态嵌套类
    // 按照位置分类:
    //      * 成员嵌套类
    //      * 局部嵌套类
    //      *
    // 2.1 > 静态嵌套类 : 与主类完全独立
    //  注:
    //      * 不能访问外部类的非静态成员和方法
    //      * 可以直接实例化，不需要先实例化外部类
    static class StaticNestedClass {
        public StaticNestedClass() {
            System.out.println("This is static nested class.");
        }
    }
    // 2.2 > 非静态嵌套类 : 内部类 (inner class)
    //  注:
    //      * 不能有 static 修饰的成员(如：块、字段、方法、接口...)，除非静态常量(static final int PI = 3.14)
    //      * 可以访问外部类的任何成员(private 、public、static...)
    //      * 可以与外部类重名，会覆盖外部类
    //      * 需要在外部类里面实例化内部类
    //      * 不同位置的内部类可以同名
    //  内部类名称格式 : 外部类名称 + $ + [序号] + [内部类名称]
    //      * 成员类 : OuterClass$MemberClass
    //      * 局部类 : OuterClass$1LocalClass
    //      * 匿名类 : OuterClass$1
    interface TestInterface { void test(); }
    // 2.2.1 > 成员类 : (member class) 定义在类里面，但不在(块、构造器、方法)里面
    //  注:
    //      * 有 enclose class 属性
    public String name;
    public class MemberClass {
        public String name;
        public MemberClass(String name) {
            this.name = name;
            System.out.println("This is member class. " + name + " " + ClassSample.this.name);
        }
        public void nothing() {}
    }
    MemberClass memberClass = new MemberClass("memberClass");
    // 2.2.2 > 局部(本地)类 : (local class) 定义在块(普通块、静态块)、构造器、方法里面
    //  注:
    //      * 只能访问块中的final属性
    {
        // 块内局部类 : 含有 enclose class 属性
        // 类名 : ClassSample$2LocalClass
        class LocalClass {
            public LocalClass() {
                System.out.println("This is local class in block..");
            }
        }
        new LocalClass();
    }
    public void localMethod() {
        // 方法局部类 : 含有 enclose method 属性
        // 类名 : ClassSample$3LocalClass
        class LocalClass {
            public LocalClass() {
                System.out.println("This local class in local method.");
            }
        }
        new LocalClass();
    }
    // 2.3 > 匿名类 : (anonymous class) 没有名称的类
    //  注:
    //      * 不能实例化，只能使用一次
    //      * 没有构造器
    //      * 只能访问 final 变量
    // 成员匿名类
    TestInterface testInterface = new TestInterface() {
        @Override
        public void test() {
            System.out.println("This member anonymous class.");
            anonymousMethod(new TestInterface() {
                @Override
                public void test() {
                    System.out.println("This param anonymous class.");
                }
            });
        }
    };
    void anonymousMethod(TestInterface test) {
        test.test();
        //  局部匿名类
        TestInterface localTest = new TestInterface() {
            @Override
            public void test() {
                System.out.println("This local anonymous class.");
            }
        };
        localTest.test();
    }

    public static void main(String ... args) {
        ClassSample mainClass = new ClassSample("mainClass");
        FileClass fileClass = new FileClass();

        ClassSample.StaticNestedClass staticNestedClass = new ClassSample.StaticNestedClass();

        mainClass.memberClass.nothing();
        ClassSample.MemberClass test = mainClass.new MemberClass("newMemberClass");

        mainClass.localMethod();
        mainClass.testInterface.test();
    }

}

// 1. 文件类 : (file class) 定义在主类外面的的类，只能是包访问权限
class FileClass {
    public FileClass() {
        System.out.println("This is file class.");
    }
}