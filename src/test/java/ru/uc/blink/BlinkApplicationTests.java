package ru.uc.blink;

import org.junit.Test;
import org.junit.Assert;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import static org.junit.Assert.assertTrue;

@RunWith(SpringRunner.class)
@SpringBootTest
public class BlinkApplicationTests {

	@Autowired
	private HelloWorldController controller;

	@Test
	public void contextLoads() {
        String output = controller.index();

        assertTrue(output.contains("Hello world"));
    }

}

