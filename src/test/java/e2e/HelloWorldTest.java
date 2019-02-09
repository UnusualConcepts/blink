package e2e;

import org.junit.Before;
import org.junit.Test;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import static junit.framework.TestCase.assertTrue;

public class HelloWorldTest {
    @Before
    public void setUp() throws Exception {
        //TODO boot up server
    }

    @Test
    public void shouldDisplayHelloMessage() throws Exception {
        URL url = new URL("http://138.197.189.107:8080");
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