package util;

public class CustomUtil {
    public static void outPosition(String color, String position) {
        if (color.equals("red"))
            System.out.println("\n\033[1;31m" + position + ":" + "\033[0m");
        else if (color.equals("green"))
            System.out.println("\n\033[1;32m" + position + ":" + "\033[0m");
        else if (color.equals("yellow"))
            System.out.println("\n\033[1;33m" + position + ":" + "\033[0m");
        else
            System.out.println("\n\033[1;34m" + position + ":" + "\033[0m");
    }

    public static void outParameter(String color, String parameterName, String parameterValue) {
        if (color.equals("red"))
            System.out.println("    \033[1;31m" + parameterName + ": " + parameterValue + "\033[0m");
        else if (color.equals("green"))
            System.out.println("    \033[1;32m" + parameterName + ": " + parameterValue + "\033[0m");
        else if (color.equals("yellow"))
            System.out.println("    \033[1;33m" + parameterName + ": " + parameterValue + "\033[0m");
        else
            System.out.println("    \033[1;34m" + parameterName + ": " + parameterValue + "\033[0m");
    }
}
