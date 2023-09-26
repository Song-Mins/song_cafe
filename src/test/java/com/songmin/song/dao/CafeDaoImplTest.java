package com.songmin.song.dao;

import com.songmin.song.domain.CafeDto;
import com.songmin.song.domain.PageCondition;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.io.FileReader;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Properties;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class CafeDaoImplTest {

    @Autowired
    CafeDao cafeDao;

    @Test
    public void insertCafe() throws Exception {

        List<String> allTopic = new ArrayList<>();
        List<String> allRegion1 = new ArrayList<>();


        Properties properties1 = new Properties();
        properties1.load(new FileReader("C:\\Users\\ssoog\\IdeaProjects\\song\\src\\main\\resources\\topic.properties"));

        for (Object topic : properties1.values()) {
            allTopic.add((String) topic);
        }


        Properties properties2 = new Properties();
        properties2.load(new FileReader("C:\\Users\\ssoog\\IdeaProjects\\song\\src\\main\\resources\\region1.properties"));

        for (Object region : properties2.values()) {
            allRegion1.add((String) region);
        }


        Properties properties3 = new Properties();
        properties3.load(new FileReader("C:\\Users\\ssoog\\IdeaProjects\\song\\src\\main\\resources\\region2.properties"));
        List<String> allRegion2;
        String region2;
        CafeDto cafeDto = new CafeDto();

        System.out.println("allTopic = " + allTopic);
        System.out.println("allRegion1 = " + allRegion1);


        for (String i : allTopic) {
            for (String j : allRegion1) {
                region2 = properties3.getProperty(j);
                allRegion2 = new ArrayList<>(Arrays.asList(region2.split(",")));
                System.out.println("allRegion2 = " + allRegion2);
                for (String k : allRegion2) {
                        cafeDto.setName(j + " " + k + " " + i + " 카페");
                        cafeDto.setManager_id("ssoogg5309");
                        cafeDto.setTopic(i);
                        cafeDto.setRegion1(j);
                        cafeDto.setRegion2(k);
                        cafeDto.setExplanation("많은 가입 부탁드립니다.");
                        System.out.println("cafeDto = " + cafeDto);
                        cafeDao.insertCafe(cafeDto);

                }
            }
        }


    }

    @Test
    public void selectCafe() throws Exception {

        PageCondition pc = new PageCondition();
        System.out.println("pc = " + pc);
        System.out.println("cafeDao.selectCafe(pc) = " + cafeDao.selectCafe(pc));
    }

    @Test
    public void testSelectCafe() throws Exception {
    }

    @Test
    public void testSelectCafe1() {
    }

    @Test
    public void updateCafe() {
    }

    @Test
    public void deleteCafe() throws Exception {
        cafeDao.deleteCafe();
    }

    @Test
    public void testDeleteCafe() {
    }
}