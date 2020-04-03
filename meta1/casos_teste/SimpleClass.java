/*
*
*   Test Cass
*
* */
public class SimpleClass {

    public static void main(String[] args) {
        // * Print Albums *
        int n = 0;
        boolean print = true;
        boolean empty = true;
        String[] albums = {"Cowboys From Hell","Vulgar Display Of Power","Far Beyond Driven","The Great Southern Trendkill","Reinventing The Steel"};
        System.out.print("Albums:\n");
        for (int i = 0; i < albums.length; i++) {
            n++;
            System.out.print(albums[i] + ": " + n + "\n");
        }
        if (n > 0) {
            empty = false;
        }
        if (print && !empty) {
            System.out.println("Total albums: " + n);
        }
    }
}
