import org.junit.Before;
import org.junit.Test;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import static junit.framework.TestCase.assertTrue;

public class HelloWorldTest {

    private URL url;

    @Before
    public void setUp() throws Exception {
        String appAddress = "http://" + System.getenv("APP_HOST") + ":" + System.getenv("APP_PORT");
        System.out.println("Generated APP address: " + appAddress);
        url = new URL(appAddress);
    }

    @Test
    public void shouldDisplayHelloMessage() throws Exception {

        HttpURLConnection con = (HttpURLConnection) url.openConnection();
        con.setRequestMethod("GET");

        StringBuilder sb = new StringBuilder();
        String output;
        while ((output = new BufferedReader(new InputStreamReader(con.getInputStream())).readLine()) != null) {
            sb.append(output);
        }

        assertTrue(sb.toString().contains("Hello world"));
    }
}